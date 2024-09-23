@implementation MapsAppTestPlacecard

- (BOOL)runTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  void *v21;
  _BOOL4 isScrollTest;
  _QWORD v24[4];
  id v25;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  self->_isScrollTest = objc_msgSend(v3, "containsString:", CFSTR("Scroll_"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("placecardThruCallout")) & 1) != 0)
    goto LABEL_4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("placecardThruSearchResultsList")))
  {

LABEL_4:
LABEL_5:
    -[MapsAppTest setupForVKTest](self, "setupForVKTest");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
    objc_msgSend(v6, "_mapstest_jumpPoint");
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
    objc_msgSend(v13, "_mapstest_pitch");
    v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
    objc_msgSend(v16, "_mapstest_yaw");
    v18 = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
    v20 = objc_msgSend(v19, "_mapstest_mapType");

    -[MapsAppTest switchToMapType:](self, "switchToMapType:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
    objc_msgSend(v21, "_mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:", 1, v8, v10, v12, v15, v18);

    objc_initWeak(&location, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100676D08;
    v24[3] = &unk_1011AD260;
    objc_copyWeak(&v25, &location);
    -[MapsAppTest addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
    return 1;
  }
  isScrollTest = self->_isScrollTest;

  if (isScrollTest)
    goto LABEL_5;
  return 0;
}

- (void)cleanup:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[MapsAppTest dismissTrayWithAssertTrayType:completion:](self, "dismissTrayWithAssertTrayType:completion:", 1, 0);
  v5.receiver = self;
  v5.super_class = (Class)MapsAppTestPlacecard;
  -[MapsAppTest cleanup:](&v5, "cleanup:", v3);
}

- (void)startPlacecardTest
{
  void *v3;
  SearchInfo *searchInfo;
  void *v5;
  void *v6;
  SearchFieldItem *v7;
  void *v8;
  void *v9;
  id v10;

  self->_waitingTests = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  self->_thruSearchResultsList = objc_msgSend(v3, "hasPrefix:", CFSTR("placecardThruSearchResultsList"));

  searchInfo = self->_searchInfo;
  self->_searchInfo = 0;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "_showCallout:", MKBalloonCalloutDidShowNotification, 0);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "_showPlaceCard:", MKPlaceViewControllerDidShowNotification, 0);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "_searchResultDidShow:", CFSTR("MapsPinsDroppedForSearchResultsNotification"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("searchString")));

  -[MapsAppTest startedTest](self, "startedTest");
  v7 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setSearchString:](v7, "setSearchString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v8, "pptTestSearchForFieldItem:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "searchSessionDidChangeSearchResults:", CFSTR("SearchSessionDidChangeSearchResultsNotification"), 0);

  -[MapsAppTestPlacecard startedSubTest:](self, "startedSubTest:", CFSTR("searchResultReceived"));
}

- (void)searchSessionDidChangeSearchResults:(id)a3
{
  id v4;
  void *v5;
  SearchInfo *v6;
  SearchInfo *searchInfo;
  void *v8;
  void *v9;
  id v10;
  const __CFString *v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("SearchSessionDidChangeSearchResultsNotification"), 0);

  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  if (v12)
  {
    v6 = (SearchInfo *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "searchInfo"));
    searchInfo = self->_searchInfo;
    self->_searchInfo = v6;

    -[MapsAppTestPlacecard finishedSubTest:checkAllFinished:](self, "finishedSubTest:checkAllFinished:", CFSTR("searchResultReceived"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "searchInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "results"));
    v10 = objc_msgSend(v9, "count");

    if ((unint64_t)v10 < 2)
    {
      if (v10 != (id)1)
      {
        -[MapsAppTest finishedTest](self, "finishedTest");
        goto LABEL_9;
      }
      -[MapsAppTestPlacecard startedSubTest:](self, "startedSubTest:", CFSTR("showCallout"));
      v11 = CFSTR("showPlaceCard");
    }
    else
    {
      v11 = CFSTR("showSearchResults");
    }
    -[MapsAppTestPlacecard startedSubTest:](self, "startedSubTest:", v11);
  }
  else
  {
    -[MapsAppTest failedTest](self, "failedTest");
  }
LABEL_9:

}

