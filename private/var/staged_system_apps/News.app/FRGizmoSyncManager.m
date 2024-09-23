@implementation FRGizmoSyncManager

- (void)syncWithGizmo
{
  _QWORD *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  +[NSThread isMainThread](NSThread, "isMainThread");
  if (!-[FRGizmoSyncManager syncingWatchData](self, "syncingWatchData"))
  {
    -[FRGizmoSyncManager setSyncingWatchData:](self, "setSyncingWatchData:", 1);
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100013BD0;
    v12[3] = &unk_1000DC6F0;
    objc_copyWeak(&v13, &location);
    v3 = objc_retainBlock(v12);
    v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000F350;
    v9[3] = &unk_1000DC718;
    objc_copyWeak(&v11, &location);
    v5 = v4;
    v10 = v5;
    -[FRGizmoSyncManager _fetchMetadataWithCompletion:](self, "_fetchMetadataWithCompletion:", v9);
    dispatch_group_enter(v5);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000C5A4;
    v7[3] = &unk_1000D9758;
    v6 = v5;
    v8 = v6;
    -[FRGizmoSyncManager _syncPreferredRefreshDatesWithCompletion:](self, "_syncPreferredRefreshDatesWithCompletion:", v7);
    dispatch_group_notify(v6, (dispatch_queue_t)&_dispatch_main_q, v3);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)setSyncingWatchData:(BOOL)a3
{
  self->_syncingWatchData = a3;
}

- (BOOL)syncingWatchData
{
  return self->_syncingWatchData;
}

- (void)_syncPreferredRefreshDatesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Syncing refresh dates with gizmo…", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRGizmoSyncManager appConfigManager](self, "appConfigManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C338;
  v7[3] = &unk_1000DAFA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchAppConfigurationIfNeededWithCompletion:", v7);

}

- (FCNewsAppConfigurationManager)appConfigManager
{
  return self->_appConfigManager;
}

- (void)_fetchMetadataWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t *v11;
  _QWORD v12[4];
  id v13;
  uint8_t *v14;
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Syncing metadata with gizmo…", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v16 = buf;
  v17 = 0x3032000000;
  v18 = sub_100018624;
  v19 = sub_100018534;
  v20 = -[FRGizmoSyncManager _newCompanionConnection](self, "_newCompanionConnection");
  objc_msgSend(*((id *)v16 + 5), "resume");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000F260;
  v12[3] = &unk_1000DC7B8;
  v5 = v4;
  v13 = v5;
  v14 = buf;
  v6 = objc_retainBlock(v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v16 + 5), "remoteObjectProxyWithErrorHandler:", v6));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004E1D0;
  v9[3] = &unk_1000DC808;
  v8 = v5;
  v10 = v8;
  v11 = buf;
  objc_msgSend(v7, "fetchHeadlineMetadataWithReply:", v9);

  _Block_object_dispose(buf, 8);
}

- (id)_newCompanionConnection
{
  id v2;
  void *v3;

  v2 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.nanonews.service.companion"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___FRWatchConsuming));
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  return v2;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FRGizmoSyncManager)initWithAppConfigManager:(id)a3 readingList:(id)a4 readingHistory:(id)a5
{
  id v9;
  id v10;
  id v11;
  FRGizmoSyncManager *v12;
  FRGizmoSyncManager *v13;
  FRGizmoPreferencesNotifier *v14;
  FRGizmoPreferencesNotifier *notifier;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v17.receiver = self;
  v17.super_class = (Class)FRGizmoSyncManager;
  v12 = -[FRGizmoSyncManager init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_appConfigManager, a3);
    objc_storeStrong((id *)&v13->_readingList, a4);
    objc_storeStrong((id *)&v13->_readingHistory, a5);
    v14 = objc_alloc_init(FRGizmoPreferencesNotifier);
    -[FRGizmoPreferencesNotifier setDelegate:](v14, "setDelegate:", v13);
    notifier = v13->_notifier;
    v13->_notifier = v14;

    objc_msgSend(v10, "addObserver:", v13);
    objc_msgSend(v11, "addObserver:", v13);
  }

  return v13;
}

