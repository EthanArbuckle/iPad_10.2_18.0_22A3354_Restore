@implementation MapsRadarController

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100270730;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D1E88 != -1)
    dispatch_once(&qword_1014D1E88, block);
  return (id)qword_1014D1E80;
}

- (MapsRadarController)init
{
  void *v3;
  unsigned __int8 v4;
  MapsRadarController *v5;
  id v6;
  NSObject *v7;
  NSBundle *v8;
  void *v9;
  NSString *v10;
  void *v11;
  const char *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *isolationQueue;
  GEOObserverHashTable *v17;
  GEOObserverHashTable *observers;
  _QWORD *v19;
  NSBundle *v20;
  void *v21;
  NSString *v22;
  void *v23;
  id v24;
  const char *v25;
  dispatch_queue_attr_t v26;
  NSObject *v27;
  dispatch_queue_t v28;
  OS_dispatch_queue *diagnosticExtensionDarwinQueue;
  NSObject *v30;
  _QWORD *v31;
  NSBundle *v32;
  void *v33;
  NSString *v34;
  void *v35;
  id v36;
  const char *v37;
  dispatch_queue_attr_t v38;
  NSObject *v39;
  dispatch_queue_t v40;
  OS_dispatch_queue *carplayDarwinQueue;
  const char *v42;
  NSObject *v43;
  _QWORD *v44;
  MapsRadarController *v45;
  id v46;
  NSObject *v47;
  id v48;
  NSObject *v49;
  char *v50;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  _QWORD handler[4];
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  objc_super v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  int v67;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v4 = objc_msgSend(v3, "isInternalInstall");

  if ((v4 & 1) != 0)
  {
    v61.receiver = self;
    v61.super_class = (Class)MapsRadarController;
    v5 = -[MapsRadarController init](&v61, "init");
    if (v5)
    {
      v6 = sub_100270D38();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v63 = (const char *)v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
      }

      v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v5));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.isolationQueue.%p"), v9, objc_opt_class(v5), v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

      v52 = objc_retainAutorelease(v11);
      v12 = (const char *)objc_msgSend(v52, "UTF8String");
      v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      v15 = dispatch_queue_create(v12, v14);
      isolationQueue = v5->_isolationQueue;
      v5->_isolationQueue = (OS_dispatch_queue *)v15;

      v17 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___MapsRadarAttachmentProvider, v5->_isolationQueue);
      observers = v5->_observers;
      v5->_observers = v17;

      objc_initWeak((id *)buf, v5);
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_100270D78;
      v59[3] = &unk_1011AE518;
      objc_copyWeak(&v60, (id *)buf);
      v19 = objc_retainBlock(v59);
      v20 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v5));
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.DiagnosticExtensionDarwinQueue.%p"), v21, objc_opt_class(v5), v5);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

      v24 = objc_retainAutorelease(v23);
      v25 = (const char *)objc_msgSend(v24, "UTF8String");
      v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      v28 = dispatch_queue_create(v25, v27);
      diagnosticExtensionDarwinQueue = v5->_diagnosticExtensionDarwinQueue;
      v5->_diagnosticExtensionDarwinQueue = (OS_dispatch_queue *)v28;

      v5->_diagnosticExtensionDarwinToken = -1;
      v30 = v5->_diagnosticExtensionDarwinQueue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100271230;
      handler[3] = &unk_1011AE568;
      objc_copyWeak(&v58, (id *)buf);
      v31 = v19;
      v57 = v31;
      notify_register_dispatch("com.apple.Maps.DEMapsExtension.CollectionRequest", &v5->_diagnosticExtensionDarwinToken, v30, handler);
      v32 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v5));
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.CarPlayDarwinQueue.%p"), v33, objc_opt_class(v5), v5);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

      v36 = objc_retainAutorelease(v35);
      v37 = (const char *)objc_msgSend(v36, "UTF8String");
      v38 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      v40 = dispatch_queue_create(v37, v39);
      carplayDarwinQueue = v5->_carplayDarwinQueue;
      v5->_carplayDarwinQueue = (OS_dispatch_queue *)v40;

      v5->_carplayDarwinToken = -1;
      v42 = (const char *)objc_msgSend(CFSTR("com.apple.carkit.maps-diagnostics-starting"), "UTF8String");
      v43 = v5->_carplayDarwinQueue;
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_1002713DC;
      v53[3] = &unk_1011AE568;
      objc_copyWeak(&v55, (id *)buf);
      v44 = v31;
      v54 = v44;
      notify_register_dispatch(v42, &v5->_carplayDarwinToken, v43, v53);

      objc_destroyWeak(&v55);
      objc_destroyWeak(&v58);

      objc_destroyWeak(&v60);
      objc_destroyWeak((id *)buf);

    }
    self = v5;
    v45 = self;
  }
  else
  {
    v46 = sub_1004318FC();
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v63 = "-[MapsRadarController init]";
      v64 = 2080;
      v65 = "MapsRadarController.m";
      v66 = 1024;
      v67 = 66;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v48 = sub_1004318FC();
      v49 = objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v50 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v63 = v50;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v45 = 0;
  }

  return v45;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  int diagnosticExtensionDarwinToken;
  int carplayDarwinToken;
  objc_super v7;
  uint8_t buf[4];
  MapsRadarController *v9;

  v3 = sub_100270D38();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  diagnosticExtensionDarwinToken = self->_diagnosticExtensionDarwinToken;
  if (diagnosticExtensionDarwinToken != -1)
    notify_cancel(diagnosticExtensionDarwinToken);
  carplayDarwinToken = self->_carplayDarwinToken;
  if (carplayDarwinToken != -1)
    notify_cancel(carplayDarwinToken);
  v7.receiver = self;
  v7.super_class = (Class)MapsRadarController;
  -[MapsRadarController dealloc](&v7, "dealloc");
}

