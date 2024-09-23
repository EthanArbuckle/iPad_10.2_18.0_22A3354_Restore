@implementation MapsAppTestLookAround

- (void)cleanup:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  objc_super v12;
  uint8_t buf[16];

  v3 = a3;
  v5 = sub_100431B9C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[self.testCoordinator pptTestExitLookAround]", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v7, "pptTestExitLookAround");

  v8 = sub_100431B9C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[self popToRootTrayWithCompletion]", buf, 2u);
  }

  -[MapsAppTest popToRootTrayWithCompletion:](self, "popToRootTrayWithCompletion:", 0);
  v10 = sub_100431B9C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[super cleanup:testCompleted]", buf, 2u);
  }

  v12.receiver = self;
  v12.super_class = (Class)MapsAppTestLookAround;
  -[MapsAppTest cleanup:](&v12, "cleanup:", v3);
}

- (BOOL)runTest
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v9[5];
  uint8_t buf[16];

  v3 = sub_100431B9C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[self.testCoordinator pptTestResetForLaunchURL]", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v5, "pptTestResetForLaunchURL");

  v6 = sub_100431B9C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[self jumpToOptionsCoord:^{...}]", buf, 2u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10041E94C;
  v9[3] = &unk_1011AC860;
  v9[4] = self;
  -[MapsAppTestLookAround jumpToOptionsCoord:](self, "jumpToOptionsCoord:", v9);
  return 1;
}

- (void)jumpToOptionsCoord:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  void *v24;
  int v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;

  if (a3)
  {
    v4 = a3;
    -[MapsAppTest setupForVKTest](self, "setupForVKTest");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
    objc_msgSend(v5, "_mapstest_jumpPoint");
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
    objc_msgSend(v12, "_mapstest_pitch");
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
    objc_msgSend(v15, "_mapstest_yaw");
    v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
    v19 = objc_msgSend(v18, "_mapstest_mapType");

    v20 = sub_100431B9C();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v25 = 134217984;
      v26 = *(double *)&v19;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "[self switchToMapType:%lu]", (uint8_t *)&v25, 0xCu);
    }

    -[MapsAppTest switchToMapType:](self, "switchToMapType:", v19);
    v22 = sub_100431B9C();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v25 = 134218752;
      v26 = v7;
      v27 = 2048;
      v28 = v9;
      v29 = 2048;
      v30 = v14;
      v31 = 2048;
      v32 = v17;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "[self.mainVKMapView _mapstest_jumpToCoords:(%g, %g) pitch:%g yaw:%g)]", (uint8_t *)&v25, 0x2Au);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
    objc_msgSend(v24, "_mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:", 1, v7, v9, v11, v14, v17);

    -[MapsAppTest addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v4);
  }
}

- (void)onLookAroundView:(id)a3 didBecomeAdequatelyDrawnCallback:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  id v7;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  if ((objc_msgSend(v5, "adequatelyDrawn") & 1) != 0)
  {
    v7 = sub_100431B9C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = (objc_class *)objc_opt_class(v5);
      v10 = NSStringFromClass(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      v17 = 2048;
      v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "<%@:%p> is already adequately drawn", buf, 0x16u);

    }
    if (v6)
      v6[2](v6);
  }
  else
  {
    v12 = MKLookAroundViewDidBecomeAdequatelyDrawnNotification;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10041EF78;
    v13[3] = &unk_1011B5B38;
    v14 = v6;
    +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", v12, v5, v13);

  }
}

- (void)onLookAroundView:(id)a3 didCompletionPostTransitionAnimation:(id)a4
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a4;
  v5 = dispatch_time(0, 200000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10041F084;
  block[3] = &unk_1011ADA00;
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)addObserverWithSearchString:(id)a3 forDidShowPreviewBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  MapsAppTestLookAround *v11;
  id v12;

  v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10041F154;
  v9[3] = &unk_1011B5B60;
  v11 = self;
  v12 = a4;
  v10 = v6;
  v7 = v12;
  v8 = v6;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("PPTLookAroundChromeOverlayDidShowLookAroundPreviewNotificationName"), 0, v9);

}

