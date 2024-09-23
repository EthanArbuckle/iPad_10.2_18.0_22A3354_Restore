@implementation CLIndoorServiceDelegate

- (void)tilePrefetchFinishedAllDownloads
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  ITileDb *ptr;
  void *v8;
  void *v9;
  void (**v10)(void);
  void *v11;
  unsigned int v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate q](self, "q"));
  dispatch_assert_queue_V2(v3);

  if (qword_100417EF8 == -1)
  {
    v4 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417EF8, &stru_100407B20);
  v4 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "TileFetch, prefetchFinished", buf, 2u);
  }
LABEL_4:
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate transactionManager](self, "transactionManager"));
  v6 = objc_msgSend(v5, "hasOpenTransactionWithDescription:", CFSTR("Prefetching"));

  if ((v6 & 1) != 0)
  {
    -[CLIndoorServiceDelegate initializeDb](self, "initializeDb");
    ptr = self->_fsDb.__ptr_;
    if (ptr)
      (*(void (**)(ITileDb *, TileStorageLimits *))(*(_QWORD *)ptr + 176))(ptr, &self->_tileStorageLimits);
    v8 = objc_autoreleasePoolPush();
    if (-[CLIndoorServiceDelegate initializeDb](self, "initializeDb"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate prefetchCompletion](self, "prefetchCompletion"));

      if (v9)
      {
        v10 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate prefetchCompletion](self, "prefetchCompletion"));
        v10[2]();

      }
      -[CLIndoorServiceDelegate setPrefetchCompletion:](self, "setPrefetchCompletion:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate transactionManager](self, "transactionManager"));
      v12 = objc_msgSend(v11, "isLastOpenTransactionWithDescription:", CFSTR("Prefetching"));

      if (v12)
      {
        -[CLIndoorServiceDelegate releaseObjectsNotNeededForLocalization](self, "releaseObjectsNotNeededForLocalization");
        goto LABEL_22;
      }
      if (qword_100417EF8 == -1)
      {
        v15 = qword_100417F00;
        if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
          goto LABEL_22;
      }
      else
      {
        dispatch_once(&qword_100417EF8, &stru_100407B20);
        v15 = qword_100417F00;
        if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        {
LABEL_22:
          if (qword_100417EF8 == -1)
          {
            v16 = qword_100417F00;
            if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
            {
LABEL_25:
              v17 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate transactionManager](self, "transactionManager"));
              objc_msgSend(v17, "closeTransactionWithDescription:", CFSTR("Prefetching"));

              goto LABEL_26;
            }
          }
          else
          {
            dispatch_once(&qword_100417EF8, &stru_100407B20);
            v16 = qword_100417F00;
            if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
              goto LABEL_25;
          }
          *(_WORD *)v18 = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Releasing the prefetch transaction", v18, 2u);
          goto LABEL_25;
        }
      }
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Deferring destruction of FilesystemDB objects and prefetcher since we're still active", v19, 2u);
      goto LABEL_22;
    }
    if (qword_100417EF8 == -1)
    {
      v14 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
      {
LABEL_26:
        objc_autoreleasePoolPop(v8);
        return;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v14 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_26;
    }
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Couldn't import all prefetched venues - before first unlock!?", v20, 2u);
    goto LABEL_26;
  }
  if (qword_100417EF8 == -1)
  {
    v13 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      return;
    goto LABEL_14;
  }
  dispatch_once(&qword_100417EF8, &stru_100407B20);
  v13 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_14:
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Got notified that all prefetch downloads are completed", v21, 2u);
  }
}

+ (BOOL)validateEntitlement:(id)a3 forConnection:(id)a4 forSelector:(SEL)a5
{
  id v8;
  id v9;
  unsigned __int8 v10;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(a1, "isEntitled:forEntitlement:", v9, v8);
  if ((v10 & 1) == 0)
    objc_msgSend(a1, "logViolation:ofEntitlement:forSelector:", v9, v8, a5);

  return v10;
}

- (id)onQueueCreateProviderForConnection:(id)a3
{
  id v4;
  _BOOL8 v5;
  CLIndoorProvider *v6;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  ITileDb *ptr;
  __shared_weak_count *v17;

  v4 = a3;
  v5 = +[CLIndoorServiceDelegate isEntitled:forEntitlement:allowRootEverything:](CLIndoorServiceDelegate, "isEntitled:forEntitlement:allowRootEverything:", v4, CFSTR("replay"), 0);
  v6 = -[CLIndoorProvider initWithConnection:]([CLIndoorProvider alloc], "initWithConnection:", v4);
  -[CLIndoorServiceDelegate initializeDb:](self, "initializeDb:", v5);
  cntrl = self->_fsDb.__cntrl_;
  ptr = self->_fsDb.__ptr_;
  v17 = cntrl;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  -[CLIndoorProvider setFsDb:](v6, "setFsDb:", &ptr);
  v10 = (std::__shared_weak_count *)v17;
  if (v17)
  {
    v11 = (unint64_t *)((char *)v17 + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate prefetcher](self, "prefetcher", ptr));
  -[CLIndoorProvider setPrefetcher:](v6, "setPrefetcher:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate workdir](self, "workdir"));
  -[CLIndoorProvider setWorkdir:](v6, "setWorkdir:", v14);

  return v6;
}

- (void)reloadAvailabilityTilePrefetchParameters
{
  NSObject *v3;
  CLAvailabilityTileParser *v4;
  void *v5;
  void *v6;
  CLAvailabilityTileParser *v7;
  id v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  float v18;
  uint64_t v19;
  float v20;
  float v21;
  _QWORD v22[2];
  float v23;
  _QWORD v24[2];
  unsigned int v25;
  _QWORD v26[2];
  unsigned int v27;
  _QWORD v28[2];
  unsigned int v29;
  _QWORD v30[2];
  unsigned int v31;
  _QWORD v32[2];
  __int128 buf;
  uint64_t v34;

  if (qword_100417EF8 == -1)
  {
    v3 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417EF8, &stru_100407B20);
  v3 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "@IndoorAvl, load, request to reload availability tile prefetch params", (uint8_t *)&buf, 2u);
  }
LABEL_4:
  v4 = [CLAvailabilityTileParser alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate workdir](self, "workdir"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CLIndoorProvider getAvailabilityTilePathFromWorkdir:](CLIndoorProvider, "getAvailabilityTilePathFromWorkdir:", v5));
  v7 = -[CLAvailabilityTileParser initWithTilePathIncrementalIO:](v4, "initWithTilePathIncrementalIO:", v6);

  if (v7)
  {
    v8 = -[CLAvailabilityTileParser getAvlTile](v7, "getAvlTile");
    v32[0] = sub_1000C3854();
    v32[1] = v9;
    v31 = sub_1000C2C28((uint64_t)v8);
    v10 = sub_1000AAF28((uint64_t)v32, &v31);
    v30[0] = sub_1000C37F0();
    v30[1] = v11;
    v29 = sub_10000E46C((uint64_t)v8);
    v12 = sub_1000AAF28((uint64_t)v30, &v29);
    v28[0] = sub_1000C3834();
    v28[1] = v13;
    v27 = sub_10000D008((uint64_t)v8);
    v14 = sub_1000AAF28((uint64_t)v28, &v27);
    v26[0] = sub_1000C37B0();
    v26[1] = v15;
    v25 = sub_1000124E0((uint64_t)v8);
    v16 = sub_1000AAF28((uint64_t)v26, &v25);
    v24[0] = sub_1000C37C4();
    v24[1] = v17;
    v23 = sub_1000C2B34((uint64_t)v8);
    v18 = sub_1000AB1D0((uint64_t)v24, &v23);
    v22[0] = sub_1000C37A0();
    v22[1] = v19;
    v21 = sub_1000C2B28((uint64_t)v8);
    v20 = sub_1000AB1D0((uint64_t)v22, &v21);
    sub_1000C89D0((uint64_t)&buf, v10, v12, v14, v16, v18, v20);
    *(_OWORD *)&self->_tileStorageLimits._maxIndoorCount = buf;
    *(_QWORD *)&self->_tileStorageLimits._numOfDaysBeforeIndoorTileRedownload = v34;
  }

}

- (void)releaseObjectsNotNeededForLocalization
{
  NSObject *v3;
  __shared_weak_count *cntrl;
  unint64_t *v5;
  unint64_t v6;
  NSObject *v7;
  __shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t buf[16];

  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407B20);
    v3 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  v3 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Destroying FilesystemDB objects", buf, 2u);
  }
LABEL_4:
  cntrl = self->_fsDb.__cntrl_;
  self->_fsDb.__ptr_ = 0;
  self->_fsDb.__cntrl_ = 0;
  if (cntrl)
  {
    v5 = (unint64_t *)((char *)cntrl + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  if (!self->_fsDbHandle.__ptr_)
  {
LABEL_17:
    if (!self->_prefetcher)
      return;
LABEL_18:
    if (qword_100417EF8 == -1)
    {
      v11 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_21;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v11 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      {
LABEL_21:
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate prefetcher](self, "prefetcher"));
        objc_msgSend(v12, "invalidate");

        if (qword_100417EF8 == -1)
        {
          v13 = qword_100417F00;
          if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
          {
LABEL_24:
            -[CLIndoorServiceDelegate setPrefetcher:](self, "setPrefetcher:", 0);
            return;
          }
        }
        else
        {
          dispatch_once(&qword_100417EF8, &stru_100407B20);
          v13 = qword_100417F00;
          if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
            goto LABEL_24;
        }
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Destroying the prefetcher", v14, 2u);
        goto LABEL_24;
      }
    }
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Invalidating the prefetcher", v15, 2u);
    goto LABEL_21;
  }
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407B20);
    v7 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_13;
    goto LABEL_12;
  }
  v7 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_12:
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Closing the base.local db handle", v16, 2u);
  }
LABEL_13:
  v8 = self->_fsDbHandle.__cntrl_;
  self->_fsDbHandle.__ptr_ = 0;
  self->_fsDbHandle.__cntrl_ = 0;
  if (!v8)
    goto LABEL_17;
  v9 = (unint64_t *)((char *)v8 + 8);
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 - 1, v9));
  if (v10)
    goto LABEL_17;
  (*(void (**)(__shared_weak_count *))(*(_QWORD *)v8 + 16))(v8);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v8);
  if (self->_prefetcher)
    goto LABEL_18;
}

- (CLIndoorTilePrefetcher)prefetcher
{
  CLIndoorTilePrefetcher *prefetcher;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  CLIndoorTilePrefetcher *v11;
  void *v12;
  CLIndoorTilePrefetcher *v13;
  CLIndoorTilePrefetcher *v14;
  _BYTE __p[12];
  __int16 v17;
  void *v18;
  char v19;
  id v20;
  id v21;

  prefetcher = self->_prefetcher;
  if (!prefetcher)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultForKey:defaultValue:", CFSTR("CLPipelineTileServer"), 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultForKey:defaultValue:", CFSTR("CLPipelineTilePrefix"), 0));

    if (qword_100417EF8 != -1)
      dispatch_once(&qword_100417EF8, &stru_100407B20);
    v9 = (id)qword_100417F00;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
      *(_DWORD *)__p = 138412546;
      *(_QWORD *)&__p[4] = v10;
      v17 = 2112;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Country specific tile data URL override: %@, path prefix override: %@", __p, 0x16u);

    }
    sub_100015E5C(v6, v8, (uint64_t)__p);
    v11 = [CLIndoorTilePrefetcher alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate q](self, "q"));
    v13 = -[CLIndoorTilePrefetcher initWithServerConfiguration:usingDelegate:queue:](v11, "initWithServerConfiguration:usingDelegate:queue:", __p, self, v12);
    v14 = self->_prefetcher;
    self->_prefetcher = v13;

    if (v19 < 0)
      operator delete(*(void **)__p);

    prefetcher = self->_prefetcher;
  }
  return prefetcher;
}

+ (BOOL)isEntitled:(id)a3 forEntitlement:(id)a4 allowRootEverything:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  unsigned int v9;
  unsigned __int8 v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint8_t v15[16];

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    if (qword_100417EF8 == -1)
    {
      v11 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
      {
LABEL_9:
        v10 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v11 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
    }
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Attempt to check entitlement of nil connection", v15, 2u);
    goto LABEL_9;
  }
  if (v5 && !objc_msgSend(v7, "effectiveUserIdentifier")
    || (v9 = objc_msgSend(v7, "processIdentifier"), v9 == getpid()))
  {
    v10 = 1;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.pipelined")));
    if (v12 && (v13 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v12, v13) & 1) != 0))
      v10 = objc_msgSend(v12, "containsObject:", v8);
    else
      v10 = 0;

  }
LABEL_15:

  return v10;
}