- (void)addAttachmentProvider:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  MapsRadarController *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  v5 = sub_100270D38();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 134349314;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Adding attachment provider: %@", (uint8_t *)&v7, 0x16u);
  }

  -[GEOObserverHashTable registerObserver:queue:](self->_observers, "registerObserver:queue:", v4, &_dispatch_main_q);
}

- (void)removeAttachmentProvider:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  MapsRadarController *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  v5 = sub_100270D38();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 134349314;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Removing attachment provider: %@", (uint8_t *)&v7, 0x16u);
  }

  -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", v4);
}

- (void)launchTTR
{
  -[MapsRadarController launchTTRWithRadar:](self, "launchTTRWithRadar:", 0);
}

- (void)launchTTRWithRadar:(id)a3
{
  -[MapsRadarController launchTTRWithRadar:promptTitle:fromViewController:](self, "launchTTRWithRadar:promptTitle:fromViewController:", a3, 0, 0);
}

- (void)launchTTRWithRadar:(id)a3 promptTitle:(id)a4 fromViewController:(id)a5
{
  char *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  MapsRadarDraft *v13;
  id v14;
  _QWORD *v15;
  const char *label;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  const char *v28;
  const char *v29;
  id v30;
  NSObject *v31;
  MapsRadarController *v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  MapsRadarController *v37;
  id v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  MapsRadarController *v42;
  id *v43;
  id *v44;
  _QWORD v45[4];
  _QWORD *v46;
  uint64_t *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  uint64_t *v51;
  id v52;
  id location;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  MapsRadarDraft *v59;
  uint8_t buf[4];
  MapsRadarController *v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  _BYTE v65[24];
  __int16 v66;
  const char *v67;

  v8 = (char *)a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100270D38();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349826;
    v61 = self;
    v62 = 2112;
    v63 = v8;
    v64 = 2112;
    *(_QWORD *)v65 = v9;
    *(_WORD *)&v65[8] = 2112;
    *(_QWORD *)&v65[10] = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Launching TTR with radar: %@ promptTitle: %@ viewController: %@", buf, 0x2Au);
  }

  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = sub_100271334;
  v58 = sub_100271344;
  if (v8)
    v13 = v8;
  else
    v13 = objc_opt_new(MapsRadarDraft);
  v59 = v13;
  objc_initWeak(&location, self);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100271FFC;
  v49[3] = &unk_1011AE5E0;
  v51 = &v54;
  v43 = &v52;
  objc_copyWeak(&v52, &location);
  v14 = v10;
  v50 = v14;
  v15 = objc_retainBlock(v49);
  if (v9)
  {
    label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
    v17 = dispatch_queue_get_label(0);
    if (label != v17 && (!label || !v17 || strcmp(label, v17)))
    {
      v26 = sub_1004318FC();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v29 = dispatch_queue_get_label(0);
        *(_DWORD *)buf = 136316418;
        v61 = (MapsRadarController *)"-[MapsRadarController launchTTRWithRadar:promptTitle:fromViewController:]";
        v62 = 2080;
        v63 = "MapsRadarController.m";
        v64 = 1024;
        *(_DWORD *)v65 = 221;
        *(_WORD *)&v65[4] = 2080;
        *(_QWORD *)&v65[6] = "dispatch_get_main_queue()";
        *(_WORD *)&v65[14] = 2080;
        *(_QWORD *)&v65[16] = v28;
        v66 = 2080;
        v67 = v29;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v30 = sub_1004318FC();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = (MapsRadarController *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols", &v52));
          *(_DWORD *)buf = 138412290;
          v61 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
    if (!v14)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
      if (!v18)
      {
        v33 = sub_1004318FC();
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v61 = (MapsRadarController *)"-[MapsRadarController launchTTRWithRadar:promptTitle:fromViewController:]";
          v62 = 2080;
          v63 = "MapsRadarController.m";
          v64 = 1024;
          *(_DWORD *)v65 = 224;
          *(_WORD *)&v65[4] = 2080;
          *(_QWORD *)&v65[6] = "mapsKeySceneDelegate != nil";
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100A70734())
        {
          v35 = sub_1004318FC();
          v36 = objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            v37 = (MapsRadarController *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            v61 = v37;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
      }
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topMostPresentedViewController", v43));
      if (!v14)
      {
        v38 = sub_1004318FC();
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v61 = (MapsRadarController *)"-[MapsRadarController launchTTRWithRadar:promptTitle:fromViewController:]";
          v62 = 2080;
          v63 = "MapsRadarController.m";
          v64 = 1024;
          *(_DWORD *)v65 = 226;
          *(_WORD *)&v65[4] = 2080;
          *(_QWORD *)&v65[6] = "viewController != nil";
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100A70734())
        {
          v40 = sub_1004318FC();
          v41 = objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            v42 = (MapsRadarController *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            v61 = v42;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
      }

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("[Internal only]\nTap to Radar"), v9, 1, v43));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100272C24;
    v45[3] = &unk_1011AE608;
    objc_copyWeak(&v48, &location);
    v47 = &v54;
    v46 = v15;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("OK"), 0, v45));
    objc_msgSend(v19, "addAction:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Not now"), 1, 0));
    objc_msgSend(v19, "addAction:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MapsInternalAlertPresentationController sharedInstance](MapsInternalAlertPresentationController, "sharedInstance"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "window"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "windowScene"));
    objc_msgSend(v22, "presentAlertController:fromWindowScene:", v19, v25);

    objc_destroyWeak(&v48);
  }
  else
  {
    -[MapsRadarController _collectAttachmentsWithRadarDraft:completion:](self, "_collectAttachmentsWithRadarDraft:completion:", v55[5], v15, &v52);
  }

  objc_destroyWeak(v44);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v54, 8);

}