- (void)displayPlacecardPhotosWithSearchString:(id)a3 resultShortAddress:(id)a4 didShowPreviewBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  SearchFieldItem *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  MapsAppTestLookAround *v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_10041F434;
  v17 = &unk_1011B5B88;
  v18 = self;
  v19 = a4;
  v20 = v8;
  v21 = a5;
  v9 = v21;
  v10 = v8;
  v11 = v19;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("SearchSessionDidChangeSearchResultsNotification"), 0, &v14);
  v12 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setSearchString:](v12, "setSearchString:", v10, v14, v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v13, "pptTestSearchForFieldItem:", v12);

}

- (void)selectSearchResult:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10041F6FC;
  v4[3] = &unk_1011B5BB0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("MapsPinsDroppedForSearchResultsNotification"), 0, v4);

}

- (void)storefrontWillMoveBlock:(id)a3 didMoveBlock:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = MKLookAroundViewWillMoveToStorefrontNotification;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10041F83C;
  v10[3] = &unk_1011B5BD8;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", v7, 0, v10);

}

- (void)enterLookAroundWithLookAroundView:(id)a3 mapItem:(id)a4 showsFullScreen:(BOOL)a5 completionBlock:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v7 = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10041FAC0;
  v15[3] = &unk_1011B5C00;
  v15[4] = self;
  v16 = a3;
  v17 = a6;
  v10 = v17;
  v11 = v16;
  v12 = a4;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("LookAroundTrayContaineeViewControllerDidAppear"), 0, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKLookAroundEntryPoint entryPointWithMapItem:](MKLookAroundEntryPoint, "entryPointWithMapItem:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v14, "pptTestEnterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:", v13, v11, v7);

}

- (void)expandLookAroundToFullscreen:(BOOL)a3 withLookAroundView:(id)a4 mapItem:(id)a5 completionBlock:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10041FD44;
  v15[3] = &unk_1011B5C00;
  v15[4] = self;
  v16 = a4;
  v17 = a6;
  v10 = v17;
  v11 = v16;
  v12 = a5;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("PPTLookAroundContainerViewControllerDidTransitionToFullscreen"), 0, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKLookAroundEntryPoint entryPointWithMapItem:](MKLookAroundEntryPoint, "entryPointWithMapItem:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v14, "pptTestEnterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:", v13, v11, v8);

}

- (void)runBrowseTest
{
  -[MapsAppTestLookAround runBrowseTestWithContinuationBlock:](self, "runBrowseTestWithContinuationBlock:", 0);
}

- (void)runBrowseTestWithContinuationBlock:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_100431B9C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[self startedTest]", buf, 2u);
  }

  -[MapsAppTest startedTest](self, "startedTest");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("searchString")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("resultShortAddress")));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10041FF5C;
  v12[3] = &unk_1011B5C50;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  -[MapsAppTestLookAround displayPlacecardPhotosWithSearchString:resultShortAddress:didShowPreviewBlock:](self, "displayPlacecardPhotosWithSearchString:resultShortAddress:didShowPreviewBlock:", v8, v10, v12);

}

- (void)runEnterTest
{
  -[MapsAppTestLookAround runEnterTestWithContinuationBlock:](self, "runEnterTestWithContinuationBlock:", 0);
}

- (void)runEnterTestWithContinuationBlock:(id)a3
{
  id v3;
  _QWORD v4[4];
  MapsAppTestLookAround *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100420420;
  v4[3] = &unk_1011B5C50;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[MapsAppTestLookAround runBrowseTestWithContinuationBlock:](v5, "runBrowseTestWithContinuationBlock:", v4);

}

- (void)runExploreTest
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100420668;
  v2[3] = &unk_1011B5C78;
  v2[4] = self;
  -[MapsAppTestLookAround runEnterTestWithContinuationBlock:](self, "runEnterTestWithContinuationBlock:", v2);
}

- (void)runEnterExploreNavExitTest
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100420860;
  v2[3] = &unk_1011B5C78;
  v2[4] = self;
  -[MapsAppTestLookAround runEnterTestWithContinuationBlock:](self, "runEnterTestWithContinuationBlock:", v2);
}