- (void)_searchResultDidShow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MapsAppTestPlacecard finishedSubTest:checkAllFinished:](self, "finishedSubTest:checkAllFinished:", CFSTR("showSearchResults"), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("MapsPinsDroppedForSearchResultsNotification"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo results](self->_searchInfo, "results"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  if (v5)
  {
    objc_msgSend(v7, "addObserver:selector:name:object:", self, "_showPlaceCard:", MKPlaceViewControllerDidShowNotification, 0);
    -[MapsAppTestPlacecard startedSubTest:](self, "startedSubTest:", CFSTR("showPlaceCard"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
    objc_msgSend(v6, "pptTestPresentPlaceCardForSearchResult:animated:", v5, !self->_isScrollTest);

  }
  else
  {
    -[MapsAppTest failedTest](self, "failedTest");
  }

}

- (void)_showCallout:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:name:object:", self, MKBalloonCalloutDidShowNotification, 0);
  -[MapsAppTestPlacecard finishedSubTest:checkAllFinished:](self, "finishedSubTest:checkAllFinished:", CFSTR("showCallout"), 0);
  -[MapsAppTestPlacecard _performNextTestAfterShowingPlacecard](self, "_performNextTestAfterShowingPlacecard");

}

- (void)_showPlaceCard:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, MKPlaceViewControllerDidShowNotification, 0);
  -[MapsAppTestPlacecard finishedSubTest:checkAllFinished:](self, "finishedSubTest:checkAllFinished:", CFSTR("showPlaceCard"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));

  objc_storeWeak((id *)&self->_placeViewController, v5);
  -[MapsAppTestPlacecard _performNextTestAfterShowingPlacecard](self, "_performNextTestAfterShowingPlacecard");

}

- (void)_performNextTestAfterShowingPlacecard
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  self->_canResizePlacecard = objc_msgSend(v3, "pptTestCanResizePlacecard");

  if (self->_canResizePlacecard)
    -[MapsAppTestPlacecard _repositionTestWillStart](self, "_repositionTestWillStart");
  else
    -[MapsAppTestPlacecard _runScrollTest](self, "_runScrollTest");
}

- (void)_repositionTestWillStart
{
  void *v3;
  void *v4;
  void *v5;
  id notifcationToken;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  if (!self->_waitingTests)
  {
    objc_initWeak(&location, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v7 = _NSConcreteStackBlock;
    v8 = 3221225472;
    v9 = sub_100677434;
    v10 = &unk_1011AD288;
    objc_copyWeak(&v11, &location);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("PPTTestTrayLayoutDidUpdateNotification"), 0, v4, &v7));
    notifcationToken = self->_notifcationToken;
    self->_notifcationToken = v5;

    -[MapsAppTestPlacecard startedSubTest:](self, "startedSubTest:", CFSTR("PlaceCardReposition"), v7, v8, v9, v10);
    -[MapsAppTestPlacecard _minimizePlaceCard](self, "_minimizePlaceCard");
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_minimizePlaceCard
{
  id v3;

  -[MapsAppTestPlacecard startedSubTest:](self, "startedSubTest:", CFSTR("PlaceCardReposition medium to small"));
  v3 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptTestMinimizePlaceCardAnimated:", 1);

}

- (void)_mediumizePlaceCard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id notifcationToken;
  void *v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  if (self->_notifcationToken)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:", self->_notifcationToken);

  }
  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_100677644;
  v12 = &unk_1011AD288;
  objc_copyWeak(&v13, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", CFSTR("PPTTestTrayLayoutDidUpdateNotification"), 0, v5, &v9));
  notifcationToken = self->_notifcationToken;
  self->_notifcationToken = v6;

  -[MapsAppTestPlacecard startedSubTest:](self, "startedSubTest:", CFSTR("PlaceCardReposition small to medium"), v9, v10, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v8, "pptTestMediumizePlaceCardAnimated:", 1);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_maxiumizePlaceCard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id notifcationToken;
  void *v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  if (self->_notifcationToken)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:", self->_notifcationToken);

  }
  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_100677808;
  v12 = &unk_1011AD288;
  objc_copyWeak(&v13, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", CFSTR("PPTTestTrayLayoutDidUpdateNotification"), 0, v5, &v9));
  notifcationToken = self->_notifcationToken;
  self->_notifcationToken = v6;

  -[MapsAppTestPlacecard startedSubTest:](self, "startedSubTest:", CFSTR("PlaceCardReposition medium to big"), v9, v10, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v8, "pptTestMaximizePlaceCardAnimated:", 1);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_mediumizePlaceCardFromBig
{
  void *v3;
  void *v4;
  id v5;

  if (self->_notifcationToken)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:", self->_notifcationToken);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_placeCardDidUpdatePosition:", CFSTR("PPTTestTrayLayoutDidUpdateNotification"), 0);

  -[MapsAppTestPlacecard startedSubTest:](self, "startedSubTest:", CFSTR("PlaceCardReposition big to medium"));
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v5, "pptTestMediumizePlaceCardAnimated:", 1);

}

- (void)_placeCardDidUpdatePosition:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("PPTTestTrayLayoutDidUpdateNotification"), 0);

  -[MapsAppTestPlacecard finishedSubTest:checkAllFinished:](self, "finishedSubTest:checkAllFinished:", CFSTR("PlaceCardReposition big to medium"), 0);
  -[MapsAppTestPlacecard _repositionTestDidFinish](self, "_repositionTestDidFinish");
}

