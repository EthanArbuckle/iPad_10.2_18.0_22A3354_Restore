@implementation PhoneShowEventDetailsWithAttendeesTest

- (id)eventDetailsDidShowSubtestName
{
  return CFSTR("EventDetailsVisibleAndInteractable");
}

- (int64_t)numAttendees
{
  return 500;
}

- (BOOL)shouldWaitForAttendeeLoading
{
  return -[PhoneShowEventDetailsWithAttendeesTest numAttendees](self, "numAttendees") > 24;
}

- (void)runTest
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  dispatch_time_t v15;
  _QWORD block[5];
  id v17;
  id v18;

  v3 = objc_msgSend((id)objc_opt_class(self), "testName");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootNavigationController"));
  v7 = objc_msgSend(v6, "resetToDayView");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShowEventDetailsTest createTestEvent:numAttendees:](self, "createTestEvent:numAttendees:", CFSTR("Test Event with Attendees"), -[PhoneShowEventDetailsWithAttendeesTest numAttendees](self, "numAttendees")));
  v9 = v8;
  if (v8)
  {
    if (!objc_msgSend(v8, "isNew"))
    {
      v15 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000392B0;
      block[3] = &unk_1001B2CD8;
      block[4] = self;
      v17 = v4;
      v18 = v9;
      dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, block);

      goto LABEL_7;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
    objc_msgSend(v10, "startedTest:", v4);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
    v12 = CFSTR("Failed to save event");
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
    objc_msgSend(v13, "startedTest:", v4);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
    v12 = CFSTR("Failed to create event");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12));
  objc_msgSend(v11, "failedTest:withFailure:", v4, v14);

LABEL_7:
}

- (void)_detailViewControllerAppeared:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  self->_eventDetailsDidAppear = 1;
  v4 = objc_msgSend((id)objc_opt_class(self), "testName");
  v10 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = -[PhoneShowEventDetailsWithAttendeesTest shouldWaitForAttendeeLoading](self, "shouldWaitForAttendeeLoading");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneShowEventDetailsWithAttendeesTest eventDetailsDidShowSubtestName](self, "eventDetailsDidShowSubtestName"));
    objc_msgSend(v7, "finishedSubTest:forTest:", v8, v10);

  }
  else
  {
    objc_msgSend(v6, "finishedTest:extraResults:", v10, 0);

    -[ShowEventDetailsTest cleanUp](self, "cleanUp");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "removeObserver:name:object:", self, EKEventViewControllerDidAppearNotification, 0);

}

- (void)_attendeesDidFinishLoading:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (!self->_eventDetailsDidAppear)
    -[PhoneShowEventDetailsWithAttendeesTest _detailViewControllerAppeared:](self, "_detailViewControllerAppeared:", 0);
  v4 = objc_msgSend((id)objc_opt_class(self), "testName");
  v7 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  objc_msgSend(v5, "finishedTest:extraResults:", v7, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, EKEventDetailsDidFinishLoadingAttendeesNotification, 0);

  -[ShowEventDetailsTest cleanUp](self, "cleanUp");
}

@end
