@implementation MapsAppTestCollectionsNatural

- (BOOL)runTest
{
  void *v3;
  unsigned int v4;
  dispatch_time_t v5;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v4 = objc_msgSend(v3, "_mapstest_isUsingSampleProactiveData");

  if (v4)
  {
    v5 = dispatch_time(0, 6000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1006E6154;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    -[MapsAppTestCollectionsNatural _setupTrayLayoutAndPerformScrollTest](self, "_setupTrayLayoutAndPerformScrollTest");
  }
  return 1;
}

- (void)_setupTrayLayoutAndPerformScrollTest
{
  _QWORD v3[5];

  if (-[MapsAppTest canUpdateTrayLayout](self, "canUpdateTrayLayout"))
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1006E61E0;
    v3[3] = &unk_1011AC860;
    v3[4] = self;
    -[MapsAppTest updateTrayLayout:animated:completion:](self, "updateTrayLayout:animated:completion:", 2, 1, v3);
  }
  else
  {
    -[MapsAppTestCollectionsNatural _expandCollectionsList](self, "_expandCollectionsList");
  }
}

- (void)_expandCollectionsList
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptTestOpenCollections");

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1006E625C;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  -[MapsAppTestCollectionsNatural _dispatchAfterShortDelay:](self, "_dispatchAfterShortDelay:", v4);
}

- (void)_openFirstCollection
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptTestOpenFirstCollection");

  v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006E62EC;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_expandCollection
{
  _QWORD v3[5];
  _QWORD v4[5];

  if (-[MapsAppTest canUpdateTrayLayout](self, "canUpdateTrayLayout"))
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1006E639C;
    v4[3] = &unk_1011AC860;
    v4[4] = self;
    -[MapsAppTest updateTrayLayout:animated:completion:](self, "updateTrayLayout:animated:completion:", 2, 1, v4);
  }
  else
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1006E63F8;
    v3[3] = &unk_1011AC860;
    v3[4] = self;
    -[MapsAppTestCollectionsNatural _dispatchAfterShortDelay:](self, "_dispatchAfterShortDelay:", v3);
  }
}

- (void)_dismissCollection
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptTestDismissTrayAnimated:assertTrayType:", 1, 0);

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1006E647C;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  -[MapsAppTestCollectionsNatural _dispatchAfterShortDelay:](self, "_dispatchAfterShortDelay:", v4);
}

- (void)_dispatchAfterShortDelay:(id)a3
{
  id v3;
  dispatch_time_t v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006E65A8;
  block[3] = &unk_1011ADA00;
  v7 = v3;
  v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_performScrollTestOfScrollView:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)RPTScrollViewTestParameters);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  v10 = objc_msgSend(v8, "initWithTestName:scrollView:completionHandler:", v9, v7, v6);

  objc_msgSend(v10, "setPreventSheetDismissal:", 1);
  +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v10);

}

@end