- (shared_ptr<ITileDb>)createDbAtBasedir:(id)a3 rootdir:(id)a4 relativeTo:(id)a5
{
  _QWORD *v5;
  _QWORD *v9;
  unint64_t v10;
  id v11;
  const char *v12;
  size_t v13;
  std::string::size_type v14;
  std::string *p_dst;
  uint64_t v16;
  uint64_t v17;
  std::string::size_type v18;
  NSObject *v19;
  NSObject *v20;
  const std::error_category *cat;
  std::string *p_buf;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  sqlite3 **ptr;
  sqlite3 ***p_fsDbHandle;
  const char *v31;
  size_t v32;
  std::string::size_type v33;
  std::string *v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int data;
  uint64_t v38;
  NSObject *v39;
  _QWORD *v40;
  NSObject *v41;
  const char *v42;
  size_t v43;
  std::string::size_type v44;
  std::string *v45;
  uint64_t v46;
  uint64_t v47;
  std::string *v48;
  __shared_weak_count *cntrl;
  unint64_t *v50;
  unint64_t v51;
  NSObject *v52;
  __shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  NSObject *v56;
  std::string *v57;
  NSObject *v58;
  std::string *v59;
  uint64_t (***v60)();
  std::string *v61;
  uint64_t (***size)();
  uint64_t v63;
  int v64;
  shared_ptr<db::resources::handle> v65;
  __shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  NSObject *v72;
  ITileDb *v73;
  __shared_weak_count *v74;
  id v75;
  id v76;
  id v77;
  std::string v78;
  std::error_code v79;
  std::string::size_type v80;
  std::string __dst;
  std::string buf;
  unint64_t v83;
  __int16 v84;
  int v85;
  std::string v86;
  shared_ptr<ITileDb> result;

  v9 = v5;
  v76 = a3;
  v77 = a4;
  v75 = a5;
  sub_1000C37D4((uint64_t)&buf);
  v10 = sub_1000C31F0((uint64_t)&buf, (uint64_t *)&buf.__r_.__value_.__r.__words[2]);
  v11 = objc_retainAutorelease(v75);
  v12 = (const char *)objc_msgSend(v11, "fileSystemRepresentation");
  v13 = strlen(v12);
  if (v13 > 0x7FFFFFFFFFFFFFF7)
    sub_1000CDE30();
  v14 = v13;
  if (v13 >= 0x17)
  {
    v16 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17)
      v16 = v13 | 7;
    v17 = v16 + 1;
    p_dst = (std::string *)operator new(v16 + 1);
    __dst.__r_.__value_.__l.__size_ = v14;
    __dst.__r_.__value_.__r.__words[2] = v17 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v13;
    p_dst = &__dst;
    if (!v13)
      goto LABEL_9;
  }
  memmove(p_dst, v12, v14);
LABEL_9:
  p_dst->__r_.__value_.__s.__data_[v14] = 0;
  *(_QWORD *)&v79.__val_ = 0;
  v79.__cat_ = 0;
  v80 = 0;
  sub_10002CD60((uint64_t)&__dst, &v79, &buf);
  v18 = buf.__r_.__value_.__r.__words[2];
  if ((v80 & 1) != 0 && (v80 != 1 || v79.__val_))
  {
    if (qword_100417EF8 != -1)
      dispatch_once(&qword_100417EF8, &stru_100407B20);
    v20 = (id)qword_100417F00;
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    if (v80)
    {
      if (v80 == 1)
      {
        std::error_code::message(&buf, &v79);
LABEL_27:
        p_buf = &buf;
        if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
        LODWORD(v86.__r_.__value_.__l.__data_) = 136380675;
        *(std::string::size_type *)((char *)v86.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_buf;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Couldn't determine amount of disk space available - assuming we have enough. %{private}s", (uint8_t *)&v86, 0xCu);
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf.__r_.__value_.__l.__data_);
LABEL_31:

        goto LABEL_32;
      }
      cat = v79.__cat_;
    }
    else
    {
      cat = (const std::error_category *)&boost::system::detail::system_cat_holder<void>::instance;
    }
    ((void (*)(std::string *__return_ptr, const std::error_category *, _QWORD))cat->equivalent)(&buf, cat, v79.__val_);
    goto LABEL_27;
  }
  if (buf.__r_.__value_.__r.__words[2] < v10)
  {
    if (qword_100417EF8 == -1)
    {
      v19 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v19 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:
        *v9 = 0;
        v9[1] = 0;
        if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__dst.__r_.__value_.__l.__data_);
        goto LABEL_144;
      }
    }
    LODWORD(buf.__r_.__value_.__l.__data_) = 138478339;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v76;
    WORD2(buf.__r_.__value_.__r.__words[1]) = 2050;
    *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v18;
    HIWORD(buf.__r_.__value_.__r.__words[2]) = 2050;
    v83 = v10;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Cannot open %{private}@: only %{public}llu bytes remaining but need %{public}llu bytes", (uint8_t *)&buf, 0x20u);
    goto LABEL_16;
  }
LABEL_32:
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate transactionManager](self, "transactionManager"));
  v24 = objc_msgSend(v23, "hasAnyOpenTransaction");

  if ((v24 & 1) == 0)
  {
    sub_100345C78(&buf);

    v73 = (ITileDb *)abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/indoorservice/CLIndoorServiceDelegate.mm", 912, "-[CLIndoorServiceDelegate createDbAtBasedir:rootdir:relativeTo:]");
LABEL_164:
    __break(1u);
    goto LABEL_165;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByAppendingPathComponent:", v76));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "path"));

  if (v26)
    objc_msgSend(v26, "ps_STLString");
  else
    memset(&buf, 0, sizeof(buf));
  __dst = buf;
  *(_QWORD *)&v79.__val_ = 0;
  v79.__cat_ = 0;
  v80 = 0;
  if (v77)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByAppendingPathComponent:", v77));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "path"));

    if (v28)
    {
      objc_msgSend(v28, "ps_STLString");
      if ((SHIBYTE(v80) & 0x80000000) == 0)
      {
LABEL_41:
        v79 = *(std::error_code *)&buf.__r_.__value_.__l.__data_;
        v80 = buf.__r_.__value_.__r.__words[2];

        goto LABEL_42;
      }
    }
    else
    {
      memset(&buf, 0, sizeof(buf));
      if ((SHIBYTE(v80) & 0x80000000) == 0)
        goto LABEL_41;
    }
    operator delete(*(void **)&v79.__val_);
    goto LABEL_41;
  }
LABEL_42:
  p_fsDbHandle = (sqlite3 ***)&self->_fsDbHandle;
  ptr = (sqlite3 **)self->_fsDbHandle.__ptr_;
  if (!ptr)
    goto LABEL_80;
  v31 = sub_100260D94(ptr, "main");
  v32 = strlen(v31);
  if (v32 > 0x7FFFFFFFFFFFFFF7)
    sub_1000CDE30();
  v33 = v32;
  if (v32 >= 0x17)
  {
    v35 = (v32 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v32 | 7) != 0x17)
      v35 = v32 | 7;
    v36 = v35 + 1;
    v34 = (std::string *)operator new(v35 + 1);
    v86.__r_.__value_.__l.__size_ = v33;
    v86.__r_.__value_.__r.__words[2] = v36 | 0x8000000000000000;
    v86.__r_.__value_.__r.__words[0] = (std::string::size_type)v34;
    goto LABEL_50;
  }
  *((_BYTE *)&v86.__r_.__value_.__s + 23) = v32;
  v34 = &v86;
  if (v32)
LABEL_50:
    memmove(v34, v31, v33);
  v34->__r_.__value_.__s.__data_[v33] = 0;
  buf = v86;
  sub_10006DB18((const char *)&buf, 0, (int *)&v78);
  data = v78.__r_.__value_.__l.__data_;
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(buf.__r_.__value_.__l.__data_);
    v38 = qword_100417EF8;
    if (data >= 2)
    {
LABEL_53:
      if (v38 == -1)
      {
        v39 = qword_100417F00;
        if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        {
LABEL_56:
          v40 = operator new(0x58uLL);
          sub_10033EF20(v40, (uint64_t)&__dst, (uint64_t)&v79, (uint64_t *)&self->_fsDbHandle);
          goto LABEL_141;
        }
      }
      else
      {
        dispatch_once(&qword_100417EF8, &stru_100407B20);
        v39 = qword_100417F00;
        if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
          goto LABEL_56;
      }
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Recreating the base.local database with a cached file handle", (uint8_t *)&buf, 2u);
      goto LABEL_56;
    }
  }
  else
  {
    v38 = qword_100417EF8;
    if (LODWORD(v78.__r_.__value_.__l.__data_) >= 2)
      goto LABEL_53;
  }
  if (v38 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407B20);
  v41 = (id)qword_100417F00;
  if (!os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    goto LABEL_75;
  v42 = sub_100260D94(*p_fsDbHandle, "main");
  v43 = strlen(v42);
  if (v43 > 0x7FFFFFFFFFFFFFF7)
    sub_1000CDE30();
  v44 = v43;
  if (v43 >= 0x17)
  {
    v46 = (v43 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v43 | 7) != 0x17)
      v46 = v43 | 7;
    v47 = v46 + 1;
    v45 = (std::string *)operator new(v46 + 1);
    buf.__r_.__value_.__l.__size_ = v44;
    buf.__r_.__value_.__r.__words[2] = v47 | 0x8000000000000000;
    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v45;
  }
  else
  {
    *((_BYTE *)&buf.__r_.__value_.__s + 23) = v43;
    v45 = &buf;
    if (!v43)
      goto LABEL_71;
  }
  memmove(v45, v42, v44);
LABEL_71:
  v45->__r_.__value_.__s.__data_[v44] = 0;
  v48 = &buf;
  if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v48 = (std::string *)buf.__r_.__value_.__r.__words[0];
  LODWORD(v86.__r_.__value_.__l.__data_) = 136380675;
  *(std::string::size_type *)((char *)v86.__r_.__value_.__r.__words + 4) = (std::string::size_type)v48;
  _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Path to db no longer exists: %{private}s", (uint8_t *)&v86, 0xCu);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
LABEL_75:

  cntrl = self->_fsDbHandle.__cntrl_;
  self->_fsDbHandle.__ptr_ = 0;
  self->_fsDbHandle.__cntrl_ = 0;
  if (cntrl)
  {
    v50 = (unint64_t *)((char *)cntrl + 8);
    do
      v51 = __ldaxr(v50);
    while (__stlxr(v51 - 1, v50));
    if (!v51)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
LABEL_80:
  if (!sub_10000D928((uint64_t)&__dst))
    goto LABEL_122;
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407B20);
  v52 = (id)qword_100417F00;
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "Resetting the handle to filesystem db just to be safe (it may actually be nil)", (uint8_t *)&buf, 2u);
  }

  v53 = self->_fsDbHandle.__cntrl_;
  self->_fsDbHandle.__ptr_ = 0;
  self->_fsDbHandle.__cntrl_ = 0;
  if (v53)
  {
    v54 = (unint64_t *)((char *)v53 + 8);
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v53 + 16))(v53);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v53);
    }
  }
  if (qword_100417EF8 == -1)
  {
    v56 = (id)qword_100417F00;
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      goto LABEL_95;
  }
  else
  {
    dispatch_once(&qword_100417EF8, &stru_100407B20);
    v56 = (id)qword_100417F00;
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      goto LABEL_95;
  }
  v57 = &__dst;
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v57 = (std::string *)__dst.__r_.__value_.__r.__words[0];
  LODWORD(buf.__r_.__value_.__l.__data_) = 136380675;
  *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v57;
  _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "removing the db path due to version mismatch: %{private}s", (uint8_t *)&buf, 0xCu);
LABEL_95:

  memset(&v86, 0, sizeof(v86));
  sub_1000D8970((uint64_t)&__dst, &v86);
  if ((v86.__r_.__value_.__s.__data_[16] & 1) != 0
    && (v86.__r_.__value_.__r.__words[2] != 1 || LODWORD(v86.__r_.__value_.__l.__data_)))
  {
    if (qword_100417EF8 == -1)
    {
      v58 = (id)qword_100417F00;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        goto LABEL_100;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v58 = (id)qword_100417F00;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
LABEL_100:
        if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v59 = &__dst;
        else
          v59 = (std::string *)__dst.__r_.__value_.__r.__words[0];
        if (v86.__r_.__value_.__r.__words[2])
        {
          if (v86.__r_.__value_.__r.__words[2] == 1)
          {
            std::error_code::message(&v78, (const std::error_code *)&v86);
LABEL_109:
            if ((v78.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v61 = &v78;
            else
              v61 = (std::string *)v78.__r_.__value_.__r.__words[0];
            if (v86.__r_.__value_.__r.__words[2])
            {
              if (v86.__r_.__value_.__r.__words[2] == 1)
                size = &boost::system::detail::interop_cat_holder<void>::instance;
              else
                size = (uint64_t (***)())v86.__r_.__value_.__l.__size_;
            }
            else
            {
              size = &boost::system::detail::system_cat_holder<void>::instance;
            }
            v63 = ((uint64_t (*)(uint64_t (***)()))**size)(size);
            v64 = (int)v86.__r_.__value_.__l.__data_;
            if (v86.__r_.__value_.__r.__words[2] == 1)
              v64 = LODWORD(v86.__r_.__value_.__l.__data_) + 1000 * (v86.__r_.__value_.__l.__size_ % 0x1FFFF7);
            LODWORD(buf.__r_.__value_.__l.__data_) = 136446978;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v59;
            WORD2(buf.__r_.__value_.__r.__words[1]) = 2082;
            *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v61;
            HIWORD(buf.__r_.__value_.__r.__words[2]) = 2082;
            v83 = v63;
            v84 = 1026;
            v85 = v64;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Failed to remove on-disk db in %{public}s, msg, %{public}s, categoryName, %{public}s, %{public}d", (uint8_t *)&buf, 0x26u);
            if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v78.__r_.__value_.__l.__data_);
            goto LABEL_121;
          }
          v60 = (uint64_t (***)())v86.__r_.__value_.__l.__size_;
        }
        else
        {
          v60 = &boost::system::detail::system_cat_holder<void>::instance;
        }
        ((void (*)(std::string *__return_ptr, uint64_t (***)(), _QWORD))(*v60)[4])(&v78, v60, LODWORD(v86.__r_.__value_.__l.__data_));
        goto LABEL_109;
      }
    }
LABEL_121:

  }
