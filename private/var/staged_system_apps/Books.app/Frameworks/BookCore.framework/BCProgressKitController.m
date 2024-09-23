@implementation BCProgressKitController

+ (BCProgressKitController)sharedController
{
  if (qword_30D530 != -1)
    dispatch_once(&qword_30D530, &stru_28C5C8);
  return (BCProgressKitController *)(id)qword_30D528;
}

- (BCProgressKitController)init
{
  BCProgressKitController *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *workQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *accessQueue;
  NSMutableDictionary *v9;
  NSMutableDictionary *openBooks;
  NSMutableDictionary *v11;
  NSMutableDictionary *activeChapters;
  NSMutableDictionary *v13;
  NSMutableDictionary *activeSections;
  NSMutableDictionary *v15;
  NSMutableDictionary *activeWidgets;
  NSMutableDictionary *v17;
  NSMutableDictionary *activeTrackingProviders;
  NSMutableDictionary *v19;
  NSMutableDictionary *readingStatisticsControllers;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)BCProgressKitController;
  v2 = -[BCProgressKitController init](&v22, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.ibooks.BCClassKitController.work", v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.ibooks.BCClassKitController.access", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v7;

    v2->_progressKitDataStore = (CLSDataStore *)+[CLSDataStore shared](CLSDataStore, "shared");
    v9 = objc_opt_new(NSMutableDictionary);
    openBooks = v2->_openBooks;
    v2->_openBooks = v9;

    v11 = objc_opt_new(NSMutableDictionary);
    activeChapters = v2->_activeChapters;
    v2->_activeChapters = v11;

    v13 = objc_opt_new(NSMutableDictionary);
    activeSections = v2->_activeSections;
    v2->_activeSections = v13;

    v15 = objc_opt_new(NSMutableDictionary);
    activeWidgets = v2->_activeWidgets;
    v2->_activeWidgets = v15;

    v17 = objc_opt_new(NSMutableDictionary);
    activeTrackingProviders = v2->_activeTrackingProviders;
    v2->_activeTrackingProviders = v17;

    v19 = objc_opt_new(NSMutableDictionary);
    readingStatisticsControllers = v2->_readingStatisticsControllers;
    v2->_readingStatisticsControllers = v19;

  }
  return v2;
}

- (id)standardProgressCapability
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = IMCommonCoreBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Reports percentage progress in the activity."), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

  v5 = objc_msgSend(objc_alloc((Class)CLSProgressReportingCapability), "initWithKind:details:", 1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v5));

  return v6;
}

- (id)standardWidgetReportingCapability
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = IMCommonCoreBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Reports score achieved and percentage progress in the activity."), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

  v6 = objc_msgSend(objc_alloc((Class)CLSProgressReportingCapability), "initWithKind:details:", 4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController standardProgressCapability](self, "standardProgressCapability"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "setByAddingObject:", v6));

  return v8;
}

- (void)_resetWithAssetID:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *workQueue;
  NSObject *v7;
  id v8;
  dispatch_time_t v9;
  id v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  NSObject *v14;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_22164;
  block[3] = &unk_28C5F0;
  block[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  dispatch_async(workQueue, block);
  v9 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v7, v9))
  {
    v10 = BCProgressKitLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1B3BC0();

  }
}

- (void)_saveChanges
{
  dispatch_semaphore_t v3;
  CLSDataStore *progressKitDataStore;
  NSObject *v5;
  dispatch_time_t v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;

  v3 = dispatch_semaphore_create(0);
  progressKitDataStore = self->_progressKitDataStore;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_222EC;
  v9[3] = &unk_28C618;
  v5 = v3;
  v10 = v5;
  -[CLSDataStore saveWithCompletion:](progressKitDataStore, "saveWithCompletion:", v9);
  v6 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = BCProgressKitLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1B3BC0();

  }
}

- (id)_bookIdentifierFromAssetID:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("bookAssetID:%@"), a3);
}

