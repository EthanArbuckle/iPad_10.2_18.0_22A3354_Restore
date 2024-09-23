@implementation CustomPOIsController

- (CustomPOIsController)init
{
  CustomPOIsController *v2;
  id v3;
  NSObject *v4;
  CustomPOIsController *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _MKCustomFeatureStore *v12;
  _MKCustomFeatureStore *customFeaturesStore;
  _MKCustomFeatureStore *v14;
  _MKCustomFeatureStore *clusteringFeaturesStore;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *annotationLocale;
  NSString *v22;
  _MKCustomFeatureStore *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSHashTable *clusteringFeaturesPendingRemoval;
  uint64_t v29;
  NSMutableArray *afterUpdateBlocks;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  dispatch_queue_attr_t v35;
  NSObject *v36;
  dispatch_queue_t v37;
  OS_dispatch_queue *lock;
  dispatch_queue_attr_t v39;
  NSObject *v40;
  dispatch_queue_t v41;
  OS_dispatch_queue *calculationQueue;
  NSDictionary *customPOIs;
  uint64_t v44;
  geo_isolater *activeInjectedAnnotationLock;
  void *v46;
  objc_super v48;
  uint8_t buf[4];
  void *v50;

  v48.receiver = self;
  v48.super_class = (Class)CustomPOIsController;
  v2 = -[CustomPOIsController init](&v48, "init");
  if (!v2)
    return v2;
  v3 = sub_100432BCC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = v2;
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ((objc_opt_respondsToSelector(v5, "accessibilityIdentifier") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CustomPOIsController performSelector:](v5, "performSelector:", "accessibilityIdentifier"));
      v10 = v9;
      if (v9 && !objc_msgSend(v9, "isEqualToString:", v8))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v8, v5, v10));

        goto LABEL_8;
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v8, v5));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v50 = v11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] Initializing", buf, 0xCu);

  }
  if (qword_1014D4308 != -1)
    dispatch_once(&qword_1014D4308, &stru_1011E7F60);
  v12 = (_MKCustomFeatureStore *)objc_msgSend(objc_alloc((Class)_MKCustomFeatureStore), "initWithClustering:", 0);
  customFeaturesStore = v2->_customFeaturesStore;
  v2->_customFeaturesStore = v12;

  v14 = (_MKCustomFeatureStore *)objc_msgSend(objc_alloc((Class)_MKCustomFeatureStore), "initWithClustering:", 1);
  clusteringFeaturesStore = v2->_clusteringFeaturesStore;
  v2->_clusteringFeaturesStore = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localeIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "componentsSeparatedByString:", CFSTR("_")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lowercaseString"));
  annotationLocale = v2->_annotationLocale;
  v2->_annotationLocale = (NSString *)v20;

  if (!-[NSString length](v2->_annotationLocale, "length"))
  {
    v22 = v2->_annotationLocale;
    v2->_annotationLocale = (NSString *)CFSTR("und");

  }
  v23 = v2->_clusteringFeaturesStore;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Search result cluster subtitle, generic"), CFSTR("localized string not found"), 0));
  -[_MKCustomFeatureStore setClusterAnnotationText:locale:](v23, "setClusterAnnotationText:locale:", v25, v2->_annotationLocale);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes searchResultStyleAttributes](GEOFeatureStyleAttributes, "searchResultStyleAttributes"));
  -[_MKCustomFeatureStore setClusterStyleAttributes:](v2->_clusteringFeaturesStore, "setClusterStyleAttributes:", v26);

  -[_MKCustomFeatureStore setSceneID:](v2->_clusteringFeaturesStore, "setSceneID:", 1);
  -[_MKCustomFeatureStore setDelegate:](v2->_clusteringFeaturesStore, "setDelegate:", v2);
  v27 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
  clusteringFeaturesPendingRemoval = v2->_clusteringFeaturesPendingRemoval;
  v2->_clusteringFeaturesPendingRemoval = (NSHashTable *)v27;

  v29 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  afterUpdateBlocks = v2->_afterUpdateBlocks;
  v2->_afterUpdateBlocks = (NSMutableArray *)v29;

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  byte_1014D42F8 = objc_msgSend(v31, "BOOLForKey:", CFSTR("__personalizedMapsInjectedPOIsLookLikeAirports"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringForKey:", CFSTR("__personalizedMapsOverrideLocale")));
  v34 = (void *)qword_1014D4300;
  qword_1014D4300 = v33;

  v35 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v36 = objc_claimAutoreleasedReturnValue(v35);
  v37 = dispatch_queue_create("CustomPOIsController.lock", v36);
  lock = v2->_lock;
  v2->_lock = (OS_dispatch_queue *)v37;

  v39 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v40 = objc_claimAutoreleasedReturnValue(v39);
  v41 = dispatch_queue_create("CustomPOIsController.calculate", v40);
  calculationQueue = v2->_calculationQueue;
  v2->_calculationQueue = (OS_dispatch_queue *)v41;

  customPOIs = v2->_customPOIs;
  v2->_customPOIs = (NSDictionary *)&__NSDictionary0__struct;

  v44 = geo_isolater_create("com.apple.Maps.activeInjectedAnnotationLock");
  activeInjectedAnnotationLock = v2->_activeInjectedAnnotationLock;
  v2->_activeInjectedAnnotationLock = (geo_isolater *)v44;

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v46, "addObserver:selector:name:object:", v2, "userDefaultsDidChange:", NSUserDefaultsDidChangeNotification, 0);

  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  CustomPOIsController *v5;
  CustomPOIsController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  objc_super v13;
  uint8_t buf[4];
  __CFString *v15;

  v3 = sub_100432BCC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CustomPOIsController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] Deallocing", buf, 0xCu);

  }
  v13.receiver = self;
  v13.super_class = (Class)CustomPOIsController;
  -[CustomPOIsController dealloc](&v13, "dealloc");
}

