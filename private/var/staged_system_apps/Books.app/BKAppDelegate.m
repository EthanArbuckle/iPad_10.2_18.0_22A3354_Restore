@implementation BKAppDelegate

- (BKObjectGraphHost)objectGraphHost
{
  BKAppDelegate *v2;
  id v3;

  v2 = self;
  v3 = BKAppDelegate.objectGraphHost.getter();

  return (BKObjectGraphHost *)v3;
}

- (void)clearWidgetImageCacheIfNeeded
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  NSString v5;
  id v6;
  id v7;
  NSString v8;
  Class isa;
  NSString v10;
  NSString v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSString v18;
  id v19;
  NSURL *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  id v25;
  Class v26;
  NSString v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  _QWORD v48[3];
  _BYTE v49[16];
  uint64_t v50;
  uint64_t v51;

  v0 = type metadata accessor for URL(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (void *)objc_opt_self(NSUserDefaults);
  v46 = objc_msgSend(v4, "bu_groupUserDefaults");
  v5 = String._bridgeToObjectiveC()();
  v6 = objc_msgSend(v46, "integerForKey:", v5);

  if (!v6)
  {
    v7 = objc_msgSend(v4, "standardUserDefaults");
    v8 = String._bridgeToObjectiveC()();
    objc_msgSend(v7, "integerForKey:", v8);

    isa = Int._bridgeToObjectiveC()().super.super.isa;
    v10 = String._bridgeToObjectiveC()();
    objc_msgSend(v46, "setValue:forKey:", isa, v10);

  }
  v11 = String._bridgeToObjectiveC()();
  v12 = (uint64_t)objc_msgSend(v46, "integerForKey:", v11);

  if (v12 > 2)
  {

  }
  else
  {
    if (qword_1009CE6F0 != -1)
      swift_once(&qword_1009CE6F0, sub_1004BC684);
    v13 = sub_100048F64(v0, (uint64_t)qword_1009E69E8);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v13, v0);
    LOBYTE(v47) = 1;
    v14 = (void *)objc_opt_self(NSFileManager);
    v15 = objc_msgSend(v14, "defaultManager");
    URL.path.getter();
    v17 = v16;
    v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v17);
    LODWORD(v17) = objc_msgSend(v15, "fileExistsAtPath:isDirectory:", v18, &v47);

    if ((_DWORD)v17)
    {
      v19 = objc_msgSend(v14, "defaultManager");
      URL._bridgeToObjectiveC()(v20);
      v22 = v21;
      v50 = 0;
      v23 = objc_msgSend(v19, "removeItemAtURL:error:", v21, &v50);

      v24 = v50;
      if (v23)
      {
        v25 = (id)v50;
        v26 = Int._bridgeToObjectiveC()().super.super.isa;
        v27 = String._bridgeToObjectiveC()();
        objc_msgSend(v46, "setValue:forKey:", v26, v27);

        if (qword_1009CE700 != -1)
          swift_once(&qword_1009CE700, sub_1004BDB20);
        v28 = type metadata accessor for Logger(0);
        v29 = sub_100048F64(v28, (uint64_t)qword_1009E6A08);
        v30 = Logger.logObject.getter(v29);
        v31 = static os_log_type_t.default.getter(v30);
        if (os_log_type_enabled(v30, v31))
        {
          v32 = (uint8_t *)swift_slowAlloc(12, -1);
          *(_DWORD *)v32 = 134217984;
          v50 = 3;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, &v51, v32 + 4, v32 + 12);
          _os_log_impl((void *)&_mh_execute_header, v30, v31, "Successfully deleted previous image cache folder. Updated current cache folder version to %ld.", v32, 0xCu);
          swift_slowDealloc(v32, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      }
      else
      {
        v33 = (id)v50;
        v34 = _convertNSErrorToError(_:)(v24);

        swift_willThrow(v35);
        (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
        if (qword_1009CE700 != -1)
          swift_once(&qword_1009CE700, sub_1004BDB20);
        v36 = type metadata accessor for Logger(0);
        sub_100048F64(v36, (uint64_t)qword_1009E6A08);
        swift_errorRetain(v34);
        v37 = swift_errorRetain(v34);
        v38 = Logger.logObject.getter(v37);
        v39 = static os_log_type_t.error.getter(v38);
        if (os_log_type_enabled(v38, v39))
        {
          v40 = (uint8_t *)swift_slowAlloc(12, -1);
          v41 = swift_slowAlloc(32, -1);
          v50 = v41;
          *(_DWORD *)v40 = 136315138;
          swift_getErrorValue(v34, v49, v48);
          v42 = Error.localizedDescription.getter(v48[1], v48[2]);
          v44 = v43;
          v47 = sub_100040F58(v42, v43, &v50);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, v48, v40 + 4, v40 + 12);
          swift_bridgeObjectRelease(v44);
          swift_errorRelease(v34);
          swift_errorRelease(v34);
          _os_log_impl((void *)&_mh_execute_header, v38, v39, "Failed to delete previous image cache folder: %s", v40, 0xCu);
          swift_arrayDestroy(v41, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v41, -1, -1);
          swift_slowDealloc(v40, -1, -1);

          swift_errorRelease(v34);
        }
        else
        {
          swift_errorRelease(v34);
          swift_errorRelease(v34);
          swift_errorRelease(v34);

        }
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);

    }
  }
}

- (id)cleanupSnapshotManager
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  Swift::String v5;
  void *object;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  Swift::String v11;
  void *v12;
  void *v13;
  id v14;
  NSString v15;
  unsigned int v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  NSString v22;
  unsigned int v23;
  id v25;
  uint64_t v26;
  id v27;
  id v28;

  v0 = (void *)objc_opt_self(UIApplication);
  v1 = objc_msgSend(v0, "applicationCacheDirectory");
  if (!v1)
  {
    __break(1u);
LABEL_10:
    __break(1u);
  }
  v2 = v1;
  static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  v4 = v3;

  v5._countAndFlagsBits = 0xD000000000000011;
  v5._object = (void *)0x80000001007BE040;
  object = String.append(pathComponent:)(v5)._object;
  swift_bridgeObjectRelease(v4);
  v7 = objc_msgSend(v0, "applicationDocumentsDirectory");
  if (!v7)
    goto LABEL_10;
  v8 = v7;
  static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v10 = v9;

  v11._countAndFlagsBits = 0xD000000000000011;
  v11._object = (void *)0x80000001007BE040;
  v12 = String.append(pathComponent:)(v11)._object;
  swift_bridgeObjectRelease(v10);
  v13 = (void *)objc_opt_self(NSFileManager);
  v14 = objc_msgSend(v13, "defaultManager");
  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  v28 = 0;
  v16 = objc_msgSend(v14, "removeItemAtPath:error:", v15, &v28);

  v17 = v28;
  if (v16)
  {
    v18 = v28;
  }
  else
  {
    v19 = v28;
    v20 = _convertNSErrorToError(_:)(v17);

    swift_willThrow();
    swift_errorRelease(v20);
  }
  v21 = objc_msgSend(v13, "defaultManager");
  v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v12);
  v28 = 0;
  v23 = objc_msgSend(v21, "removeItemAtPath:error:", v22, &v28);

  if (v23)
    return v28;
  v27 = v28;
  v25 = v28;
  v26 = _convertNSErrorToError(_:)(v27);

  swift_willThrow();
  return (id)swift_errorRelease(v26);
}

- (BKContainerHost)containerHost
{
  BKAppDelegate *v3;
  id v4;
  BKContainerHost *result;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  _OWORD v10[2];

  swift_beginAccess(&unk_100A1E4F8, v10, 32, 0);
  v3 = self;
  v4 = objc_getAssociatedObject(v3, &unk_100A1E4F8);
  result = (BKContainerHost *)swift_endAccess(v10);
  if (v4)
  {
    _bridgeAnyObjectToAny(_:)(v4);
    swift_unknownObjectRelease(v4);
    sub_10004CFC4(&v9, v10);
    v6 = type metadata accessor for ContainerHost();
    swift_dynamicCast(&v8, v10, (char *)&type metadata for Any + 8, v6, 7);
    v7 = v8;

    return (BKContainerHost *)v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BKEngagementManager)engagementManager
{
  BKAppDelegate *v2;
  void *v3;

  v2 = self;
  v3 = (void *)BKAppDelegate.engagementManager.getter();

  return (BKEngagementManager *)v3;
}

- (BKAssetMetadataCache)assetMetadataCache
{
  return self->_assetMetadataCache;
}

- (BKAssetCoverImageHelper)coverImageHelper
{
  return self->_coverImageHelper;
}

- (BKLibraryManager)libraryManager
{
  return (BKLibraryManager *)objc_loadWeakRetained((id *)&self->_libraryManager);
}

- (IMUbiquityStatusMonitor)ubiquityStatusMonitor
{
  return self->_ubiquityStatusMonitor;
}

- (BKUbiquitousDocumentsController)ubiquitousDocumentsController
{
  return self->_ubiquitousDocumentsController;
}

- (BKLibraryItemStateProvider)libraryItemStateProvider
{
  return self->_libraryItemStateProvider;
}

- (id)flowControllers
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](self, "sceneManager"));
  v3 = BUProtocolCast(&OBJC_PROTOCOL___IMFlowControllerHosting, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "flowControllers"));

  return v5;
}

+ (id)sceneManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sceneManager"));

  return v3;
}

- (id)keyWindowAnalyticsTracker
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_opt_class(BKSceneController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](self, "sceneManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSceneController"));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](self, "sceneManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "primarySceneController"));

  if (v7 == v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootBarCoordinator"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hostingViewController"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bk_window"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootViewController"));
  }
  v12 = (void *)v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ba_deepestVisibleChildViewControllerIncludePresented:", 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ba_effectiveAnalyticsTracker"));

  return v14;
}

- (UIWindow)window
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](self, "sceneManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSceneController"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](self, "sceneManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentSceneController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bk_window"));

  }
  else
  {
    v8 = sub_100036938();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1006A48B0();

    v7 = 0;
  }
  return (UIWindow *)v7;
}

- (unint64_t)ec_beginBackgroundTaskWithName:(id)a3 expirationHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = objc_msgSend(v7, "beginBackgroundTaskWithName:expirationHandler:", v6, v5);

  return (unint64_t)v8;
}

+ (BKAppDelegate)delegate
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = objc_opt_class(BKAppDelegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = BUDynamicCast(v2, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (BKAppDelegate *)v6;
}

- (BKAppSceneManager)sceneManager
{
  return self->_sceneManager;
}

- (BKAppLaunchCoordinator)appLaunchCoordinator
{
  return self->_appLaunchCoordinator;
}

- (void)ec_endBackgroundTask:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v4, "endBackgroundTask:", a3);

}

- (void)_extendedLaunchComplete:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD block[5];
  uint8_t buf[4];
  void *v19;

  v4 = a3;
  v5 = sub_100036938();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138412290;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received %@. Marking extended launch as complete.", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v9 = BSUIFeedInitialContentReadyNotification;
  objc_msgSend(v8, "removeObserver:name:object:", self, BSUIFeedInitialContentReadyNotification, 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "removeObserver:name:object:", self, BSUIFeedViewControllerDidDisappearNotification, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarCoordinator didSwitchRootBarItemNotification](BKRootBarCoordinator, "didSwitchRootBarItemNotification"));
  objc_msgSend(v11, "removeObserver:name:object:", self, v12, 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarCoordinator rootViewControllerDidDisappearNotification](BKRootBarCoordinator, "rootViewControllerDidDisappearNotification"));
  objc_msgSend(v13, "removeObserver:name:object:", self, v14, 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  LODWORD(v9) = objc_msgSend(v15, "isEqualToString:", v9);

  if ((_DWORD)v9)
  {
    -[BKAppDelegate _signalExtendedLaunchComplete](self, "_signalExtendedLaunchComplete");
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001C5CB0;
    block[3] = &unk_1008E72C0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate bkStartupTaskManager](self, "bkStartupTaskManager"));
  objc_msgSend(v16, "startAllTasksInPhase:", 2);

}

- (void)_didFinishUpgradingWithOptions:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BKLibraryAssetIsNewManager *v10;
  uint64_t v11;
  void *v12;
  BKLibraryAssetIsNewManager *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  dispatch_time_t v19;
  _QWORD block[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesCoverManager sharedInstance](BKSeriesCoverManager, "sharedInstance", a3));
  objc_msgSend(v4, "addSeriesCoverObserver:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesCoverManager sharedInstance](BKSeriesCoverManager, "sharedInstance"));
  objc_msgSend(v5, "prewarm");

  +[BKPDFModernBookViewController setupModernPDF](BKPDFModernBookViewController, "setupModernPDF");
  v6 = objc_opt_class(BKLibraryManager);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate mainLibrary](self, "mainLibrary"));
  v8 = BUDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = [BKLibraryAssetIsNewManager alloc];
  v11 = objc_claimAutoreleasedReturnValue(-[BKAppDelegate sharedAnnotationProvider](self, "sharedAnnotationProvider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate workloopBackgroundQueue](self, "workloopBackgroundQueue"));
  v13 = -[BKLibraryAssetIsNewManager initWithLibraryManager:annotationProvider:queue:](v10, "initWithLibraryManager:annotationProvider:queue:", v9, v11, v12);
  -[BKAppDelegate setLibraryAssetIsNewManager:](self, "setLibraryAssetIsNewManager:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate libraryAssetIsNewManager](self, "libraryAssetIsNewManager"));
  objc_msgSend(v14, "setDelegate:", self);

  -[BKAppDelegate _startLibraryReloadForLaunchWhenNeeded](self, "_startLibraryReloadForLaunchWhenNeeded");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  LOBYTE(v11) = objc_msgSend(v15, "BOOLForKey:", CFSTR("BKTestEPubLayout"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v17 = objc_msgSend(v16, "BOOLForKey:", CFSTR("BKTestEPubPowerConsumption"));

  if ((v11 & 1) != 0 || v17)
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1008EEF68);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[BKLastOpenBookManager sharedInstance](BKLastOpenBookManager, "sharedInstance"));
  objc_msgSend(v18, "prewarmAppState");

  -[BKAppDelegate _showMainViewControllerOrWelcomeScreen](self, "_showMainViewControllerOrWelcomeScreen");
  v19 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C4FD0;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_createBackgroundTaskAssertionForLaunch
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  Block_layout *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BCBackgroundTaskAssertion sharedAssertion](BCBackgroundTaskAssertion, "sharedAssertion"));
  objc_msgSend(v3, "claimAssertionForIdentifier:description:", CFSTR("kAppLaunchBackgroundTaskIdentifier"), CFSTR("Launch in progress"));

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_1001C4BDC;
  v8[4] = sub_1001C4C04;
  v9 = &stru_1008EEF20;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate appLaunchCoordinator](self, "appLaunchCoordinator"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000775C;
  v7[3] = &unk_1008EEF48;
  v7[4] = v8;
  objc_msgSend(v4, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 32, CFSTR("releaseLaunchAssertion launched"), v7);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate appLaunchCoordinator](self, "appLaunchCoordinator"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001C4F4C;
  v6[3] = &unk_1008EEF48;
  v6[4] = v8;
  objc_msgSend(v5, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 0x2000, CFSTR("releaseLaunchAssertion libraryDidFinish"), v6);

  _Block_object_dispose(v8, 8);
}

