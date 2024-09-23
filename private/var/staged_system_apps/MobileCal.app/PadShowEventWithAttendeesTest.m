@implementation PadShowEventWithAttendeesTest

- (int64_t)numAttendees
{
  return 500;
}

- (BOOL)shouldWaitForAttendeeLoad
{
  return -[PadShowEventWithAttendeesTest numAttendees](self, "numAttendees") > 24;
}

- (id)eventDetailsDidShowSubtestName
{
  return CFSTR("EventDetailsVisibleAndInteractable");
}

- (void)_setupViewToDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MonthViewController *v8;
  void *v9;
  MonthViewController *monthViewController;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  objc_msgSend(v5, "setSelectedDate:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootNavigationController"));
  v8 = (MonthViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resetToMonthView"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
  -[MonthViewController showDate:animated:](v8, "showDate:animated:", v9, 0);

  -[PadShowEventTest setController:](self, "setController:", v8);
  monthViewController = self->_monthViewController;
  self->_monthViewController = v8;

}

- (id)_getEvent
{
  return -[ShowEventDetailsTest createTestEvent:numAttendees:](self, "createTestEvent:numAttendees:", CFSTR("Test Event with Attendees"), -[PadShowEventWithAttendeesTest numAttendees](self, "numAttendees"));
}

- (void)runTest
{
  void *v3;
  void *v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest extractInitialDateOption](self, "extractInitialDateOption"));
  -[PadShowEventWithAttendeesTest _setupViewToDate:](self, "_setupViewToDate:", v4);
  v5 = dispatch_time(0, 4000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E0204;
  v7[3] = &unk_1001B26A0;
  v7[4] = self;
  v8 = v3;
  v6 = v3;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);

}

- (void)_detailsDidAppear:(id)a3
{
  unsigned int v4;
  void *v5;
  void *v6;
  double v7;
  id v8;
  void *v9;
  double v10;
  id v11;
  void *v12;
  id v13;

  self->_eventDetailsDidAppear = 1;
  v4 = -[PadShowEventWithAttendeesTest shouldWaitForAttendeeLoad](self, "shouldWaitForAttendeeLoad", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PadShowEventWithAttendeesTest eventDetailsDidShowSubtestName](self, "eventDetailsDidShowSubtestName"));
    *(_QWORD *)&v7 = objc_opt_class(self).n128_u64[0];
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "testName", v7));
    objc_msgSend(v5, "finishedSubTest:forTest:", v6, v9);

  }
  else
  {
    *(_QWORD *)&v10 = objc_opt_class(self).n128_u64[0];
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "testName", v10));
    objc_msgSend(v5, "finishedTest:extraResults:", v12, 0);

    -[ShowEventDetailsTest cleanUp](self, "cleanUp");
  }
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "removeObserver:name:object:", self, EKEventViewControllerDidAppearNotification, 0);

}

- (void)_attendeesDidFinishLoading:(id)a3
{
  void *v4;
  double v5;
  id v6;
  void *v7;
  void *v8;

  if (!self->_eventDetailsDidAppear)
    -[PadShowEventWithAttendeesTest _detailsDidAppear:](self, "_detailsDidAppear:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application", a3));
  *(_QWORD *)&v5 = objc_opt_class(self).n128_u64[0];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "testName", v5));
  objc_msgSend(v4, "finishedTest:extraResults:", v7, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "removeObserver:name:object:", self, EKEventDetailsDidFinishLoadingAttendeesNotification, 0);

  -[ShowEventDetailsTest cleanUp](self, "cleanUp");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthViewController, 0);
}

@end