- (void)setMapView:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  CustomPOIsController *v8;
  CustomPOIsController *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  __CFString *v21;
  __int16 v22;
  id v23;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  if (WeakRetained != v4)
  {
    v6 = sub_100432BCC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      v16 = objc_loadWeakRetained((id *)&self->_mapView);
      objc_msgSend(v16, "_removeCustomFeatureDataSource:", self->_customFeaturesStore);

      v17 = objc_loadWeakRetained((id *)&self->_mapView);
      objc_msgSend(v17, "_removeCustomFeatureDataSource:", self->_clusteringFeaturesStore);

      v18 = objc_storeWeak((id *)&self->_mapView, v4);
      objc_msgSend(v4, "_addCustomFeatureDataSource:", self->_customFeaturesStore);

      v19 = objc_loadWeakRetained((id *)&self->_mapView);
      objc_msgSend(v19, "_addCustomFeatureDataSource:", self->_clusteringFeaturesStore);

      goto LABEL_13;
    }
    v8 = self;
    v9 = v8;
    if (!v8)
    {
      v15 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v10 = (objc_class *)objc_opt_class(v8);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CustomPOIsController performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_9;
      }

    }
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_9:

LABEL_11:
    *(_DWORD *)buf = 138543618;
    v21 = v15;
    v22 = 2112;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Got a new map view: %@", buf, 0x16u);

    goto LABEL_12;
  }
LABEL_13:

}

- (void)userDefaultsDidChange:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  NSObject *lock;
  _QWORD v9[6];
  _QWORD block[6];
  _QWORD v11[5];
  id v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("__personalizedMapsInjectedPOIsLookLikeAirports"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringForKey:", CFSTR("__personalizedMapsOverrideLocale")));

  if (byte_1014D42F8 != v5
    || qword_1014D4300 | v7 && (objc_msgSend((id)qword_1014D4300, "isEqualToString:", v7) & 1) == 0)
  {
    byte_1014D42F8 = v5;
    objc_storeStrong((id *)&qword_1014D4300, (id)v7);
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = sub_100BB7800;
    v11[4] = sub_100BB7810;
    v12 = 0;
    lock = self->_lock;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100BB7818;
    block[3] = &unk_1011ADF48;
    block[4] = self;
    block[5] = v11;
    dispatch_sync(lock, block);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100BB7850;
    v9[3] = &unk_1011AD318;
    v9[4] = self;
    v9[5] = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
    _Block_object_dispose(v11, 8);

  }
}