- (void)_startLibraryReloadForLaunchWhenNeeded
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  dispatch_time_t v9;
  dispatch_time_t v10;
  _QWORD v11[7];
  _QWORD block[6];
  _QWORD v13[6];
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD *v21;
  uint8_t buf[4];
  id v23;

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_1001C4BDC;
  v20[4] = sub_1001C4C04;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001C4C0C;
  v19[3] = &unk_1008E72C0;
  v19[4] = self;
  v21 = objc_retainBlock(v19);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate appLaunchCoordinator](self, "appLaunchCoordinator"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100008CD4;
  v14[3] = &unk_1008EEF00;
  v14[4] = &v15;
  v14[5] = v20;
  objc_msgSend(v3, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 512, CFSTR("_startLibraryReloadForLaunchWhenNeeded extended reloadLibrary"), v14);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate appLaunchCoordinator](self, "appLaunchCoordinator"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001C4C74;
  v13[3] = &unk_1008EEF00;
  v13[4] = &v15;
  v13[5] = v20;
  objc_msgSend(v4, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 256, CFSTR("_startLibraryReloadForLaunchWhenNeeded carPlay reloadLibrary"), v13);

  v5 = sub_100036938();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v8 = objc_msgSend(v7, "applicationState");
    *(_DWORD *)buf = 134217984;
    v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Library Reload: Initial applicationState: %ld", buf, 0xCu);

  }
  v9 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C4D38;
  block[3] = &unk_1008E94B8;
  block[4] = &v15;
  block[5] = v20;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  if (!*((_BYTE *)v16 + 24))
  {
    v10 = dispatch_time(0, 5000000000);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001C4EA8;
    v11[3] = &unk_1008E8AD0;
    v11[4] = self;
    v11[5] = &v15;
    v11[6] = v20;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v11);

  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v20, 8);

}

- (void)_finishLaunching
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  dispatch_queue_attr_t v22;
  NSObject *v23;
  dispatch_queue_t v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BKAppDelegate workloopUtilityQueue](self, "workloopUtilityQueue"));
  dispatch_async(v3, &stru_1008EEAA0);

  kdebug_trace(725353712, 0, 0, 0, 0);
  kdebug_trace(725353712, 2, 0, 0, 0);
  -[BKAppDelegate _setupUbiquity](self, "_setupUbiquity");
  kdebug_trace(725353712, 3, 0, 0, 0);
  v4 = +[BCLayerRenderer sharedInstance](BCLayerRenderer, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate preLaunchQueue](self, "preLaunchQueue"));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100018BE4;
  v36[3] = &unk_1008E72C0;
  v36[4] = self;
  objc_msgSend(v5, "addOperationWithBlock:", v36);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate preLaunchQueue](self, "preLaunchQueue"));
  objc_msgSend(v6, "addOperationWithBlock:", &stru_1008EEAC0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate preLaunchQueue](self, "preLaunchQueue"));
  objc_msgSend(v7, "addOperationWithBlock:", &stru_1008EEAE0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate preLaunchQueue](self, "preLaunchQueue"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000100CC;
  v35[3] = &unk_1008E72C0;
  v35[4] = self;
  objc_msgSend(v8, "addOperationWithBlock:", v35);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate preLaunchQueue](self, "preLaunchQueue"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100063FE0;
  v34[3] = &unk_1008E72C0;
  v34[4] = self;
  objc_msgSend(v9, "addOperationWithBlock:", v34);

  v10 = objc_claimAutoreleasedReturnValue(-[BKAppDelegate workloopUserInitiatedQueue](self, "workloopUserInitiatedQueue"));
  dispatch_async(v10, &stru_1008EEB00);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate preLaunchQueue](self, "preLaunchQueue"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100013A64;
  v33[3] = &unk_1008E72C0;
  v33[4] = self;
  objc_msgSend(v11, "addOperationWithBlock:", v33);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate preLaunchQueue](self, "preLaunchQueue"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10000A23C;
  v32[3] = &unk_1008E72C0;
  v32[4] = self;
  objc_msgSend(v12, "addOperationWithBlock:", v32);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate preLaunchQueue](self, "preLaunchQueue"));
  objc_msgSend(v13, "addOperationWithBlock:", &stru_1008EEB20);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate preLaunchQueue](self, "preLaunchQueue"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000172B4;
  v31[3] = &unk_1008E72C0;
  v31[4] = self;
  objc_msgSend(v14, "addOperationWithBlock:", v31);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate preLaunchQueue](self, "preLaunchQueue"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000640B4;
  v30[3] = &unk_1008E72C0;
  v30[4] = self;
  objc_msgSend(v15, "addOperationWithBlock:", v30);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate preLaunchQueue](self, "preLaunchQueue"));
  objc_msgSend(v16, "addOperationWithBlock:", &stru_1008EEB40);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate preLaunchQueue](self, "preLaunchQueue"));
  objc_msgSend(v17, "addOperationWithBlock:", &stru_1008EEB60);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate preLaunchQueue](self, "preLaunchQueue"));
  objc_msgSend(v18, "addOperationWithBlock:", &stru_1008EEB80);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate preLaunchQueue](self, "preLaunchQueue"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100009698;
  v29[3] = &unk_1008E72C0;
  v29[4] = self;
  objc_msgSend(v19, "addOperationWithBlock:", v29);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate preLaunchQueue](self, "preLaunchQueue"));
  objc_msgSend(v20, "addOperationWithBlock:", &stru_1008EEBC0);

  v21 = objc_alloc((Class)BUNetworkMonitor);
  v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  v24 = dispatch_queue_create("com.apple.iBooks.networkMonitoringQueue", v23);
  v25 = objc_msgSend(v21, "initWithQueue:", v24);
  -[BKAppDelegate setNetworkMonitor:](self, "setNetworkMonitor:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[BCSyncUserDefaults makeOSStateHandler](BCSyncUserDefaults, "makeOSStateHandler"));
  -[BKAppDelegate setBcSyncUserDefaultsStateHandler:](self, "setBcSyncUserDefaultsStateHandler:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate preLaunchQueue](self, "preLaunchQueue"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100018114;
  v28[3] = &unk_1008E72C0;
  v28[4] = self;
  objc_msgSend(v27, "addOperationWithBlock:", v28);

  kdebug_trace(725353712, 1, 0, 0, 0);
}

- (BKLaunchOperationQueue)preLaunchQueue
{
  return self->_preLaunchQueue;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  BKMenuController *v56;
  void *v57;
  void *v58;
  BKMenuController *v59;
  BKMenuController *menuController;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v66[5];
  _QWORD v67[5];
  _QWORD v68[5];
  _QWORD v69[5];
  id v70;
  _QWORD v71[5];
  _QWORD v72[5];
  _QWORD v73[5];
  id v74;
  _QWORD v75[5];
  _QWORD v76[5];
  _QWORD v77[5];
  _QWORD v78[5];
  _QWORD v79[5];
  _QWORD v80[5];
  _QWORD v81[5];
  _QWORD v82[5];
  _QWORD v83[5];
  _QWORD v84[5];
  _QWORD v85[5];
  uint8_t buf[4];
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;

  v6 = a3;
  v7 = a4;
  kdebug_trace(725353652, 0, 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKReadingActivityService includePDFsDefaultsKey](BKReadingActivityService, "includePDFsDefaultsKey"));
  v90 = v9;
  v91 = &__kCFBooleanFalse;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1));
  objc_msgSend(v8, "registerDefaults:", v10);

  -[BKAppDelegate enableMetricsInspectorOnDebugMode](self, "enableMetricsInspectorOnDebugMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKReadingActivityService readingGoalsUserDefaultsKey](BKReadingActivityService, "readingGoalsUserDefaultsKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BUAppGroup books](BUAppGroup, "books"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userDefaults"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKReadingActivityService readingGoalsUserDefaultsKey](BKReadingActivityService, "readingGoalsUserDefaultsKey"));
  v88 = v16;
  v17 = &__kCFBooleanTrue;
  if (v13)
    v17 = v13;
  v89 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1));
  objc_msgSend(v15, "registerDefaults:", v18);

  if (v13)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[BKReadingActivityService readingGoalsUserDefaultsKey](BKReadingActivityService, "readingGoalsUserDefaultsKey"));
    objc_msgSend(v19, "removeObjectForKey:", v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("BKIncludeBookStoreResultsInSearch")));

  if (!v22)
  {
    v23 = objc_opt_class(NSNumber);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", CFSTR("BKExcludeBookStoreResultsInSearch")));
    v26 = BUDynamicCast(v23, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v27, "BOOLValue") ^ 1));
    objc_msgSend(v28, "setObject:forKey:", v29, CFSTR("BKIncludeBookStoreResultsInSearch"));

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v30, "removeObjectForKey:", CFSTR("BKExcludeBookStoreResultsInSearch"));

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v31, "removeObjectForKey:", CFSTR("BKLibraryClearICloudMergeDataOnRestart"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v32, "removeObjectForKey:", CFSTR("REI.EnableCellularFontDownload"));

  objc_msgSend(v6, "setMinimumBackgroundFetchInterval:", 3600.0);
  +[INPreferences requestSiriAuthorization:](INPreferences, "requestSiriAuthorization:", &stru_1008EECF8);
  v33 = sub_100036938();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Registering Link actions", buf, 2u);
  }

  -[BKAppDelegate registerAppIntentsDependencies](self, "registerAppIntentsDependencies");
  -[BKAppDelegate _createBackgroundTaskAssertionForLaunch](self, "_createBackgroundTaskAssertionForLaunch");
  v35 = BCIMLog(-[BKAppDelegate setLaunchOptions:](self, "setLaunchOptions:", v7));
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v87 = v7;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Books launching with launchOptions=%{private}@", buf, 0xCu);
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate startupQueue](self, "startupQueue"));
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_1001C2B18;
  v85[3] = &unk_1008E72C0;
  v85[4] = self;
  objc_msgSend(v37, "addOperationWithBlock:", v85);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate startupQueue](self, "startupQueue"));
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_10001D080;
  v84[3] = &unk_1008E72C0;
  v84[4] = self;
  objc_msgSend(v38, "addOperationWithBlock:", v84);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate startupQueue](self, "startupQueue"));
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_100063AE4;
  v83[3] = &unk_1008E72C0;
  v83[4] = self;
  objc_msgSend(v39, "addOperationWithBlock:", v83);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate startupQueue](self, "startupQueue"));
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_10000CA40;
  v82[3] = &unk_1008E72C0;
  v82[4] = self;
  objc_msgSend(v40, "addOperationWithBlock:", v82);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate startupQueue](self, "startupQueue"));
  objc_msgSend(v41, "addOperationWithBlock:", &stru_1008EED18);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate startupQueue](self, "startupQueue"));
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_10005AF38;
  v81[3] = &unk_1008E72C0;
  v81[4] = self;
  objc_msgSend(v42, "addOperationWithBlock:", v81);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate startupQueue](self, "startupQueue"));
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_100063A3C;
  v80[3] = &unk_1008E72C0;
  v80[4] = self;
  objc_msgSend(v43, "addOperationWithBlock:", v80);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate startupQueue](self, "startupQueue"));
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_10000CFB4;
  v79[3] = &unk_1008E72C0;
  v79[4] = self;
  objc_msgSend(v44, "addOperationWithBlock:", v79);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate startupQueue](self, "startupQueue"));
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_100034934;
  v78[3] = &unk_1008E72C0;
  v78[4] = self;
  objc_msgSend(v45, "addOperationWithBlock:", v78);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate startupQueue](self, "startupQueue"));
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_10000C4F4;
  v77[3] = &unk_1008E72C0;
  v77[4] = self;
  objc_msgSend(v46, "addOperationWithBlock:", v77);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate startupQueue](self, "startupQueue"));
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_10000D400;
  v76[3] = &unk_1008E72C0;
  v76[4] = self;
  objc_msgSend(v47, "addOperationWithBlock:", v76);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate startupQueue](self, "startupQueue"));
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_1000139C8;
  v75[3] = &unk_1008E72C0;
  v75[4] = self;
  objc_msgSend(v48, "addOperationWithBlock:", v75);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate startupQueue](self, "startupQueue"));
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_100007828;
  v73[3] = &unk_1008E7338;
  v73[4] = self;
  v74 = v7;
  v50 = v7;
  objc_msgSend(v49, "addOperationWithBlock:", v73);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate startupQueue](self, "startupQueue"));
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_100012B58;
  v72[3] = &unk_1008E72C0;
  v72[4] = self;
  objc_msgSend(v51, "addOperationWithBlock:", v72);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate startupQueue](self, "startupQueue"));
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_100063B68;
  v71[3] = &unk_1008E72C0;
  v71[4] = self;
  objc_msgSend(v52, "addOperationWithBlock:", v71);

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1008EED38);
  objc_msgSend(v6, "registerForRemoteNotifications");
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[BAAppManager sharedManager](BAAppManager, "sharedManager"));
  objc_msgSend(v53, "startAppSessionWithApplicationGroupIdentifier:enableUploads:", BUBooksGroupContainerIdentifier, 1);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate appLaunchCoordinator](self, "appLaunchCoordinator"));
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_10001A920;
  v69[3] = &unk_1008E7D28;
  v69[4] = self;
  v70 = v6;
  v55 = v6;
  objc_msgSend(v54, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 512, CFSTR("actionHandler initialization"), v69);

  v56 = [BKMenuController alloc];
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate appLaunchCoordinator](self, "appLaunchCoordinator"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](self, "sceneManager"));
  v59 = -[BKMenuController initWithAppLaunchCoordinator:sceneManager:](v56, "initWithAppLaunchCoordinator:sceneManager:", v57, v58);
  menuController = self->_menuController;
  self->_menuController = v59;

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate appLaunchCoordinator](self, "appLaunchCoordinator"));
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_10001FF14;
  v68[3] = &unk_1008E77C8;
  v68[4] = self;
  objc_msgSend(v61, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 512, CFSTR("audioBookController initialization"), v68);

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate appLaunchCoordinator](self, "appLaunchCoordinator"));
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_10000A398;
  v67[3] = &unk_1008E77C8;
  v67[4] = self;
  objc_msgSend(v62, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 512, CFSTR("jsaBridge startEviction"), v67);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate appLaunchCoordinator](self, "appLaunchCoordinator"));
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_100063B3C;
  v66[3] = &unk_1008E77C8;
  v66[4] = self;
  objc_msgSend(v63, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 512, CFSTR("SnapshotManager cleanup"), v66);

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate bkStartupTaskManager](self, "bkStartupTaskManager"));
  objc_msgSend(v64, "startAllTasksInPhase:", 1);

  kdebug_trace(725353664, 0, 0, 0, 0);
  return 1;
}