- (id)_chapterIdentifierFromAssetID:(id)a3 chapterID:(id)a4
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), a3, a4);
}

- (id)_chapterHrefFromAssetID:(id)a3 chapterID:(id)a4
{
  id v5;
  void *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:"), a3));
  v7 = (char *)objc_msgSend(v5, "rangeOfString:", v6);
  v9 = v8;

  if (v9)
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringFromIndex:", &v7[v9]));
  else
    v10 = 0;

  return v10;
}

- (id)_sectionIdentifierFromAssetID:(id)a3 chapterID:(id)a4 sectionID:(id)a5
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@:%@"), a3, a4, a5);
}

- (id)_mediaIdentifierFromCFI:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("media:%@"), a3);
}

- (id)_widgetIdentifierFromAssetID:(id)a3 parentID:(id)a4 widgetID:(id)a5
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@:%@"), a3, a4, a5);
}

- (id)_universalLinkFromAssetID:(id)a3 cfi:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL bu_urlWithAssetID:](NSURL, "bu_urlWithAssetID:", v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v7, 0));

    objc_msgSend(v8, "setFragment:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_contextWithID:(id)a3
{
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_2274C;
  v21 = sub_2275C;
  v22 = 0;
  if (objc_msgSend(v4, "length"))
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CLSQuery predicateForObjectsWithIdentifier:](CLSQuery, "predicateForObjectsWithIdentifier:", v4));
    v6 = dispatch_semaphore_create(0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController progressKitDataStore](self, "progressKitDataStore"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_22764;
    v14[3] = &unk_28C640;
    v16 = &v17;
    v8 = v6;
    v15 = v8;
    objc_msgSend(v7, "contextsMatchingPredicate:completion:", v5, v14);

    v9 = dispatch_time(0, 1000000000);
    if (dispatch_semaphore_wait(v8, v9))
    {
      v10 = BCProgressKitLog();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1B3C4C();

    }
  }
  v12 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v12;
}

- (BOOL)_isBookOpen:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController openBooks](self, "openBooks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6 != 0;
}

- (id)_getOpenBookContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController openBooks](self, "openBooks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController _contextWithID:](self, "_contextWithID:", v7));

  return v8;
}

- (id)_getActiveChapterContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController activeChapters](self, "activeChapters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController _contextWithID:](self, "_contextWithID:", v7));

  return v8;
}

- (id)_getActiveSectionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController activeSections](self, "activeSections"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController _contextWithID:](self, "_contextWithID:", v6));
  return v7;
}

- (id)_getActiveWidgetContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController activeWidgets](self, "activeWidgets"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController _contextWithID:](self, "_contextWithID:", v6));
  return v7;
}

- (id)_currentActivityForContext:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentActivity"));

  if (!v4)
    v5 = objc_msgSend(v3, "createNewActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentActivity"));

  return v6;
}

- (void)_startActivity:(BOOL)a3 forContext:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[24];

  v4 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = v6;
    do
    {
      v8 = BCProgressKitLog();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
      if (v4)
      {
        if (v10)
          sub_1B3CE4((uint64_t)v14, (uint64_t)v7);

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController _currentActivityForContext:](self, "_currentActivityForContext:", v7));
        objc_msgSend(v11, "start");
      }
      else
      {
        if (v10)
          sub_1B3D34((uint64_t)&v13, (uint64_t)v7);

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController _currentActivityForContext:](self, "_currentActivityForContext:", v7));
        objc_msgSend(v11, "stop");
      }

      if (objc_msgSend(v7, "type") == (char *)&dword_8 + 3)
        break;
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parent"));

      v7 = (void *)v12;
    }
    while (v12);

  }
}

- (void)_resignActiveContext
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CLSDataStore activeContext](self->_progressKitDataStore, "activeContext"));
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "resignActive");
    -[BCProgressKitController _startActivity:forContext:](self, "_startActivity:forContext:", 0, v4);
    v3 = v4;
  }

}

