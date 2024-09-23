@implementation STUClassKitReSyncer

- (STUClassKitReSyncer)init
{
  STUClassKitReSyncer *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  CRKCancelable *classroomLaunchSubscription;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)STUClassKitReSyncer;
  v2 = -[STUClassKitReSyncer init](&v13, "init");
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "primitives"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "runningBoardPrimitives"));

    v6 = CRKClassroomBundleIdentifier;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100042EBC;
    v10[3] = &unk_1000C9F38;
    objc_copyWeak(&v11, &location);
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subscribeToLaunchEventsForBundleIdentifier:handler:", v6, v10));
    classroomLaunchSubscription = v2->_classroomLaunchSubscription;
    v2->_classroomLaunchSubscription = (CRKCancelable *)v7;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)classroomSettingsPaneDidActivate
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100042F58();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Classroom Settings pane did activate", v5, 2u);
  }

  -[STUClassKitReSyncer resyncClassKitIfStudent](self, "resyncClassKitIfStudent");
}

- (void)classroomDidLaunch
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100042F58();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Classroom app did cold launch", v5, 2u);
  }

  -[STUClassKitReSyncer resyncClassKitIfInstructor](self, "resyncClassKitIfInstructor");
}

- (void)resyncClassKitIfInstructor
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = sub_100042F58();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Re-syncing ClassKit if the currently signed in user is an instructor", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primitives"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "instructorClassKitFacade"));
  -[STUClassKitReSyncer resyncClassKitWithFacade:userEvaluator:](self, "resyncClassKitWithFacade:userEvaluator:", v7, &stru_1000CAD70);

}

- (void)resyncClassKitIfStudent
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = sub_100042F58();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Re-syncing ClassKit if the currently signed in user is a student", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primitives"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "studentClassKitFacade"));
  -[STUClassKitReSyncer resyncClassKitWithFacade:userEvaluator:](self, "resyncClassKitWithFacade:userEvaluator:", v7, &stru_1000CAD90);

}

- (void)resyncClassKitWithFacade:(id)a3 userEvaluator:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  NSObject *v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = sub_100042F58();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Attempting to re-sync ClassKit", buf, 2u);
  }

  if (objc_msgSend(v6, "accountState") == (id)2)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000432C8;
    v12[3] = &unk_1000CADE0;
    v14 = v7;
    v12[4] = self;
    v13 = v6;
    objc_msgSend(v13, "currentUserWithCompletion:", v12);

    v10 = v14;
  }
  else
  {
    v11 = sub_100042F58();
    v10 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Not re-syncing ClassKit because the currently signed in user is not eligible for ClassKit", buf, 2u);
    }
  }

}

- (void)resyncClassKitWithFacade:(id)a3
{
  _objc_msgSend(a3, "syncServerConfigWithCompletion:", &stru_1000CAE20);
}

- (CRKCancelable)classroomLaunchSubscription
{
  return self->_classroomLaunchSubscription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classroomLaunchSubscription, 0);
}

@end