- (void)customFeatureForKey:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", a3));
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v10 = v9;

  -[CustomPOIsController customFeatureForKeys:completion:](self, "customFeatureForKeys:completion:", v10, v6);
}

- (void)customFeatureForKeys:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *lock;
  uint64_t v11;
  _QWORD v12[6];
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  id (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  _QWORD *v22;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100BB7B80;
  v21 = sub_100BB7BA8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100BB7BB0;
  v13[3] = &unk_1011B0288;
  objc_copyWeak(&v16, &location);
  v8 = v6;
  v14 = v8;
  v9 = v7;
  v15 = v9;
  v22 = objc_retainBlock(v13);
  lock = self->_lock;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100BB7DD0;
  v12[3] = &unk_1011AD318;
  v12[4] = self;
  v12[5] = &v17;
  dispatch_sync(lock, v12);
  v11 = v18[5];
  if (v11)
    (*(void (**)(void))(v11 + 16))();
  _Block_object_dispose(&v17, 8);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)_addAfterUpdateBlock:(id)a3
{
  NSMutableArray *afterUpdateBlocks;
  id v4;

  afterUpdateBlocks = self->_afterUpdateBlocks;
  v4 = objc_msgSend(a3, "copy");
  -[NSMutableArray addObject:](afterUpdateBlocks, "addObject:", v4);

}

- (void)customFeatureStore:(id)a3 annotationTextForClusterFeatureCount:(unint64_t)a4 text:(id *)a5 locale:(id *)a6
{
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  if (self->_clusteringFeaturesStore == a3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("__personalizedMapsShowClusterCountInSubtitle"));

    if (a5 && v11)
    {
      if (a4)
        v12 = (a4 - 1);
      else
        v12 = 0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Search result cluster subtitle"), CFSTR("localized string not found"), 0));

      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v12)));
      *a5 = v15;

    }
    if (a6)
      *a6 = objc_retainAutorelease(self->_annotationLocale);
  }
}

- (void)personalizedItemManagerWillChangeItems:(id)a3
{
  NSObject *lock;
  _QWORD block[5];

  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100BB7FB8;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_sync(lock, block);
}

- (void)personalizedItemManager:(id)a3 didChangeItems:(id)a4 itemGroups:(id)a5
{
  id v5;
  _QWORD v6[5];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100BB805C;
  v6[3] = &unk_1011AC8B0;
  v6[4] = self;
  v7 = a4;
  v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

}

- (void)_createPOIsForItems:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t Log;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  NSObject *lock;
  id v11;
  NSObject *v12;
  CustomPOIsController *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  NSObject *calculationQueue;
  NSObject *v24;
  id v25;
  id v26;
  NSObject *v27;
  CustomPOIsController *v28;
  CustomPOIsController *v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  _QWORD v36[4];
  NSObject *v37;
  id v38;
  CustomPOIsController *v39;
  id v40;
  __int128 *p_buf;
  uint64_t *v42;
  id v43;
  _QWORD block[7];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  int v48;
  uint8_t v49[4];
  void *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  int v54;
  __int128 buf;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  if (!WeakRetained)
  {
    v26 = sub_100432BCC();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
LABEL_23:

      goto LABEL_24;
    }
    v28 = self;
    v29 = v28;
    if (!v28)
    {
      v35 = CFSTR("<nil>");
      goto LABEL_22;
    }
    v30 = (objc_class *)objc_opt_class(v28);
    v31 = NSStringFromClass(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    if ((objc_opt_respondsToSelector(v29, "accessibilityIdentifier") & 1) != 0)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CustomPOIsController performSelector:](v29, "performSelector:", "accessibilityIdentifier"));
      v34 = v33;
      if (v33 && !objc_msgSend(v33, "isEqualToString:", v32))
      {
        v35 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v32, v29, v34));

        goto LABEL_20;
      }

    }
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v32, v29));
LABEL_20:

LABEL_22:
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v35;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot create POIs, no map view", (uint8_t *)&buf, 0xCu);

    goto LABEL_23;
  }
  Log = GEOFindOrCreateLog(objc_msgSend(CFSTR("com.apple.Maps"), "UTF8String"), "CustomPOIsController");
  v7 = (id)objc_claimAutoreleasedReturnValue(Log);
  v8 = os_signpost_id_generate(v7);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, v9, "CreatePOIsForItems", ", (uint8_t *)&buf, 2u);
    }
  }

  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v56 = 0x3032000000;
  v57 = sub_100BB7800;
  v58 = sub_100BB7810;
  v59 = 0;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100BB85A0;
  block[3] = &unk_1011CA2C0;
  block[4] = self;
  block[5] = &v45;
  block[6] = &buf;
  dispatch_sync(lock, block);
  v11 = sub_100432BCC();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    goto LABEL_12;
  v13 = self;
  v14 = (objc_class *)objc_opt_class(v13);
  v15 = NSStringFromClass(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CustomPOIsController performSelector:](v13, "performSelector:", "accessibilityIdentifier"));
    v18 = v17;
    if (v17 && (objc_msgSend(v17, "isEqualToString:", v16) & 1) == 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

      goto LABEL_11;
    }

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_11:

  v20 = *((_DWORD *)v46 + 6);
  *(_DWORD *)v49 = 138543874;
  v50 = v19;
  v51 = 2112;
  v52 = v4;
  v53 = 1024;
  v54 = v20;
  _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] Creating POIs for items: %@ with counter: %d", v49, 0x1Cu);

LABEL_12:
  v21 = objc_loadWeakRetained((id *)&self->_mapView);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "_calloutShowAnimationGroup"));

  objc_initWeak((id *)v49, self);
  calculationQueue = self->_calculationQueue;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100BB8608;
  v36[3] = &unk_1011E7FD8;
  v37 = v7;
  v24 = v7;
  objc_copyWeak(&v43, (id *)v49);
  p_buf = &buf;
  v38 = v4;
  v39 = self;
  v42 = &v45;
  v40 = v22;
  v25 = v22;
  dispatch_async(calculationQueue, v36);

  objc_destroyWeak(&v43);
  objc_destroyWeak((id *)v49);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v45, 8);
LABEL_24:

}

- (id)injectSearchResultIfNeeded:(id)a3
{
  id v4;
  SearchResultMapItem *v5;
  SearchResultMapItem *v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  PersonalizedCompoundItem *v13;
  void *v14;
  POIAnnotation *v15;
  id v16;
  NSObject *v17;
  CustomPOIsController *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  _MKCustomFeatureStore *customFeaturesStore;
  NSObject *v26;
  id v27;
  CustomPOIsController *v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  id v35;
  CustomPOIsController *v36;
  CustomPOIsController *v37;
  objc_class *v38;
  NSString *v39;
  void *v40;
  void *v41;
  void *v42;
  __CFString *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  POIAnnotation *v49;
  SearchResultMapItem *v50;
  uint8_t v51[128];
  uint8_t buf[4];
  __CFString *v53;
  __int16 v54;
  const char *v55;

  v4 = a3;
  v5 = -[SearchResultMapItemBase initWithSearchResult:]([SearchResultMapItem alloc], "initWithSearchResult:", v4);
  v6 = v5;
  if (!v5)
  {
    v35 = sub_100432BCC();
    v7 = objc_claimAutoreleasedReturnValue(v35);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_36:
      v15 = 0;
      goto LABEL_37;
    }
    v36 = self;
    v37 = v36;
    if (!v36)
    {
      v43 = CFSTR("<nil>");
      goto LABEL_35;
    }
    v38 = (objc_class *)objc_opt_class(v36);
    v39 = NSStringFromClass(v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    if ((objc_opt_respondsToSelector(v37, "accessibilityIdentifier") & 1) != 0)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[CustomPOIsController performSelector:](v37, "performSelector:", "accessibilityIdentifier"));
      v42 = v41;
      if (v41 && !objc_msgSend(v41, "isEqualToString:", v40))
      {
        v43 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v40, v37, v42));

        goto LABEL_33;
      }

    }
    v43 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v40, v37));