- (BKLaunchOperationQueue)startupQueue
{
  return self->_startupQueue;
}

- (void)_observeExtendedLaunchComplete
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_extendedLaunchComplete:", BSUIFeedInitialContentReadyNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_extendedLaunchComplete:", BSUIFeedViewControllerDidDisappearNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarCoordinator didSwitchRootBarItemNotification](BKRootBarCoordinator, "didSwitchRootBarItemNotification"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_extendedLaunchComplete:", v6, 0);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarCoordinator rootViewControllerDidDisappearNotification](BKRootBarCoordinator, "rootViewControllerDidDisappearNotification"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "_extendedLaunchComplete:", v7, 0);

}

- (BKStoreController)storeController
{
  BKStoreController *storeController;

  storeController = self->_storeController;
  if (!storeController)
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKAppDelegate.m", 2799, "-[BKAppDelegate storeController]", "_storeController", 0);
    storeController = self->_storeController;
  }
  return storeController;
}

- (void)_setupUbiquity
{
  id v3;
  void *v4;
  void *v5;
  BDSICloudIdentityTokenTracker *v6;
  BDSICloudIdentityTokenTracker *iCloudIdentityTokenTracker;
  IMUbiquityStatusMonitor *v8;
  IMUbiquityStatusMonitor *ubiquityStatusMonitor;
  void *v10;
  BKUbiquityOptInController *v11;
  IMUbiquityStatusMonitor *v12;
  void *v13;
  BKUbiquityOptInController *v14;
  BKUbiquityOptInController *ubiquityOptInController;
  void *v16;
  id v17;

  v3 = objc_alloc((Class)BDSICloudIdentityTokenTracker);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BDSApplication applicationDocumentsDirectory](BDSApplication, "applicationDocumentsDirectory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v4, 1));
  v6 = (BDSICloudIdentityTokenTracker *)objc_msgSend(v3, "initWithContainerURL:trackingLiverpool:", v5, 0);
  iCloudIdentityTokenTracker = self->_iCloudIdentityTokenTracker;
  self->_iCloudIdentityTokenTracker = v6;

  v8 = (IMUbiquityStatusMonitor *)objc_alloc_init((Class)IMUbiquityStatusMonitor);
  ubiquityStatusMonitor = self->_ubiquityStatusMonitor;
  self->_ubiquityStatusMonitor = v8;

  -[IMUbiquityStatusMonitor registerCoordinatingObserver:](self->_ubiquityStatusMonitor, "registerCoordinatingObserver:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate liverpoolStatusMonitor](self, "liverpoolStatusMonitor"));
  objc_msgSend(v10, "registerCoordinatingObserver:", self);

  v11 = [BKUbiquityOptInController alloc];
  v12 = self->_ubiquityStatusMonitor;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate liverpoolStatusMonitor](self, "liverpoolStatusMonitor"));
  v14 = -[BKUbiquityOptInController initWithStatusMonitor:liverpoolStatusMonitor:](v11, "initWithStatusMonitor:liverpoolStatusMonitor:", v12, v13);
  ubiquityOptInController = self->_ubiquityOptInController;
  self->_ubiquityOptInController = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[BDSLiverpoolStatusMonitor makeOSStateHandler](BDSLiverpoolStatusMonitor, "makeOSStateHandler"));
  -[BKAppDelegate setSyncUserDefaultsStateHandler:](self, "setSyncUserDefaultsStateHandler:", v16);

  v17 = (id)objc_claimAutoreleasedReturnValue(-[IMUbiquityStatusMonitor makeOSStateHandler](self->_ubiquityStatusMonitor, "makeOSStateHandler"));
  -[BKAppDelegate setUbiquityStatusMonitorStateHandler:](self, "setUbiquityStatusMonitorStateHandler:", v17);

}

- (BDSLiverpoolStatusMonitor)liverpoolStatusMonitor
{
  if (qword_1009F5208 != -1)
    dispatch_once(&qword_1009F5208, &stru_1008EEBE0);
  return (BDSLiverpoolStatusMonitor *)(id)qword_1009F5210;
}

- (void)setupAEAssetFactory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  REEpubPlugin *v10;
  void *v11;
  void *v12;
  REEpubPlugin *v13;
  void *v14;
  void *v15;
  void *v16;
  BKAudiobookPlugin *v17;
  void *v18;
  void *v19;
  Class v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AEBookProtocolCacheItemProvider sharedInstance](AEBookProtocolCacheItemProvider, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BEProtocolCache sharedInstance](BEProtocolCache, "sharedInstance"));
  objc_msgSend(v4, "setItemProvider:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  +[AEAssetEngine setLibraryMgr:](AEAssetEngine, "setLibraryMgr:", v5);

  v24 = (id)objc_opt_new(AEPDFPlugin);
  if ((objc_opt_respondsToSelector(v24, "setSharedAnnotationProvider:") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sharedAnnotationProvider](self, "sharedAnnotationProvider"));
    objc_msgSend(v24, "setSharedAnnotationProvider:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v8 = BUProtocolCast(&OBJC_PROTOCOL___BCCoverResetting, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v24, "setSharedBookCoverResetter:", v9);

  v10 = [REEpubPlugin alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate storeController](self, "storeController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate engagementManager](self, "engagementManager"));
  v13 = -[REEpubPlugin initWithStoreController:engagementManager:](v10, "initWithStoreController:engagementManager:", v11, v12);

  if ((objc_opt_respondsToSelector(v13, "setSharedAnnotationProvider:") & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sharedAnnotationProvider](self, "sharedAnnotationProvider"));
    -[REEpubPlugin setSharedAnnotationProvider:](v13, "setSharedAnnotationProvider:", v14);

  }
  v15 = (void *)objc_opt_new(AEEPubPictureBookPlugin);
  if ((objc_opt_respondsToSelector(v15, "setSharedAnnotationProvider:") & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sharedAnnotationProvider](self, "sharedAnnotationProvider"));
    objc_msgSend(v15, "setSharedAnnotationProvider:", v16);

  }
  v17 = objc_opt_new(BKAudiobookPlugin);
  if ((objc_opt_respondsToSelector(v17, "setSharedAnnotationProvider:") & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sharedAnnotationProvider](self, "sharedAnnotationProvider"));
    -[BKAudiobookPlugin setSharedAnnotationProvider:](v17, "setSharedAnnotationProvider:", v18);

  }
  if (qword_1009F5228 != -1)
    dispatch_once(&qword_1009F5228, &stru_1008EF070);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[AEPluginRegistry sharedInstance](AEPluginRegistry, "sharedInstance"));
  objc_msgSend(v19, "registerAssetEnginePlugin:", v24);
  objc_msgSend(v19, "registerAssetEnginePlugin:", v13);
  objc_msgSend(v19, "registerAssetEnginePlugin:", v15);
  if ((isARMv6(objc_msgSend(v19, "registerAssetEnginePlugin:", v17)) & 1) == 0)
  {
    v20 = NSClassFromString(CFSTR("THApplePubAssetPluginProvider"));
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class sharedPlugin](v20, "sharedPlugin"));
      v22 = v21;
      if (v21 && objc_msgSend(v21, "conformsToProtocol:", &OBJC_PROTOCOL___AEPlugin))
      {
        if ((objc_opt_respondsToSelector(v22, "setSharedAnnotationProvider:") & 1) != 0)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sharedAnnotationProvider](self, "sharedAnnotationProvider"));
          objc_msgSend(v22, "setSharedAnnotationProvider:", v23);

        }
        objc_msgSend(v19, "registerAssetEnginePlugin:", v22);
      }

    }
  }
  SetBookFormatByExtensionCB(sub_1001C4224);

}

- (AEAnnotationProvider)sharedAnnotationProvider
{
  return self->_sharedAnnotationProvider;
}

- (BAAnalyticsController)primaryAnalyticsController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate _primarySceneControllerAnalyticsManager](self, "_primarySceneControllerAnalyticsManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "analyticsController"));

  return (BAAnalyticsController *)v3;
}

- (id)_primarySceneControllerAnalyticsManager
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = objc_opt_class(BKSceneController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](self, "sceneManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primarySceneController"));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "analyticsManager"));
  return v8;
}

- (BKAppDelegate)init
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  dispatch_workloop_t v8;
  void *v9;
  id v10;
  void *v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  void *v17;
  dispatch_queue_attr_t v18;
  NSObject *v19;
  dispatch_queue_attr_t v20;
  NSObject *v21;
  dispatch_queue_t v22;
  void *v23;
  dispatch_queue_attr_t v24;
  NSObject *v25;
  dispatch_queue_attr_t v26;
  NSObject *v27;
  dispatch_queue_t v28;
  void *v29;
  dispatch_queue_attr_t v30;
  NSObject *v31;
  dispatch_queue_attr_t v32;
  NSObject *v33;
  dispatch_queue_t v34;
  void *v35;
  BKLaunchOperationQueue *v36;
  uint64_t v37;
  void *v38;
  BKLaunchOperationQueue *v39;
  void *v40;
  BKLaunchOperationQueue *v41;
  uint64_t v42;
  void *v43;
  BKLaunchOperationQueue *v44;
  void *v45;
  BKLaunchOperationQueue *v46;
  uint64_t v47;
  void *v48;
  BKLaunchOperationQueue *v49;
  void *v50;
  BKAppLaunchCoordinator *v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  os_signpost_id_t v55;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  BKBagOfflineCacheProvider *v63;
  BKTUIOfflineCacheProvider *v64;
  NSObject *v65;
  id v66;
  NSObject *v67;
  NSObject *v68;
  _QWORD *v69;
  NSObject *v70;
  id v71;
  BKAppImportCoordinator *v72;
  void *v73;
  BKAppSceneManager *v74;
  void *v75;
  _QWORD v77[4];
  id v78;
  _QWORD v79[4];
  id v80;
  _QWORD block[4];
  id v82;
  id v83;
  os_signpost_id_t v84;
  uint8_t buf[8];
  objc_super v86;

  v86.receiver = self;
  v86.super_class = (Class)BKAppDelegate;
  v2 = -[BKAppDelegate init](&v86, "init");
  if (v2)
  {
    v3 = kdebug_trace(725353648, 0, 0, 0, 0);
    v4 = MKBDeviceUnlockedSinceBoot(v3);
    if (!(_DWORD)v4)
    {
      v5 = BCIMLog(v4);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_1006A445C();

      raise(9);
    }
    objc_msgSend(v2, "_observeExtendedLaunchComplete");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    objc_msgSend(v7, "addObserver:accountTypes:", v2, 1);

    v8 = dispatch_workloop_create("com.apple.iBooks.workloop");
    v9 = (void *)*((_QWORD *)v2 + 37);
    *((_QWORD *)v2 + 37) = v8;

    v10 = objc_msgSend(objc_alloc((Class)BUCoalescingCallBlock), "initWithNotifyBlock:blockDescription:", &stru_1008EE9D8, CFSTR("BKApp Jalisco Authentication Request"));
    v11 = (void *)*((_QWORD *)v2 + 52);
    *((_QWORD *)v2 + 52) = v10;

    objc_msgSend(*((id *)v2 + 52), "setCoalescingDelay:", 2.0);
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INTERACTIVE, 0);
    v15 = objc_claimAutoreleasedReturnValue(v14);

    v16 = dispatch_queue_create_with_target_V2("com.apple.iBooks.workloopUserInteractiveQueue", v15, *((dispatch_queue_t *)v2 + 37));
    v17 = (void *)*((_QWORD *)v2 + 38);
    *((_QWORD *)v2 + 38) = v16;

    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_USER_INITIATED, 0);
    v21 = objc_claimAutoreleasedReturnValue(v20);

    v22 = dispatch_queue_create_with_target_V2("com.apple.iBooks.workloopUserInitiateQueue", v21, *((dispatch_queue_t *)v2 + 37));
    v23 = (void *)*((_QWORD *)v2 + 39);
    *((_QWORD *)v2 + 39) = v22;

    v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    v26 = dispatch_queue_attr_make_with_qos_class(v25, QOS_CLASS_UTILITY, 0);
    v27 = objc_claimAutoreleasedReturnValue(v26);

    v28 = dispatch_queue_create_with_target_V2("com.apple.iBooks.workloopUtilityQueue", v27, *((dispatch_queue_t *)v2 + 37));
    v29 = (void *)*((_QWORD *)v2 + 40);
    *((_QWORD *)v2 + 40) = v28;

    v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    v32 = dispatch_queue_attr_make_with_qos_class(v31, QOS_CLASS_BACKGROUND, 0);
    v33 = objc_claimAutoreleasedReturnValue(v32);

    v34 = dispatch_queue_create_with_target_V2("com.apple.iBooks.workloopBackgroundQueue", v33, *((dispatch_queue_t *)v2 + 37));
    v35 = (void *)*((_QWORD *)v2 + 41);
    *((_QWORD *)v2 + 41) = v34;

    setiopolicy_np(3, 0, 1);
    v36 = [BKLaunchOperationQueue alloc];
    v37 = BCSignpostPreLaunchQueue();
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v39 = -[BKLaunchOperationQueue initWithName:signpostLog:targetQueue:activate:](v36, "initWithName:signpostLog:targetQueue:activate:", CFSTR("com.apple.iBooks.preLaunch"), v38, 0, 1);
    v40 = (void *)*((_QWORD *)v2 + 42);
    *((_QWORD *)v2 + 42) = v39;

    objc_msgSend(*((id *)v2 + 42), "setQosClass:", 25);
    v41 = [BKLaunchOperationQueue alloc];
    v42 = BCSignpostLibrarySetupQueue();
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    v44 = -[BKLaunchOperationQueue initWithName:signpostLog:targetQueue:activate:](v41, "initWithName:signpostLog:targetQueue:activate:", CFSTR("com.apple.iBooks.librarySetup"), v43, 0, 1);
    v45 = (void *)*((_QWORD *)v2 + 43);
    *((_QWORD *)v2 + 43) = v44;

    objc_msgSend(*((id *)v2 + 43), "setQosClass:", 25);
    v46 = [BKLaunchOperationQueue alloc];
    v47 = BCSignpostStartupQueue();
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    v49 = -[BKLaunchOperationQueue initWithName:signpostLog:targetQueue:activate:](v46, "initWithName:signpostLog:targetQueue:activate:", CFSTR("com.apple.iBooks.startup"), v48, 0, 0);
    v50 = (void *)*((_QWORD *)v2 + 44);
    *((_QWORD *)v2 + 44) = v49;

    objc_msgSend(*((id *)v2 + 44), "setQosClass:", 33);
    BCSetUnsafeAppDelegateReference(v2);
    v51 = objc_alloc_init(BKAppLaunchCoordinator);
    v52 = (void *)*((_QWORD *)v2 + 15);
    *((_QWORD *)v2 + 15) = v51;

    v53 = BCSignpostLaunch();
    v54 = objc_claimAutoreleasedReturnValue(v53);
    v55 = os_signpost_id_generate(v54);

    v56 = BCSignpostLaunch();
    v57 = objc_claimAutoreleasedReturnValue(v56);
    v58 = v57;
    if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v58, OS_SIGNPOST_INTERVAL_BEGIN, v55, "Hold at launch", ", buf, 2u);
    }

    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v2 + 15), "appLaunchCoordinatorHoldAtLaunchingAssertion"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001C159C;
    block[3] = &unk_1008E8BE8;
    v82 = v59;
    v60 = v2;
    v83 = v60;
    v84 = v55;
    v61 = v59;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[JSAProcessEnvironment currentEnvironment](JSAProcessEnvironment, "currentEnvironment"));
    objc_msgSend(v62, "setup");

    v63 = objc_alloc_init(BKBagOfflineCacheProvider);
    +[BUBag setOfflineCacheProvider:](BUBag, "setOfflineCacheProvider:", v63);

    v64 = objc_alloc_init(BKTUIOfflineCacheProvider);
    +[TUIOfflineCache setProvider:](TUIOfflineCache, "setProvider:", v64);

    v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "workloopUserInitiatedQueue"));
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_1001C167C;
    v79[3] = &unk_1008E72C0;
    v66 = v60;
    v80 = v66;
    dispatch_async(v65, v79);

    v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "workloopUserInitiatedQueue"));
    dispatch_async(v67, &stru_1008EE9F8);

    v68 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "workloopUserInitiatedQueue"));
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_1001C1768;
    v77[3] = &unk_1008E72C0;
    v69 = v66;
    v78 = v69;
    dispatch_async(v68, v77);

    v70 = objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "workloopUserInitiatedQueue"));
    dispatch_async(v70, &stru_1008EEA18);

    dispatch_async(*((dispatch_queue_t *)v2 + 40), &stru_1008EEA38);
    v71 = +[BCAnalyticsVisibilityPresentationNotifier sharedInstance](BCAnalyticsVisibilityPresentationNotifier, "sharedInstance");
    v72 = objc_alloc_init(BKAppImportCoordinator);
    v73 = (void *)v69[24];
    v69[24] = v72;

    v74 = -[BKAppSceneManager initWithLaunchCoordinator:importCoordinator:]([BKAppSceneManager alloc], "initWithLaunchCoordinator:importCoordinator:", *((_QWORD *)v2 + 15), v69[24]);
    v75 = (void *)v69[6];
    v69[6] = v74;

    v69[54] = 0;
    kdebug_trace(725353708, 0, 0, 0, 0);
    +[BLLockFile setBackgroundTaskDelegate:](BLLockFile, "setBackgroundTaskDelegate:", v69);
    +[BMManagerConfiguration setBackgroundTaskDelegate:](BMManagerConfiguration, "setBackgroundTaskDelegate:", v69);
    objc_msgSend(v69, "_finishLaunching");

  }
  return (BKAppDelegate *)v2;
}