- (void)_becomeActiveOnContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CLSDataStore activeContext](self->_progressKitDataStore, "activeContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    if (v4)
      -[BCProgressKitController _resignActiveContext](self, "_resignActiveContext");
    objc_msgSend(v8, "becomeActive");
    -[BCProgressKitController _startActivity:forContext:](self, "_startActivity:forContext:", 1, v8);
  }

}

- (void)_deactivateCurrentWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void **v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *, void *);
  void *v18;
  BCProgressKitController *v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController _getActiveWidgetContext:](self, "_getActiveWidgetContext:", v4));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CLSDataStore activeContext](self->_progressKitDataStore, "activeContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController _currentActivityForContext:](self, "_currentActivityForContext:", v6));
      v10 = objc_msgSend(v9, "isStarted");

    }
    else
    {
      v10 = 0;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController activeTrackingProviders](self, "activeTrackingProviders"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v4));

    if (v10
      && objc_msgSend(v12, "tracksScore")
      && (objc_opt_respondsToSelector(v12, "queryScore:") & 1) != 0)
    {
      v15 = _NSConcreteStackBlock;
      v16 = 3221225472;
      v17 = sub_22E90;
      v18 = &unk_28C668;
      v19 = self;
      v20 = v5;
      objc_msgSend(v12, "queryScore:", &v15);

    }
    else
    {
      -[BCProgressKitController _resignActiveContext](self, "_resignActiveContext");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController activeWidgets](self, "activeWidgets", v15, v16, v17, v18, v19));
    objc_msgSend(v13, "removeObjectForKey:", v4);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController activeTrackingProviders](self, "activeTrackingProviders"));
    objc_msgSend(v14, "removeObjectForKey:", v4);

  }
}

- (void)_updateContext:(id)a3 withProgress:(double)a4
{
  NSObject *workQueue;
  id v7;
  void *v8;
  id v9;

  workQueue = self->_workQueue;
  v7 = a3;
  dispatch_assert_queue_V2(workQueue);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[CLSDataStore activeContext](self->_progressKitDataStore, "activeContext"));
  -[BCProgressKitController _becomeActiveOnContext:](self, "_becomeActiveOnContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController _currentActivityForContext:](self, "_currentActivityForContext:", v7));

  objc_msgSend(v8, "addProgressRangeFromStart:toEnd:", 0.0, a4);
  -[BCProgressKitController _becomeActiveOnContext:](self, "_becomeActiveOnContext:", v9);
  -[BCProgressKitController _saveChanges](self, "_saveChanges");

}

- (void)_updateContext:(id)a3 withScore:(double)a4 maxScore:(double)a5
{
  NSObject *workQueue;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  workQueue = self->_workQueue;
  v9 = a3;
  dispatch_assert_queue_V2(workQueue);
  v15 = (id)objc_claimAutoreleasedReturnValue(-[CLSDataStore activeContext](self->_progressKitDataStore, "activeContext"));
  -[BCProgressKitController _becomeActiveOnContext:](self, "_becomeActiveOnContext:", v9);
  v10 = objc_alloc((Class)CLSScoreItem);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v13 = objc_msgSend(v10, "initWithIdentifier:title:score:maxScore:", v11, v12, a4, a5);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController _currentActivityForContext:](self, "_currentActivityForContext:", v9));
  objc_msgSend(v14, "addAdditionalActivityItem:", v13);
  objc_msgSend(v14, "setPrimaryActivityItem:", v13);
  objc_msgSend(v14, "addProgressRangeFromStart:toEnd:", 0.0, 1.0);
  -[BCProgressKitController _becomeActiveOnContext:](self, "_becomeActiveOnContext:", v15);
  -[BCProgressKitController _saveChanges](self, "_saveChanges");

}