LABEL_122:
  if (*p_fsDbHandle)
  {
    sub_100345B78(&buf);

    v73 = (ITileDb *)abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/indoorservice/CLIndoorServiceDelegate.mm", 950, "-[CLIndoorServiceDelegate createDbAtBasedir:rootdir:relativeTo:]");
    goto LABEL_164;
  }
  *((_BYTE *)&v86.__r_.__value_.__s + 23) = 10;
  strcpy((char *)&v86, "privacy.db");
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    sub_10006CED8(&buf, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
  else
    buf = __dst;
  sub_1000675EC(&buf, (uint64_t)&v86);
  sub_1000CB228((uint64_t)&buf, 0, (uint64_t *)&v78);
  v65 = *(shared_ptr<db::resources::handle> *)&v78.__r_.__value_.__l.__data_;
  *(_OWORD *)&v78.__r_.__value_.__l.__data_ = 0uLL;
  v66 = self->_fsDbHandle.__cntrl_;
  self->_fsDbHandle = v65;
  if (v66)
  {
    v67 = (unint64_t *)((char *)v66 + 8);
    do
      v68 = __ldaxr(v67);
    while (__stlxr(v68 - 1, v67));
    if (!v68)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v66 + 16))(v66);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v66);
    }
  }
  v69 = (std::__shared_weak_count *)v78.__r_.__value_.__l.__size_;
  if (!v78.__r_.__value_.__l.__size_)
    goto LABEL_135;
  v70 = (unint64_t *)(v78.__r_.__value_.__l.__size_ + 8);
  do
    v71 = __ldaxr(v70);
  while (__stlxr(v71 - 1, v70));
  if (!v71)
  {
    ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
    std::__shared_weak_count::__release_weak(v69);
    if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_136:
      if ((SHIBYTE(v86.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_137;
LABEL_147:
      operator delete(v86.__r_.__value_.__l.__data_);
      if (qword_100417EF8 == -1)
        goto LABEL_138;
LABEL_148:
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      goto LABEL_138;
    }
  }
  else
  {
LABEL_135:
    if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_136;
  }
  operator delete(buf.__r_.__value_.__l.__data_);
  if (SHIBYTE(v86.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_147;
LABEL_137:
  if (qword_100417EF8 != -1)
    goto LABEL_148;
LABEL_138:
  v72 = (id)qword_100417F00;
  if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "Creating the base.local database with a new file handle", (uint8_t *)&buf, 2u);
  }

  v40 = operator new(0x58uLL);
  sub_10033EF20(v40, (uint64_t)&__dst, (uint64_t)&v79, (uint64_t *)&self->_fsDbHandle);
LABEL_141:
  *v9 = v40 + 3;
  v9[1] = v40;
  if (SHIBYTE(v80) < 0)
  {
    operator delete(*(void **)&v79.__val_);
    if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_143;
LABEL_163:
    operator delete(__dst.__r_.__value_.__l.__data_);
    goto LABEL_143;
  }
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_163;
LABEL_143:

LABEL_144:
LABEL_165:
  result.__cntrl_ = v74;
  result.__ptr_ = v73;
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  CLIndoorProvider **p_currentProvider;
  id WeakRetained;
  void *v14;
  BOOL v15;
  void *v16;
  unsigned int v17;
  NSObject *v18;
  unsigned int v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  NSObject *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  NSObject *v27;
  unsigned int v28;
  unsigned int v29;
  _QWORD v31[5];
  id v32;
  id v33;
  id from;
  id location;
  uint8_t buf[4];
  _QWORD v37[2];

  v7 = a3;
  v8 = a4;
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407B20);
  v9 = (id)qword_100417F00;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CLIndoorServiceDelegate versionString](CLIndoorServiceDelegate, "versionString"));
    *(_DWORD *)buf = 138543362;
    v37[0] = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "New XPC connection to pipelined %{public}@", buf, 0xCu);

  }
  if (+[CLIndoorServiceDelegate validateEntitlement:forConnection:forSelector:](CLIndoorServiceDelegate, "validateEntitlement:forConnection:forSelector:", CFSTR("positioning"), v8, a2))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_queue"));
    objc_msgSend(v8, "_setQueue:", v11);

    p_currentProvider = &self->_currentProvider;
    WeakRetained = objc_loadWeakRetained((id *)&self->_currentProvider);
    v14 = WeakRetained;
    v15 = WeakRetained == 0;
    if (WeakRetained)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "xpcConnection"));
      v17 = objc_msgSend(v16, "processIdentifier");
      if (v17 == objc_msgSend(v8, "processIdentifier"))
      {
        if (qword_100417EF8 != -1)
          dispatch_once(&qword_100417EF8, &stru_100407B20);
        v18 = (id)qword_100417F00;
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          goto LABEL_28;
        v19 = objc_msgSend(v16, "processIdentifier");
        *(_DWORD *)buf = 67174657;
        LODWORD(v37[0]) = v19;
        v20 = "WARNING: Already have a connection from %{private}d - rejecting";
        v21 = v18;
        v22 = 8;
      }
      else
      {
        if (qword_100417EF8 != -1)
          dispatch_once(&qword_100417EF8, &stru_100407B20);
        v18 = (id)qword_100417F00;
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          goto LABEL_28;
        v28 = objc_msgSend(v16, "processIdentifier");
        v29 = objc_msgSend(v8, "processIdentifier");
        *(_DWORD *)buf = 67174913;
        LODWORD(v37[0]) = v28;
        WORD2(v37[0]) = 1025;
        *(_DWORD *)((char *)v37 + 6) = v29;
        v20 = "WARNING: Already have a connection from %{private}d - rejecting connection from  %{private}d";
        v21 = v18;
        v22 = 14;
      }
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v20, buf, v22);
LABEL_28:

      goto LABEL_29;
    }
    if (self->_shutdown)
    {
      if (qword_100417EF8 != -1)
        dispatch_once(&qword_100417EF8, &stru_100407B20);
      v23 = (id)qword_100417F00;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = objc_msgSend(v8, "processIdentifier");
        *(_DWORD *)buf = 67174657;
        LODWORD(v37[0]) = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "WARNING: Connection from %{private}d postponing shutdown", buf, 8u);
      }

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CLIndoorProtocolPrivate));
    objc_msgSend(v8, "setExportedInterface:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CLIndoorDelegateProtocolInternal));
    objc_msgSend(v8, "setRemoteObjectInterface:", v26);

    -[CLIndoorServiceDelegate createIndoorProvderTransaction](self, "createIndoorProvderTransaction");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate onQueueCreateProviderForConnection:](self, "onQueueCreateProviderForConnection:", v8));
    objc_msgSend(v16, "setPrefetchFloorLimitIndoor:", sub_1000C27A0((unsigned int *)&self->_tileStorageLimits));
    objc_msgSend(v16, "setPrefetchByteSizeLimitIndoor:", sub_1000C2550((uint64_t)&self->_tileStorageLimits));
    objc_msgSend(v16, "setPrefetchFloorLimitRegional:", sub_1000C2678((uint64_t)&self->_tileStorageLimits));
    objc_msgSend(v16, "setPrefetchByteSizeLimitRegional:", sub_1000C2428((uint64_t)&self->_tileStorageLimits));
    objc_msgSend(v8, "setExportedObject:", v16);
    objc_initWeak(&location, v8);
    objc_initWeak(&from, self);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100025DA4;
    v31[3] = &unk_100407B00;
    objc_copyWeak(&v32, &location);
    objc_copyWeak(&v33, &from);
    v31[4] = self;
    objc_msgSend(v8, "setInvalidationHandler:", v31);
    if (qword_100417EF8 == -1)
    {
      v27 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      {
LABEL_22:
        objc_msgSend(v8, "resume");
        objc_storeWeak((id *)p_currentProvider, v16);
        objc_destroyWeak(&v33);
        objc_destroyWeak(&v32);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v27 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_22;
    }
    *(_DWORD *)buf = 134283521;
    v37[0] = v16;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Resuming XPC connection with %{private}p as the provider", buf, 0xCu);
    goto LABEL_22;
  }
  v15 = 0;
LABEL_30:

  return v15;
}

+ (id)versionString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infoDictionary"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CFBundleVersion")));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Revision")));
  if (-[__CFString length](v6, "length"))
  {
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v5, v6));
  }
  else
  {
    v8 = CFSTR("<unknown version>");
    if (v6)
      v8 = v6;
    v7 = v8;
  }
  v9 = v7;

  objc_autoreleasePoolPop(v2);
  return v9;
}

- (BOOL)tilePrefetchShouldPrefetchTileDataForFloor:(const void *)a3
{
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep;
  ITileDb *ptr;
  char v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  int v20;
  _BYTE v21[12];

  v5 = objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate q](self, "q"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate transactionManager](self, "transactionManager"));
  v7 = objc_msgSend(v6, "hasAnyOpenTransaction");

  if ((v7 & 1) == 0)
  {
    if (qword_100417EF8 == -1)
    {
      v14 = qword_100417F00;
      if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
      {
LABEL_10:
        v20 = 136315138;
        *(_QWORD *)v21 = "-[CLIndoorServiceDelegate tilePrefetchShouldPrefetchTileDataForFloor:]";
        v15 = "%s Got delegate call from prefetcher while shutting down. Ignoring";
        v16 = v14;
        v17 = 12;
        goto LABEL_14;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v14 = qword_100417F00;
      if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
    }
    return 0;
  }
  -[CLIndoorServiceDelegate initializeDb](self, "initializeDb");
  if (!self->_fsDb.__ptr_)
  {
    if (qword_100417EF8 == -1)
    {
      v18 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        return 0;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v18 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        return 0;
    }
    LOWORD(v20) = 0;
    v15 = "Attempt to prefetch before first unlock";
    v16 = v18;
    v17 = 2;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v20, v17);
    return 0;
  }
  rep = std::chrono::system_clock::now().__d_.__rep_;
  ptr = self->_fsDb.__ptr_;
  sub_10008930C(&v20, (uint64_t)a3);
  v10 = (*(uint64_t (**)(ITileDb *, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep, int *))(*(_QWORD *)ptr + 208))(ptr, rep, &v20);
  v11 = *(std::__shared_weak_count **)&v21[4];
  if (*(_QWORD *)&v21[4])
  {
    v12 = (unint64_t *)(*(_QWORD *)&v21[4] + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return v10;
}

- (BOOL)tilePrefetchShouldPrefetchMetadataForFloor:(const void *)a3 withLocationContext:(int64_t)a4
{
  NSObject *v7;
  void *v8;
  unsigned __int8 v9;
  std::chrono::system_clock::time_point v10;
  double v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  char v17;
  NSObject *v18;
  double v19;
  ITileDb *ptr;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  int v25;
  _QWORD v26[2];

  v7 = objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate q](self, "q"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate transactionManager](self, "transactionManager"));
  v9 = objc_msgSend(v8, "hasAnyOpenTransaction");

  if ((v9 & 1) == 0)
  {
    if (qword_100417EF8 == -1)
    {
      v12 = qword_100417F00;
      if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
      {
LABEL_8:
        v25 = 136315138;
        v26[0] = "-[CLIndoorServiceDelegate tilePrefetchShouldPrefetchMetadataForFloor:withLocationContext:]";
        v13 = "%s Got delegate call from prefetcher while shutting down. Ignoring";
        v14 = v12;
        v15 = 12;
        goto LABEL_12;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v12 = qword_100417F00;
      if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
    }
    return 0;
  }
  -[CLIndoorServiceDelegate initializeDb](self, "initializeDb");
  if (!self->_fsDb.__ptr_)
  {
    if (qword_100417EF8 == -1)
    {
      v16 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        return 0;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v16 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        return 0;
    }
    LOWORD(v25) = 0;
    v13 = "Attempt to prefetch before first unlock";
    v14 = v16;
    v15 = 2;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v25, v15);
    return 0;
  }
  v10.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
  if (a4 == 1)
  {
    v11 = sub_100242C04((uint64_t)&self->_tileStorageLimits);
    goto LABEL_19;
  }
  if (a4)
  {
    if (qword_100417EF8 == -1)
    {
      v18 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
      {
LABEL_18:
        v11 = sub_10007DE70((uint64_t)&self->_tileStorageLimits);
        goto LABEL_19;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v18 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
    }
    v25 = 67109120;
    LODWORD(v26[0]) = a4;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Unimplemented CLPipelinedLocationContext %d, default to indoor...", (uint8_t *)&v25, 8u);
    goto LABEL_18;
  }
  v11 = sub_10007DE70((uint64_t)&self->_tileStorageLimits);
LABEL_19:
  v19 = v11;
  ptr = self->_fsDb.__ptr_;
  sub_10008930C(&v25, (uint64_t)a3);
  v17 = (*(uint64_t (**)(ITileDb *, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep, int *, double))(*(_QWORD *)ptr + 200))(ptr, v10.__d_.__rep_, &v25, v19);
  v21 = *(std::__shared_weak_count **)((char *)v26 + 4);
  if (*(_QWORD *)((char *)v26 + 4))
  {
    v22 = (unint64_t *)(*(_QWORD *)((char *)v26 + 4) + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  return v17;
}

- (void)tilePrefetchForTileId:(const void *)a3 updateRelevancy:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  unsigned __int8 v9;
  double v10;
  std::chrono::system_clock::time_point v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  int v17;
  const char *v18;

  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate q](self, "q"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate transactionManager](self, "transactionManager"));
  v9 = objc_msgSend(v8, "hasAnyOpenTransaction");

  if ((v9 & 1) == 0)
  {
    if (qword_100417EF8 == -1)
    {
      v12 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v12 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
    }
    v17 = 136315138;
    v18 = "-[CLIndoorServiceDelegate tilePrefetchForTileId:updateRelevancy:]";
    v13 = "%s Got delegate call from prefetcher while shutting down. Ignoring";
    v14 = v12;
    v15 = 12;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v17, v15);
    goto LABEL_11;
  }
  -[CLIndoorServiceDelegate initializeDb](self, "initializeDb");
  if (!self->_fsDb.__ptr_)
  {
    if (qword_100417EF8 == -1)
    {
      v16 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v16 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
    }
    LOWORD(v17) = 0;
    v13 = "@TileFetch, error, Couldn't mark venue as relevant - before first unlock!?";
    v14 = v16;
    v15 = 2;
    goto LABEL_10;
  }
  objc_msgSend(v6, "timeIntervalSince1970");
  v11.__d_.__rep_ = std::chrono::system_clock::from_time_t((uint64_t)v10).__d_.__rep_;
  (*(void (**)(ITileDb *, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep, const void *))(*(_QWORD *)self->_fsDb.__ptr_ + 192))(self->_fsDb.__ptr_, v11.__d_.__rep_, a3);
