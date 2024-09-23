@implementation PhoneShowEventDetailsWithConferenceNotesTest

+ (id)_delaySubTestName
{
  return CFSTR("Delay");
}

+ (id)_animationSubTestName
{
  return CFSTR("Animation");
}

- (void)runTest
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  dispatch_time_t v14;
  void *v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v3 = objc_msgSend((id)objc_opt_class(self), "testName");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend((id)objc_opt_class(self), "_delaySubTestName");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend((id)objc_opt_class(self), "_animationSubTestName");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneShowEventDetailsWithConferenceNotesTest _testEventWithConferenceNotes](self, "_testEventWithConferenceNotes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v11 = v10;
  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootNavigationController"));
    v13 = objc_msgSend(v12, "resetToDayView");

    v14 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100039758;
    block[3] = &unk_1001B2CB0;
    block[4] = self;
    v18 = v4;
    v19 = v6;
    v20 = v9;
    v21 = v8;
    dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    objc_msgSend(v10, "startedTest:", v4);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to create event")));
    objc_msgSend(v15, "failedTest:withFailure:", v4, v16);

  }
}

- (void)_detailViewControllerAppeared:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = objc_msgSend((id)objc_opt_class(self), "testName");
  v12 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = objc_msgSend((id)objc_opt_class(self), "_animationSubTestName");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  objc_msgSend(v7, "finishedSubTest:forTest:", v6, v12);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  objc_msgSend(v8, "finishedTest:extraResults:", v12, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventStore"));
  objc_msgSend(v10, "removeEvent:span:error:", self->_testEvent, 0, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "removeObserver:name:object:", self, EKEventViewControllerDidAppearNotification, 0);

}

- (id)_testEventWithConferenceNotes
{
  EKEvent *testEvent;
  EKEvent *v3;
  void *v5;
  EKEvent *v6;
  EKEvent *v7;

  testEvent = self->_testEvent;
  if (testEvent)
  {
    v3 = testEvent;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 3600.0));
    v6 = (EKEvent *)objc_claimAutoreleasedReturnValue(-[PhoneShowEventDetailsWithConferenceNotesTest _createTestEventWithStartDate:](self, "_createTestEventWithStartDate:", v5));
    v7 = self->_testEvent;
    self->_testEvent = v6;

    v3 = self->_testEvent;
  }
  return v3;
}