LABEL_33:

LABEL_35:
    *(_DWORD *)buf = 138543618;
    v53 = v43;
    v54 = 2080;
    v55 = "-[CustomPOIsController injectSearchResultIfNeeded:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[%{public}@] %s: Failed to create PersonalizedItem item", buf, 0x16u);

    goto LABEL_36;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v7 = objc_claimAutoreleasedReturnValue(-[SearchResultMapItemBase keys](v5, "keys"));
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (!v8)
    goto LABEL_10;
  v9 = v8;
  v10 = *(_QWORD *)v46;
  while (2)
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(_QWORD *)v46 != v10)
        objc_enumerationMutation(v7);
      v12 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_customPOIs, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i)));
      if (v12)
      {
        v15 = (POIAnnotation *)v12;
        v27 = sub_100432BCC();
        v26 = objc_claimAutoreleasedReturnValue(v27);
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          goto LABEL_25;
        v28 = self;
        v29 = (objc_class *)objc_opt_class(v28);
        v30 = NSStringFromClass(v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        if ((objc_opt_respondsToSelector(v28, "accessibilityIdentifier") & 1) != 0)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[CustomPOIsController performSelector:](v28, "performSelector:", "accessibilityIdentifier"));
          v33 = v32;
          if (v32 && !objc_msgSend(v32, "isEqualToString:", v31))
          {
            v34 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v31, v28, v33));

            goto LABEL_24;
          }

        }
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v31, v28));
LABEL_24:

        *(_DWORD *)buf = 138543618;
        v53 = v34;
        v54 = 2080;
        v55 = "-[CustomPOIsController injectSearchResultIfNeeded:]";
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "[%{public}@] %s: Using cached annotation", buf, 0x16u);

        goto LABEL_25;
      }
    }
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v9)
      continue;
    break;
  }
LABEL_10:

  v13 = [PersonalizedCompoundItem alloc];
  v50 = v6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));
  v7 = -[PersonalizedCompoundItem initWithItems:](v13, "initWithItems:", v14);

  v15 = -[POIAnnotation initWithItem:defaultLocale:]([POIAnnotation alloc], "initWithItem:defaultLocale:", v7, self->_annotationLocale);
  -[CustomPOIsController setActiveInjectedAnnotation:](self, "setActiveInjectedAnnotation:", v15);
  v16 = sub_100432BCC();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = self;
    v19 = (objc_class *)objc_opt_class(v18);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if ((objc_opt_respondsToSelector(v18, "accessibilityIdentifier") & 1) == 0)
      goto LABEL_15;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CustomPOIsController performSelector:](v18, "performSelector:", "accessibilityIdentifier"));
    v23 = v22;
    if (v22 && !objc_msgSend(v22, "isEqualToString:", v21))
    {
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v18, v23));

    }
    else
    {

LABEL_15:
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v18));
    }

    *(_DWORD *)buf = 138543618;
    v53 = v24;
    v54 = 2080;
    v55 = "-[CustomPOIsController injectSearchResultIfNeeded:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}@] %s: Adding new annotation", buf, 0x16u);

  }
  customFeaturesStore = self->_customFeaturesStore;
  v49 = v15;
  v26 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v49, 1));
  -[_MKCustomFeatureStore addAnnotations:](customFeaturesStore, "addAnnotations:", v26);
LABEL_25:

LABEL_37:
  return v15;
}