LABEL_11:

}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (IndoorServiceTransactionManager)transactionManager
{
  return self->_transactionManager;
}

- (BOOL)initializeDb
{
  return -[CLIndoorServiceDelegate initializeDb:](self, "initializeDb:", 0);
}

- (BOOL)initializeDb:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  ITileDb *ptr;
  uint64_t v7;
  uint64_t v8;
  __shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  __shared_weak_count *cntrl;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  NSObject *v17;
  shared_ptr<ITileDb> v18;
  __shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  ITileDb *v24;
  uint8_t *v25;
  uint8_t *v26;
  uint64_t v27;
  NSObject *v28;
  BOOL v29;
  CFAbsoluteTime Current;
  uint64_t v32;
  CLIndoorTileEvictionPolicy *v33;
  uint8_t buf[16];
  uint8_t *v35;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate workdir](self, "workdir"));
  if (!v5)
  {
    sub_100345A78(buf);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/indoorservice/CLIndoorServiceDelegate.mm", 835, "-[CLIndoorServiceDelegate initializeDb:]");
    __break(1u);
    goto LABEL_47;
  }
  if (!+[Keybag afterFirstUserUnlock](Keybag, "afterFirstUserUnlock"))
  {
    if (qword_100417EF8 == -1)
    {
      v17 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
        goto LABEL_48;
LABEL_24:
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Cannot initialize db - not unlocked yet", buf, 2u);
      goto LABEL_48;
    }
LABEL_47:
    dispatch_once(&qword_100417EF8, &stru_100407B20);
    v17 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
      goto LABEL_48;
    goto LABEL_24;
  }
  ptr = self->_fsDb.__ptr_;
  if (ptr)
  {
    if (v3)
    {
      v7 = (*(uint64_t (**)(ITileDb *))(*(_QWORD *)ptr + 240))(ptr);
      v8 = *(unsigned __int8 *)(v7 + 23);
      if ((v8 & 0x80u) != 0)
        v8 = *(_QWORD *)(v7 + 8);
      if (!v8)
      {
        -[CLIndoorServiceDelegate createLocalizerDbWithRootDir:relativeTo:](self, "createLocalizerDbWithRootDir:relativeTo:", 1, v5);
        if (*(_QWORD *)buf)
        {
          v9 = *(__shared_weak_count **)&buf[8];
          if (*(_QWORD *)&buf[8])
          {
            v10 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
            do
              v11 = __ldxr(v10);
            while (__stxr(v11 + 1, v10));
          }
          cntrl = self->_fsDb.__cntrl_;
          self->_fsDb.__ptr_ = *(ITileDb **)buf;
          self->_fsDb.__cntrl_ = v9;
          if (cntrl)
          {
            v13 = (unint64_t *)((char *)cntrl + 8);
            do
              v14 = __ldaxr(v13);
            while (__stlxr(v14 - 1, v13));
            if (!v14)
            {
              (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
              std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
            }
          }
        }
        if (*(_QWORD *)&buf[8])
        {
          v15 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
          do
            v16 = __ldaxr(v15);
          while (__stlxr(v16 - 1, v15));
          if (!v16)
          {
            (*(void (**)(_QWORD))(**(_QWORD **)&buf[8] + 16))(*(_QWORD *)&buf[8]);
            std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&buf[8]);
          }
        }
      }
    }
    goto LABEL_45;
  }
  -[CLIndoorServiceDelegate createLocalizerDbWithRootDir:relativeTo:](self, "createLocalizerDbWithRootDir:relativeTo:", 0, v5);
  v18 = *(shared_ptr<ITileDb> *)buf;
  memset(buf, 0, sizeof(buf));
  v19 = self->_fsDb.__cntrl_;
  self->_fsDb = v18;
  if (v19)
  {
    v20 = (unint64_t *)((char *)v19 + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v19 + 16))(v19);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v19);
    }
  }
  if (*(_QWORD *)&buf[8])
  {
    v22 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)&buf[8] + 16))(*(_QWORD *)&buf[8]);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&buf[8]);
    }
  }
  if (!self->_fsDb.__ptr_)
  {
LABEL_48:
    v29 = 0;
    goto LABEL_49;
  }
  v32 = 0;
  v33 = objc_alloc_init(CLIndoorTileEvictionPolicy);
  Current = CFAbsoluteTimeGetCurrent();
  v24 = self->_fsDb.__ptr_;
  v25 = (uint8_t *)operator new(0x28uLL);
  *(_QWORD *)v25 = off_100407B70;
  *((_QWORD *)v25 + 1) = &v32;
  *((_QWORD *)v25 + 2) = &v33;
  *((_QWORD *)v25 + 3) = &Current;
  *((_QWORD *)v25 + 4) = (char *)&v32 + 4;
  v35 = v25;
  (*(void (**)(ITileDb *, uint8_t *))(*(_QWORD *)v24 + 152))(v24, buf);
  v26 = v35;
  if (v35 == buf)
  {
    v27 = 4;
    v26 = buf;
  }
  else
  {
    if (!v35)
      goto LABEL_41;
    v27 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v26 + 8 * v27))();
LABEL_41:
  if (qword_100417F08 != -1)
  {
    dispatch_once(&qword_100417F08, &stru_100407B40);
    v28 = qword_100417F10;
    if (!os_log_type_enabled((os_log_t)qword_100417F10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_44;
    goto LABEL_43;
  }
  v28 = qword_100417F10;
  if (os_log_type_enabled((os_log_t)qword_100417F10, OS_LOG_TYPE_DEFAULT))
  {
LABEL_43:
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)&buf[4] = HIDWORD(v32);
    *(_WORD *)&buf[8] = 1026;
    *(_DWORD *)&buf[10] = v32;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "VenueList, clearVisit, indoor, -1, -1, regional, %{public}d, %{public}d", buf, 0xEu);
  }
LABEL_44:

LABEL_45:
  v29 = 1;
LABEL_49:

  return v29;
}

- (NSURL)workdir
{
  return self->_workdir;
}

- (void)prefetcher:(id)a3 didFinishForegroundRequest:(id)a4
{
  NSObject *v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate q](self, "q"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate currentProvider](self, "currentProvider"));
  objc_msgSend(v6, "foregroundRequestCompleted:", v7);

}

- (CLIndoorProvider)currentProvider
{
  return (CLIndoorProvider *)objc_loadWeakRetained((id *)&self->_currentProvider);
}

- (void)setPrefetcher:(id)a3
{
  objc_storeStrong((id *)&self->_prefetcher, a3);
}

- (CLIndoorTileEvictionPolicy)delayedClearTilesPolicy
{
  return self->_delayedClearTilesPolicy;
}

- (shared_ptr<ITileDb>)createLocalizerDbWithRootDir:(BOOL)a3 relativeTo:(id)a4
{
  ITileDb *v4;
  __shared_weak_count *v5;
  shared_ptr<ITileDb> result;

  if (a3)
    v4 = (ITileDb *)-[CLIndoorServiceDelegate createDbAtBasedir:rootdir:relativeTo:](self, "createDbAtBasedir:rootdir:relativeTo:", CFSTR("base.local"), CFSTR("playback"), a4);
  else
    v4 = (ITileDb *)-[CLIndoorServiceDelegate createDbAtBasedir:rootdir:relativeTo:](self, "createDbAtBasedir:rootdir:relativeTo:", CFSTR("base.local"), 0, a4);
  result.__cntrl_ = v5;
  result.__ptr_ = v4;
  return result;
}

- (void)createIndoorProvderTransaction
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate transactionManager](self, "transactionManager"));
  objc_msgSend(v2, "openTransactionWithDescription:", CFSTR("start indoor provider"));

}

+ (BOOL)isEntitled:(id)a3 forEntitlement:(id)a4
{
  return +[CLIndoorServiceDelegate isEntitled:forEntitlement:allowRootEverything:](CLIndoorServiceDelegate, "isEntitled:forEntitlement:allowRootEverything:", a3, a4, 1);
}

+ (void)logViolation:(id)a3 ofEntitlement:(id)a4 forSelector:(SEL)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSString *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  id v17;

  v7 = a3;
  v8 = a4;
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407B20);
  v9 = (id)qword_100417F00;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = NSStringFromSelector(a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = 138543875;
    v13 = v11;
    v14 = 1025;
    v15 = objc_msgSend(v7, "processIdentifier");
    v16 = 2113;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Attempt to invoke %{public}@ by pid %{private}d without the appropriate entitlement %{private}@ set", (uint8_t *)&v12, 0x1Cu);

  }
}

+ (id)defaultWorkdir
{
  void *v2;
  __CFString *v3;
  passwd *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  char *v12;
  void *v13;
  void *v14;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  uint8_t buf[8];
  __int16 v30;
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (+[Keybag supportsMultiUser](Keybag, "supportsMultiUser"))
  {
    if (+[Keybag supportsMultiUser](Keybag, "supportsMultiUser"))
      v3 = CFSTR("mobile");
    else
      v3 = 0;
    v4 = getpwnam((const char *)-[__CFString UTF8String](v3, "UTF8String"));
    if (v4)
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4->pw_dir));
    else
      v5 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10040B1C0, "componentsJoinedByString:", CFSTR("/")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", v8));

    v7 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLsForDirectory:inDomains:", 13, 1));
    if (!objc_msgSend(v5, "count"))
    {
      sub_100345778(buf);

      abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/indoorservice/CLIndoorServiceDelegate.mm", 213, "+[CLIndoorServiceDelegate defaultWorkdir]");
      goto LABEL_27;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("com.apple.pipelined")));
  }
  v9 = (void *)v7;

  if (!v9)
  {
    sub_1003453E8(buf);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/indoorservice/CLIndoorServiceDelegate.mm", 218, "+[CLIndoorServiceDelegate defaultWorkdir]");
    goto LABEL_27;
  }
  v28 = 0;
  objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v28);
  v10 = v28;
  if (v10)
  {
    v16 = v10;
    v17 = sub_100338D28();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedDescription")));
      v20 = objc_msgSend(v19, "UTF8String");
      *(_DWORD *)buf = 68289795;
      *(_DWORD *)&buf[4] = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2081;
      v33 = v20;
      v34 = 2082;
      v35 = "assert";
      v36 = 2081;
      v37 = "error == nullptr";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Failed to create directory:\", \"error\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);

    }
    v21 = sub_100338D28();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_signpost_enabled(v22))
    {
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedDescription")));
      v24 = objc_msgSend(v23, "UTF8String");
      *(_DWORD *)buf = 68289795;
      *(_DWORD *)&buf[4] = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2081;
      v33 = v24;
      v34 = 2082;
      v35 = "assert";
      v36 = 2081;
      v37 = "error == nullptr";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to create directory:", "{\"msg%{public}.0s\":\"Failed to create directory:\", \"error\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);

    }
    v25 = sub_100338D28();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedDescription")));
      sub_1003456E8((uint64_t)objc_msgSend(v27, "UTF8String"), buf, v26, v27);
    }

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/indoorservice/CLIndoorServiceDelegate.mm", 223, "+[CLIndoorServiceDelegate defaultWorkdir]");
LABEL_27:
    __break(1u);
  }
  v11 = objc_retainAutorelease(v9);
  v12 = realpath_DARWIN_EXTSN((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 0);
  if (!v12)
  {
    sub_1003454E8(buf);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/indoorservice/CLIndoorServiceDelegate.mm", 225, "+[CLIndoorServiceDelegate defaultWorkdir]");
    goto LABEL_27;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v13));

  if (!v14)
  {
    sub_1003455E8(buf);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/indoorservice/CLIndoorServiceDelegate.mm", 228, "+[CLIndoorServiceDelegate defaultWorkdir]");
    goto LABEL_27;
  }
  free(v12);

  return v14;
}