- (FRGizmoSyncManager)init
{
  return -[FRGizmoSyncManager initWithAppConfigManager:readingList:readingHistory:](self, "initWithAppConfigManager:readingList:readingHistory:", 0, 0, 0);
}

- (void)gizmoPreferencesNotifierDidNoticeUpdate:(id)a3
{
  +[NSThread isMainThread](NSThread, "isMainThread", a3);
  -[FRGizmoSyncManager syncWithGizmo](self, "syncWithGizmo");
}

- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  id v15;
  id v16;
  void ***v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  _BYTE *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _BYTE *v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  +[NSThread isMainThread](NSThread, "isMainThread");
  if (objc_msgSend(v10, "count") || objc_msgSend(v11, "count"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = objc_msgSend(v10, "count");
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v11, "count");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Marking %lu IDs saved and %lu IDs unsaved…", buf, 0x16u);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v31 = sub_100018624;
    v32 = sub_100018534;
    v33 = -[FRGizmoSyncManager _newCompanionConnection](self, "_newCompanionConnection");
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "resume");
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10004DE18;
    v26[3] = &unk_1000DC740;
    v12 = v10;
    v27 = v12;
    v13 = v11;
    v28 = v13;
    v29 = buf;
    v14 = objc_retainBlock(v26);
    v19 = _NSConcreteStackBlock;
    v20 = 3221225472;
    v21 = sub_10004DE78;
    v22 = &unk_1000DB5D0;
    v15 = v12;
    v23 = v15;
    v16 = v13;
    v24 = v16;
    v25 = buf;
    v17 = objc_retainBlock(&v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "remoteObjectProxyWithErrorHandler:", v14, v19, v20, v21, v22));
    objc_msgSend(v18, "markArticleIdentifiersAsSaved:articleIdentifiersAsNotSaved:withReply:", v15, v16, v17);

    _Block_object_dispose(buf, 8);
  }

}

- (void)readingHistoryDidClear:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  uint8_t buf[8];
  uint8_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Clearing gizmo seen history…", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v10 = buf;
  v11 = 0x3032000000;
  v12 = sub_100018624;
  v13 = sub_100018534;
  v14 = -[FRGizmoSyncManager _newCompanionConnection](self, "_newCompanionConnection");
  objc_msgSend(*((id *)v10 + 5), "resume");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004E0DC;
  v8[3] = &unk_1000DC768;
  v8[4] = buf;
  v5 = objc_retainBlock(v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v10 + 5), "remoteObjectProxyWithErrorHandler:", v5));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004E148;
  v7[3] = &unk_1000DC790;
  v7[4] = buf;
  objc_msgSend(v6, "clearAllSeenArticleIdentifiersWithReply:", v7);

  _Block_object_dispose(buf, 8);
}

- (void)_syncSeenIdentifiers:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E384;
  block[3] = &unk_1000DC8A8;
  block[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_syncSavedIdentifiersOnGizmo:(id)a3 articleIdentifiersOnGizmo:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  FRGizmoSyncManager *v13;
  id v14;
  id v15;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004E9B4;
  v11[3] = &unk_1000DBC38;
  v12 = a3;
  v13 = self;
  v14 = a4;
  v15 = a5;
  v8 = v15;
  v9 = v14;
  v10 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

}

- (FRGizmoSyncManagerDelegate)delegate
{
  return (FRGizmoSyncManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (FCReadingList)readingList
{
  return self->_readingList;
}

- (FCReadingHistory)readingHistory
{
  return self->_readingHistory;
}

- (FRGizmoPreferencesNotifier)notifier
{
  return self->_notifier;
}

- (NSSet)articleIdentifiersOnGizmo
{
  return self->_articleIdentifiersOnGizmo;
}

- (void)setArticleIdentifiersOnGizmo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleIdentifiersOnGizmo, 0);
  objc_storeStrong((id *)&self->_notifier, 0);
  objc_storeStrong((id *)&self->_readingHistory, 0);
  objc_storeStrong((id *)&self->_readingList, 0);
  objc_storeStrong((id *)&self->_appConfigManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
