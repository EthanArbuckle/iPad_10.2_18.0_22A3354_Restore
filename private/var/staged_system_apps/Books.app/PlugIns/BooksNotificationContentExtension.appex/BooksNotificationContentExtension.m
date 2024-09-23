id BooksNotificationLog()
{
  if (qword_10000D0B8 != -1)
    dispatch_once(&qword_10000D0B8, &stru_100008408);
  return (id)qword_10000D0B0;
}

void sub_100002884(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.iBooks", "BooksNotification");
  v2 = (void *)qword_10000D0B0;
  qword_10000D0B0 = (uint64_t)v1;

}

void sub_10000299C(uint64_t a1, int a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  char v10;

  if (a2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100002A7C;
    block[3] = &unk_100008430;
    v9 = *(_QWORD *)(a1 + 56);
    v6 = *(id *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    v10 = 1;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    v3 = objc_retainBlock(*(id *)(a1 + 48));
    if (v3)
    {
      v4 = v3;
      (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
      v3 = v4;
    }

  }
}

void sub_100002A7C(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "_contentDataForContentID:tracker:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
  objc_msgSend(v2, "emitAddToCollectionEventWithTracker:collectionID:contentData:", *(_QWORD *)(a1 + 40), kBKCollectionDefaultIDWantToRead, v6);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
  objc_msgSend(v3, "emitWantListAddEventWithTracker:contentData:", *(_QWORD *)(a1 + 40), v6);

  v4 = objc_retainBlock(*(id *)(a1 + 48));
  v5 = v4;
  if (v4)
    (*((void (**)(id, _QWORD))v4 + 2))(v4, *(unsigned __int8 *)(a1 + 64));

}

void sub_100002D34(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "notificationDelegate"));
  objc_msgSend(v2, "feedViewController:willTransitionToContentHeight:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

}

void sub_10000321C(uint64_t a1, char a2)
{
  id v2;
  NSObject *v3;
  void *v5;
  void *v6;
  id v7;

  if ((a2 & 1) != 0)
  {
    v2 = BooksNotificationLog();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1000050DC(v3);

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "analyticsManager"));
    objc_msgSend(v5, "endSession");

    +[JSAApplication willTerminate](JSAApplication, "willTerminate");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "analyticsManager"));
    objc_msgSend(v6, "waitForSessionEndWithTimeout:", 2.0);

    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "analyticsManager"));
    objc_msgSend(v7, "appSessionDidTerminate");

  }
}

void sub_100003420(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v3 = a2;
  v4 = objc_opt_class(NSArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("host-patterns")));
  v6 = BUDynamicCast(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = objc_opt_class(NSArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("path-patterns")));

  v10 = BUDynamicCast(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "defaultAction"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "defaultURL"));

  if (objc_msgSend(a1[5], "_isURLValid:hostPatterns:pathPatterns:", v13, v7, v11))
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000035C0;
    v21[3] = &unk_1000084D0;
    v14 = a1[4];
    v22 = a1[5];
    v23 = v14;
    objc_msgSend(v22, "_setupWithCompletion:", v21);
    v15 = v23;
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000035CC;
    v18[3] = &unk_1000084D0;
    v16 = a1[6];
    v17 = a1[5];
    v19 = v16;
    v20 = v17;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);
    v15 = v19;
  }

}

id sub_1000035C0(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_renderUserNotification:", *(_QWORD *)(a1 + 40));
}

id sub_1000035CC(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)BooksNotificationViewController;
  return objc_msgSendSuper2(&v3, "didReceiveNotification:", v1);
}

uint64_t sub_100003D80(_QWORD *a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;

  v2 = BooksNotificationLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class(a1[4]);
    v5 = a1[5];
    v6 = a1[7];
    v11 = 138543874;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    v15 = 2048;
    v16 = v6;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: didReceiveNotificationResponse:completionHandler: handling URL and bump'd %@ in WTR position to #1 for action type %ld", (uint8_t *)&v11, 0x20u);

  }
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(a1[6] + 16))(a1[6], 1, v8, v9);
}

uint64_t sub_100003E6C(_QWORD *a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;

  v2 = BooksNotificationLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class(a1[4]);
    v5 = a1[5];
    v6 = a1[9];
    v12 = 138543874;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    v16 = 2048;
    v17 = v6;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: didReceiveNotificationResponse:completionHandler: handling URL and bump'd %@ in WTR position to #1 for action type %ld", (uint8_t *)&v12, 0x20u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v8, "openSensitiveURL:withOptions:", a1[6], a1[7]);

  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(a1[8] + 16))(a1[8], 1, v9, v10);
}