- (void)runNavTest
{
  id v3;
  id v4;
  id v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainMKMapView](self, "mainMKMapView"));
  v3 = objc_alloc((Class)MKPlacemark);
  objc_msgSend(v6, "centerCoordinate");
  v4 = objc_msgSend(v3, "initWithCoordinate:");
  v5 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithPlacemark:", v4);
  -[MapsAppTestLookAround runNavTestWithMapItem:showsFullScreen:](self, "runNavTestWithMapItem:showsFullScreen:", v5, 0);

}

- (void)runFullScreenNavTestWithMapItem:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_100431B9C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[self startedTest]", buf, 2u);
  }

  -[MapsAppTest startedTest](self, "startedTest");
  v7 = sub_100431B9C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[self startedSubTest:@\"navLookAround\"]", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  self->_savedDebugDrawContinuously = objc_msgSend(v9, "layoutContinuously");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  objc_msgSend(v10, "setLayoutContinuously:", 1);

  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("navFullScreenLookAroundEnter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKLookAroundEntryPoint entryPointWithMapItem:](MKLookAroundEntryPoint, "entryPointWithMapItem:", v4));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v12, "pptTestEnterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:", v11, 0, 1);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100420B20;
  v13[3] = &unk_1011AD1C0;
  v13[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("PPTLookAroundContainerViewControllerDidTransitionToFullscreen"), 0, v13);

}

- (void)runNavTestWithMapItem:(id)a3 showsFullScreen:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  v7 = sub_100431B9C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[self startedTest]", buf, 2u);
  }

  -[MapsAppTest startedTest](self, "startedTest");
  v9 = sub_100431B9C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[self startedSubTest:@\"navLookAround\"]", buf, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  self->_savedDebugDrawContinuously = objc_msgSend(v11, "layoutContinuously");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  objc_msgSend(v12, "setLayoutContinuously:", 1);

  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("navLookAroundEnter"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKLookAroundEntryPoint entryPointWithMapItem:](MKLookAroundEntryPoint, "entryPointWithMapItem:", v6));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v14, "pptTestEnterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:", v13, 0, v4);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100420F40;
  v16[3] = &unk_1011B5BB0;
  v16[4] = self;
  v17 = v6;
  v15 = v6;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("LookAroundTrayContaineeViewControllerDidAppear"), 0, v16);

}

- (void)panLookAroundView:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  dispatch_time_t v9;
  id v10;
  _QWORD block[4];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  objc_msgSend(v7, "setPresentationYaw:animated:", 1, (double)(int)objc_msgSend(v8, "_maptest_lookAroundNavigationAmountToTurnInDegrees"));

  v9 = dispatch_time(0, 3000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100421564;
  block[3] = &unk_1011ADA00;
  v12 = v6;
  v10 = v6;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)tap:(CGPoint)a3 countdown:(int)a4 mapView:(id)a5 totalTimeInMS:(double)a6 firstTap:(BOOL)a7
{
  _BOOL4 v7;
  CGFloat y;
  CGFloat x;
  id v13;
  uint64_t v14;
  void *v15;
  int64_t v16;
  dispatch_time_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  int v22;
  int v23;
  _BOOL8 savedDebugDrawContinuously;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *i;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  int v43;
  void *v44;
  void *v45;
  _QWORD block[4];
  id v47;
  id v48;
  MapsAppTestLookAround *v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  int v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[16];
  _BYTE v59[128];

  v7 = a7;
  y = a3.y;
  x = a3.x;
  v13 = a5;
  v14 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v15 = (void *)v14;
  if (a4 <= 0)
  {
    v44 = (void *)v14;
    v19 = sub_100431B9C();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[self finishedSubTest:@\"navLookAround\"]", buf, 2u);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
    v22 = objc_msgSend(v21, "_maptest_lookAroundNavigationTaps");

    if (v22 >= 1)
      v23 = v22;
    else
      v23 = 5;
    v43 = v23;
    savedDebugDrawContinuously = self->_savedDebugDrawContinuously;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
    objc_msgSend(v25, "setLayoutContinuously:", savedDebugDrawContinuously);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainMKMapView](self, "mainMKMapView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "_mapLayer"));
    objc_msgSend(v27, "setHidden:", 0);

    -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("navLookAround"));
    objc_msgSend(v13, "disableTestStatistics");
    v45 = v13;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "testStatistics"));
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v28 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(_QWORD *)v55 != v30)
            objc_enumerationMutation(v18);
          v32 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v32));
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest results](self, "results"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sub:loadingScene:%@"), v32));
          objc_msgSend(v34, "setObject:forKey:", v33, v35);

        }
        v29 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v29);
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6 / (double)v43));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest results](self, "results"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sub:navLookAround:average animation time")));
    objc_msgSend(v37, "setObject:forKey:", v36, v38);

    v13 = v45;
    objc_msgSend(v45, "resetTestStatistics");
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "tileStatistics"));
    if (v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest results](self, "results"));
      objc_msgSend(v40, "addEntriesFromDictionary:", v39);

    }
    v41 = sub_100431B9C();
    v42 = objc_claimAutoreleasedReturnValue(v41);
    v15 = v44;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "[self finishedTest]", buf, 2u);
    }

    -[MapsAppTest finishedTest](self, "finishedTest");
  }
  else
  {
    if (v7)
      v16 = 0;
    else
      v16 = 3500000000;
    v17 = dispatch_time(0, v16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100421984;
    block[3] = &unk_1011B5D18;
    v47 = v13;
    v50 = x;
    v51 = y;
    v48 = v15;
    v49 = self;
    v53 = a4;
    v52 = a6;
    dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, block);

    v18 = v47;
  }

}

