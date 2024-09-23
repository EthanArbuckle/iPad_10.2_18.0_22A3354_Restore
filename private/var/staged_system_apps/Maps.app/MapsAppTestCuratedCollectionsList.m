@implementation MapsAppTestCuratedCollectionsList

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
    v5 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1008ECD84;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    -[MapsAppTestCuratedCollectionsList _startTestAndPerformScrollTest](self, "_startTestAndPerformScrollTest");
  }
  return 1;
}

- (void)_startTestAndPerformScrollTest
{
  -[MapsAppTest startedTest](self, "startedTest");
  -[MapsAppTestCuratedCollectionsList _enterSearchModeAndPerformAllCuratedCollectionsScrollTest](self, "_enterSearchModeAndPerformAllCuratedCollectionsScrollTest");
}

- (void)_enterSearchModeAndPerformAllCuratedCollectionsScrollTest
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptTestEnterSearchMode");

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008ECE24;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  -[MapsAppTestCuratedCollectionsList _dispatchAfterShortDelay:](self, "_dispatchAfterShortDelay:", v4);
}

- (void)_selectAndScrollAllCuratedCollections
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptSelectSeeAllCuratedCollections");

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008ECEA0;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  -[MapsAppTestCuratedCollectionsList _dispatchAfterShortDelay:](self, "_dispatchAfterShortDelay:", v4);
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
  block[2] = sub_1008ED018;
  block[3] = &unk_1011ADA00;
  v7 = v3;
  v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_performScrollTestOfScrollView:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)UIScrollTestParameters);
  objc_msgSend(v7, "setIterations:", 1);
  objc_msgSend(v7, "setDelta:", 20.0);
  objc_msgSend(v7, "setLength:", UIScrollTestParametersLengthAutomatic);
  objc_msgSend(v7, "setAxis:", 2);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1008ED10C;
  v9[3] = &unk_1011D9618;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "_performScrollTestWithParameters:completionBlock:", v7, v9);

}

@end