- (OS_dispatch_queue)workloopUserInitiatedQueue
{
  return self->_workloopUserInitiatedQueue;
}

- (void)_applicationWillEnterForeground:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKUserActivityManager sharedInstance](BKUserActivityManager, "sharedInstance", a3));
  objc_msgSend(v4, "willEnterForeground");

  +[JSAApplication willEnterForeground](JSAApplication, "willEnterForeground");
  -[BKAppDelegate _resumeFromBackground](self, "_resumeFromBackground");
  v5 = (id)objc_claimAutoreleasedReturnValue(+[BCBookReadingTimeTracker sharedInstance](BCBookReadingTimeTracker, "sharedInstance"));
  objc_msgSend(v5, "scrubRecents");

}

- (void)_dieIfUnacknowledgediCloudLogoutOcccurredWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void (**v11)(_QWORD);
  uint8_t v12[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = BDSCloudKitLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_dieIfUnacknowledgediCloudLogoutOcccurredWithCompletion:", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate iCloudIdentityTokenTracker](self, "iCloudIdentityTokenTracker"));
  objc_msgSend(v7, "fetchCurrentToken");
  if (objc_msgSend(v7, "didUnacknowledgediCloudLogoutOccur"))
  {
    v8 = BDSCloudKitLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "User logged out of iCloud.  Signalling to prevent a crash", v12, 2u);
    }

    raise(9);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate iCloudIdentityTokenTracker](self, "iCloudIdentityTokenTracker"));
    objc_msgSend(v10, "acknowledgeiCloudIdentity");

  }
  v11 = (void (**)(_QWORD))objc_retainBlock(v4);

  if (v11)
    v11[2](v11);

}

- (BDSICloudIdentityTokenTracker)iCloudIdentityTokenTracker
{
  return self->_iCloudIdentityTokenTracker;
}

- (BKServiceCenter)serviceCenter
{
  BKAppDelegate *v2;
  void *v3;

  v2 = self;
  v3 = (void *)BKAppDelegate.serviceCenter.getter();

  return (BKServiceCenter *)v3;
}

- (void)sq_kickoffFinishLaunching
{
  void *v3;
  BKLaunchOperationQueue *preLaunchQueue;
  void *v5;
  BKLaunchOperationQueue *librarySetupQueue;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;
  _QWORD block[5];

  kdebug_trace(725353712, 26, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate preLaunchQueue](self, "preLaunchQueue"));
  objc_msgSend(v3, "waitUntilAllOperationsAreFinished");

  kdebug_trace(725353712, 27, 0, 0, 0);
  preLaunchQueue = self->_preLaunchQueue;
  self->_preLaunchQueue = 0;

  kdebug_trace(725353712, 28, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate librarySetupQueue](self, "librarySetupQueue"));
  objc_msgSend(v5, "waitUntilAllOperationsAreFinished");

  kdebug_trace(725353712, 29, 0, 0, 0);
  librarySetupQueue = self->_librarySetupQueue;
  self->_librarySetupQueue = 0;

  kdebug_trace(725353712, 30, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate ubiquityOptInController](self, "ubiquityOptInController"));
  objc_msgSend(v7, "finalizeSetup");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKCloudQuotaUIServices sharedInstance](BKCloudQuotaUIServices, "sharedInstance"));
  objc_msgSend(v8, "addObserver:", self);

  +[BCSyncUserDefaults syncDefaultsWithTCC](BCSyncUserDefaults, "syncDefaultsWithTCC");
  kdebug_trace(725353712, 31, 0, 0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019358;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  kdebug_trace(725353712, 64, 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIStoreServices sharedInstance](BSUIStoreServices, "sharedInstance"));
  objc_msgSend(v9, "setDelegate:", self);
  -[BKAppDelegate startDownloadPurchaseMonitor](self, "startDownloadPurchaseMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate libraryManager](self, "libraryManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetDetailsManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BCAnnotationSyncManager sharedInstance](BCAnnotationSyncManager, "sharedInstance"));
  objc_msgSend(v12, "setDelegate:", v11);

  kdebug_trace(725353712, 65, 0, 0, 0);
  objc_initWeak(&location, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate appLaunchCoordinator](self, "appLaunchCoordinator"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100063E20;
  v14[3] = &unk_1008E7A08;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v13, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 512, CFSTR("clearWidgetImageCacheIfNeeded"), v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)registerAppIntentsDependencies
{
  BKAppDelegate *v2;

  v2 = self;
  BKAppDelegate.registerAppIntentsDependencies()();

}

- (void)setEngagementManager:(id)a3
{
  sub_10001BBB0(self, (uint64_t)a2, a3, &unk_100A1E4F9);
}

- (void)setServiceCenter:(id)a3
{
  sub_10001BBB0(self, (uint64_t)a2, a3, &unk_100A1E4FB);
}

- (void)setContainerHost:(id)a3
{
  sub_10001BBB0(self, (uint64_t)a2, a3, &unk_100A1E4F8);
}

- (OS_dispatch_queue)workloopUtilityQueue
{
  return self->_workloopUtilityQueue;
}

- (OS_dispatch_queue)workloopBackgroundQueue
{
  return self->_workloopBackgroundQueue;
}

- (BKLibraryDataSourcePlistUntetheredBooks)untetheredPlistDataSource
{
  return self->_untetheredPlistDataSource;
}

- (BKUbiquityOptInController)ubiquityOptInController
{
  return self->_ubiquityOptInController;
}

- (void)setUbiquitousDocumentsController:(id)a3
{
  objc_storeStrong((id *)&self->_ubiquitousDocumentsController, a3);
}

- (void)setSyncUserDefaultsStateHandler:(id)a3
{
  objc_storeStrong((id *)&self->_syncUserDefaultsStateHandler, a3);
}

- (void)setStoreController:(id)a3
{
  objc_storeStrong((id *)&self->_storeController, a3);
}

- (void)setStartupQueue:(id)a3
{
  objc_storeStrong((id *)&self->_startupQueue, a3);
}

- (void)setSharedAnnotationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sharedAnnotationProvider, a3);
}

- (void)setOfflineCacheLoadingController:(id)a3
{
  objc_storeStrong((id *)&self->_offlineCacheLoadingController, a3);
}

- (void)setNetworkMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_networkMonitor, a3);
}

- (void)setLibraryManager:(id)a3
{
  objc_storeWeak((id *)&self->_libraryManager, a3);
}

- (void)setLibraryItemStateProvider:(id)a3
{
  objc_storeStrong((id *)&self->_libraryItemStateProvider, a3);
}

- (void)setLibraryAssetIsNewManager:(id)a3
{
  objc_storeStrong((id *)&self->_libraryAssetIsNewManager, a3);
}

- (void)setLaunchOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (void)setDownloadProgressCenter:(id)a3
{
  objc_storeStrong((id *)&self->_downloadProgressCenter, a3);
}

- (void)setBookletMigrationManager:(id)a3
{
  objc_storeStrong((id *)&self->_bookletMigrationManager, a3);
}

- (void)setBcSyncUserDefaultsStateHandler:(id)a3
{
  objc_storeStrong((id *)&self->_bcSyncUserDefaultsStateHandler, a3);
}

- (void)setAppLifecycleObserver:(id)a3
{
  objc_storeStrong((id *)&self->_appLifecycleObserver, a3);
}

- (void)setAnalyticsApplicationState:(unint64_t)a3
{
  self->_analyticsApplicationState = a3;
}

- (void)setAirTrafficController:(id)a3
{
  objc_storeStrong((id *)&self->_airTrafficController, a3);
}

- (void)q_setupLibrary
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate librarySetupQueue](self, "librarySetupQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100034A24;
  v4[3] = &unk_1008E72C0;
  v4[4] = self;
  objc_msgSend(v3, "addOperationWithBlock:", v4);

}

- (void)q_deleteLocaliCloudDataIfUserLoggedOutFromiCloud
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  _QWORD v13[4];
  id v14;
  dispatch_semaphore_t v15;
  uint8_t buf[16];

  v3 = BDSCloudKitLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "q_deleteLocaliCloudDataIfUserLoggedOutFromiCloudWithCompletion:", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate iCloudIdentityTokenTracker](self, "iCloudIdentityTokenTracker"));
  objc_msgSend(v5, "fetchCurrentToken");
  v6 = objc_msgSend(v5, "didUnacknowledgediCloudLogoutOccur");
  if ((_DWORD)v6)
  {
    v8 = BDSCloudKitLog(v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "User logged out from iCloud.  Deleting local copies of cloud data.", buf, 2u);
    }

    v10 = dispatch_semaphore_create(0);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001C7594;
    v13[3] = &unk_1008E73F0;
    v14 = v5;
    v15 = v10;
    v11 = v10;
    -[BKAppDelegate deleteCloudDataWithCompletion:](self, "deleteCloudDataWithCompletion:", v13);
    v12 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v11, v12);

  }
  else
  {
    objc_msgSend(v5, "acknowledgeiCloudIdentity");
  }

}

- (BKOfflineCacheLoadingController)offlineCacheLoadingController
{
  return self->_offlineCacheLoadingController;
}

- (void)mergeSyncSidecar
{
  _QWORD *v3;
  void *v4;
  _QWORD *v5;
  id v6;
  BKDatabaseBackupFileManager *v7;
  void *v8;
  BKDatabaseBackupFileManager *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  UIBackgroundTaskIdentifier v16;
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000142FC;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  if (qword_1009F5230 != -1)
    dispatch_once(&qword_1009F5230, block);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = UIBackgroundTaskInvalid;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000B358;
  v12[3] = &unk_1008E7BE8;
  v12[4] = &v13;
  v3 = objc_retainBlock(v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001C6EA8;
  v10[3] = &unk_1008E7818;
  v5 = v3;
  v11 = v5;
  v6 = objc_msgSend(v4, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("BKAppDelegate merge"), v10);
  v14[3] = (uint64_t)v6;

  v7 = [BKDatabaseBackupFileManager alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sharedAnnotationProvider](self, "sharedAnnotationProvider"));
  v9 = -[BKDatabaseBackupFileManager initWithLibraryManager:annotationProvider:](v7, "initWithLibraryManager:annotationProvider:", 0, v8);

  -[BKDatabaseBackupFileManager mergeSyncSidecarWithCompletionBlock:](v9, "mergeSyncSidecarWithCompletionBlock:", v5);
  _Block_object_dispose(&v13, 8);
}

- (BKMenuController)menuController
{
  return self->_menuController;
}

- (BKLaunchOperationQueue)librarySetupQueue
{
  return self->_librarySetupQueue;
}

- (BKLibraryAssetIsNewManager)libraryAssetIsNewManager
{
  return self->_libraryAssetIsNewManager;
}

- (BSUIDownloadProgressCenter)downloadProgressCenter
{
  return self->_downloadProgressCenter;
}

- (BUCoalescingCallBlock)coalescingJaliscoBlock
{
  return self->_coalescingJaliscoBlock;
}