- (CLIndoorServiceDelegate)initWithWorkdir:(id)a3
{
  id v4;
  char *v5;
  dispatch_queue_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  float v17;
  uint64_t v18;
  float v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  IndoorServiceTransactionManager *v23;
  Keybag *v24;
  void *v25;
  CLIndoorServiceDelegate *v26;
  CLIndoorServiceDelegate *result;
  _QWORD v28[4];
  id v29;
  id v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  id location;
  uint64_t v42;
  id to[2];
  uint64_t v44;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CLIndoorServiceDelegate;
  v5 = -[CLIndoorServiceDelegate init](&v45, "init");
  if (!v5
    || (v6 = dispatch_queue_create("com.apple.pipelined.positioning", 0),
        v7 = (void *)*((_QWORD *)v5 + 14),
        *((_QWORD *)v5 + 14) = v6,
        v7,
        !*((_QWORD *)v5 + 14)))
  {
    v26 = 0;
    goto LABEL_7;
  }
  v5[56] = 0;
  location = (id)sub_1000C3854();
  v42 = v8;
  v9 = sub_1000AAF28((uint64_t)&location, (unsigned int *)&v42 + 1);
  v39 = sub_1000C37F0();
  v40 = v10;
  v11 = sub_1000AAF28((uint64_t)&v39, (unsigned int *)&v40 + 1);
  v37 = sub_1000C3834();
  v38 = v12;
  v13 = sub_1000AAF28((uint64_t)&v37, (unsigned int *)&v38 + 1);
  v35 = sub_1000C37B0();
  v36 = v14;
  v15 = sub_1000AAF28((uint64_t)&v35, (unsigned int *)&v36 + 1);
  v33 = sub_1000C37C4();
  v34 = v16;
  v17 = sub_1000AB1D0((uint64_t)&v33, (float *)&v34 + 1);
  v31 = sub_1000C37A0();
  v32 = v18;
  v19 = sub_1000AB1D0((uint64_t)&v31, (float *)&v32 + 1);
  sub_1000C89D0((uint64_t)to, v9, v11, v13, v15, v17, v19);
  *(_OWORD *)(v5 + 60) = *(_OWORD *)to;
  *(_QWORD *)(v5 + 76) = v44;
  if (v4
    || (v4 = (id)objc_claimAutoreleasedReturnValue(+[CLIndoorServiceDelegate defaultWorkdir](CLIndoorServiceDelegate, "defaultWorkdir"))) != 0)
  {
    objc_msgSend(v5, "_setWorkingdir:", v4);
    objc_msgSend(v5, "deleteLegacyPrefetchDatabase");
    objc_initWeak(&location, v5);
    v20 = sub_1000B4684();
    v21 = *((_QWORD *)v5 + 14);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3321888768;
    v28[2] = sub_100339908;
    v28[3] = &unk_100407970;
    objc_copyWeak(to, &location);
    v22 = v4;
    to[1] = v22;
    objc_copyWeak(&v29, to);
    v30 = to[1];
    (*(void (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v20 + 48))(v20, v21, v28);

    objc_destroyWeak(to);
    xpc_set_event_stream_handler("com.apple.notifyd.matching", *((dispatch_queue_t *)v5 + 14), &stru_1004079A0);
    v23 = objc_alloc_init(IndoorServiceTransactionManager);
    objc_msgSend(v5, "setTransactionManager:", v23);

    v24 = -[Keybag initWithDelegate:]([Keybag alloc], "initWithDelegate:", v5);
    v25 = (void *)*((_QWORD *)v5 + 17);
    *((_QWORD *)v5 + 17) = v24;

    v26 = v5;
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
    v4 = v22;
LABEL_7:

    return v26;
  }
  sub_100345878(to);

  result = (CLIndoorServiceDelegate *)abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/indoorservice/CLIndoorServiceDelegate.mm", 261, "-[CLIndoorServiceDelegate initWithWorkdir:]");
  __break(1u);
  return result;
}

- (CLIndoorServiceDelegate)init
{
  return -[CLIndoorServiceDelegate initWithWorkdir:](self, "initWithWorkdir:", 0);
}

- (void)keybagDidLock
{
  NSObject *v2;
  uint8_t v3[16];

  if (qword_100417EF8 == -1)
  {
    v2 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      return;
  }
  else
  {
    dispatch_once(&qword_100417EF8, &stru_100407B20);
    v2 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      return;
  }
  *(_WORD *)v3 = 0;
  _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "keybag did lock", v3, 2u);
}

- (void)keybagDidUnlock
{
  NSObject *v3;
  NSObject *q;
  _QWORD v5[5];
  id v6;
  id buf[2];

  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407B20);
    v3 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  v3 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "keybag did unlock", (uint8_t *)buf, 2u);
  }
LABEL_4:
  objc_initWeak(buf, self);
  q = self->_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100339D28;
  v5[3] = &unk_1004070F8;
  objc_copyWeak(&v6, buf);
  v5[4] = self;
  dispatch_async(q, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (void)_setWorkingdir:(id)a3
{
  id v3;
  id v5;
  void *v6;
  void *p_p;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned __int8 v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  id v20;
  void *__p;
  char v22;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate workdir](self, "workdir"));

  if (v6)
  {
    sub_100345978(&v20);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/indoorservice/CLIndoorServiceDelegate.mm", 344, "-[CLIndoorServiceDelegate _setWorkingdir:]");
    __break(1u);
LABEL_21:
    dispatch_once(&qword_100417EF8, &stru_100407B20);
    goto LABEL_13;
  }
  sub_10033A34C((uint64_t)&v20);
  if ((_BYTE)v20)
  {
    if (v22 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", p_p, 1, 0));
    v9 = v8;
    if (v8)
    {
      v10 = v8;

      v5 = v10;
    }

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
  v12 = objc_msgSend(v6, "fileExistsAtPath:", v11);

  if ((v12 & 1) != 0)
  {
    v3 = 0;
    goto LABEL_16;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
  v17 = 0;
  v14 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v17);
  v3 = v17;

  if ((v14 & 1) != 0)
    goto LABEL_16;
  if (qword_100417EF8 != -1)
    goto LABEL_21;
LABEL_13:
  v15 = (id)qword_100417F00;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
    *(_DWORD *)buf = 138477827;
    v19 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failure to create working directory, %{private}@", buf, 0xCu);

  }
LABEL_16:
  -[CLIndoorServiceDelegate setWorkdir:](self, "setWorkdir:", v5);

  if ((_BYTE)v20 && v22 < 0)
    operator delete(__p);

}

- (void)deleteLegacyPrefetchDatabase
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  _QWORD v16[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate workdir](self, "workdir"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v16[0] = v5;
  v16[1] = CFSTR("prefetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v6));

  if (!objc_msgSend(v3, "fileExistsAtPath:", v7))
  {
    v10 = 0;
    goto LABEL_11;
  }
  if (qword_100417EF8 == -1)
  {
    v8 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
      goto LABEL_5;
    goto LABEL_4;
  }
  dispatch_once(&qword_100417EF8, &stru_100407B20);
  v8 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
  {
LABEL_4:
    *(_DWORD *)buf = 138477827;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Deleting legacy prefetch database directory, %{private}@", buf, 0xCu);
  }
LABEL_5:
  v13 = 0;
  v9 = objc_msgSend(v3, "removeItemAtPath:error:", v7, &v13);
  v10 = v13;
  if ((v9 & 1) == 0)
  {
    if (qword_100417EF8 == -1)
    {
      v11 = (id)qword_100417F00;
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_9:

        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v11 = (id)qword_100417F00;
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
    *(_DWORD *)buf = 138477827;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error, while deleting legacy prefetch database directory, %{private}@", buf, 0xCu);

    goto LABEL_9;
  }
LABEL_11:

}

- (void)fullyVacuumAllDBs
{
  -[CLIndoorServiceDelegate fullyVacuumAllDBsWithReply:](self, "fullyVacuumAllDBsWithReply:", &stru_1004079C0);
}

- (void)fullyVacuumAllDBsWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *q;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id buf[2];

  v4 = a3;
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407B20);
    v5 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Dispatching request to vacuum databases", (uint8_t *)buf, 2u);
  }
LABEL_4:
  objc_initWeak(buf, self);
  q = self->_q;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10033A89C;
  v8[3] = &unk_1004079E8;
  objc_copyWeak(&v10, buf);
  v9 = v4;
  v7 = v4;
  dispatch_async(q, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (void)clearTiles:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *q;
  id v7;
  _QWORD block[4];
  id v9;
  CLIndoorServiceDelegate *v10;
  id v11;
  id buf[2];

  v4 = a3;
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407B20);
    v5 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Dispatching request to clear tiles", (uint8_t *)buf, 2u);
  }
LABEL_4:
  objc_initWeak(buf, self);
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033AEF4;
  block[3] = &unk_100407A10;
  objc_copyWeak(&v11, buf);
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(q, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);
}

- (void)cancelPrefetch
{
  NSObject *v3;
  NSObject *q;
  _QWORD block[4];
  id v6;
  id buf[2];

  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407B20);
    v3 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  v3 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Dispatching request to cancel prefetch", (uint8_t *)buf, 2u);
  }
LABEL_4:
  objc_initWeak(buf, self);
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033B268;
  block[3] = &unk_1004048E8;
  objc_copyWeak(&v6, buf);
  dispatch_async(q, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (void)prefetch:(id)a3 callback:(id)a4 when:(unsigned __int8)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  unsigned __int8 v17;
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  v10 = objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate q](self, "q"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033B52C;
  block[3] = &unk_100407A38;
  objc_copyWeak(&v16, &location);
  v14 = v8;
  v15 = v9;
  v17 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (int)getMaxPriorityForPrefetch:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  char *v10;
  char *v11;
  size_t v12;
  size_t v13;
  void *v14;
  char *v15;
  CLIndoorServiceDelegate *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  int v30;
  char *v31;
  char *v32;
  void *v33;
  NSObject *v34;
  id v36;
  id v37;
  _QWORD v38[4];
  int v39;
  __int128 v40;
  __int128 v41;
  int v42;
  int v43;
  _QWORD v44[4];
  __int128 v45;
  __int128 v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  unsigned int v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  void *__p;
  char *v58;
  unint64_t v59;
  __int128 v60;
  __int128 v61;
  int v62;
  char *__s;
  __int16 v64;
  _BYTE v65[10];
  _BYTE v66[6];
  __int16 v67;
  int v68;
  __int16 v69;
  int v70;
  __int16 v71;
  int v72;
  __int16 v73;
  int v74;
  __int16 v75;
  int v76;
  __int16 v77;
  int v78;
  __int16 v79;
  int v80;
  __int16 v81;
  int v82;
  _BYTE v83[128];

  v36 = a3;
  -[CLIndoorServiceDelegate initializeDb](self, "initializeDb");
  if (!self->_fsDb.__ptr_)
  {
    if (qword_100417EF8 == -1)
    {
      v34 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
      {
LABEL_45:
        v19 = 0;
        goto LABEL_48;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v34 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_45;
    }
    LOWORD(__s) = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Prefetched file before first unlock!", (uint8_t *)&__s, 2u);
    goto LABEL_45;
  }
  __p = 0;
  v58 = 0;
  v59 = 0;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v4 = v36;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v53, v83, 16);
  if (!v5)
    goto LABEL_20;
  v6 = *(_QWORD *)v54;
  v37 = v4;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v54 != v6)
        objc_enumerationMutation(v4);
      v8 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "venueUuid")));
      __s = (char *)objc_msgSend(v9, "UTF8String");
      v52 = objc_msgSend(v8, "priority");
      v10 = v58;
      if ((unint64_t)v58 >= v59)
      {
        v15 = sub_10033EBB0(&__p, (const char **)&__s, &v52);
        goto LABEL_18;
      }
      v11 = __s;
      v12 = strlen(__s);
      if (v12 >= 0x7FFFFFFFFFFFFFF8)
        sub_1000CDE30();
      v13 = v12;
      if (v12 >= 0x17)
      {
        v16 = self;
        v17 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17)
          v17 = v12 | 7;
        v18 = v17 + 1;
        v14 = operator new(v17 + 1);
        *((_QWORD *)v10 + 1) = v13;
        *((_QWORD *)v10 + 2) = v18 | 0x8000000000000000;
        *(_QWORD *)v10 = v14;
        self = v16;
        v4 = v37;
      }
      else
      {
        v58[23] = v12;
        v14 = v10;
        if (!v12)
          goto LABEL_17;
      }
      memmove(v14, v11, v13);