- (void)_repositionTestDidFinish
{
  -[MapsAppTestPlacecard finishedSubTest:checkAllFinished:](self, "finishedSubTest:checkAllFinished:", CFSTR("PlaceCardReposition"), !self->_isScrollTest);
  -[MapsAppTestPlacecard _runScrollTest](self, "_runScrollTest");
}

- (void)_runScrollTest
{
  void *v3;
  id v4;

  if (self->_isScrollTest && !self->_waitingTests)
  {
    if (self->_canResizePlacecard)
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v4, "addObserver:selector:name:object:", self, "_scrollTest:", CFSTR("PPTTestTrayLayoutDidUpdateNotification"), 0);
      self->_scrollTestState = 0;
      -[MapsAppTestPlacecard startedSubTest:](self, "startedSubTest:", CFSTR("expand"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
      objc_msgSend(v3, "pptTestMaximizePlaceCardAnimated:", 1);

    }
    else
    {
      self->_scrollTestState = 0;
      -[MapsAppTestPlacecard _scrollTest:](self, "_scrollTest:", 0);
    }
  }
}

- (void)_scrollTest:(id)a3
{
  id v4;
  unint64_t scrollTestState;
  void *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  ScrollViewDelegateForwarder *v12;
  ScrollViewDelegateForwarder *scrollViewDelegate;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  ScrollViewDelegateForwarder *v20;
  id v21;
  id v22;
  CGRect v23;

  v4 = a3;
  scrollTestState = self->_scrollTestState;
  if (scrollTestState != 2)
  {
    if (scrollTestState == 1)
    {
      v21 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
      objc_msgSend(v6, "setContentOffset:animated:", 1, CGPointZero.x, CGPointZero.y);
    }
    else
    {
      if (scrollTestState)
      {
LABEL_10:
        self->_scrollTestState = scrollTestState + 1;
        goto LABEL_11;
      }
      v21 = v4;
      if (self->_canResizePlacecard)
        -[MapsAppTestPlacecard finishedSubTest:checkAllFinished:](self, "finishedSubTest:checkAllFinished:", CFSTR("expand"), 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("PPTTestTrayLayoutDidUpdateNotification"), 0);
      WeakRetained = objc_loadWeakRetained((id *)&self->_placeViewController);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
      v9 = objc_opt_class(UIScrollView);
      v10 = sub_10067639C(v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

      objc_msgSend(v6, "addObserver:selector:name:object:", self, "_scrollTest:", CFSTR("ScrollingFinishedNotification"), v11);
      v12 = objc_alloc_init(ScrollViewDelegateForwarder);
      scrollViewDelegate = self->_scrollViewDelegate;
      self->_scrollViewDelegate = v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));
      -[ScrollViewDelegateForwarder setOriginalDelegate:](self->_scrollViewDelegate, "setOriginalDelegate:", v14);

      objc_msgSend(v11, "setDelegate:", self->_scrollViewDelegate);
      -[MapsAppTestPlacecard startedSubTest:](self, "startedSubTest:", CFSTR("scrolling"));
      objc_msgSend(v11, "contentSize");
      v16 = v15;
      objc_msgSend(v11, "frame");
      objc_msgSend(v11, "setContentOffset:animated:", 1, CGPointZero.x, v16 - CGRectGetHeight(v23));

    }
    scrollTestState = self->_scrollTestState;
    v4 = v21;
    goto LABEL_10;
  }
  v22 = v4;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "object"));
  objc_msgSend(v17, "removeObserver:name:object:", self, CFSTR("ScrollingFinishedNotification"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ScrollViewDelegateForwarder originalDelegate](self->_scrollViewDelegate, "originalDelegate"));
  objc_msgSend(v18, "setDelegate:", v19);

  v20 = self->_scrollViewDelegate;
  self->_scrollViewDelegate = 0;

  -[MapsAppTestPlacecard finishedSubTest:checkAllFinished:](self, "finishedSubTest:checkAllFinished:", CFSTR("scrolling"), 1);
  v4 = v22;
LABEL_11:

}

- (void)startedSubTest:(id)a3
{
  objc_super v3;

  ++self->_waitingTests;
  v3.receiver = self;
  v3.super_class = (Class)MapsAppTestPlacecard;
  -[MapsAppTest startedSubTest:](&v3, "startedSubTest:", a3);
}

- (void)finishedSubTest:(id)a3 checkAllFinished:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v6;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)MapsAppTestPlacecard;
  -[MapsAppTest finishedSubTest:](&v7, "finishedSubTest:", a3);
  v6 = self->_waitingTests - 1;
  self->_waitingTests = v6;
  if (v4 && !v6)
    -[MapsAppTest finishedTest](self, "finishedTest");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notifcationToken, 0);
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_storeStrong((id *)&self->_scrollViewDelegate, 0);
  objc_destroyWeak((id *)&self->_placeViewController);
}

@end