- (BUCoalescingCallBlock)coalescedUpdateEnableSync
{
  return self->_coalescedUpdateEnableSync;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v6;
  id v7;
  BKContainerHost *v8;
  void *v9;
  BKContainerHost *v10;
  BKAppLifecycleObserver *v11;
  void *v12;
  BKAppLifecycleObserver *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id location[2];

  v6 = a3;
  v7 = a4;
  v8 = [BKContainerHost alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate appLaunchCoordinator](self, "appLaunchCoordinator"));
  v10 = -[BKContainerHost initWithLaunchCoordinator:](v8, "initWithLaunchCoordinator:", v9);
  -[BKAppDelegate setContainerHost:](self, "setContainerHost:", v10);

  v11 = [BKAppLifecycleObserver alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate appLaunchCoordinator](self, "appLaunchCoordinator"));
  v13 = -[BKAppLifecycleObserver initWithCoordinator:](v11, "initWithCoordinator:", v12);

  -[BKAppDelegate setAppLifecycleObserver:](self, "setAppLifecycleObserver:", v13);
  objc_initWeak(location, self);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100008980;
  v41[3] = &unk_1008EAF88;
  objc_copyWeak(&v43, location);
  v14 = v6;
  v42 = v14;
  -[BKAppLifecycleObserver setOnWillEnterForeground:](v13, "setOnWillEnterForeground:", v41);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1001C29C8;
  v38[3] = &unk_1008EAF88;
  objc_copyWeak(&v40, location);
  v15 = v14;
  v39 = v15;
  -[BKAppLifecycleObserver setOnDidEnterBackground:](v13, "setOnDidEnterBackground:", v38);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1001C2A04;
  v35[3] = &unk_1008EAF88;
  objc_copyWeak(&v37, location);
  v16 = v15;
  v36 = v16;
  -[BKAppLifecycleObserver setOnWillResignActive:](v13, "setOnWillResignActive:", v35);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000089BC;
  v32[3] = &unk_1008EAF88;
  objc_copyWeak(&v34, location);
  v17 = v16;
  v33 = v17;
  -[BKAppLifecycleObserver setOnDidBecomeActive:](v13, "setOnDidBecomeActive:", v32);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1001C2A40;
  v29[3] = &unk_1008EAF88;
  objc_copyWeak(&v31, location);
  v18 = v17;
  v30 = v18;
  -[BKAppLifecycleObserver setOnWillResignFrontmost:](v13, "setOnWillResignFrontmost:", v29);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10006396C;
  v26[3] = &unk_1008EAF88;
  objc_copyWeak(&v28, location);
  v19 = v18;
  v27 = v19;
  -[BKAppLifecycleObserver setOnDidBecomeFrontmost:](v13, "setOnDidBecomeFrontmost:", v26);
  if (objc_msgSend(v19, "launchedToTest")
    && objc_msgSend(v19, "shouldRecordExtendedLaunchTime"))
  {
    objc_msgSend(v19, "observeExtendedLaunchTestCompletion");
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate preLaunchQueue](self, "preLaunchQueue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100063938;
  v24[3] = &unk_1008E72C0;
  v21 = v19;
  v25 = v21;
  objc_msgSend(v20, "addOperationWithBlock:", v24);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate bkStartupTaskManager](self, "bkStartupTaskManager"));
  objc_msgSend(v22, "startAllTasksInPhase:", 0);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v37);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v43);
  objc_destroyWeak(location);

  return 1;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](self, "sceneManager"));
  objc_msgSend(v8, "application:didDiscardSceneSessions:", v7, v6);

}

- (unint64_t)analyticsApplicationState
{
  return self->_analyticsApplicationState;
}

- (void)_signalExtendedLaunchComplete
{
  if (!-[BKAppLaunchCoordinator appLaunchCoordinatorIsConditionSatisfied:](self->_appLaunchCoordinator, "appLaunchCoordinatorIsConditionSatisfied:", 9))-[BKAppLaunchCoordinator signalConditionSatisfied:](self->_appLaunchCoordinator, "signalConditionSatisfied:", 9);
}

- (void)_signalEnableSyncCheck
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKAppDelegate coalescedUpdateEnableSync](self, "coalescedUpdateEnableSync"));
  objc_msgSend(v2, "signalWithCompletion:", &stru_1008EEA80);

}

- (void)_showMainViewControllerOrWelcomeScreen
{
  _QWORD *v2;
  _QWORD block[4];
  _QWORD *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D244;
  v5[3] = &unk_1008E74C8;
  objc_copyWeak(&v6, &location);
  v2 = objc_retainBlock(v5);
  if (v2)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v2[2])(v2);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001C5204;
      block[3] = &unk_1008E7818;
      v4 = v2;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_setupUserEngagement
{
  id v3;
  BKEngagementManager *v4;
  void *v5;
  BKEngagementManager *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKAppDelegate _engagementManagerDirectory](self, "_engagementManagerDirectory"));
  v3 = objc_msgSend(objc_alloc((Class)BMManagerConfiguration), "initWithDirectory:shouldRunUpdatesOnSchedule:shouldPurgeOutdatedData:", v7, 0, 1);
  v4 = [BKEngagementManager alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BCRCDataContainer defaultContainer](BCRCDataContainer, "defaultContainer"));
  v6 = -[BKEngagementManager initWithConfiguration:configurationContainer:](v4, "initWithConfiguration:configurationContainer:", v3, v5);
  -[BKAppDelegate setEngagementManager:](self, "setEngagementManager:", v6);

}

- (void)_resumeFromBackground
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10005A348;
  v2[3] = &unk_1008E72C0;
  v2[4] = self;
  -[BKAppDelegate _dieIfUnacknowledgediCloudLogoutOcccurredWithCompletion:](self, "_dieIfUnacknowledgediCloudLogoutOcccurredWithCompletion:", v2);
}

- (void)_prewarmAEPluginRegistry
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self->_appLaunchCoordinator);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C2A7C;
  v8[3] = &unk_1008E7EB0;
  objc_copyWeak(&v9, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, 5.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AEPluginRegistry sharedInstance](AEPluginRegistry, "sharedInstance"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001C2AD8;
  v5[3] = &unk_1008EAF88;
  objc_copyWeak(&v7, &location);
  v4 = v2;
  v6 = v4;
  objc_msgSend(v3, "prewarmSharedResourcesWithCompletion:", v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)_engagementManagerDirectory
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BUAppGroup books](BUAppGroup, "books"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "containerURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("EngagementCollector"), 1));

  return v4;
}

- (void)_createCoverCache
{
  -[BKAppDelegate _createCoverCacheForcingEmptyPPTCache:](self, "_createCoverCacheForcingEmptyPPTCache:", 0);
}

- (void)_createCoverCacheForcingEmptyPPTCache:(BOOL)a3
{
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  dispatch_queue_t v12;
  dispatch_queue_t v13;
  dispatch_queue_t v14;
  BKCoverCacheURLSchemeHandler *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  if (a3)
  {
    v20 = (id)objc_opt_new(_BCPPTCacheManager);
  }
  else
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
    v10 = objc_claimAutoreleasedReturnValue(v9);

    v11 = dispatch_queue_create_with_target_V2("com.apple.coverWorkQHigh", v6, 0);
    v12 = dispatch_queue_create_with_target_V2("com.apple.coverWorkQLow", v10, 0);
    v13 = dispatch_queue_create_with_target_V2("com.apple.coverTaskQ_high", v6, 0);
    v14 = dispatch_queue_create_with_target_V2("com.apple.coverTaskQ_low", v10, 0);
    v15 = objc_opt_new(BKCoverCacheURLSchemeHandler);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesCoverManager sharedInstance](BKSeriesCoverManager, "sharedInstance"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultClassDefinitionsWithProtocolHandler:stackDecomposer:](BCCacheManager, "defaultClassDefinitionsWithProtocolHandler:stackDecomposer:", v15, v16));

    v18 = objc_alloc((Class)BCCacheManager);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate libraryManager](self, "libraryManager"));
    v20 = objc_msgSend(v18, "initWithClassDefinitions:highPriorityGeneralQueue:lowPriorityGeneralQueue:highPriorityTargetQueue:backgroundTargetQueue:delegate:", v17, v11, v12, v13, v14, v19);

  }
  +[BCCacheManager setDefaultCacheManager:](BCCacheManager, "setDefaultCacheManager:", v20);

}

- (void)_applicationDidBecomeFrontmost:(id)a3
{
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  v5 = _os_activity_create((void *)&_mh_execute_header, "BKAppLaunchJaliscoUpdate", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063CDC;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  os_activity_apply(v5, block);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate menuController](self, "menuController"));
  objc_msgSend(v4, "updateKeyWindow");

}

- (void)_applicationDidBecomeActive:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[JSAApplication didBecomeActive](JSAApplication, "didBecomeActive", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](self, "sceneManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appStoreReviewManager"));
  objc_msgSend(v5, "applicationDidForeground");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudKitController sharedInstance](BCCloudKitController, "sharedInstance"));
  objc_msgSend(v6, "applicationDidBecomeActive");

  if ((id)-[BKAppDelegate analyticsApplicationState](self, "analyticsApplicationState") == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](self, "sceneManager"));
    objc_msgSend(v7, "analyticsVisibilityDidDisappear");

  }
  -[BKAppDelegate setAnalyticsApplicationState:](self, "setAnalyticsApplicationState:", 2);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](self, "sceneManager"));
  objc_msgSend(v8, "analyticsVisibilityUpdate");

}

- (void)orderFrontStandardAboutPanel:(id)a3
{
  _QWORD *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  void *v13;
  id v14;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001C1A0C;
  v12[3] = &unk_1008EEA60;
  v12[4] = self;
  v3 = objc_retainBlock(v12);
  v4 = objc_alloc_init((Class)NSMutableAttributedString);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Acknowledgments"), &stru_10091C438, 0));

  v7 = ((uint64_t (*)(_QWORD *, void *, const __CFString *))v3[2])(v3, v6, CFSTR("Acknowledgments.pdf"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v4, "appendAttributedString:", v8);

  v9 = +[BCAppKitBundleLoader appKitBundleClass](BCAppKitBundleLoader, "appKitBundleClass");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "aboutPanelOptionCreditsKey"));
  v13 = v10;
  v14 = v4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));

  objc_msgSend(v9, "orderFrontStandardAboutPanelWithOptions:", v11);
}

- (void)_cleanup
{
  void *v3;
  BKReachability *networkReachability;
  AEAnnotationProvider *sharedAnnotationProvider;

  -[BKAppDelegate _endObservingNotifications](self, "_endObservingNotifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", v3);

  networkReachability = self->_networkReachability;
  if (networkReachability)
    -[BKReachability stopNotifier](networkReachability, "stopNotifier");
  sharedAnnotationProvider = self->_sharedAnnotationProvider;
  self->_sharedAnnotationProvider = 0;

}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  return -[BKAppDelegate applicationOpenURL:options:sceneController:](self, "applicationOpenURL:options:sceneController:", a4, a5, 0);
}

- (BOOL)applicationOpenURL:(id)a3 options:(id)a4 sceneController:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = kdebug_trace(725353656, 0, 0, 0, 0);
  v12 = BCSceneLog(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scene"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "session"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "persistentIdentifier"));
    *(_DWORD *)buf = 138412802;
    v28 = v8;
    v29 = 2112;
    v30 = v9;
    v31 = 2112;
    v32 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "applicationOpenURL: url=%@, options=%@, withSceneID=%@", buf, 0x20u);

  }
  -[BKAppDelegate setSuppressOpenLastBook:](self, "setSuppressOpenLastBook:", 1);
  objc_initWeak((id *)buf, self);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate appLaunchCoordinator](self, "appLaunchCoordinator"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001C1E78;
  v22[3] = &unk_1008E7B48;
  objc_copyWeak(&v26, (id *)buf);
  v18 = v8;
  v23 = v18;
  v19 = v9;
  v24 = v19;
  v20 = v10;
  v25 = v20;
  objc_msgSend(v17, "appLaunchCoordinatorPerformWhenLaunched:block:", CFSTR("app openURL"), v22);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (void)_applicationOpenURL:(id)a3 options:(id)a4 sceneController:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  unsigned __int8 v50;
  void *v51;
  void *v52;
  void *v53;
  unsigned __int8 v54;
  void *v55;
  uint64_t v56;
  id v57;
  __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  BKAppDelegate *v63;
  id val;
  _QWORD v65[4];
  id v66;
  id v67;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](self, "sceneManager"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentSceneController"));

  }
  v62 = objc_msgSend(v12, "newShowURLTransaction");
  v14 = objc_opt_class(NSString);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", UIApplicationOpenURLOptionsSourceApplicationKey));
  v16 = BUDynamicCast(v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", UIApplicationOpenURLOptionsAnnotationKey));
  v63 = self;
  val = (id)objc_claimAutoreleasedReturnValue(-[BKAppDelegate _primarySceneControllerAnalyticsManager](self, "_primarySceneControllerAnalyticsManager"));
  objc_msgSend(val, "analyticsSetReferralURL:app:", v8, v17);
  v61 = v17;
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.iBooks.BooksWidget")))
  {
    v57 = v8;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "query"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL bu_dictionaryForQueryString:unescapedValues:](NSURL, "bu_dictionaryForQueryString:unescapedValues:", v18, 0));

    v20 = objc_opt_class(NSString);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("widgetFamily")));
    v22 = BUDynamicCast(v20, v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)v23;
    if (v23)
      v25 = (__CFString *)v23;
    else
      v25 = &stru_10091C438;
    v58 = v25;

    v26 = objc_opt_class(NSString);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("widgetKind")));
    v28 = BUDynamicCast(v26, v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)v29;
    if (v29)
      v31 = (__CFString *)v29;
    else
      v31 = &stru_10091C438;
    v32 = v31;

    v33 = objc_opt_class(NSString);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("hasAssets")));
    v35 = BUDynamicCast(v33, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v37 = objc_msgSend(v36, "BOOLValue");

    v38 = objc_opt_class(NSString);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("isStreakExposed")));
    v40 = BUDynamicCast(v38, v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v42 = objc_msgSend(v41, "BOOLValue");

    v43 = objc_msgSend(objc_alloc((Class)BAWidgetData), "initWithWidgetFamily:displayMode:isContentExposed:isStreakExposed:", v58, v32, v37, v42);
    objc_initWeak(&location, val);
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_1001C23DC;
    v65[3] = &unk_1008EAF88;
    objc_copyWeak(&v67, &location);
    v44 = v43;
    v66 = v44;
    objc_msgSend(val, "setEvaluateAfterSessionStart:", v65);

    objc_destroyWeak(&v67);
    objc_destroyWeak(&location);

    v8 = v57;
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BKApplicationOpenURLOptionsOpenAfterImportKey")));
  v46 = v45;
  if (v45)
    v47 = (uint64_t)objc_msgSend(v45, "BOOLValue");
  else
    v47 = 1;
  v59 = v11;
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BKApplicationImportInPlaceKey")));
  v49 = v48;
  if (v48)
    v50 = objc_msgSend(v48, "BOOLValue");
  else
    v50 = 0;
  v51 = v8;
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BKApplicationShowLibraryAllCollectionKey")));
  v53 = v52;
  if (v52)
    v54 = objc_msgSend(v52, "BOOLValue");
  else
    v54 = 0;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](v63, "sceneManager"));
  BYTE2(v56) = 1;
  BYTE1(v56) = v54;
  LOBYTE(v56) = v50;
  objc_msgSend(v55, "handleApplicationURL:sourceApplication:annotation:likelyUserInitiated:canImport:openAfterImport:importInPlace:showLibraryAllCollection:switchToLibrary:transaction:completion:", v51, v61, v60, 0, 1, v47, v56, v62, 0);

}

