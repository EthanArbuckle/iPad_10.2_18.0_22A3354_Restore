@implementation MapsAppTestPlacecardPresentation

- (BOOL)runTest
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "finishedTest", MKPlaceViewControllerDidShowNotification, 0);

  -[MapsAppTestPlacecardPresentation performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "startPlaceViewControllerPresentationTest", 0, 1.0);
  return 1;
}

- (void)cleanup:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[MapsAppTest dismissTrayWithAssertTrayType:completion:](self, "dismissTrayWithAssertTrayType:completion:", 1, 0);
  v5.receiver = self;
  v5.super_class = (Class)MapsAppTestPlacecardPresentation;
  -[MapsAppTest cleanup:](&v5, "cleanup:", v3);
}

- (void)startPlaceViewControllerPresentationTest
{
  void *v3;
  id v4;
  SearchResult *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapstest_location"));

  v4 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithCLLocation:", v7);
  v5 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v4);
  -[MapsAppTest startedTest](self, "startedTest");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v6, "pptTestPresentPlaceCardForSearchResult:animated:", v5, 1);

}

@end
