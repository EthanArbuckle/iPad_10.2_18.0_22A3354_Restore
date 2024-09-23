@implementation MapsAppTestTransitRoute

- (void)doAfterSubTestForDisplayingRoutes
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("realtime")));
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
    -[MapsAppTestTransitRoute _performRouteUpdateWithList](self, "_performRouteUpdateWithList");
  else
    -[MapsAppTest finishedTest](self, "finishedTest");
}

- (void)_performRouteUpdateWithList
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];

  -[MapsAppTest startedTest](self, "startedTest");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptTestPauseRealtimeTransitUpdates");

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10022F648;
  v8[3] = &unk_1011AD1C0;
  v8[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("MapsTestingTransitRouteUpdateWillUpdateRoute"), 0, v8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10022F658;
  v7[3] = &unk_1011AD1C0;
  v7[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("MapsTestingTransitRouteUpdateDidUpdateRoute"), 0, v7);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10022F668;
  v6[3] = &unk_1011AD1C0;
  v6[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("MapsTestingTransitRouteUpdateWillUpdateSummary"), 0, v6);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10022F678;
  v5[3] = &unk_1011AD1C0;
  v5[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("MapsTestingTransitRouteUpdateDidUpdateSummary"), 0, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v4, "pptTestResumeRealtimeTransitUpdates");

}

- (void)_performRouteUpdateWithDetails
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptTestPauseRealtimeTransitUpdates");

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10022F77C;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  -[MapsAppTest _presentDirectionDetailsWithCompletion:](self, "_presentDirectionDetailsWithCompletion:", v4);
}

@end