- (void)_updateEnableSync
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  +[BCSyncUserDefaults syncDefaultsWithTCC](BCSyncUserDefaults, "syncDefaultsWithTCC");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate liverpoolStatusMonitor](self, "liverpoolStatusMonitor"));
  v4 = objc_msgSend(v3, "isCloudKitEnabled");

  if ((_DWORD)v4)
  {
    v5 = +[BCSyncUserDefaults isCollectionSyncOptedIn](BCSyncUserDefaults, "isCollectionSyncOptedIn");
    v6 = +[BCSyncUserDefaults isReadingNowSyncOptedIn](BCSyncUserDefaults, "isReadingNowSyncOptedIn");
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudKitController sharedInstance](BCCloudKitController, "sharedInstance"));
  objc_msgSend(v7, "setEnableCloudSync:serviceMode:", v5, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager"));
  objc_msgSend(v8, "setEnableCloudSync:enableReadingNowSync:", v5, v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BCReadingStatisticsSyncManager sharedInstance](BCReadingStatisticsSyncManager, "sharedInstance"));
  objc_msgSend(v9, "setEnableCloudSync:", v5);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudCollectionsManager sharedManager](BCCloudCollectionsManager, "sharedManager"));
  objc_msgSend(v10, "setEnableCloudSync:", v5);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BDSCloudGlobalMetadataManager sharedManager](BDSCloudGlobalMetadataManager, "sharedManager"));
  objc_msgSend(v11, "setEnableCloudSync:", v5);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BDSSecureManager sharedManager](BDSSecureManager, "sharedManager"));
  objc_msgSend(v12, "setEnableCloudSync:", v5);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate libraryManager](self, "libraryManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "assetDetailsManager"));
  objc_msgSend(v14, "setEnableReadingNowSync:", v6);

  v16 = (id)objc_claimAutoreleasedReturnValue(-[BKAppDelegate serviceCenter](self, "serviceCenter"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "readingActivityService"));
  objc_msgSend(v15, "setEnableCloudSync:", v4);

}

- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKUserActivityManager sharedInstance](BKUserActivityManager, "sharedInstance"));
  v6 = objc_msgSend(v5, "willContinueActivityWithType:sceneController:", v4, 0);

  return v6;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v5;
  void *v6;
  unsigned __int8 v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKUserActivityManager sharedInstance](BKUserActivityManager, "sharedInstance"));
  v7 = objc_msgSend(v6, "continueActivity:sceneController:", v5, 0);

  return v7;
}

- (void)application:(id)a3 handleIntent:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  BKAppDelegate *v25;
  id v26;
  __int128 *v27;
  _QWORD v28[5];
  id v29;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = BooksSiriLog(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Handling Siri Intent: %@", (uint8_t *)&buf, 0xCu);
  }

  if (qword_1009F5220 != -1)
    dispatch_once(&qword_1009F5220, &stru_1008EED78);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = sub_10004E520;
  v34 = sub_10004E2F8;
  v35 = 0;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1001C3074;
  v28[3] = &unk_1008EEDF0;
  p_buf = &buf;
  v28[4] = self;
  v13 = v10;
  v29 = v13;
  v14 = objc_retainBlock(v28);
  v15 = objc_opt_class(INPlayMediaIntent);
  v16 = BUDynamicCast(v15, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mediaItems"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastObject"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate appLaunchCoordinator](self, "appLaunchCoordinator"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001C3590;
  v23[3] = &unk_1008EEE40;
  v21 = v19;
  v24 = v21;
  v27 = &buf;
  v22 = v14;
  v25 = self;
  v26 = v22;
  objc_msgSend(v20, "appLaunchCoordinatorPerformWhenLaunched:block:", CFSTR("tryToShowAudiobook"), v23);

  _Block_object_dispose(&buf, 8);
}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  -[BKAppDelegate performActionForShortcutItem:sceneController:completionHandler:](self, "performActionForShortcutItem:sceneController:completionHandler:", a4, 0, a5);
}

- (void)performActionForShortcutItem:(id)a3 sceneController:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = BCSceneLog(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scene"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "session"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "persistentIdentifier"));
    *(_DWORD *)buf = 138412546;
    v24 = v8;
    v25 = 2112;
    v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Performing shortcut: shortcutItem=%@, withSceneID=%@", buf, 0x16u);

  }
  kdebug_trace(725353660, 0, 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate primaryAnalyticsController](self, "primaryAnalyticsController"));
  objc_msgSend(v16, "setLaunchedFromShortcutItem");

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate appLaunchCoordinator](self, "appLaunchCoordinator"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001C3B08;
  v20[3] = &unk_1008E9110;
  v20[4] = self;
  v21 = v8;
  v22 = v10;
  v18 = v10;
  v19 = v8;
  objc_msgSend(v17, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 6, CFSTR("performActionForShortcutItem"), v20);

}

- (void)_reloadLibraryForLaunch
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate libraryManager](self, "libraryManager"));
  objc_msgSend(v3, "initializeMostRecentPurchaseDateCacheIfNeeded");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001C42D8;
  v5[3] = &unk_1008E7338;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "reloadWithCompletion:", v5);

}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  id v16;
  void *v17;
  objc_super v19;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate appAccountActionHandler](self, "appAccountActionHandler"));
  v8 = objc_msgSend(v7, "canPerformAction:withSender:", a3, v6);

  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[BKAppDelegate appAccountActionHandler](self, "appAccountActionHandler"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate appGlobalActionHandler](self, "appGlobalActionHandler"));
    v11 = objc_msgSend(v10, "canPerformAction:withSender:", a3, v6);

    if (v11)
    {
      v9 = objc_claimAutoreleasedReturnValue(-[BKAppDelegate appGlobalActionHandler](self, "appGlobalActionHandler"));
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate appInternalActionHandler](self, "appInternalActionHandler"));
      v13 = objc_msgSend(v12, "canPerformAction:withSender:", a3, v6);

      if (v13)
      {
        v9 = objc_claimAutoreleasedReturnValue(-[BKAppDelegate appInternalActionHandler](self, "appInternalActionHandler"));
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate audiobookController](self, "audiobookController"));
        v15 = objc_msgSend(v14, "canPerformAction:withSender:", a3, v6);

        if (v15)
        {
          v9 = objc_claimAutoreleasedReturnValue(-[BKAppDelegate audiobookController](self, "audiobookController"));
        }
        else
        {
          v19.receiver = self;
          v19.super_class = (Class)BKAppDelegate;
          v16 = -[BKAppDelegate targetForAction:withSender:](&v19, "targetForAction:withSender:", a3, v6);
          v9 = objc_claimAutoreleasedReturnValue(v16);
        }
      }
    }
  }
  v17 = (void *)v9;

  return v17;
}

- (void)buildMenuWithBuilder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "system"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem"));

  if (v4 == v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate menuController](self, "menuController"));
    objc_msgSend(v6, "buildWithBuilder:", v8);

    if (+[JSADevice isInternalBuild](JSADevice, "isInternalBuild"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate menuController](self, "menuController"));
      objc_msgSend(v7, "buildInternalWithBuilder:", v8);

    }
  }

}

- (void)_showWelcomeScreenIfNeeded:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  _QWORD block[4];
  _QWORD *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001C5378;
  v13[3] = &unk_1008EB378;
  objc_copyWeak(&v16, &location);
  v8 = v6;
  v14 = v8;
  v9 = v7;
  v15 = v9;
  v10 = objc_retainBlock(v13);
  if (v10)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v10[2])(v10);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001C54E4;
      block[3] = &unk_1008E7818;
      v12 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)_reloadUbiquityDataSources
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate ubiquityiOSDataSource](self, "ubiquityiOSDataSource"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001C5588;
  v5[3] = &unk_1008E72C0;
  v5[4] = self;
  objc_msgSend(v3, "reloadDataSource:completion:", v4, v5);

}

- (void)_applicationDidEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  __CFString *v10;

  +[IMSleepManager didEnterBackground](IMSleepManager, "didEnterBackground", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKUserActivityManager sharedInstance](BKUserActivityManager, "sharedInstance"));
  objc_msgSend(v4, "didEnterBackground");

  +[JSAApplication didEnterBackground](JSAApplication, "didEnterBackground");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLastOpenBookManager sharedInstance](BKLastOpenBookManager, "sharedInstance"));
  objc_msgSend(v5, "saveCurrentBookState");

  -[BKAppDelegate setAnalyticsApplicationState:](self, "setAnalyticsApplicationState:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](self, "sceneManager"));
  objc_msgSend(v6, "analyticsVisibilityDidDisappear");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate finishedAssetManager](self, "finishedAssetManager"));
  -[BKAppDelegate finishedAssetRemovalThreshold](self, "finishedAssetRemovalThreshold");
  objc_msgSend(v7, "removeFinishedDownloadsWithThreshhold:");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BCBackgroundTaskAssertion sharedAssertion](BCBackgroundTaskAssertion, "sharedAssertion"));
  objc_msgSend(v8, "claimAssertionForIdentifier:description:", CFSTR("kBackgroundAppIdentifier"), CFSTR("Backgrounding in progress"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001C5704;
  v9[3] = &unk_1008E7338;
  v9[4] = self;
  v10 = CFSTR("kBackgroundAppIdentifier");
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  +[BKApplicationShortcutController performUpdate](BKApplicationShortcutController, "performUpdate");

}

- (void)_applicationWillResignActive:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("BKGenerateOfflineCache"));

  -[BKAppDelegate setAnalyticsApplicationState:](self, "setAnalyticsApplicationState:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](self, "sceneManager"));
  objc_msgSend(v5, "analyticsVisibilityWillDisappear");

  +[JSAApplication willResignActive](JSAApplication, "willResignActive");
  -[BKAppDelegate flushJetMetricsWithCompletionHandler:](self, "flushJetMetricsWithCompletionHandler:", &stru_1008EEFC8);
}

- (void)applicationWillTerminate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  -[BKAppDelegate setAnalyticsTimeoutStart:](self, "setAnalyticsTimeoutStart:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate appLaunchCoordinator](self, "appLaunchCoordinator"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C59F8;
  v8[3] = &unk_1008E7D28;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 1, CFSTR("applicationWillTerminate"), v8);

}

- (void)_applicationWillTerminate:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  -[BKAppDelegate _analyticsForceEndSessionOnViewControllers](self, "_analyticsForceEndSessionOnViewControllers", a3);
  +[JSAApplication willTerminate](JSAApplication, "willTerminate");
  -[BKAppDelegate flushJetMetricsWithCompletionHandler:](self, "flushJetMetricsWithCompletionHandler:", &stru_1008EEFE8);
  -[BKAppDelegate saveStateClosing:](self, "saveStateClosing:", 1);
  -[BKAppDelegate _cleanup](self, "_cleanup");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate analyticsTimeoutStart](self, "analyticsTimeoutStart"));
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  if (4.0 - v7 >= 0.0)
    v8 = 4.0 - v7;
  else
    v8 = 0.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](self, "sceneManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001C5C08;
  v11[3] = &unk_1008EF008;
  *(double *)&v11[4] = v8;
  objc_msgSend(v9, "enumerateSceneController:includeHidden:", v11, 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BAAppManager sharedManager](BAAppManager, "sharedManager"));
  objc_msgSend(v10, "appSessionDidTerminate");

}

- (void)clearReadingGoals:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKAppDelegate serviceCenter](self, "serviceCenter", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "readingActivityService"));
  objc_msgSend(v3, "clearData");

}

- (void)resetOnlineContentAccess:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3));
  objc_msgSend(v3, "setBool:forKey:", 1, BEDocumentExternalLoadApprovalCacheDefaultsClearKey);

}

- (void)resetAnalyticsIdentifier:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3));
  objc_msgSend(v3, "setBool:forKey:", 1, kBAResetAnalyticsUserID);

}

- (BOOL)isSyncingEnabledForIsNewManager:(id)a3
{
  return +[BCSyncUserDefaults isAnnotationSyncOptedIn](BCSyncUserDefaults, "isAnnotationSyncOptedIn", a3);
}

- (void)processedButNoHighWaterUpdateForAssetsWithIDs:(id)a3
{
  +[BKLibraryIndexer processedButNoHighWaterUpdateForAssetsWithIDs:](BKLibraryIndexer, "processedButNoHighWaterUpdateForAssetsWithIDs:", a3);
}

- (void)willMarkAsset:(id)a3 finished:(BOOL)a4 finishedDate:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BKAppDelegate serviceCenter](self, "serviceCenter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "readingActivityService"));
  objc_msgSend(v10, "willMarkAsset:finished:finishedDate:", v9, v5, v8);

}

- (BOOL)isShowPurchasesEnabled
{
  return +[BKLibraryDataSourceJalisco isShowPurchasesEnabled](BKLibraryDataSourceJalisco, "isShowPurchasesEnabled");
}

- (BOOL)isStoreAllowed
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
  v3 = objc_msgSend(v2, "isBookStoreAllowed");

  return v3;
}

- (void)initialDataSourceFetchInitiated
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C5F3C;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didMigrateBooksCollection:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001C5FD0;
  v4[3] = &unk_1008E7338;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)libraryDidReload:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C61A8;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_iCloudStatusChanged
{
  _BOOL4 v3;
  uint64_t state64;

  state64 = 0;
  notify_get_state(self->_iCloudRestoreToken, &state64);
  v3 = state64 - 1 < 2;
  if (self->_restoringFromICloud != v3)
    self->_restoringFromICloud = v3;
}

- (void)_beginObservingICloudRestoreStatus
{
  _QWORD handler[5];

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1001C62E4;
  handler[3] = &unk_1008EF030;
  handler[4] = self;
  notify_register_dispatch((const char *)objc_msgSend(kMBManagerRestoreStateChangedNotification, "UTF8String"), &self->_iCloudRestoreToken, (dispatch_queue_t)&_dispatch_main_q, handler);
  -[BKAppDelegate _iCloudStatusChanged](self, "_iCloudStatusChanged");
}

- (void)_endObservingICloudRestoreStatus
{
  notify_cancel(self->_iCloudRestoreToken);
  self->_iCloudRestoreToken = -1;
}

- (BKReachability)networkReachability
{
  BKReachability *networkReachability;
  BKReachability *v4;
  BKReachability *v5;

  networkReachability = self->_networkReachability;
  if (!networkReachability)
  {
    v4 = (BKReachability *)objc_claimAutoreleasedReturnValue(+[BKReachability reachabilityForInternetConnection](BKReachability, "reachabilityForInternetConnection"));
    v5 = self->_networkReachability;
    self->_networkReachability = v4;

    networkReachability = self->_networkReachability;
  }
  return networkReachability;
}