LABEL_17:
      *((_BYTE *)v14 + v13) = 0;
      *((_DWORD *)v10 + 6) = v52;
      v15 = v10 + 32;
LABEL_18:
      v58 = v15;

    }
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v53, v83, 16);
  }
  while (v5);
LABEL_20:

  v19 = (*(uint64_t (**)(ITileDb *, void **, TileStorageLimits *, __int128 *))(*(_QWORD *)self->_fsDb.__ptr_
                                                                                       + 216))(self->_fsDb.__ptr_, &__p, &self->_tileStorageLimits, &v60);
  if (qword_100417EF8 == -1)
  {
    v20 = qword_100417F00;
    if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
  }
  else
  {
    dispatch_once(&qword_100417EF8, &stru_100407B20);
    v20 = qword_100417F00;
    if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
    {
LABEL_22:
      LODWORD(__s) = 67240704;
      HIDWORD(__s) = v19;
      v64 = 2050;
      *(_QWORD *)v65 = (v58 - (_BYTE *)__p) >> 5;
      *(_WORD *)&v65[8] = 1026;
      *(_DWORD *)v66 = DWORD1(v60);
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "TileFetch, maxpriority, %{public}d, len, %{public}lu, queued, %{public}d", (uint8_t *)&__s, 0x18u);
    }
  }
  if (DWORD1(v60))
  {
    v21 = 100;
    if (HIDWORD(v61))
      v21 = 100 * DWORD1(v60) / SHIDWORD(v61);
    v22 = v61 + DWORD1(v61);
    if (DWORD2(v61))
    {
      v23 = 100 * v22 / SDWORD2(v61);
      v24 = 100 * DWORD2(v60) / SDWORD2(v61);
      v25 = v60;
      if ((_DWORD)v60)
        goto LABEL_28;
LABEL_50:
      v26 = 0;
      if (qword_100417EF8 != -1)
        goto LABEL_51;
LABEL_29:
      v27 = qword_100417F00;
      if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
    }
    else
    {
      v23 = 0;
      v24 = 0;
      v25 = v60;
      if (!(_DWORD)v60)
        goto LABEL_50;
LABEL_28:
      v26 = 100 * DWORD1(v60) / v25;
      if (qword_100417EF8 == -1)
        goto LABEL_29;
LABEL_51:
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v27 = qword_100417F00;
      if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:
        LODWORD(__s) = 67243008;
        HIDWORD(__s) = v60;
        v64 = 1026;
        *(_DWORD *)v65 = DWORD1(v60);
        *(_WORD *)&v65[4] = 1026;
        *(_DWORD *)&v65[6] = DWORD2(v60);
        *(_WORD *)v66 = 1026;
        *(_DWORD *)&v66[2] = HIDWORD(v60);
        v67 = 1026;
        v68 = v61;
        v69 = 1026;
        v70 = DWORD1(v61);
        v71 = 1026;
        v72 = DWORD2(v61);
        v73 = 1026;
        v74 = HIDWORD(v61);
        v75 = 1026;
        v76 = v21;
        v77 = 1026;
        v78 = v23;
        v79 = 1026;
        v80 = v24;
        v81 = 1026;
        v82 = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Wifi2Metric, prefetch, incoming, %{public}d, queued, %{public}d, ondisk, %{public}d, lowpriortity, %{public}d, evictlow, %{public}d, evictoff, %{public}d, tiles, %{public}d, max, %{public}d, pctRequest, %{public}d, pctEvict, %{public}d, pctOndisk, %{public}d, pctFetch, %{public}d", (uint8_t *)&__s, 0x4Au);
      }
    }
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10033BCA8;
    v44[3] = &unk_100407A58;
    v45 = v60;
    v46 = v61;
    v47 = v62;
    v48 = v21;
    v49 = v23;
    v50 = v24;
    v51 = v26;
    AnalyticsSendEventLazy(CFSTR("com.apple.clx.wifi2.prefetch"), v44);
    if (v22)
    {
      v28 = 100 * v62;
      if (qword_100417EF8 == -1)
      {
        v29 = qword_100417F00;
        v30 = v28 / v22;
        if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
          goto LABEL_34;
      }
      else
      {
        dispatch_once(&qword_100417EF8, &stru_100407B20);
        v29 = qword_100417F00;
        v30 = v28 / v22;
        if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
        {
LABEL_34:
          LODWORD(__s) = 67240704;
          HIDWORD(__s) = v22;
          v64 = 1026;
          *(_DWORD *)v65 = v62;
          *(_WORD *)&v65[4] = 1026;
          *(_DWORD *)&v65[6] = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Wifi2Metric, eviction, %{public}d, untouched, %{public}d, pct, %{public}d, trigger, prefetch", (uint8_t *)&__s, 0x14u);
        }
      }
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_10033BF9C;
      v38[3] = &unk_100407A78;
      v39 = v22;
      v40 = v60;
      v41 = v61;
      v42 = v62;
      v43 = v30;
      AnalyticsSendEventLazy(CFSTR("com.apple.clx.wifi2.eviction"), v38);
    }
  }
  v31 = (char *)__p;
  if (__p)
  {
    v32 = v58;
    v33 = __p;
    if (v58 != __p)
    {
      do
      {
        if (*(v32 - 9) < 0)
          operator delete(*((void **)v32 - 4));
        v32 -= 32;
      }
      while (v32 != v31);
      v33 = __p;
    }
    v58 = v31;
    operator delete(v33);
  }
LABEL_48:

  return v19;
}

- (void)onQueuePrefetch:(id)a3 callback:(id)a4 when:(unsigned __int8)a5
{
  int v5;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  unsigned int v26;
  id v27;
  signed int v28;
  id v29;
  id v30;
  int v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void (**v45)(void);
  CLIndoorServiceDelegate *v46;
  id v47;
  id v48;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  __int16 v70;
  int v71;
  __int16 v72;
  signed int v73;
  _BYTE v74[128];
  _BYTE v75[128];
  id v76;
  _BYTE v77[128];

  v5 = a5;
  v44 = a3;
  v45 = (void (**)(void))a4;
  v46 = self;
  v8 = objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate q](self, "q"));
  dispatch_assert_queue_V2(v8);

  if (v5)
  {
    if (v5 == 1)
      -[CLIndoorServiceDelegate setPrefetchCompletion:](v46, "setPrefetchCompletion:", v45);
  }
  else
  {
    v45[2]();
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate transactionManager](v46, "transactionManager"));
  objc_msgSend(v9, "openTransactionWithDescription:", CFSTR("Prefetching"));

  if (!-[CLIndoorServiceDelegate initializeDb](v46, "initializeDb"))
  {
    if (qword_100417EF8 == -1)
    {
      v36 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
      {
LABEL_43:
        v10 = (id)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate transactionManager](v46, "transactionManager"));
        objc_msgSend(v10, "closeTransactionWithDescription:", CFSTR("Prefetching"));
        goto LABEL_55;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v36 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "TileFetch, onPrefetch, skip, database handle unavailable", buf, 2u);
    goto LABEL_43;
  }
  -[CLIndoorServiceDelegate reloadAvailabilityTilePrefetchParameters](v46, "reloadAvailabilityTilePrefetchParameters");
  v10 = objc_alloc_init((Class)NSMutableArray);
  v48 = objc_alloc_init((Class)NSMutableArray);
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v44;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v77, 16);
  if (!v11)
    goto LABEL_17;
  v12 = *(_QWORD *)v59;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(_QWORD *)v59 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
      v15 = objc_msgSend(v14, "locationContext");
      v16 = v10;
      if (!v15)
        goto LABEL_9;
      if (v15 == (id)1)
      {
        v16 = v48;
LABEL_9:
        objc_msgSend(v16, "addObject:", v14);
        continue;
      }
    }
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v77, 16);
  }
  while (v11);
LABEL_17:

  v43 = objc_msgSend(v10, "count");
  if (!objc_msgSend(v48, "count"))
  {
    v34 = 0;
    v28 = 0;
    goto LABEL_48;
  }
  v76 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("priority"), 1);
  v42 = v76;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v76, 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "sortedArrayUsingDescriptors:", v17));

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v47 = v18;
  v19 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v54, v75, 16);
  if (!v19)
    goto LABEL_31;
  v20 = *(_QWORD *)v55;
  while (2)
  {
    v21 = 0;
    while (2)
    {
      if (*(_QWORD *)v55 != v20)
        objc_enumerationMutation(v47);
      v22 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v21);
      if (qword_100417EF8 == -1)
      {
        v23 = (id)qword_100417F00;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          goto LABEL_25;
      }
      else
      {
        dispatch_once(&qword_100417EF8, &stru_100407B20);
        v23 = (id)qword_100417F00;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
LABEL_25:
          v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "venueUuid")));
          v25 = objc_msgSend(v24, "UTF8String");
          v26 = objc_msgSend(v22, "priority");
          *(_DWORD *)buf = 136380931;
          v63 = v25;
          v64 = 1026;
          LODWORD(v65) = v26;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "TileMaxPri, sortedreg, %{private}s, %{public}d", buf, 0x12u);

        }
      }

      if (v19 != (id)++v21)
        continue;
      break;
    }
    v27 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v54, v75, 16);
    v19 = v27;
    if (v27)
      continue;
    break;
  }
LABEL_31:

  v28 = -[CLIndoorServiceDelegate getMaxPriorityForPrefetch:](v46, "getMaxPriorityForPrefetch:", v47);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v29 = v47;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v74, 16);
  if (v30)
  {
    v31 = 0;
    v32 = *(_QWORD *)v51;
    while (2)
    {
      v33 = 0;
      v34 = v31 + (_DWORD)v30;
      do
      {
        if (*(_QWORD *)v51 != v32)
          objc_enumerationMutation(v29);
        v35 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v33);
        if ((uint64_t)objc_msgSend(v35, "priority") > v28)
        {
          v34 = v31 + (_DWORD)v33;
          goto LABEL_47;
        }
        objc_msgSend(v10, "addObject:", v35);
        v33 = (char *)v33 + 1;
      }
      while (v30 != v33);
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v74, 16);
      v31 = v34;
      if (v30)
        continue;
      break;
    }
  }
  else
  {
    v34 = 0;
  }
LABEL_47:

LABEL_48:
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407B20);
  v37 = (id)qword_100417F00;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = objc_msgSend(obj, "count");
    v39 = objc_msgSend(v10, "count");
    v40 = objc_msgSend(v48, "count");
    *(_DWORD *)buf = 134350336;
    v63 = v38;
    v64 = 2050;
    v65 = v39;
    v66 = 2050;
    v67 = v43;
    v68 = 2050;
    v69 = v40;
    v70 = 1026;
    v71 = v34;
    v72 = 1026;
    v73 = v28;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "TileFetch, onPrefetch, %{public}lu, reduced, %{public}lu, indoor, %{public}lu, regional, %{public}lu, %{public}d, prioritylimit, %{public}d", buf, 0x36u);
  }

  if (objc_msgSend(v10, "count"))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate prefetcher](v46, "prefetcher"));
    objc_msgSend(v41, "prefetch:", v10);

  }
LABEL_55:

}

- (void)tilePrefetchDidDownload:(const void *)a3 forRequest:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  unsigned __int8 v9;
  std::chrono::system_clock::time_point v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  unsigned int v22;
  NSObject *v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  void **v27;
  int v28;
  void **v29;
  id v30;
  void **v31;
  void **v32;
  int v33;
  void *__p[2];
  uint64_t v35;
  void *__dst[2];
  uint64_t v37;
  void *v38[2];
  uint64_t v39;
  void *v40[2];
  uint64_t v41;
  uint8_t v42[4];
  unsigned int v43;
  __int16 v44;
  unsigned int v45;
  __int16 v46;
  void **v47;
  __int16 v48;
  void **v49;
  __int16 v50;
  int v51;
  _BYTE buf[12];
  char v53;
  void *v54;
  char v55;

  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate q](self, "q"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate transactionManager](self, "transactionManager"));
  v9 = objc_msgSend(v8, "hasAnyOpenTransaction");

  if ((v9 & 1) == 0)
  {
    if (qword_100417EF8 == -1)
    {
      v13 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_50;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v13 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_50;
    }
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[CLIndoorServiceDelegate tilePrefetchDidDownload:forRequest:]";
    v14 = "%s Got delegate call from prefetcher while shutting down. Ignoring";
    v15 = v13;
    v16 = 12;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
    goto LABEL_50;
  }
  -[CLIndoorServiceDelegate initializeDb](self, "initializeDb");
  if (!self->_fsDb.__ptr_)
  {
    if (qword_100417EF8 == -1)
    {
      v17 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_50;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v17 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_50;
    }
    *(_WORD *)buf = 0;
    v14 = "Prefetched file before first unlock!";
    v15 = v17;
    v16 = 2;
    goto LABEL_11;
  }
  v10.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "venueUuid"));
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "ps_STLString");
  }
  else
  {
    v40[0] = 0;
    v40[1] = 0;
    v41 = 0;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "floorUuid"));
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "ps_STLString");
  }
  else
  {
    v38[0] = 0;
    v38[1] = 0;
    v39 = 0;
  }

  if (SHIBYTE(v39) < 0)
  {
    sub_10006CED8(__dst, v38[0], (unint64_t)v38[1]);
  }
  else
  {
    *(_OWORD *)__dst = *(_OWORD *)v38;
    v37 = v39;
  }
  if (SHIBYTE(v41) < 0)
  {
    sub_10006CED8(__p, v40[0], (unint64_t)v40[1]);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)v40;
    v35 = v41;
  }
  *(_QWORD *)&v20 = sub_10008FD38((uint64_t)buf, (__int128 *)__dst, (__n128 *)__p, +[CLLocationContextConversions fromCLPipelinedLocationContext:](CLLocationContextConversions, "fromCLPipelinedLocationContext:", objc_msgSend(v6, "context", __p[0], __p[1], v35))).n128_u64[0];
  if (SHIBYTE(v35) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v37) & 0x80000000) == 0)
      goto LABEL_24;
  }
  else if ((SHIBYTE(v37) & 0x80000000) == 0)
  {
    goto LABEL_24;
  }
  operator delete(__dst[0]);