- (void)readingStatisticsDidChangeOnController:(id)a3 changes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t, _BYTE *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_2274C;
  v20 = sub_2275C;
  v21 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController readingStatisticsControllers](self, "readingStatisticsControllers"));
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_23208;
  v13 = &unk_28C690;
  v9 = v6;
  v14 = v9;
  v15 = &v16;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v10);

  if (objc_msgSend((id)v17[5], "length", v10, v11, v12, v13))
    -[BCProgressKitController updateBookProgress:completion:](self, "updateBookProgress:completion:", v17[5], 0);

  _Block_object_dispose(&v16, 8);
}

- (void)buildContextTree:(id)a3 forBook:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *workQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  BCProgressKitController *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_2333C;
  v15[3] = &unk_28C190;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(workQueue, v15);

}

- (void)contextForBook:(id)a3 title:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *workQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_23B20;
  v15[3] = &unk_28C190;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(workQueue, v15);

}

- (void)activeContextWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_23CD8;
  v7[3] = &unk_28C388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)didOpenBookWithAssetID:(id)a3 version:(id)a4 title:(id)a5 pageCount:(int64_t)a6 storeID:(id)a7 completion:(id)a8
{
  -[BCProgressKitController didOpenBookWithAssetID:version:title:pageCount:storeID:coverImage:completion:](self, "didOpenBookWithAssetID:version:title:pageCount:storeID:coverImage:completion:", a3, a4, a5, a6, a7, 0, a8);
}

- (void)didOpenBookWithAssetID:(id)a3 version:(id)a4 title:(id)a5 pageCount:(int64_t)a6 storeID:(id)a7 coverImage:(id)a8 completion:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *workQueue;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  int64_t v31;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_23E80;
  block[3] = &unk_28C6B8;
  block[4] = self;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v30 = v18;
  v31 = a6;
  v29 = v17;
  v20 = v18;
  v21 = v17;
  v22 = v16;
  v23 = v15;
  v24 = v14;
  dispatch_async(workQueue, block);

}

- (void)addReadingStatisticsController:(id)a3 forAssetID:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    objc_msgSend(v7, "addObserver:", self);
    v8 = (id)objc_claimAutoreleasedReturnValue(-[BCProgressKitController readingStatisticsControllers](self, "readingStatisticsControllers"));
    objc_msgSend(v8, "setObject:forKey:", v7, v6);

  }
}

- (void)didCloseBookWithAssetID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_24250;
  block[3] = &unk_28B750;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (void)updateBookProgress:(id)a3 completion:(id)a4
{
  -[BCProgressKitController _updateBookProgress:currentPage:completion:](self, "_updateBookProgress:currentPage:completion:", a3, 0x7FFFFFFFFFFFFFFFLL, a4);
}

- (void)updateBookProgress:(id)a3 currentPage:(int64_t)a4 completion:(id)a5
{
  -[BCProgressKitController _updateBookProgress:currentPage:completion:](self, "_updateBookProgress:currentPage:completion:", a3, a4, a5);
}

- (void)_updateBookProgress:(id)a3 currentPage:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *workQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  workQueue = self->_workQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_2462C;
  v13[3] = &unk_28C708;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(workQueue, v13);

}

- (void)activateChapterForBook:(id)a3 chapterID:(id)a4 title:(id)a5 completion:(id)a6
{
  -[BCProgressKitController _activateChapterForBook:chapterID:title:currentPage:chapterRange:completion:](self, "_activateChapterForBook:chapterID:title:currentPage:chapterRange:completion:", a3, a4, a5, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, 0, a6);
}

- (void)activateChapterForBook:(id)a3 chapterID:(id)a4 title:(id)a5 currentPage:(int64_t)a6 chapterRange:(_NSRange)a7 completion:(id)a8
{
  -[BCProgressKitController _activateChapterForBook:chapterID:title:currentPage:chapterRange:completion:](self, "_activateChapterForBook:chapterID:title:currentPage:chapterRange:completion:", a3, a4, a5, a6, a7.location, a7.length);
}