- (void)runZoomTest
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[16];

  v3 = sub_100431B9C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[self startedTest]", buf, 2u);
  }

  -[MapsAppTest startedTest](self, "startedTest");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  self->_savedDebugDrawContinuously = objc_msgSend(v5, "layoutContinuously");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  objc_msgSend(v6, "setLayoutContinuously:", 1);

  v7 = sub_100431B9C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[self startedSubTest:@\"zoomLookAroundEnter\"]", buf, 2u);
  }

  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("zoomLookAroundEnter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainMKMapView](self, "mainMKMapView"));
  v10 = objc_alloc((Class)MKPlacemark);
  objc_msgSend(v9, "centerCoordinate");
  v11 = objc_msgSend(v10, "initWithCoordinate:");
  v12 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithPlacemark:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKLookAroundEntryPoint entryPointWithMapItem:](MKLookAroundEntryPoint, "entryPointWithMapItem:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v14, "pptTestEnterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:", v13, 0, 1);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100421CA0;
  v15[3] = &unk_1011AD1C0;
  v15[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("LookAroundTrayContaineeViewControllerDidAppear"), 0, v15);

}

- (void)zoom:(CGPoint)a3 countdown:(int)a4 oldFactor:(double)a5 mapView:(id)a6
{
  double y;
  double x;
  id v11;
  void *v12;
  dispatch_time_t v13;
  id v14;
  void *v15;
  dispatch_time_t v16;
  id v17;
  _QWORD v18[5];
  void *v19;
  double v20;
  double v21;
  double v22;
  int v23;
  _QWORD block[4];
  void *v25;
  MapsAppTestLookAround *v26;
  double v27;
  double v28;

  y = a3.y;
  x = a3.x;
  v11 = a6;
  v12 = v11;
  if (a4 <= 0)
  {
    v16 = dispatch_time(0, 50000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100422094;
    block[3] = &unk_1011B15D8;
    v27 = x;
    v28 = y;
    v25 = v12;
    v26 = self;
    v17 = v12;
    dispatch_after(v16, (dispatch_queue_t)&_dispatch_main_q, block);
    v15 = v25;
  }
  else
  {
    objc_msgSend(v11, "updatePinchWithFocusPoint:oldFactor:newFactor:", x, y, a5, a5 + 0.1);
    v13 = dispatch_time(0, 50000000);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100422324;
    v18[3] = &unk_1011B5D68;
    v20 = x;
    v21 = y;
    v23 = a4;
    v22 = a5 + 0.1;
    v18[4] = self;
    v19 = v12;
    v14 = v12;
    dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v18);
    v15 = v19;
  }

}

- (BOOL)savedDebugDrawContinuously
{
  return self->_savedDebugDrawContinuously;
}

- (void)setSavedDebugDrawContinuously:(BOOL)a3
{
  self->_savedDebugDrawContinuously = a3;
}

@end