- (id)_createTestEventWithStartDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eventStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[EKEvent eventWithEventStore:](EKEvent, "eventWithEventStore:", v6));

  objc_msgSend(v7, "setStartDate:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:", 3600.0));
  objc_msgSend(v7, "setEndDate:", v9);

  objc_msgSend(v7, "setTitle:", CFSTR("Perf conference test event"));
  v10 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", CFSTR("Test conference string\n"));
  v11 = 20;
  do
  {
    objc_msgSend(v10, "appendString:", CFSTR("Adding some extra text here to simulate the extra notes that are usually added. "));
    --v11;
  }
  while (v11);
  objc_msgSend(v10, "appendString:", CFSTR("\n\n"));
  v12 = 0;
  do
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https://fake.webex.com/faketestingURLfake/fakefakefaketestingURL%d\n\n"), v12));
    objc_msgSend(v10, "appendString:", v13);

    v12 = (v12 + 100);
  }
  while ((_DWORD)v12 != 1000);
  objc_msgSend(v10, "appendString:", CFSTR("International phone numbers\nGermany: +49 55 555 5555\nAustria: +43 55555555\nBelgium: +32 55555555\nBrazil: +55 5555555555\nCroatia: +38 555555555\nDenmark: +45 55555555\nFinland: +358 555555555\nFrance: +33 555555555\nGreece: +30 5555555555\nHungary (landline): +36 55555555\nHungary (mobile): +36 555555555\nIndia Toll (Bangalore): +91 8555555555\nIndia Toll (Delhi): +91 1555555555\nIndia Toll (Pune): +91 2555555555\nIreland: +353 555555555\nMacedonia: +389 55555555\nMexico: +52 2555555555\nMontenegro: +382 55555555\nPoland: +48 555555555\nRomania: +40 555555555\nRussia (Moscow): +7 4555555555\nRussia (St Petersburg): +7 8555555555\nRussia (Voronezh): +7 4555555555\nSingapore: +65 55555555\nSpain: +34 555555555\nSweden: +46 555555555\nSwitzerland (for customers): +41 555555555\nUK: +44 2555555555\nUSA (for customers): +1 5555555555\nUSA (for customers): +1 5555555555\n\n"));
  objc_msgSend(v10, "appendString:", CFSTR("International phone numbers\nGermany: +49 55 555 5555\nAustria: +43 55555555\nBelgium: +32 55555555\nBrazil: +55 5555555555\nCroatia: +38 555555555\nDenmark: +45 55555555\nFinland: +358 555555555\nFrance: +33 555555555\nGreece: +30 5555555555\nHungary (landline): +36 55555555\nHungary (mobile): +36 555555555\nIndia Toll (Bangalore): +91 8555555555\nIndia Toll (Delhi): +91 1555555555\nIndia Toll (Pune): +91 2555555555\nIreland: +353 555555555\nMacedonia: +389 55555555\nMexico: +52 2555555555\nMontenegro: +382 55555555\nPoland: +48 555555555\nRomania: +40 555555555\nRussia (Moscow): +7 4555555555\nRussia (St Petersburg): +7 8555555555\nRussia (Voronezh): +7 4555555555\nSingapore: +65 55555555\nSpain: +34 555555555\nSweden: +46 555555555\nSwitzerland (for customers): +41 555555555\nUK: +44 2555555555\nUSA (for customers): +1 5555555555\nUSA (for customers): +1 5555555555\n\n"));
  objc_msgSend(v10, "appendString:", CFSTR("Telephone URLS\nGermany: tel:+49555555555,,,,55555555555#\nAustria: tel:+4355555555,,,,55555555555#\nBelgium: tel:+3255555555,,,,55555555555#\nBrazil: tel:+555555555555,,,,55555555555#\nCroatia: tel:+38555555555,,,,55555555555#\nDenmark: tel:+4555555555,,,,55555555555#\nFinland: tel:+358555555555,,,,55555555555#\nFrance: tel:+33555555555,,,,55555555555#\nGreece: tel:+305555555555,,,,55555555555#\nHungary (landline): tel:+3655555555,,,,55555555555#\nHungary (mobile): tel:+36555555555,,,,55555555555#\nIndia Toll (Bangalore): tel:+918555555555,,,,55555555555#\nIndia Toll (Delhi): tel:+911555555555,,,,55555555555#\nIndia Toll (Pune): tel:+912555555555,,,,55555555555#\nIreland: tel:+353555555555,,,,55555555555#\nMacedonia: tel:+38955555555,,,,55555555555#\nMexico: tel:+522555555555,,,,55555555555#\nMontenegro: tel:+38255555555,,,,55555555555#\nPoland: tel:+48555555555,,,,55555555555#\nRomania: tel:+40555555555,,,,55555555555#\nRussia (Moscow): tel:+74555555555,,,,55555555555#\nRussia (St Petersburg): tel:+78555555555,,,,55555555555#\nRussia (Voronezh): tel:+74555555555,,,,55555555555#\nSingapore: tel:+6555555555,,,,55555555555#\nSpain: tel:+34555555555,,,,55555555555#\nSweden: tel:+46555555555,,,,55555555555#\nSwitzerland (for customers): tel:+41555555555,,,,55555555555#\nUK: tel:+442555555555,,,,55555555555#\nUSA (for customers): tel:+15555555555,,,,55555555555#\nUSA (for customers): tel:+15555555555,,,,55555555555#\n"));
  objc_msgSend(v7, "setNotes:", v10);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testEvent, 0);
}

@end