- (void)_activateChapterForBook:(id)a3 chapterID:(id)a4 title:(id)a5 currentPage:(int64_t)a6 chapterRange:(_NSRange)a7 completion:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *workQueue;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  NSUInteger v28;
  NSUInteger v29;
  int64_t v30;

  length = a7.length;
  location = a7.location;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  workQueue = self->_workQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_24BB4;
  v23[3] = &unk_28C730;
  v23[4] = self;
  v24 = v14;
  v25 = v15;
  v26 = v16;
  v29 = length;
  v30 = a6;
  v27 = v17;
  v28 = location;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  dispatch_async(workQueue, v23);

}

- (id)_updateCurrentChapterProgressForBook:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_2274C;
  v36 = sub_2275C;
  v37 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController _getActiveChapterContext:](self, "_getActiveChapterContext:", v4));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController readingStatisticsControllers](self, "readingStatisticsControllers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController _chapterHrefFromAssetID:chapterID:](self, "_chapterHrefFromAssetID:chapterID:", v4, v8));

      v26 = 0;
      v27 = &v26;
      v28 = 0x3032000000;
      v29 = sub_2274C;
      v30 = sub_2275C;
      v31 = 0;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_251BC;
      v22[3] = &unk_28C6E0;
      v24 = &v32;
      v25 = &v26;
      v10 = dispatch_semaphore_create(0);
      v23 = v10;
      objc_msgSend(v7, "tocEntryStatisticsForHref:completion:", v9, v22);
      v11 = dispatch_time(0, 1000000000);
      if (dispatch_semaphore_wait(v10, v11))
      {
        v12 = BCProgressKitLog();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_1B4090();

      }
      if (!v33[5])
      {
        objc_msgSend((id)v27[5], "doubleValue");
        -[BCProgressKitController _updateContext:withProgress:](self, "_updateContext:withProgress:", v5);
      }

      _Block_object_dispose(&v26, 8);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCProgressKitController activeChapters](self, "activeChapters"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v4));

      if (objc_msgSend(v9, "isProgressValid"))
      {
        objc_msgSend(v9, "progress");
        -[BCProgressKitController _updateContext:withProgress:](self, "_updateContext:withProgress:", v5);
      }
      else
      {
        v15 = BCProgressKitLog();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          sub_1B41C8();

      }
    }

  }
  v17 = (void *)v33[5];
  if (v17)
  {
    v18 = BCProgressKitLog();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1B4154();

    v17 = (void *)v33[5];
  }
  v20 = v17;

  _Block_object_dispose(&v32, 8);
  return v20;
}

- (void)activateSectionForBook:(id)a3 chapterID:(id)a4 sectionID:(id)a5 title:(id)a6 completion:(id)a7
{
  id v7;
  id v8;

  v7 = objc_retainBlock(a7);
  if (v7)
  {
    v8 = v7;
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    v7 = v8;
  }

}

- (void)updateMediaForBook:(id)a3 chapter:(id)a4 mediaCFI:(id)a5 progress:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *workQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  workQueue = self->_workQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_253B0;
  v23[3] = &unk_28C780;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(workQueue, v23);

}

- (void)activateWidgetForBook:(id)a3 chapterID:(id)a4 sectionID:(id)a5 widgetID:(id)a6 title:(id)a7 trackingProvider:(id)a8 cfi:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *workQueue;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD block[5];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  v32 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_25AF4;
  block[3] = &unk_28C7A8;
  block[4] = self;
  v34 = v32;
  v35 = v20;
  v36 = v17;
  v37 = v16;
  v38 = v18;
  v39 = v21;
  v40 = v19;
  v41 = v22;
  v24 = v22;
  v25 = v19;
  v26 = v21;
  v27 = v18;
  v28 = v16;
  v29 = v17;
  v30 = v20;
  v31 = v32;
  dispatch_async(workQueue, block);

}