LABEL_24:
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastRelevant", v20));
  -[CLIndoorServiceDelegate tilePrefetchForTileId:updateRelevancy:](self, "tilePrefetchForTileId:updateRelevancy:", buf, v21);

  v22 = objc_msgSend(v6, "kind");
  if (v22)
  {
    if (v22 == 1)
      (*(void (**)(ITileDb *, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep, _BYTE *, uint64_t, const void *, TileStorageLimits *))(*(_QWORD *)self->_fsDb.__ptr_ + 168))(self->_fsDb.__ptr_, v10.__d_.__rep_, buf, -1, a3, &self->_tileStorageLimits);
  }
  else
  {
    (*(void (**)(ITileDb *, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep, _BYTE *, const void *, TileStorageLimits *))(*(_QWORD *)self->_fsDb.__ptr_ + 160))(self->_fsDb.__ptr_, v10.__d_.__rep_, buf, a3, &self->_tileStorageLimits);
  }
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407B20);
  v23 = (id)qword_100417F00;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_msgSend(v6, "kind");
    v25 = objc_msgSend(v6, "session");
    v26 = SHIBYTE(v39);
    v27 = (void **)v38[0];
    v28 = SHIBYTE(v41);
    v29 = (void **)v40[0];
    v30 = objc_msgSend(v6, "context");
    v31 = v40;
    *(_DWORD *)v42 = 67241219;
    if (v28 < 0)
      v31 = v29;
    v43 = v24;
    v32 = v38;
    v44 = 1026;
    if (v26 < 0)
      v32 = v27;
    v45 = v25;
    v46 = 2081;
    if (v30 == (id)1)
      v33 = 82;
    else
      v33 = 73;
    v47 = v32;
    v48 = 2081;
    v49 = v31;
    v50 = 1026;
    v51 = v33;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "@TileFetch, kind, %{public}d, session, %{public}d, %{private}s, %{private}s, %{public}c", v42, 0x28u);
  }

  if (v55 < 0)
  {
    operator delete(v54);
    if ((v53 & 0x80000000) == 0)
    {
LABEL_43:
      if ((SHIBYTE(v39) & 0x80000000) == 0)
        goto LABEL_44;
      goto LABEL_48;
    }
  }
  else if ((v53 & 0x80000000) == 0)
  {
    goto LABEL_43;
  }
  operator delete(*(void **)buf);
  if ((SHIBYTE(v39) & 0x80000000) == 0)
  {
LABEL_44:
    if (SHIBYTE(v41) < 0)
      goto LABEL_49;
    goto LABEL_50;
  }
LABEL_48:
  operator delete(v38[0]);
  if (SHIBYTE(v41) < 0)
LABEL_49:
    operator delete(v40[0]);
LABEL_50:

}

- (void)tileForegroundFetchFinishedAllDownloads
{
  NSObject *v3;
  ITileDb *ptr;
  uint8_t v5[16];

  if (qword_100417EF8 == -1)
  {
    v3 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417EF8, &stru_100407B20);
  v3 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "TileFetch, prefetchFinished", v5, 2u);
  }
LABEL_4:
  -[CLIndoorServiceDelegate initializeDb](self, "initializeDb");
  ptr = self->_fsDb.__ptr_;
  if (ptr)
    (*(void (**)(ITileDb *, TileStorageLimits *))(*(_QWORD *)ptr + 176))(ptr, &self->_tileStorageLimits);
}

- (void)prefetcher:(id)a3 didFinishForegroundRequest:(id)a4 withError:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  v8 = objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate q](self, "q"));
  dispatch_assert_queue_V2(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate currentProvider](self, "currentProvider"));
  objc_msgSend(v9, "foregroundRequestCompleted:withError:", v10, v7);

}

- (vector<std::shared_ptr<ITileDb>,)onQueueDbsToClear
{
  NSObject *v5;
  __int128 *p_fsDb;
  ITileDb *ptr;
  vector<std::shared_ptr<ITileDb>, std::allocator<std::shared_ptr<ITileDb>>> *result;
  NSObject *v9;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v5 = objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate q](self, "q"));
  dispatch_assert_queue_V2(v5);

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  ptr = self->_fsDb.__ptr_;
  p_fsDb = (__int128 *)&self->_fsDb;
  if (ptr)
  {
    if (qword_100417EF8 == -1)
    {
      v9 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      {
LABEL_6:
        result = (vector<std::shared_ptr<ITileDb>, std::allocator<std::shared_ptr<ITileDb>>> *)sub_1001E3DB8((uint64_t)retstr, p_fsDb);
        retstr->var1 = result;
        return result;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v9 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_6;
    }
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Device will evict from the real DB", v12, 2u);
    goto LABEL_6;
  }
  if (qword_100417EF8 == -1)
  {
    v11 = qword_100417F00;
    result = (vector<std::shared_ptr<ITileDb>, std::allocator<std::shared_ptr<ITileDb>>> *)os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO);
    if ((_DWORD)result)
    {
LABEL_11:
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Device appears to be locked.", buf, 2u);
    }
  }
  else
  {
    dispatch_once(&qword_100417EF8, &stru_100407B20);
    v11 = qword_100417F00;
    result = (vector<std::shared_ptr<ITileDb>, std::allocator<std::shared_ptr<ITileDb>>> *)os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO);
    if ((_DWORD)result)
      goto LABEL_11;
  }
  return result;
}

- (void)onQueueClearTiles:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  void *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  _xpc_activity_s *v14;
  BOOL v15;
  NSObject *v16;
  _xpc_activity_s *v17;
  xpc_activity_state_t state;
  NSObject *v19;
  char *v20;
  char *v21;
  void *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  void *__p;
  char *v27;
  uint64_t v28;
  void *v29;
  char *v30;
  uint64_t v31;
  uint8_t buf[4];
  xpc_activity_state_t v33;

  v4 = a3;
  -[CLIndoorServiceDelegate initializeDb](self, "initializeDb");
  -[CLIndoorServiceDelegate onQueueDbsToClear](self, "onQueueDbsToClear");
  if (v29 == v30)
  {
    if (qword_100417EF8 == -1)
    {
      v11 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v11 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
      {
LABEL_14:
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activity"));
        v13 = v12 == 0;

        if (v13)
          goto LABEL_25;
        v14 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activity"));
        v15 = xpc_activity_set_state(v14, 5);

        if (v15)
        {
LABEL_20:
          if (qword_100417EF8 == -1)
          {
            v19 = qword_100417F00;
            if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
              goto LABEL_25;
          }
          else
          {
            dispatch_once(&qword_100417EF8, &stru_100407B20);
            v19 = qword_100417F00;
            if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
              goto LABEL_25;
          }
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "@CtsClear, DONE", buf, 2u);
          goto LABEL_25;
        }
        if (qword_100417EF8 == -1)
        {
          v16 = (id)qword_100417F00;
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
LABEL_19:

            goto LABEL_20;
          }
        }
        else
        {
          dispatch_once(&qword_100417EF8, &stru_100407B20);
          v16 = (id)qword_100417F00;
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            goto LABEL_19;
        }
        v17 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activity"));
        state = xpc_activity_get_state(v17);
        *(_DWORD *)buf = 134349056;
        v33 = state;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "@CtsClear, failed to mark tile cleanup activity as done.  current state is %{public}ld", buf, 0xCu);

        goto LABEL_19;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "No DB handles could be obtained to process tile eviction request.", buf, 2u);
    goto LABEL_14;
  }
  __p = v29;
  v27 = v30;
  v28 = v31;
  v29 = 0;
  v30 = 0;
  v31 = 0;
  -[CLIndoorServiceDelegate onQueueClearTilesIfPossible:fromDbs:](self, "onQueueClearTilesIfPossible:fromDbs:", v4, &__p);
  v5 = (char *)__p;
  if (__p)
  {
    v6 = v27;
    v7 = __p;
    if (v27 != __p)
    {
      do
      {
        v8 = (std::__shared_weak_count *)*((_QWORD *)v6 - 1);
        if (v8)
        {
          p_shared_owners = (unint64_t *)&v8->__shared_owners_;
          do
            v10 = __ldaxr(p_shared_owners);
          while (__stlxr(v10 - 1, p_shared_owners));
          if (!v10)
          {
            ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
            std::__shared_weak_count::__release_weak(v8);
          }
        }
        v6 -= 16;
      }
      while (v6 != v5);
      v7 = __p;
    }
    v27 = v5;
    operator delete(v7);
  }
LABEL_25:
  v20 = (char *)v29;
  if (v29)
  {
    v21 = v30;
    v22 = v29;
    if (v30 != v29)
    {
      do
      {
        v23 = (std::__shared_weak_count *)*((_QWORD *)v21 - 1);
        if (v23)
        {
          v24 = (unint64_t *)&v23->__shared_owners_;
          do
            v25 = __ldaxr(v24);
          while (__stlxr(v25 - 1, v24));
          if (!v25)
          {
            ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
            std::__shared_weak_count::__release_weak(v23);
          }
        }
        v21 -= 16;
      }
      while (v21 != v20);
      v22 = v29;
    }
    v30 = v20;
    operator delete(v22);
  }

}

- (void)onQueueClearTiles:(id)a3 fromDbs:()vector<std:(std::allocator<std::shared_ptr<ITileDb>>> *)a4 :shared_ptr<ITileDb>
{
  NSObject *v6;
  CLIndoorTileEvictionPolicy *delayedClearTilesPolicy;
  NSObject *v8;
  __shared_weak_count *cntrl;
  unint64_t *v10;
  unint64_t v11;
  __int128 v12;
  _QWORD *var0;
  _QWORD *var1;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  std::string *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  int *p_buf;
  uint64_t v24;
  NSObject *v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  NSObject *v32;
  std::string *v33;
  void *v34;
  BOOL v35;
  _xpc_activity_s *v36;
  BOOL v37;
  NSObject *v38;
  _xpc_activity_s *v39;
  xpc_activity_state_t state;
  __int128 v41;
  shared_ptr<ITileDb> *p_fsDb;
  void *context;
  _QWORD v44[4];
  std::string v45;
  int v46;
  int v47;
  int v48;
  std::string __p;
  uint64_t v50;
  CFAbsoluteTime Current;
  std::string v52;
  id v53;
  int buf;
  _BYTE buf_4[10];
  _BYTE v56[18];

  v53 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[CLIndoorServiceDelegate q](self, "q"));
  dispatch_assert_queue_V2(v6);

  delayedClearTilesPolicy = self->_delayedClearTilesPolicy;
  self->_delayedClearTilesPolicy = 0;

  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407B20);
    v8 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  v8 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Releasing the database file handles before clearing tiles", (uint8_t *)&buf, 2u);
  }
