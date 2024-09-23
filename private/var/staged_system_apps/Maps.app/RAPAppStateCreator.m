@implementation RAPAppStateCreator

- (RAPAppStateCreator)initWithSceneDelegate:(id)a3
{
  id v4;
  RAPAppStateCreator *v5;
  RAPAppStateCreator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RAPAppStateCreator;
  v5 = -[RAPAppStateCreator init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_sceneDelegate, v4);

  return v6;
}

- (void)createReportAProblemAppStateWithCompletion:(id)a3
{
  id v3;
  _QWORD v4[4];
  RAPAppStateCreator *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100467768;
  v4[3] = &unk_1011B7758;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[RAPAppStateCreator _saveDirectionRecordingsIfNeededWithCompletion:](v5, "_saveDirectionRecordingsIfNeededWithCompletion:", v4);

}

- (void)createLookAroundReportAProblemAppStateWithLookAroundContext:(id)a3 completion:(id)a4
{
  id v6;
  MapsSceneDelegate **p_sceneDelegate;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  p_sceneDelegate = &self->_sceneDelegate;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapView"));
  v12 = objc_loadWeakRetained((id *)p_sceneDelegate);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "chromeViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentTraits"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100467A40;
  v16[3] = &unk_1011B7780;
  v17 = v6;
  v15 = v6;
  +[RAPAppStateFactory createAppStateWithMapView:lookAroundContext:traits:completion:](RAPAppStateFactory, "createAppStateWithMapView:lookAroundContext:traits:completion:", v11, v8, v14, v16);

}

- (void)createReportAProblemAppStateAndPrefetchShortcutsWithCompletion:(id)a3
{
  id v3;
  _QWORD v4[4];
  RAPAppStateCreator *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100467AD0;
  v4[3] = &unk_1011B7758;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[RAPAppStateCreator _saveDirectionRecordingsIfNeededWithCompletion:](v5, "_saveDirectionRecordingsIfNeededWithCompletion:", v4);

}

- (id)createReportAProblemAppState
{
  RAPAppState *v3;
  MapsSceneDelegate **p_sceneDelegate;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  RAPAppState *v11;

  v3 = [RAPAppState alloc];
  p_sceneDelegate = &self->_sceneDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapView"));
  v8 = objc_loadWeakRetained((id *)p_sceneDelegate);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "chromeViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentTraits"));
  v11 = -[RAPAppState initWithMapView:traits:searchHistory:directionHistory:place:searchDataSource:directionsDataSource:currentlyConnectedAuxiliaryControls:](v3, "initWithMapView:traits:searchHistory:directionHistory:place:searchDataSource:directionsDataSource:currentlyConnectedAuxiliaryControls:", v7, v10, &__NSArray0__struct, &__NSArray0__struct, 0, 0, 0, 0);

  return v11;
}

- (void)createCuratedCollectionReportAProblemAppStateWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentTraits"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100467E4C;
  v12[3] = &unk_1011B7780;
  v13 = v6;
  v11 = v6;
  +[RAPAppStateFactory createAppStateWithTraits:curatedCollectionContext:completion:](RAPAppStateFactory, "createAppStateWithTraits:curatedCollectionContext:completion:", v10, v7, v12);

}

- (void)_saveDirectionRecordingsIfNeededWithCompletion:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "platformController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionStack"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = objc_opt_class(RoutePlanningSession);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reportAProblemRecorder"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reportAProblemRecorder"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10046803C;
    v15[3] = &unk_1011B77A8;
    v16 = v4;
    objc_msgSend(v14, "savePartialRecordingWithCompletion:", v15);

  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (void)createPlacecardImageryReportAProblemAppStateWithContext:(id)a3 completion:(id)a4
{
  id v6;
  RAPAppState *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  RAPAppState *v11;
  void (**v12)(id, id, _QWORD);

  v12 = (void (**)(id, id, _QWORD))a4;
  v6 = a3;
  v7 = [RAPAppState alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentTraits"));
  v11 = -[RAPAppState initWithTraits:placecardImageryContext:](v7, "initWithTraits:placecardImageryContext:", v10, v6);

  if (v12)
    v12[2](v12, v11, 0);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneDelegate);
}

@end
