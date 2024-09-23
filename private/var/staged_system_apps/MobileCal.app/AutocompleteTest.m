@implementation AutocompleteTest

- (void)runTest
{
  double v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  AutocompleteTest *v15;
  id v16;
  id v17;
  id v18;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "testName", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest options](self, "options"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("testEventName")));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001056A8;
  v13[3] = &unk_1001B2CB0;
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootNavigationController"));
  v15 = self;
  v16 = v6;
  v17 = v5;
  v18 = v8;
  v9 = v8;
  v10 = v5;
  v11 = v6;
  v12 = v14;
  objc_msgSend(v12, "showAddEventAnimated:completion:", 0, v13);

}

- (void)handleDidBeginAutocompleteSearchNotification:(id)a3
{
  double v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  *(_QWORD *)&v4 = objc_opt_class(self).n128_u64[0];
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "testName", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  objc_msgSend(v6, "finishedSubTest:forTest:", CFSTR("SearchThrottleDelay"), v8);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  objc_msgSend(v7, "startedSubTest:forTest:", CFSTR("Search"), v8);

}

- (void)handleDidShowAutocompleteResultsNotification:(id)a3
{
  double v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  *(_QWORD *)&v4 = objc_opt_class(self).n128_u64[0];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "testName", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  objc_msgSend(v7, "finishedSubTest:forTest:", CFSTR("Search"), v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  objc_msgSend(v8, "startedSubTest:forTest:", CFSTR("CellDisplay"), v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001058E0;
  v11[3] = &unk_1001B26A0;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "installCACommitCompletionBlock:", v11);

}

@end