- (BOOL)isConnectedToInternet
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate networkReachability](self, "networkReachability"));
  if (objc_msgSend(v2, "currentReachabilityStatus"))
    v3 = objc_msgSend(v2, "connectionRequired") ^ 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (void)_startObservingNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  void *v5;
  void *v6;
  const char *v7;
  NSObject *workloopUserInitiatedQueue;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  Block_layout *v13;
  _QWORD handler[5];
  int out_token;
  _QWORD block[5];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter)
  {
    v4 = DarwinNotifyCenter;
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1001C65F8, CFSTR("com.apple.sync.books.began"), 0, CFNotificationSuspensionBehaviorDrop);
    CFNotificationCenterAddObserver(v4, 0, (CFNotificationCallback)sub_1001C6658, CFSTR("com.apple.sync.books.finished"), 0, CFNotificationSuspensionBehaviorDrop);
    CFNotificationCenterAddObserver(v4, 0, (CFNotificationCallback)sub_1001C66B8, CFSTR("MCManagedBooksChanged"), 0, CFNotificationSuspensionBehaviorDrop);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "storeChangedNotification:", kAEStoreEnabledChangedNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "userDefaultsChanged:", NSUserDefaultsDidChangeNotification, 0);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C6718;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  -[BKAppDelegate _beginObservingICloudRestoreStatus](self, "_beginObservingICloudRestoreStatus");
  out_token = -1;
  v7 = (const char *)objc_msgSend(CFSTR("com.apple.tcc.access.changed"), "UTF8String");
  workloopUserInitiatedQueue = self->_workloopUserInitiatedQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1001C6788;
  handler[3] = &unk_1008EF030;
  handler[4] = self;
  if (notify_register_dispatch(v7, &out_token, workloopUserInitiatedQueue, handler))
    v9 = 0xFFFFFFFFLL;
  else
    v9 = out_token;
  -[BKAppDelegate setTccNotifyToken:](self, "setTccNotifyToken:", v9);
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v10 = +[BKAudiobookPlayerMuxingObserver sharedInstance](BKAudiobookPlayerMuxingObserver, "sharedInstance");
  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001C681C;
    v12[3] = &unk_1008E7818;
    v13 = &stru_1008EF050;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate networkMonitor](self, "networkMonitor"));
  objc_msgSend(v11, "start");

}

- (void)_endObservingNotifications
{
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v6;
  void *v7;
  id v8;

  if (-[BKAppDelegate tccNotifyToken](self, "tccNotifyToken") != -1)
    notify_cancel(-[BKAppDelegate tccNotifyToken](self, "tccNotifyToken"));
  -[BKAppDelegate _endObservingICloudRestoreStatus](self, "_endObservingICloudRestoreStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate networkReachability](self, "networkReachability"));
  objc_msgSend(v4, "stopNotifier");

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter)
  {
    v6 = DarwinNotifyCenter;
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.sync.books.began"), 0);
    CFNotificationCenterRemoveObserver(v6, self, CFSTR("com.apple.sync.books.finished"), 0);
    CFNotificationCenterRemoveObserver(v6, self, CFSTR("MCManagedBooksChanged"), 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  objc_msgSend(v7, "removeObserver:accountTypes:", self, 1);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKAppDelegate networkMonitor](self, "networkMonitor"));
  objc_msgSend(v8, "stop");

}

- (void)storeChangedNotification:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKAppDelegate storeController](self, "storeController", a3));
  objc_msgSend(v3, "refreshUpdateCountAsync");

}

- (void)showConfigurationErrorAndQuit
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Configuration Error"), &stru_10091C438, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("There is a problem with the configuration of your %@.\nPlease restore with iTunes or redownload Apple Books."), &stru_10091C438, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedModel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v7));
  v15 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v3, v8, 1));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Quit"), &stru_10091C438, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 1, &stru_1008EF090));
  objc_msgSend(v15, "addAction:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](self, "sceneManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentSceneController"));
  objc_msgSend(v13, "presentViewController:animated:completion:", v15, 1, 0);

}

- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate appLaunchCoordinator](self, "appLaunchCoordinator"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C6BD8;
  v8[3] = &unk_1008E77C8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 1, CFSTR("handleRemoteNotification"), v8);

}

- (void)userDefaultsChanged:(id)a3
{
  NSObject *workloopUserInitiatedQueue;
  _QWORD block[5];

  workloopUserInitiatedQueue = self->_workloopUserInitiatedQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C6D40;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(workloopUserInitiatedQueue, block);
}

- (void)networkReachabilityChanged:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  const char *v10;
  void *v11;
  unsigned int v12;
  int v13;
  const char *v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = objc_opt_class(BKReachability);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    && objc_msgSend(v4, "currentReachabilityStatus")
    && (objc_msgSend(v4, "connectionRequired") & 1) == 0)
  {
    v6 = sub_100036938();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate liverpoolStatusMonitor](self, "liverpoolStatusMonitor"));
      v9 = objc_msgSend(v8, "isCloudKitEnabled");
      v10 = "NO";
      if (v9)
        v10 = "YES";
      v13 = 136315138;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Network now reachable.  Is user opted in: %s", (uint8_t *)&v13, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate ubiquityStatusMonitor](self, "ubiquityStatusMonitor"));
    v12 = objc_msgSend(v11, "isICloudDriveEnabled");

    if (v12)
      -[BKAppDelegate _reloadUbiquityDataSources](self, "_reloadUbiquityDataSources");
  }

}

- (void)importMigratedBooks
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C6F20;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  if (qword_1009F5238 != -1)
    dispatch_once(&qword_1009F5238, block);
}

- (BOOL)annotationProvider:(id)a3 acknowledgeMergingAnnotationsWithAssetVersionMismatch:(id)a4 assetID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001C70F0;
  v16[3] = &unk_1008EF0E0;
  v16[4] = self;
  v12 = v10;
  v17 = v12;
  v20 = &v21;
  v13 = v8;
  v18 = v13;
  v14 = v9;
  v19 = v14;
  objc_msgSend(v11, "performBackgroundReadOnlyBlockAndWait:", v16);

  LOBYTE(v11) = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return (char)v11;
}

- (BOOL)libraryAssetStatusController:(id)a3 isAccountPrimaryAndSignedIn:(id)a4
{
  return 1;
}

- (void)libraryAssetStatusController:(id)a3 makeAccountPrimaryAndSignedIn:(id)a4 completion:(id)a5
{
  id v5;
  id v6;

  v5 = objc_retainBlock(a5);
  if (v5)
  {
    v6 = v5;
    (*((void (**)(id, uint64_t, _QWORD))v5 + 2))(v5, 1, 0);
    v5 = v6;
  }

}

- (void)cloudStorageUpgradeSheetWasDismissed
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate ubiquityStatusMonitor](self, "ubiquityStatusMonitor"));
  v4 = objc_msgSend(v3, "isICloudDriveEnabled");

  if (v4)
    -[BKAppDelegate _reloadUbiquityDataSources](self, "_reloadUbiquityDataSources");
}

- (void)ubiquityStatusChangedToAvailableWithNewIdentity:(id)a3 oldIdentity:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v5 = BDSCloudKitLog(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "BKAppDelegate: ubiquityStatusChangedToAvailableWithNewIdentity:", buf, 2u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001C73F4;
  v7[3] = &unk_1008E72C0;
  v7[4] = self;
  -[BKAppDelegate _dieIfUnacknowledgediCloudLogoutOcccurredWithCompletion:](self, "_dieIfUnacknowledgediCloudLogoutOcccurredWithCompletion:", v7);
}

- (void)saveStateClosing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  UIBackgroundTaskIdentifier v26;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](self, "sceneManager"));
  objc_msgSend(v5, "saveStateClosing:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "synchronize");

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = UIBackgroundTaskInvalid;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001C783C;
  v22[3] = &unk_1008E7BE8;
  v22[4] = &v23;
  v7 = objc_retainBlock(v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001C78B4;
  v20[3] = &unk_1008E7818;
  v9 = v7;
  v21 = v9;
  v10 = objc_msgSend(v8, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("BKAppDelegate SaveState"), v20);
  v24[3] = (uint64_t)v10;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate libraryManager](self, "libraryManager"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sharedAnnotationProvider](self, "sharedAnnotationProvider"));
    v13 = objc_claimAutoreleasedReturnValue(-[BKAppDelegate workloopUtilityQueue](self, "workloopUtilityQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001C78C0;
    block[3] = &unk_1008E8898;
    v17 = v11;
    v18 = v12;
    v19 = v9;
    v14 = v12;
    dispatch_async(v13, block);

  }
  else
  {
    v15 = sub_100036938();
    v14 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1006A4884();
  }

  _Block_object_dispose(&v23, 8);
}

- (void)seriesCoversForSeriesIdsChanged:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
  objc_msgSend(v4, "incrementVersionForIdentifiers:", v3);

}

+ (id)currentSceneController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentSceneController"));

  return v3;
}

+ (id)anySceneController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "anySceneController"));

  return v3;
}

+ (id)sceneControllerForViewController:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sceneControllerForViewController:", v3));

  return v5;
}

- (void)clientDetectedStoreChangeAndAccountChange:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v5 = sub_100036938();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BKAppDelegate clientDetectedStoreChangeAndAccountChange:%@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  objc_msgSend(v7, "performNamed:workerQueueBlock:", CFSTR("resetJaliscoStatus"), &stru_1008EF120);

  v8 = _os_activity_create((void *)&_mh_execute_header, "BKAppAccountSignOut", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001C7B98;
  v10[3] = &unk_1008E7338;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  os_activity_apply(v8, v10);

}

- (void)clientDetectedStoreChange:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  id v12;

  v3 = a3;
  v4 = sub_100036938();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BKAppDelegate clientDetectedStoreChange:%@", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  objc_msgSend(v6, "performNamed:workerQueueBlock:", CFSTR("resetJaliscoStatus"), &stru_1008EF160);

  v7 = _os_activity_create((void *)&_mh_execute_header, "BKAppAccountSignIn", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C8040;
  block[3] = &unk_1008E72C0;
  v10 = v3;
  v8 = v3;
  os_activity_apply(v7, block);

}

- (void)clientDetectedPredicateChange:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[BKLibraryDataSourceJaliscoDAAPClientProxy sharedproxy](BKLibraryDataSourceJaliscoDAAPClientProxy, "sharedproxy"));
  objc_msgSend(v4, "clientDetectedPredicateChange:", v3);

}

- (void)clientDetectedPurchaseServerClientExpired:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C81F8;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)clientRequestITunesAuthentication:(id)a3 withCompletion:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[BKAuthenticationAlertRequest sharedRequester](BKAuthenticationAlertRequest, "sharedRequester"));
  objc_msgSend(v5, "requestAuthenticationPolitely:completion:", 1, v4);

}

- (void)_logIfError:(id)a3 operation:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = sub_100036938();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1006A48DC((uint64_t)v6, (uint64_t)v5, v8);

  }
}

- (void)deleteCloudDataWithCompletion:(id)a3
{
  id v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  dispatch_group_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  _QWORD block[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[4];
  NSObject *v23;
  NSObject *v24;
  BKAppDelegate *v25;
  _QWORD *v26;
  _QWORD v27[4];
  NSObject *v28;
  NSObject *v29;
  BKAppDelegate *v30;
  _QWORD *v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[6];

  v4 = a3;
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = dispatch_queue_create("com.apple.iBooks.BKAppDelegate.CloudDataDeletion", v6);

  v8 = dispatch_group_create();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = sub_10004E520;
  v32[4] = sub_10004E2F8;
  v33 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate _engagementManagerDirectory](self, "_engagementManagerDirectory"));
  +[BKEngagementManager destroyPersistentStorageInDirectory:](BKEngagementManager, "destroyPersistentStorageInDirectory:", v9);

  v34[0] = objc_opt_class(BKLibraryManager);
  v34[1] = objc_opt_class(AEAnnotationProvider);
  v34[2] = objc_opt_class(BCReadingStatisticsSyncManager);
  v34[3] = objc_opt_class(BCReadingStatisticsController);
  v34[4] = objc_opt_class(BCCloudKitController);
  v34[5] = objc_opt_class(BDSCloudGlobalMetadataManager);
  v10 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 6));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1001C8754;
  v27[3] = &unk_1008EF1F8;
  v11 = v8;
  v28 = v11;
  v12 = v7;
  v29 = v12;
  v30 = self;
  v31 = v32;
  objc_msgSend((id)v10, "enumerateObjectsUsingBlock:", v27);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate serviceCenter](self, "serviceCenter"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate serviceCenter](self, "serviceCenter"));
  LOBYTE(v10) = v15 == 0;

  if ((v10 & 1) == 0)
    objc_msgSend(v13, "addObject:", v14);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001C8954;
  v22[3] = &unk_1008EF270;
  v16 = v11;
  v23 = v16;
  v17 = v12;
  v24 = v17;
  v25 = self;
  v26 = v32;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v22);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C8B68;
  block[3] = &unk_1008EF298;
  v20 = v4;
  v21 = v32;
  v18 = v4;
  dispatch_group_notify(v16, v17, block);

  _Block_object_dispose(v32, 8);
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  BKWelcomeGDPRItem *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v19 = objc_claimAutoreleasedReturnValue(-[BKAppDelegate currentLocalAccountIdentifier](self, "currentLocalAccountIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localStoreAccount"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));

  v10 = v19 | v9;
  if (v19 | v9)
    v10 = objc_msgSend((id)v19, "isEqual:", v9) ^ 1;
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0x64)
    v11 = 1;
  else
    v11 = v10;
  if (a4 == 100 || a4 == 102)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate libraryManager](self, "libraryManager"));
    objc_msgSend(v12, "updateMostRecentPurchaseDateCacheFromLibrary");
    goto LABEL_11;
  }
  if (a4 == 101)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate libraryManager](self, "libraryManager"));
    objc_msgSend(v12, "clearMostRecentPurchaseDateCache");
LABEL_11:

  }
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](self, "sceneManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "welcomeScreenManager"));

    if (!v14)
    {
      if (a4)
      {
        v15 = objc_alloc_init(BKWelcomeGDPRItem);
        -[BKAppDelegate _showWelcomeScreenIfNeeded:completion:](self, "_showWelcomeScreenIfNeeded:completion:", v15, &stru_1008EF2B8);

      }
      -[BKAppDelegate setCurrentLocalAccountIdentifier:](self, "setCurrentLocalAccountIdentifier:", v9);
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate primaryAnalyticsController](self, "primaryAnalyticsController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "applicationTracker"));
  objc_msgSend(v16, "emitAccountDidChangeEventWithTracker:type:reason:", v18, a3, a4);

}

- (id)analyticsTrackerForStoreServices:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate primaryAnalyticsController](self, "primaryAnalyticsController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationTracker"));

  return v4;
}