- (void)deactivateCurrentWidgetForBook:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_25E48;
  block[3] = &unk_28B750;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (void)updateWidgetProgressForBook:(id)a3 chapterID:(id)a4 sectionID:(id)a5 widgetID:(id)a6 percent:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *workQueue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_26064;
  block[3] = &unk_28C7D0;
  block[4] = self;
  v28 = v14;
  v29 = v16;
  v30 = v15;
  v31 = v17;
  v32 = v18;
  v33 = v19;
  v21 = v19;
  v22 = v18;
  v23 = v17;
  v24 = v15;
  v25 = v16;
  v26 = v14;
  dispatch_async(workQueue, block);

}

- (void)updateWidgetScoreForBook:(id)a3 chapterID:(id)a4 sectionID:(id)a5 widgetID:(id)a6 score:(id)a7 total:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *workQueue;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  workQueue = self->_workQueue;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_26280;
  v30[3] = &unk_28C7F8;
  v30[4] = self;
  v31 = v15;
  v32 = v17;
  v33 = v16;
  v34 = v18;
  v35 = v19;
  v36 = v20;
  v37 = v21;
  v23 = v21;
  v24 = v20;
  v25 = v19;
  v26 = v18;
  v27 = v16;
  v28 = v17;
  v29 = v15;
  dispatch_async(workQueue, v30);

}

- (void)resetWidgetAttemptForBook:(id)a3 chapterID:(id)a4 sectionID:(id)a5 widgetID:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *workQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  workQueue = self->_workQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_2646C;
  v23[3] = &unk_28C780;
  v23[4] = self;
  v24 = v12;
  v25 = v14;
  v26 = v13;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v13;
  v21 = v14;
  v22 = v12;
  dispatch_async(workQueue, v23);

}

- (void)updateBook:(id)a3 withTitle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *workQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_265E8;
  v15[3] = &unk_28C190;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(workQueue, v15);

}

- (BOOL)testMode
{
  return self->_testMode;
}

- (void)setTestMode:(BOOL)a3
{
  self->_testMode = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (CLSDataStore)progressKitDataStore
{
  return self->_progressKitDataStore;
}

- (NSMutableDictionary)openBooks
{
  return self->_openBooks;
}

- (void)setOpenBooks:(id)a3
{
  objc_storeStrong((id *)&self->_openBooks, a3);
}

- (NSMutableDictionary)activeChapters
{
  return self->_activeChapters;
}

- (void)setActiveChapters:(id)a3
{
  objc_storeStrong((id *)&self->_activeChapters, a3);
}

- (NSMutableDictionary)activeSections
{
  return self->_activeSections;
}

- (void)setActiveSections:(id)a3
{
  objc_storeStrong((id *)&self->_activeSections, a3);
}

- (NSMutableDictionary)activeWidgets
{
  return self->_activeWidgets;
}

- (void)setActiveWidgets:(id)a3
{
  objc_storeStrong((id *)&self->_activeWidgets, a3);
}

- (NSMutableDictionary)activeTrackingProviders
{
  return self->_activeTrackingProviders;
}

- (void)setActiveTrackingProviders:(id)a3
{
  objc_storeStrong((id *)&self->_activeTrackingProviders, a3);
}

- (NSMutableDictionary)readingStatisticsControllers
{
  return self->_readingStatisticsControllers;
}

- (void)setReadingStatisticsControllers:(id)a3
{
  objc_storeStrong((id *)&self->_readingStatisticsControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readingStatisticsControllers, 0);
  objc_storeStrong((id *)&self->_activeTrackingProviders, 0);
  objc_storeStrong((id *)&self->_activeWidgets, 0);
  objc_storeStrong((id *)&self->_activeSections, 0);
  objc_storeStrong((id *)&self->_activeChapters, 0);
  objc_storeStrong((id *)&self->_openBooks, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