- (void)_collectAttachmentsWithRadarDraft:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  id v14;
  dispatch_group_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  void *v25;
  _QWORD block[4];
  id v27;
  id v28;
  _BYTE *v29;
  id v30;
  _QWORD v31[4];
  NSObject *v32;
  MapsRadarController *v33;
  id v34;
  id v35;
  id location;
  _BYTE buf[24];
  __int128 v38;
  id v39;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v21 = sub_1004318FC();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[MapsRadarController _collectAttachmentsWithRadarDraft:completion:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "MapsRadarController.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v38) = 247;
      WORD2(v38) = 2080;
      *(_QWORD *)((char *)&v38 + 6) = "completion != nil";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v23 = sub_1004318FC();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v8 = sub_100270D38();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Collecting attachments", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v10, "setBool:forKey:", 1, off_1014A3148);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&v38 = sub_100271334;
  *((_QWORD *)&v38 + 1) = sub_100271344;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%p.attachments"), v12, objc_opt_class(self), self);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v13));
  v39 = (id)os_transaction_create(objc_msgSend(v14, "UTF8String"));

  v15 = dispatch_group_create();
  objc_initWeak(&location, self);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadarController observers](self, "observers"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100273090;
  v31[3] = &unk_1011AE680;
  objc_copyWeak(&v35, &location);
  v17 = v15;
  v32 = v17;
  v33 = self;
  v18 = v6;
  v34 = v18;
  objc_msgSend(v16, "enumerateObserversWithGroup:visitor:", v17, v31);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100273520;
  block[3] = &unk_1011AE6A8;
  objc_copyWeak(&v30, &location);
  v27 = v18;
  v28 = v7;
  v29 = buf;
  v19 = v7;
  v20 = v18;
  dispatch_group_notify(v17, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (void)setIsolationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_isolationQueue, a3);
}

- (OS_dispatch_queue)diagnosticExtensionDarwinQueue
{
  return self->_diagnosticExtensionDarwinQueue;
}

- (void)setDiagnosticExtensionDarwinQueue:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticExtensionDarwinQueue, a3);
}

- (int)diagnosticExtensionDarwinToken
{
  return self->_diagnosticExtensionDarwinToken;
}

- (void)setDiagnosticExtensionDarwinToken:(int)a3
{
  self->_diagnosticExtensionDarwinToken = a3;
}

- (OS_dispatch_queue)carplayDarwinQueue
{
  return self->_carplayDarwinQueue;
}

- (void)setCarplayDarwinQueue:(id)a3
{
  objc_storeStrong((id *)&self->_carplayDarwinQueue, a3);
}

- (int)carplayDarwinToken
{
  return self->_carplayDarwinToken;
}

- (void)setCarplayDarwinToken:(int)a3
{
  self->_carplayDarwinToken = a3;
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_carplayDarwinQueue, 0);
  objc_storeStrong((id *)&self->_diagnosticExtensionDarwinQueue, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end