- (void)clearInjectSearchResult
{
  -[CustomPOIsController setActiveInjectedAnnotation:](self, "setActiveInjectedAnnotation:", 0);
}

- (id)activeInjectedAnnotation
{
  geo_isolater *activeInjectedAnnotationLock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100BB7800;
  v10 = sub_100BB7810;
  v11 = 0;
  activeInjectedAnnotationLock = self->_activeInjectedAnnotationLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100BBBFE0;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  geo_isolate_sync(activeInjectedAnnotationLock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setActiveInjectedAnnotation:(id)a3
{
  id v4;
  geo_isolater *activeInjectedAnnotationLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  activeInjectedAnnotationLock = self->_activeInjectedAnnotationLock;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100BBC070;
  v7[3] = &unk_1011AC8B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  geo_isolate_sync(activeInjectedAnnotationLock, v7);

}

- (void)clearSearchResultStyle
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  CustomPOIsController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  CustomPOIsController *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_MKCustomFeatureStore allAnnotations](self->_clusteringFeaturesStore, "allAnnotations"));
  v4 = objc_msgSend(v3, "count");
  v5 = sub_100432BCC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4 != (id)1)
  {
    if (!v7)
      goto LABEL_18;
    v16 = self;
    v17 = (objc_class *)objc_opt_class(v16);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if ((objc_opt_respondsToSelector(v16, "accessibilityIdentifier") & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CustomPOIsController performSelector:](v16, "performSelector:", "accessibilityIdentifier"));
      v21 = v20;
      if (v20 && !objc_msgSend(v20, "isEqualToString:", v19))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v19, v16, v21));

        goto LABEL_17;
      }

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v19, v16));
LABEL_17:

    *(_DWORD *)buf = 138543362;
    v24 = v22;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Not clearing search result style, no clustered annotations", buf, 0xCu);

    goto LABEL_18;
  }
  if (!v7)
    goto LABEL_9;
  v8 = self;
  v9 = (objc_class *)objc_opt_class(v8);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CustomPOIsController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
    v13 = v12;
    if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

      goto LABEL_8;
    }

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

  *(_DWORD *)buf = 138543362;
  v24 = v14;
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Clearing search result style", buf, 0xCu);

LABEL_9:
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  if (-[NSObject isLabelPOI](v6, "isLabelPOI"))
  {
    self->_regionSearchResultCleared = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    objc_msgSend(WeakRetained, "_setDisplayedSearchResultsType:", 0);

  }
LABEL_18:

}

- (int64_t)_preferredDisplayedSearchResultTypeWithItems:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "items", 0));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v18;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(_QWORD *)v18 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j);
              if ((objc_opt_respondsToSelector(v14, "preferredDisplayedSearchResultType") & 1) != 0
                && objc_msgSend(v14, "preferredDisplayedSearchResultType"))
              {
                v15 = objc_msgSend(v14, "preferredDisplayedSearchResultType");

                goto LABEL_20;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            if (v11)
              continue;
            break;
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v15 = 0;
    }
    while (v5);
  }
  else
  {
    v15 = 0;
  }
LABEL_20:

  return (int64_t)v15;
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (BOOL)allowSingleSearchResult
{
  return self->_allowSingleSearchResult;
}

- (void)setAllowSingleSearchResult:(BOOL)a3
{
  self->_allowSingleSearchResult = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_activeInjectedAnnotationLock, 0);
  objc_storeStrong((id *)&self->_activeInjectedAnnotation, 0);
  objc_storeStrong((id *)&self->_afterUpdateBlocks, 0);
  objc_storeStrong((id *)&self->_customPOIs, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_clusteringFeaturesPendingRemoval, 0);
  objc_storeStrong((id *)&self->_clusteringFeaturesStore, 0);
  objc_storeStrong((id *)&self->_customFeaturesStore, 0);
  objc_storeStrong((id *)&self->_annotationLocale, 0);
  objc_storeStrong((id *)&self->_calculationQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