LABEL_4:
  cntrl = self->_fsDbHandle.__cntrl_;
  self->_fsDbHandle.__ptr_ = 0;
  self->_fsDbHandle.__cntrl_ = 0;
  if (cntrl)
  {
    v10 = (unint64_t *)((char *)cntrl + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  context = objc_autoreleasePoolPush();
  *((_BYTE *)&v52.__r_.__value_.__s + 23) = 3;
  LODWORD(v52.__r_.__value_.__l.__data_) = 6645601;
  objc_msgSend(v53, "maxModifiedAge");
  if (*(double *)&v12 == -1.79769313e308)
    std::string::assign(&v52, "privacy");
  var0 = a4->var0;
  var1 = a4->var1;
  if (a4->var0 != var1)
  {
    p_fsDb = &self->_fsDb;
    *(_QWORD *)&v12 = 136380675;
    v41 = v12;
    do
    {
      if (qword_100417EF8 == -1)
      {
        v15 = (id)qword_100417F00;
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          goto LABEL_22;
      }
      else
      {
        dispatch_once(&qword_100417EF8, &stru_100407B20);
        v15 = (id)qword_100417F00;
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          goto LABEL_22;
      }
      v16 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*var0 + 232))(*var0);
      if (*(char *)(v16 + 23) >= 0)
        v17 = v16;
      else
        v17 = *(_QWORD *)v16;
      v18 = &v52;
      if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v18 = (std::string *)v52.__r_.__value_.__r.__words[0];
      buf = 136380931;
      *(_QWORD *)buf_4 = v17;
      *(_WORD *)&buf_4[8] = 2082;
      *(_QWORD *)v56 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "TileEvict, fromDB, %{private}s, trigger, %{public}s", (uint8_t *)&buf, 0x16u);
LABEL_22:

      Current = 0.0;
      Current = CFAbsoluteTimeGetCurrent();
      v50 = 0;
      v19 = *var0;
      if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
        sub_10006CED8(&__p, v52.__r_.__value_.__l.__data_, v52.__r_.__value_.__l.__size_);
      else
        __p = v52;
      v20 = operator new(0x28uLL);
      *v20 = off_100407C50;
      v20[1] = &v53;
      v20[2] = &Current;
      v20[3] = (char *)&v50 + 4;
      v20[4] = &v50;
      *(_QWORD *)&v56[10] = v20;
      (*(void (**)(uint64_t, std::string *, int *))(*(_QWORD *)v19 + 112))(v19, &__p, &buf);
      p_buf = *(int **)&v56[10];
      if (*(int **)&v56[10] == &buf)
      {
        p_buf = &buf;
        v24 = 4;
      }
      else
      {
        if (!*(_QWORD *)&v56[10])
          goto LABEL_30;
        v24 = 5;
      }
      (*(void (**)(int *, uint64_t, uint64_t))(*(_QWORD *)p_buf + 8 * v24))(p_buf, v21, v22);
LABEL_30:
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (qword_100417EF8 == -1)
      {
        v25 = (id)qword_100417F00;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          goto LABEL_34;
      }
      else
      {
        dispatch_once(&qword_100417EF8, &stru_100407B20);
        v25 = (id)qword_100417F00;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
LABEL_34:
          v27 = v50;
          v26 = HIDWORD(v50);
          v28 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*var0 + 232))(*var0);
          if (*(char *)(v28 + 23) >= 0)
            v29 = v28;
          else
            v29 = *(_QWORD *)v28;
          buf = 67240962;
          *(_DWORD *)buf_4 = v26;
          *(_WORD *)&buf_4[4] = 1026;
          *(_DWORD *)&buf_4[6] = v27;
          *(_WORD *)v56 = 2082;
          *(_QWORD *)&v56[2] = v29;
          *(_WORD *)&v56[10] = 1026;
          *(_DWORD *)&v56[12] = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "@TileEvict, numVenuesRemoved, %{public}d, untouched, %{public}d, db, %{public}s, removeAll, %{public}d", (uint8_t *)&buf, 0x1Eu);
        }
      }

      v30 = HIDWORD(v50);
      if (HIDWORD(v50))
      {
        v31 = v50;
        if (qword_100417EF8 != -1)
          dispatch_once(&qword_100417EF8, &stru_100407B20);
        v32 = qword_100417F00;
        if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
        {
          v33 = &v52;
          if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v33 = (std::string *)v52.__r_.__value_.__r.__words[0];
          buf = 67240962;
          *(_DWORD *)buf_4 = HIDWORD(v50);
          *(_WORD *)&buf_4[4] = 1026;
          *(_DWORD *)&buf_4[6] = v50;
          *(_WORD *)v56 = 1026;
          *(_DWORD *)&v56[2] = 100 * v31 / v30;
          *(_WORD *)&v56[6] = 2082;
          *(_QWORD *)&v56[8] = v33;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Wifi2Metric, eviction, %{public}d, untouched, %{public}d, pct, %{public}d, trigger, %{public}s", (uint8_t *)&buf, 0x1Eu);
        }
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3321888768;
        v44[2] = sub_10033DF40;
        v44[3] = &unk_100407A98;
        v46 = HIDWORD(v50);
        v47 = v50;
        v48 = 100 * v31 / v30;
        if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
          sub_10006CED8(&v45, v52.__r_.__value_.__l.__data_, v52.__r_.__value_.__l.__size_);
        else
          v45 = v52;
        AnalyticsSendEventLazy(CFSTR("com.apple.clx.wifi2.eviction"), v44);
        if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v45.__r_.__value_.__l.__data_);
      }
      var0 += 2;
    }
    while (var0 != var1);
  }
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v52.__r_.__value_.__l.__data_);
  objc_autoreleasePoolPop(context);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "activity"));
  v35 = v34 == 0;

  if (!v35)
  {
    v36 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "activity"));
    v37 = xpc_activity_set_state(v36, 5);

    if (!v37)
    {
      if (qword_100417EF8 == -1)
      {
        v38 = (id)qword_100417F00;
        if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
LABEL_61:

          goto LABEL_62;
        }
      }
      else
      {
        dispatch_once(&qword_100417EF8, &stru_100407B20);
        v38 = (id)qword_100417F00;
        if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          goto LABEL_61;
      }
      v39 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "activity", v41, p_fsDb));
      state = xpc_activity_get_state(v39);
      buf = 134349056;
      *(_QWORD *)buf_4 = state;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "failed to mark tile cleanup activity as done.  current state is %{public}ld", (uint8_t *)&buf, 0xCu);

      goto LABEL_61;
    }
  }
LABEL_62:

}

- (void)onQueueClearTilesIfPossible:(id)a3 fromDbs:()vector<std:(std::allocator<std::shared_ptr<ITileDb>>> *)a4 :shared_ptr<ITileDb>
{
  id v7;
  id WeakRetained;
  NSObject *v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  char *v13;
  char *v14;
  void *v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  char *v19;
  char *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  NSObject *v24;
  void *__p;
  char *v26;
  char *v27;
  char *v28;
  uint8_t buf[4];
  _BOOL4 v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  uint64_t v34;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentProvider);
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407B20);
  v9 = (id)qword_100417F00;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v7, "forceClean");
    objc_msgSend(v7, "maxModifiedAge");
    *(_DWORD *)buf = 67240704;
    v30 = WeakRetained == 0;
    v31 = 1026;
    v32 = v10;
    v33 = 2050;
    v34 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "@CtsClear, check, providernil, %{public}d, force, %{public}d, agethresh, %{public}.1f", buf, 0x18u);
  }

  if (WeakRetained)
  {
    if (!objc_msgSend(v7, "forceClean"))
    {
      objc_storeStrong((id *)&self->_delayedClearTilesPolicy, a3);
      if (qword_100417EF8 == -1)
      {
        v24 = qword_100417F00;
        if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
          goto LABEL_36;
      }
      else
      {
        dispatch_once(&qword_100417EF8, &stru_100407B20);
        v24 = qword_100417F00;
        if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
          goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "@CtsClear, scheduled deferred tile clear when localizer stops", buf, 2u);
      goto LABEL_36;
    }
    if (qword_100417EF8 == -1)
    {
      v12 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_10;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407B20);
      v12 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      {
LABEL_10:
        sub_10033F24C(&__p, (uint64_t)a4);
        -[CLIndoorServiceDelegate onQueueClearTiles:fromDbs:](self, "onQueueClearTiles:fromDbs:", v7, &__p);
        v13 = (char *)__p;
        if (__p)
        {
          v14 = v26;
          v15 = __p;
          if (v26 != __p)
          {
            do
            {
              v16 = (std::__shared_weak_count *)*((_QWORD *)v14 - 1);
              if (v16)
              {
                p_shared_owners = (unint64_t *)&v16->__shared_owners_;
                do
                  v18 = __ldaxr(p_shared_owners);
                while (__stlxr(v18 - 1, p_shared_owners));
                if (!v18)
                {
                  ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
                  std::__shared_weak_count::__release_weak(v16);
                }
              }
              v14 -= 16;
            }
            while (v14 != v13);
            v15 = __p;
          }
          v26 = v13;
LABEL_35:
          operator delete(v15);
          goto LABEL_36;
        }
        goto LABEL_36;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "WARNING: Request to force a clean of all tiles while localizer is active - crash may occur", buf, 2u);
    goto LABEL_10;
  }
  sub_10033F24C(&v27, (uint64_t)a4);
  -[CLIndoorServiceDelegate onQueueClearTiles:fromDbs:](self, "onQueueClearTiles:fromDbs:", v7, &v27);
  v19 = v27;
  if (v27)
  {
    v20 = v28;
    v15 = v27;
    if (v28 != v27)
    {
      do
      {
        v21 = (std::__shared_weak_count *)*((_QWORD *)v20 - 1);
        if (v21)
        {
          v22 = (unint64_t *)&v21->__shared_owners_;
          do
            v23 = __ldaxr(v22);
          while (__stlxr(v23 - 1, v22));
          if (!v23)
          {
            ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
            std::__shared_weak_count::__release_weak(v21);
          }
        }
        v20 -= 16;
      }
      while (v20 != v19);
      v15 = v27;
    }
    v28 = v19;
    goto LABEL_35;
  }
LABEL_36:

}

- (void)shutdown
{
  NSObject *q;
  _QWORD block[5];

  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033E4FC;
  block[3] = &unk_1003EE788;
  block[4] = self;
  dispatch_sync(q, block);
}

- (void)onQueueShutdown
{
  id WeakRetained;

  self->_shutdown = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentProvider);
  objc_msgSend(WeakRetained, "onConnectionQueueShutdown");

}

- (int64_t)numFloors
{
  NSObject *v3;
  NSObject *q;
  int64_t v5;
  id v7;
  uint64_t *v8;
  _QWORD block[4];
  id v10[2];
  uint64_t v11;
  id location;

  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407B20);
    v3 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  v3 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Dispatching request get number of floors", (uint8_t *)&v7, 2u);
  }
LABEL_4:
  objc_initWeak(&location, self);
  v11 = -1;
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_10033E698;
  block[3] = &unk_100407AC8;
  objc_copyWeak(&v7, &location);
  v8 = &v11;
  objc_copyWeak(v10, &v7);
  v10[1] = v8;
  dispatch_sync(q, block);
  objc_destroyWeak(&v7);
  v5 = v11;
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  return v5;
}

- (int64_t)onQueueNumFloors
{
  ITileDb *ptr;
  int64_t result;
  std::bad_cast *exception;
  std::bad_cast *v6;

  if (!+[Keybag afterFirstUserUnlock](Keybag, "afterFirstUserUnlock"))
    return -1;
  -[CLIndoorServiceDelegate initializeDb](self, "initializeDb");
  ptr = self->_fsDb.__ptr_;
  if (!ptr)
    return -1;
  result = (*(uint64_t (**)(ITileDb *))(*(_QWORD *)ptr + 72))(ptr);
  if (result < 0)
  {
    exception = (std::bad_cast *)__cxa_allocate_exception(8uLL);
    exception->__vftable = 0;
    v6 = sub_10016A6B8(exception);
  }
  return result;
}

- (void)setWorkdir:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setCurrentProvider:(id)a3
{
  objc_storeWeak((id *)&self->_currentProvider, a3);
}

- (Keybag)keybag
{
  return self->_keybag;
}

- (void)setKeybag:(id)a3
{
  objc_storeStrong((id *)&self->_keybag, a3);
}

- (BOOL)shouldImportFromPrefetchOnProviderShutdown
{
  return self->_shouldImportFromPrefetchOnProviderShutdown;
}

- (void)setTransactionManager:(id)a3
{
  objc_storeStrong((id *)&self->_transactionManager, a3);
}

- (id)prefetchCompletion
{
  return self->_prefetchCompletion;
}

- (void)setPrefetchCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  __shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;

  objc_storeStrong(&self->_prefetchCompletion, 0);
  objc_storeStrong((id *)&self->_transactionManager, 0);
  objc_storeStrong((id *)&self->_delayedClearTilesPolicy, 0);
  objc_storeStrong((id *)&self->_prefetcher, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_destroyWeak((id *)&self->_currentProvider);
  objc_storeStrong((id *)&self->_workdir, 0);
  objc_storeStrong((id *)&self->_q, 0);
  cntrl = self->_fsDbHandle.__cntrl_;
  if (!cntrl)
    goto LABEL_5;
  v4 = (unint64_t *)((char *)cntrl + 8);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 - 1, v4));
  if (!v5)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    v6 = self->_fsDb.__cntrl_;
    if (!v6)
      goto LABEL_11;
  }
  else
  {
LABEL_5:
    v6 = self->_fsDb.__cntrl_;
    if (!v6)
      goto LABEL_11;
  }
  v7 = (unint64_t *)((char *)v6 + 8);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
  if (!v8)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v6 + 16))(v6);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
  }
LABEL_11:
  if (self->_workdirOverride.m_initialized)
  {
    if ((char)self->_anon_11[22] < 0)
      operator delete(*(void **)((char *)&self->_workdirOverride.m_storage.dummy_.aligner_ + 7));
    self->_workdirOverride.m_initialized = 0;
  }
}

- (id).cxx_construct
{
  self->_workdirOverride.m_initialized = 0;
  self->_fsDb.__ptr_ = 0;
  self->_fsDb.__cntrl_ = 0;
  sub_100242BF0((uint64_t)&self->_tileStorageLimits);
  self->_fsDbHandle.__ptr_ = 0;
  self->_fsDbHandle.__cntrl_ = 0;
  return self;
}

@end