void sub_100004388(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD block[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentPackage"));
  objc_msgSend(v2, "registerTemplateBundlesFromPackage:", v4);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000443C;
  block[3] = &unk_100008548;
  v6 = *(id *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10000443C(uint64_t a1)
{
  void (**v1)(void);
  void (**v2)(void);

  v1 = (void (**)(void))objc_retainBlock(*(id *)(a1 + 32));
  if (v1)
  {
    v2 = v1;
    v1[2]();
    v1 = v2;
  }

}

void sub_10000469C(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "feedViewController"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BNJSAWindowProvider sharedInstance](BNJSAWindowProvider, "sharedInstance"));
  objc_msgSend(v3, "setWindow:", v2);

}

void sub_100004864(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a3;
  if (v4)
  {
    v5 = BooksNotificationLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000051A8(a1, (uint64_t)v4, v6);

  }
}

void sub_100004E60(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_10000D0C8;
  qword_10000D0C8 = (uint64_t)v1;

}

uint64_t LibraryAnalyticsDataProvider.seriesType(for:)@<X0>(uint64_t a1@<X8>)
{
  id v2;
  NSString v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = (id)BSUIGetLibraryItemStateProvider();
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend(v2, "itemStateWithIdentifier:", v3);

  swift_unknownObjectRelease(v2);
  v5 = objc_msgSend(v4, "seriesType");
  swift_unknownObjectRelease(v4);
  switch((unint64_t)v5)
  {
    case 1uLL:
      v10 = (unsigned int *)&enum case for SeriesType.nonSeries(_:);
      goto LABEL_6;
    case 2uLL:
      v10 = (unsigned int *)&enum case for SeriesType.ordered(_:);
      goto LABEL_6;
    case 3uLL:
      v10 = (unsigned int *)&enum case for SeriesType.unOrdered(_:);
LABEL_6:
      v11 = *v10;
      v12 = type metadata accessor for SeriesType(0);
      v13 = *(_QWORD *)(v12 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 104))(a1, v11, v12);
      v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56);
      v8 = a1;
      v9 = 0;
      v6 = v12;
      break;
    default:
      v6 = type metadata accessor for SeriesType(0);
      v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
      v8 = a1;
      v9 = 1;
      break;
  }
  return v7(v8, v9, 1, v6);
}

ValueMetadata *type metadata accessor for LibraryAnalyticsDataProvider()
{
  return &type metadata for LibraryAnalyticsDataProvider;
}

uint64_t static EventReporter.setupLibraryAnalyticsDataProvider()()
{
  _BYTE v1[24];
  ValueMetadata *v2;
  unint64_t v3;

  type metadata accessor for EventReporter(0);
  v2 = &type metadata for LibraryAnalyticsDataProvider;
  v3 = sub_100005050();
  return static EventReporter.libraryAnalyticsDataProvider.setter(v1);
}

unint64_t sub_100005050()
{
  unint64_t result;

  result = qword_10000D0A0;
  if (!qword_10000D0A0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LibraryAnalyticsDataProvider, &type metadata for LibraryAnalyticsDataProvider);
    atomic_store(result, (unint64_t *)&qword_10000D0A0);
  }
  return result;
}

void sub_100005094(id a1, SEL a2)
{
  _BYTE v2[24];
  ValueMetadata *v3;
  unint64_t v4;

  type metadata accessor for EventReporter(0);
  v3 = &type metadata for LibraryAnalyticsDataProvider;
  v4 = sub_100005050();
  static EventReporter.libraryAnalyticsDataProvider.setter(v2);
}

void sub_1000050DC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Process is about to be suspended. Upload metrics might have failed.", v1, 2u);
}

void sub_10000511C(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;

  v4 = 138543362;
  v5 = (id)objc_opt_class(a1);
  v3 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@: didReceiveNotification: received for a notification that did not originate from an AMS", (uint8_t *)&v4, 0xCu);

  sub_100004DE0();
}

void sub_1000051A8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;

  v5 = (void *)objc_opt_class(*(_QWORD *)(a1 + 32));
  v7 = 138543618;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  v6 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}@: can't flush Figaro event due to %@", (uint8_t *)&v7, 0x16u);

  sub_100004DE0();
}

id objc_msgSend__contentDataForContentID_tracker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentDataForContentID:tracker:");
}

id objc_msgSend__emitNotificationEngagementEventForResponse_notificationAction_actionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_emitNotificationEngagementEventForResponse:notificationAction:actionType:");
}

id objc_msgSend__isOwned_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isOwned:");
}

id objc_msgSend__isURLValid_hostPatterns_pathPatterns_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isURLValid:hostPatterns:pathPatterns:");
}

id objc_msgSend__reportMetricsEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportMetricsEvent:");
}

id objc_msgSend__setupWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupWithCompletion:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionIdentifier");
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFinishBlock:");
}

id objc_msgSend_addStoreID_toCollectionID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addStoreID:toCollectionID:completion:");
}

id objc_msgSend_addStoreIDToWantToRead_tracker_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addStoreIDToWantToRead:tracker:completion:");
}

id objc_msgSend_analyticsController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analyticsController");
}

id objc_msgSend_analyticsManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analyticsManager");
}

id objc_msgSend_appSessionDidTerminate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appSessionDidTerminate");
}

id objc_msgSend_applicationTracker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationTracker");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_ba_effectiveAnalyticsTracker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ba_effectiveAnalyticsTracker");
}

id objc_msgSend_bc_analyticsVisibilitySubtreeDidDisappear(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bc_analyticsVisibilitySubtreeDidDisappear");
}