- (id)_analyticsSessionHost
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = objc_opt_class(BKSceneController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](self, "sceneManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primarySceneController"));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "analyticsSessionHost"));

  return v8;
}

- (void)listeningSessionWillEnd
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKAppDelegate _analyticsSessionHost](self, "_analyticsSessionHost"));
  objc_msgSend(v2, "listeningSessionWillEnd");

}

- (void)readSessionDidEnd:(id)a3 readTime:(double)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKAppDelegate _analyticsSessionHost](self, "_analyticsSessionHost"));
  objc_msgSend(v7, "readSessionDidEnd:readTime:", v6, a4);

}

- (void)playSessionDidEnd:(id)a3 playTime:(double)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKAppDelegate _analyticsSessionHost](self, "_analyticsSessionHost"));
  objc_msgSend(v7, "playSessionDidEnd:playTime:", v6, a4);

}

- (id)contentPrivateIDForContentID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate _analyticsSessionHost](self, "_analyticsSessionHost"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentPrivateIDForContentID:", v4));

  return v6;
}

- (id)contentUserIDForContentID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppDelegate _analyticsSessionHost](self, "_analyticsSessionHost"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentUserIDForContentID:", v4));

  return v6;
}

- (void)_analyticsForceEndSessionOnViewControllers
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKAppDelegate sceneManager](self, "sceneManager"));
  objc_msgSend(v2, "analyticsForceEndSession");

}

- (unint64_t)bl_beginBackgroundTaskWithName:(id)a3 expirationHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = objc_msgSend(v7, "beginBackgroundTaskWithName:expirationHandler:", v6, v5);

  return (unint64_t)v8;
}

- (void)bl_endBackgroundTask:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v4, "endBackgroundTask:", a3);

}

- (void)setUbiquityOptInController:(id)a3
{
  objc_storeStrong((id *)&self->_ubiquityOptInController, a3);
}

- (BKLibraryAssetModificationDateManager)libraryAssetModificationDateManager
{
  return self->_libraryAssetModificationDateManager;
}

- (void)setLibraryAssetModificationDateManager:(id)a3
{
  objc_storeStrong((id *)&self->_libraryAssetModificationDateManager, a3);
}

- (BKLibraryAssetPostProcessor)libraryAssetPostProcessor
{
  return self->_libraryAssetPostProcessor;
}

- (void)setLibraryAssetPostProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_libraryAssetPostProcessor, a3);
}

- (void)setUbiquityStatusMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_ubiquityStatusMonitor, a3);
}

- (BUNetworkMonitoring)networkMonitor
{
  return self->_networkMonitor;
}

- (BOOL)suppressOpenLastBook
{
  return self->_suppressOpenLastBook;
}

- (void)setSuppressOpenLastBook:(BOOL)a3
{
  self->_suppressOpenLastBook = a3;
}

- (void)setAppLaunchCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_appLaunchCoordinator, a3);
}

- (BKCriticalAlertCoordinating)criticalAlertCoordinator
{
  return self->_criticalAlertCoordinator;
}

- (void)setNetworkReachability:(id)a3
{
  objc_storeStrong((id *)&self->_networkReachability, a3);
}

- (BKAppLifecycleObserver)appLifecycleObserver
{
  return self->_appLifecycleObserver;
}

- (BKAirTrafficController)airTrafficController
{
  return self->_airTrafficController;
}

- (BKLibraryOperationObserver)libraryOperationObserver
{
  return self->_libraryOperationObserver;
}

- (void)setLibraryOperationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_libraryOperationObserver, a3);
}

- (BKAppImportCoordinator)importCoordinator
{
  return self->_importCoordinator;
}

- (void)setImportCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_importCoordinator, a3);
}

- (BKAppAccountActionHandler)appAccountActionHandler
{
  return self->_appAccountActionHandler;
}

- (BKAppGlobalActionHandler)appGlobalActionHandler
{
  return self->_appGlobalActionHandler;
}

- (BKAppInternalActionHandler)appInternalActionHandler
{
  return self->_appInternalActionHandler;
}

- (BKAudiobookController)audiobookController
{
  return self->_audiobookController;
}

- (void)setUntetheredPlistDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_untetheredPlistDataSource, a3);
}

- (BKLibraryDataSourceUbiquityiOS)ubiquityiOSDataSource
{
  return self->_ubiquityiOSDataSource;
}

- (void)setUbiquityiOSDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_ubiquityiOSDataSource, a3);
}

- (BOOL)establishedRecordSalt
{
  return self->_establishedRecordSalt;
}

- (void)setEstablishedRecordSalt:(BOOL)a3
{
  self->_establishedRecordSalt = a3;
}

- (int)tccNotifyToken
{
  return self->_tccNotifyToken;
}

- (void)setTccNotifyToken:(int)a3
{
  self->_tccNotifyToken = a3;
}

- (int)iCloudRestoreToken
{
  return self->_iCloudRestoreToken;
}

- (void)setICloudRestoreToken:(int)a3
{
  self->_iCloudRestoreToken = a3;
}

- (BOOL)isRestoringFromiCloud
{
  return self->_restoringFromICloud;
}

- (void)setRestoringFromICloud:(BOOL)a3
{
  self->_restoringFromICloud = a3;
}

- (void)setCoalescedUpdateEnableSync:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedUpdateEnableSync, a3);
}

- (void)setICloudIdentityTokenTracker:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudIdentityTokenTracker, a3);
}

- (BKBookletMigrationManager)bookletMigrationManager
{
  return self->_bookletMigrationManager;
}

- (BKFinishedAssetManager)finishedAssetManager
{
  return (BKFinishedAssetManager *)objc_getProperty(self, a2, 280, 1);
}

- (void)setFinishedAssetManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (BUAssertion)analyticsSessionAssertion
{
  return self->_analyticsSessionAssertion;
}

- (void)setAnalyticsSessionAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsSessionAssertion, a3);
}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (void)setWorkloop:(id)a3
{
  objc_storeStrong((id *)&self->_workloop, a3);
}

- (OS_dispatch_queue)workloopUserInteractiveQueue
{
  return self->_workloopUserInteractiveQueue;
}

- (void)setWorkloopUserInteractiveQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workloopUserInteractiveQueue, a3);
}

- (void)setWorkloopUserInitiatedQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workloopUserInitiatedQueue, a3);
}

- (void)setWorkloopUtilityQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workloopUtilityQueue, a3);
}

- (void)setWorkloopBackgroundQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workloopBackgroundQueue, a3);
}

- (void)setPreLaunchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_preLaunchQueue, a3);
}

- (void)setLibrarySetupQueue:(id)a3
{
  objc_storeStrong((id *)&self->_librarySetupQueue, a3);
}

- (NSDictionary)launchOptions
{
  return self->_launchOptions;
}

- (unint64_t)lastRequestedReloadGeneration
{
  return self->_lastRequestedReloadGeneration;
}

- (void)setLastRequestedReloadGeneration:(unint64_t)a3
{
  self->_lastRequestedReloadGeneration = a3;
}

- (BOOL)userHasCancelledAuthorizationPrompt
{
  return self->_userHasCancelledAuthorizationPrompt;
}

- (void)setUserHasCancelledAuthorizationPrompt:(BOOL)a3
{
  self->_userHasCancelledAuthorizationPrompt = a3;
}

- (NSDate)analyticsTimeoutStart
{
  return self->_analyticsTimeoutStart;
}

- (void)setAnalyticsTimeoutStart:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsTimeoutStart, a3);
}

- (NSString)currentLocalAccountIdentifier
{
  return self->_currentLocalAccountIdentifier;
}

- (void)setCurrentLocalAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocalAccountIdentifier, a3);
}

- (BUOSStateHandler)syncUserDefaultsStateHandler
{
  return self->_syncUserDefaultsStateHandler;
}

- (BUOSStateHandler)ubiquityStatusMonitorStateHandler
{
  return self->_ubiquityStatusMonitorStateHandler;
}

- (void)setUbiquityStatusMonitorStateHandler:(id)a3
{
  objc_storeStrong((id *)&self->_ubiquityStatusMonitorStateHandler, a3);
}

- (BUOSStateHandler)bcSyncUserDefaultsStateHandler
{
  return self->_bcSyncUserDefaultsStateHandler;
}

- (void)setCoalescingJaliscoBlock:(id)a3
{
  objc_storeStrong((id *)&self->_coalescingJaliscoBlock, a3);
}

- (double)finishedAssetRemovalThreshold
{
  return self->_finishedAssetRemovalThreshold;
}

- (void)setFinishedAssetRemovalThreshold:(double)a3
{
  self->_finishedAssetRemovalThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineCacheLoadingController, 0);
  objc_storeStrong((id *)&self->_coalescingJaliscoBlock, 0);
  objc_storeStrong((id *)&self->_bcSyncUserDefaultsStateHandler, 0);
  objc_storeStrong((id *)&self->_ubiquityStatusMonitorStateHandler, 0);
  objc_storeStrong((id *)&self->_syncUserDefaultsStateHandler, 0);
  objc_storeStrong((id *)&self->_currentLocalAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_analyticsTimeoutStart, 0);
  objc_storeStrong((id *)&self->_launchOptions, 0);
  objc_storeStrong((id *)&self->_startupQueue, 0);
  objc_storeStrong((id *)&self->_librarySetupQueue, 0);
  objc_storeStrong((id *)&self->_preLaunchQueue, 0);
  objc_storeStrong((id *)&self->_workloopBackgroundQueue, 0);
  objc_storeStrong((id *)&self->_workloopUtilityQueue, 0);
  objc_storeStrong((id *)&self->_workloopUserInitiatedQueue, 0);
  objc_storeStrong((id *)&self->_workloopUserInteractiveQueue, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_storeStrong((id *)&self->_analyticsSessionAssertion, 0);
  objc_storeStrong((id *)&self->_finishedAssetManager, 0);
  objc_storeStrong((id *)&self->_bookletMigrationManager, 0);
  objc_storeStrong((id *)&self->_iCloudIdentityTokenTracker, 0);
  objc_storeStrong((id *)&self->_coalescedUpdateEnableSync, 0);
  objc_storeStrong((id *)&self->_downloadProgressCenter, 0);
  objc_storeStrong((id *)&self->_ubiquityiOSDataSource, 0);
  objc_storeStrong((id *)&self->_untetheredPlistDataSource, 0);
  objc_storeStrong((id *)&self->_audiobookController, 0);
  objc_storeStrong((id *)&self->_appInternalActionHandler, 0);
  objc_storeStrong((id *)&self->_appGlobalActionHandler, 0);
  objc_storeStrong((id *)&self->_appAccountActionHandler, 0);
  objc_storeStrong((id *)&self->_importCoordinator, 0);
  objc_storeStrong((id *)&self->_libraryOperationObserver, 0);
  objc_storeStrong((id *)&self->_airTrafficController, 0);
  objc_storeStrong((id *)&self->_appLifecycleObserver, 0);
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_destroyWeak((id *)&self->_libraryManager);
  objc_storeStrong((id *)&self->_libraryItemStateProvider, 0);
  objc_storeStrong((id *)&self->_menuController, 0);
  objc_storeStrong((id *)&self->_criticalAlertCoordinator, 0);
  objc_storeStrong((id *)&self->_appLaunchCoordinator, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_ubiquityStatusMonitor, 0);
  objc_storeStrong((id *)&self->_ubiquitousDocumentsController, 0);
  objc_storeStrong((id *)&self->_storeController, 0);
  objc_storeStrong((id *)&self->_libraryAssetPostProcessor, 0);
  objc_storeStrong((id *)&self->_libraryAssetModificationDateManager, 0);
  objc_storeStrong((id *)&self->_libraryAssetIsNewManager, 0);
  objc_storeStrong((id *)&self->_sharedAnnotationProvider, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_coverImageHelper, 0);
  objc_storeStrong((id *)&self->_assetMetadataCache, 0);
  objc_storeStrong((id *)&self->_ubiquityOptInController, 0);
}

- (void)appGlobalActionHandler:(id)a3 open:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  BKAppDelegate *v13;
  id v14;
  NSURL *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  Class isa;
  uint64_t v20;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = (void *)objc_opt_self(UIApplication);
  v12 = a3;
  v13 = self;
  v14 = objc_msgSend(v11, "sharedApplication");
  URL._bridgeToObjectiveC()(v15);
  v17 = v16;
  v18 = sub_1001DA758((uint64_t)_swiftEmptyArrayStorage);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_100008DB0(&qword_1009D0CC8, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_10070F050);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v18);
  objc_msgSend(v14, "openURL:options:completionHandler:", v17, isa, 0);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BSUIJetActionHandling)jetActionHandler
{
  BKAppDelegate *v2;
  BKObjectGraphHost *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v8;

  v2 = self;
  v3 = -[BKAppDelegate objectGraphHost](v2, "objectGraphHost");
  v4 = *(uint64_t *)((char *)&v3->super.isa + OBJC_IVAR___BKObjectGraphHost_objectGraph);
  swift_retain(v4);

  v5 = sub_10004CFD4(&qword_1009D9420);
  BaseObjectGraph.inject<A>(_:)(&v8, v5, v5);
  swift_release(v4);
  v6 = v8;

  return (BSUIJetActionHandling *)v6;
}

- (void)registerReadingSettings
{
  sub_10000A614();
  static NSUserDefaults.books_registerReadingSettings()();
}

- (void)flushJetMetricsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  BKAppDelegate *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1008FBD88, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1008FBDB0, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1009D9460;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1008FBDD8, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1009D76E0;
  v12[5] = v11;
  v13 = self;
  v14 = sub_1005D61EC((uint64_t)v7, (uint64_t)&unk_1009E5570, (uint64_t)v12);
  swift_release(v14);
}

- (_TtP5Books20BKStartupTaskManager_)bkStartupTaskManager
{
  BKAppDelegate *v2;
  BKContainerHost *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtP5Books20BKStartupTaskManager_ *result;
  _TtP5Books20BKStartupTaskManager_ *v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v2 = self;
  v3 = -[BKAppDelegate containerHost](v2, "containerHost");
  sub_1000145A0(v9);

  v4 = v10;
  v5 = v11;
  sub_10003F198(v9, v10);
  v6 = type metadata accessor for StartupTaskManager(0);
  result = (_TtP5Books20BKStartupTaskManager_ *)dispatch thunk of ResolverType.resolve<A>(_:)(v6, v6, v4, v5);
  if (result)
  {
    v8 = result;
    _s5Books15CurrentPageViewVwxx_0(v9);

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)startDownloadPurchaseMonitor
{
  BKAppDelegate *v2;

  v2 = self;
  BKAppDelegate.startDownloadPurchaseMonitor()();

}

@end