id objc_msgSend_bc_analyticsVisibilitySubtreeWillDisappear(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bc_analyticsVisibilitySubtreeWillDisappear");
}

id objc_msgSend_bc_analyticsVisibilityUpdateSubtree(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bc_analyticsVisibilityUpdateSubtree");
}

id objc_msgSend_bc_hasMatchInRegexPatterns_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bc_hasMatchInRegexPatterns:");
}

id objc_msgSend_bc_isBookStoreAddToWantToReadURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bc_isBookStoreAddToWantToReadURL");
}

id objc_msgSend_bc_isBookStoreBuyNowURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bc_isBookStoreBuyNowURL");
}

id objc_msgSend_bc_isBookStoreStartListeningURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bc_isBookStoreStartListeningURL");
}

id objc_msgSend_bc_isBookStoreStartReadingURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bc_isBookStoreStartReadingURL");
}

id objc_msgSend_bc_isBookStoreViewInStoreURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bc_isBookStoreViewInStoreURL");
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "body");
}

id objc_msgSend_books(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "books");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_buttonActions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonActions");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "content");
}

id objc_msgSend_contentPrivateIDForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentPrivateIDForContentID:");
}

id objc_msgSend_contentUserIDForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentUserIDForContentID:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createUNNotificationActions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createUNNotificationActions");
}

id objc_msgSend_currentPackage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPackage");
}

id objc_msgSend_defaultAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultAction");
}

id objc_msgSend_defaultBag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultBag");
}

id objc_msgSend_defaultContainer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultContainer");
}

id objc_msgSend_defaultURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultURL");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dynamicRegistry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dynamicRegistry");
}

id objc_msgSend_emitAddToCollectionEventWithTracker_collectionID_contentData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitAddToCollectionEventWithTracker:collectionID:contentData:");
}

id objc_msgSend_emitNotificationEngagementEventWithTracker_engagementData_notificationData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitNotificationEngagementEventWithTracker:engagementData:notificationData:");
}

id objc_msgSend_emitWantListAddEventWithTracker_contentData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitWantListAddEventWithTracker:contentData:");
}

id objc_msgSend_endSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endSession");
}

id objc_msgSend_enqueueEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueEvent:");
}

id objc_msgSend_expectedContentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expectedContentSize");
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionContext");
}

id objc_msgSend_feedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedViewController");
}

id objc_msgSend_feedViewController_willTransitionToContentHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedViewController:willTransitionToContentHeight:");
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flush");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frame");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "host");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_initWithActionType_actionUrl_targetID_targetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActionType:actionUrl:targetID:targetType:");
}

id objc_msgSend_initWithContentID_contentType_contentPrivateID_contentUserID_contentAcquisitionType_contentSubType_contentLength_supplementalContentCount_seriesType_productionType_isUnified_contentKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentID:contentType:contentPrivateID:contentUserID:contentAcquisitionType:contentSubType:contentLength:supplementalContentCount:seriesType:productionType:isUnified:contentKind:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithNotificationContentID_notificationID_notificationType_recoType_goalType_titleCode_title_messageCode_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNotificationContentID:notificationID:notificationType:recoType:goalType:titleCode:title:messageCode:message:");
}

id objc_msgSend_initWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOptions:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithUploadsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUploadsEnabled:");
}

id objc_msgSend_initializeEnvironmentWithDataSource_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeEnvironmentWithDataSource:completion:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_itemStateWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemStateWithIdentifier:");
}

id objc_msgSend_ixStoreSheetBooks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ixStoreSheetBooks");
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "library");
}

id objc_msgSend_logKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logKey");
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manager");
}

id objc_msgSend_metricsEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsEvent");
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notification");
}

id objc_msgSend_notificationDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationDelegate");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_performExpiringActivityWithReason_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performExpiringActivityWithReason:usingBlock:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processInfo");
}

id objc_msgSend_registerStateProvider_forKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerStateProvider:forKind:");
}

id objc_msgSend_registerTemplateBundlesFromPackage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerTemplateBundlesFromPackage:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "request");
}

id objc_msgSend_setAnalyticsManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnalyticsManager:");
}

id objc_msgSend_setFeedViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeedViewController:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNotificationActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationActions:");
}

id objc_msgSend_setNotificationDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationDelegate:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindow:");
}

id objc_msgSend_setupLibraryAnalyticsDataProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupLibraryAnalyticsDataProvider");
}

id objc_msgSend_setupTrackingForRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupTrackingForRootViewController:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedReporter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedReporter");
}

id objc_msgSend_startSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startSession");
}

id objc_msgSend_stateCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateCenter");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValue");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "title");
}

id objc_msgSend_underlyingDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "underlyingDictionary");
}

id objc_msgSend_userNotificationFromNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userNotificationFromNotification:");
}

id objc_msgSend_valueWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCompletion:");
}

id objc_msgSend_videoUrl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "videoUrl");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewIfLoaded");
}

id objc_msgSend_waitForSessionEndWithTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitForSessionEndWithTimeout:");
}

id objc_msgSend_willTerminate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willTerminate");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "window");
}
