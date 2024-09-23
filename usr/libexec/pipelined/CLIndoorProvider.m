@implementation CLIndoorProvider

- (NSXPCConnection)xpcConnection
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    if (qword_100417EF8 == -1)
    {
      v5 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_3;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407200);
      v5 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_3;
    }
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "request to login, but connection to client is dead", v7, 2u);

    return (NSXPCConnection *)0;
  }
  v4 = WeakRetained;
LABEL_3:

  return (NSXPCConnection *)v3;
}

- (void)clVisionNotificationAvailable:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = v4;
  if (self->_serviceLocalizer.__ptr_.__value_)
  {
    v6 = objc_msgSend(v4, "notificationType");
    if (v6)
    {
      if (v6 == 1)
      {
        -[CLIndoorProvider clVisionNotificationVIOEstimationAvailable:](self, "clVisionNotificationVIOEstimationAvailable:", v5);
      }
      else if (v6 == 2)
      {
        -[CLIndoorProvider clVisionNotificationVLLocalizationResultAvailable:](self, "clVisionNotificationVLLocalizationResultAvailable:", v5);
      }
    }
    else
    {
      -[CLIndoorProvider clVisionNotificationARSessionStateAvailable:](self, "clVisionNotificationARSessionStateAvailable:", v5);
    }
    goto LABEL_6;
  }
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407200);
    v7 = qword_100417F00;
    if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_9;
LABEL_6:

    return;
  }
  v7 = qword_100417F00;
  if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
    goto LABEL_6;
LABEL_9:
  *(_WORD *)v8 = 0;
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Ignoring CLVision notification - not localizing yet", v8, 2u);

}

- (void)setFsDb:(shared_ptr<ITileDb>)a3
{
  ITileDb *ptr;
  NSObject *v5;
  _BOOL4 v6;
  ITileDb *v7;
  __shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  __shared_weak_count *cntrl;
  unint64_t *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *__p[2];
  char v17;
  std::string buf;
  __int128 v19;
  uint64_t v20;

  ptr = a3.__ptr_;
  if (qword_100417EF8 == -1)
  {
    v5 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417EF8, &stru_100407200);
  v5 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    v6 = *(_QWORD *)ptr != 0;
    LODWORD(buf.__r_.__value_.__l.__data_) = 67240192;
    HIDWORD(buf.__r_.__value_.__r.__words[0]) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[CLIndoorProvider] Keybag unlock, FsDb, %{public}d", (uint8_t *)&buf, 8u);
  }
LABEL_4:
  v7 = self->_fsDb.__ptr_;
  if (v7)
  {
    if (v7 != *(ITileDb **)ptr)
    {
      sub_1000D5048(__p, "");
      sub_10023D100("Cannot change the localizer DB being used", &buf);
      sub_100174738((uint64_t)__p, (uint64_t)&buf, 1);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf.__r_.__value_.__l.__data_);
      if (v17 < 0)
        operator delete(__p[0]);
      sub_1000F2AE4((uint64_t)&v15);
    }
  }
  else
  {
    v7 = *(ITileDb **)ptr;
  }
  v8 = (__shared_weak_count *)*((_QWORD *)ptr + 1);
  if (v8)
  {
    v9 = (unint64_t *)((char *)v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  self->_fsDb.__ptr_ = v7;
  cntrl = self->_fsDb.__cntrl_;
  self->_fsDb.__cntrl_ = v8;
  if (!cntrl)
    goto LABEL_19;
  v12 = (unint64_t *)((char *)cntrl + 8);
  do
    v13 = __ldaxr(v12);
  while (__stlxr(v13 - 1, v12));
  if (!v13)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    if (!self->_deferredState.m_initialized)
      return;
  }
  else
  {
LABEL_19:
    if (!self->_deferredState.m_initialized)
      return;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorProvider xpcConnection](self, "xpcConnection"));
  if (v14)
  {
    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)objc_retain(*(id *)((char *)&self->_deferredState.m_storage.dummy_.aligner_
                                                                                 + 7));
    buf.__r_.__value_.__s.__data_[8] = 0;
    if (self->_anon_11[7])
    {
      buf.__r_.__value_.__r.__words[2] = (std::string::size_type)*(id *)&self->_anon_11[15];
      if ((char)self->_anon_11[46] < 0)
      {
        sub_10006CED8(&v19, *(void **)&self->_anon_11[23], *(_QWORD *)&self->_anon_11[31]);
      }
      else
      {
        v19 = *(_OWORD *)&self->_anon_11[23];
        v20 = *(_QWORD *)&self->_anon_11[39];
      }
      buf.__r_.__value_.__s.__data_[8] = 1;
    }
    if (self->_deferredState.m_initialized)
    {
      if (self->_anon_11[7])
      {
        sub_10007CDC0((uint64_t)&self->_anon_11[15]);
        self->_anon_11[7] = 0;
      }

      self->_deferredState.m_initialized = 0;
    }
    if (buf.__r_.__value_.__r.__words[0])
      -[CLIndoorProvider playbackDatarun:](self, "playbackDatarun:");
    if (buf.__r_.__value_.__s.__data_[8])
    {
      if (!self->_lastOutdoorPositionAvailable
        || (-[CLIndoorProvider startUpdatingLocationDeferred:](self, "startUpdatingLocationDeferred:"),
            buf.__r_.__value_.__s.__data_[8]))
      {
        sub_10007CDC0((uint64_t)&buf.__r_.__value_.__r.__words[2]);
        buf.__r_.__value_.__s.__data_[8] = 0;
      }
    }

  }
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  CLIndoorProvider *v8;

  if (qword_100417EF8 == -1)
  {
    v3 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417EF8, &stru_100407200);
  v3 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "dealloc start", buf, 2u);
  }
LABEL_4:
  -[CLIndoorProvider onQueueInvalidate:](self, "onQueueInvalidate:", 1);
  if (qword_100417EF8 == -1)
  {
    v4 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    goto LABEL_6;
  }
  dispatch_once(&qword_100417EF8, &stru_100407200);
  v4 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_6:
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Connection state %p invalidated", buf, 0xCu);
  }
LABEL_7:
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407200);
    v5 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
      goto LABEL_10;
    goto LABEL_9;
  }
  v5 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
  {
LABEL_9:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "dealloc end", buf, 2u);
  }
LABEL_10:
  v6.receiver = self;
  v6.super_class = (Class)CLIndoorProvider;
  -[CLIndoorProvider dealloc](&v6, "dealloc");
}

- (void)onQueueNotifyLocationContext:(BOOL)a3 withLocationContext:(int)a4
{
  uint64_t *v5;
  uint64_t *v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  float v9;
  uint64_t v10;
  uint64_t v11;

  if (a4 == 1)
  {
    v5 = sub_100315A18();
    v6 = v5;
    v7 = atomic_load((unsigned __int8 *)v5 + 26);
    if ((v7 & 1) != 0 || *((_BYTE *)v5 + 16))
      goto LABEL_8;
  }
  else
  {
    v5 = sub_1000141CC();
    v6 = v5;
    v8 = atomic_load((unsigned __int8 *)v5 + 26);
    if ((v8 & 1) != 0 || *((_BYTE *)v5 + 16))
      goto LABEL_8;
  }
  *((float *)v6 + 5) = sub_1000AB1D0((uint64_t)v5, (float *)v5 + 3);
  *((_BYTE *)v6 + 16) = 1;
  atomic_store(1u, (unsigned __int8 *)v6 + 26);
LABEL_8:
  v9 = *((float *)v6 + 5);
  v10 = sub_100014180();
  if (sub_100014258(v10) != v9)
  {
    v11 = sub_100014180();
    sub_1000BB82C(v11, v9);
    ++self->_localizationSessionMetrics.numOfLocationContextChange;
  }
}

+ (id)getAvailabilityTilePathFromWorkdir:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "URLByDeletingLastPathComponent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("locationd/indoor_tiles/availability.pb")));

  return v4;
}

- (id)initializeServiceApi
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  shared_ptr<PlatformInfo> v7;
  __shared_weak_count *cntrl;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *size;
  unint64_t *v12;
  unint64_t v13;
  __shared_weak_count *v14;
  __shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  shared_ptr<SensorCollection> v19;
  __shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  id v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  _BYTE v33[24];
  std::string v34;
  std::runtime_error v35;
  _QWORD *v36;
  std::__shared_weak_count *v37;
  _QWORD v38[3];
  _QWORD *v39;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorProvider xpcConnection](self, "xpcConnection"));
  if (!v3)
    goto LABEL_40;
  v4 = (*(uint64_t (**)(ITileDb *))(*(_QWORD *)self->_fsDb.__ptr_ + 232))(self->_fsDb.__ptr_);
  v5 = (*(uint64_t (**)(ITileDb *))(*(_QWORD *)self->_fsDb.__ptr_ + 240))(self->_fsDb.__ptr_);
  v6 = (std::__shared_weak_count *)operator new(0xA8uLL);
  v6->__shared_owners_ = 0;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)off_100407530;
  sub_1003308FC((uint64_t)&v34, (uint64_t)&v6[1], v4, v5);
  v36 = &v6[1].__vftable;
  v37 = v6;
  sub_1000C23DC(&v34);
  v7 = *(shared_ptr<PlatformInfo> *)&v34.__r_.__value_.__l.__data_;
  *(_OWORD *)&v34.__r_.__value_.__l.__data_ = 0uLL;
  cntrl = self->_platformInfo.__cntrl_;
  self->_platformInfo = v7;
  if (cntrl)
  {
    v9 = (unint64_t *)((char *)cntrl + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  size = (std::__shared_weak_count *)v34.__r_.__value_.__l.__size_;
  if (v34.__r_.__value_.__l.__size_)
  {
    v12 = (unint64_t *)(v34.__r_.__value_.__l.__size_ + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }
  v14 = (__shared_weak_count *)operator new(0x48uLL);
  *((_QWORD *)v14 + 1) = 0;
  *((_QWORD *)v14 + 2) = 0;
  *(_QWORD *)v14 = off_100407580;
  self->_eventBuses.__ptr_ = (_EventBusCollection *)sub_1000087A4((_QWORD *)v14 + 3);
  v15 = self->_eventBuses.__cntrl_;
  self->_eventBuses.__cntrl_ = v14;
  if (v15)
  {
    v16 = (unint64_t *)((char *)v15 + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v15 + 16))(v15);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v15);
    }
  }
  v18 = (uint64_t)v36;
  sub_1000C8868((uint64_t)v36, (uint64_t *)&self->_eventBuses);
  v39 = 0;
  sub_1000166D4(v18, 0xBu, v38, &v34);
  v19 = *(shared_ptr<SensorCollection> *)&v34.__r_.__value_.__l.__data_;
  *(_OWORD *)&v34.__r_.__value_.__l.__data_ = 0uLL;
  v20 = self->_localizationSensorCollection.__cntrl_;
  self->_localizationSensorCollection = v19;
  if (!v20)
    goto LABEL_21;
  v21 = (unint64_t *)((char *)v20 + 8);
  do
    v22 = __ldaxr(v21);
  while (__stlxr(v22 - 1, v21));
  if (!v22)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v20 + 16))(v20);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v20);
    v23 = (std::__shared_weak_count *)v34.__r_.__value_.__l.__size_;
    if (!v34.__r_.__value_.__l.__size_)
      goto LABEL_25;
  }
  else
  {
LABEL_21:
    v23 = (std::__shared_weak_count *)v34.__r_.__value_.__l.__size_;
    if (!v34.__r_.__value_.__l.__size_)
      goto LABEL_25;
  }
  p_shared_owners = (unint64_t *)&v23->__shared_owners_;
  do
    v25 = __ldaxr(p_shared_owners);
  while (__stlxr(v25 - 1, p_shared_owners));
  if (!v25)
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
    v26 = v39;
    if (v39 != v38)
      goto LABEL_26;
LABEL_31:
    v27 = 4;
    v26 = v38;
    goto LABEL_32;
  }
LABEL_25:
  v26 = v39;
  if (v39 == v38)
    goto LABEL_31;
LABEL_26:
  if (!v26)
    goto LABEL_33;
  v27 = 5;
LABEL_32:
  (*(void (**)(void))(*v26 + 8 * v27))();
LABEL_33:
  if (self->_serviceLocalizer.__ptr_.__value_ && -[CLIndoorProvider localizationActive](self, "localizationActive"))
  {
    __cxa_allocate_exception(0x40uLL);
    sub_1000D5048(&v34, "This should not be possible. We have just started pipelined for the first time. The localizer couldn't possibly be running.");
    std::runtime_error::runtime_error(&v35, &v34);
    v35.__vftable = (std::runtime_error_vtbl *)&off_1003EF830;
    sub_10018D04C((uint64_t)v33);
    sub_1000F2F7C(&v35, (uint64_t)"-[CLIndoorProvider initializeServiceApi]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/indoorservice/CLIndoorProvider.mm", 1617, (uint64_t)v33);
  }
  v28 = v3;
  v29 = v37;
  if (v37)
  {
    v30 = (unint64_t *)&v37->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
LABEL_40:

  return v3;
}

- (void)updateUniverseIfAllowedAndNecessary:(id *)a3
{
  uint64_t v5;
  CLIndoorUniverse *indoorUniverse;
  CLIndoorProvider *v7;
  NSObject *v8;
  _QWORD v9[4];
  CLIndoorProvider *v10;
  void *v11;
  void *__p[2];
  char v13;
  std::string buf;

  if (!self->_serviceLocalizer.__ptr_.__value_ || !-[CLIndoorProvider localizationStarted](self, "localizationStarted"))
  {
    if (qword_100417EF8 == -1)
    {
      v8 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
        return;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407200);
      v8 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
        return;
    }
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[CLIndoorProvider] Localizer is not running, ignoring request to updateUniverse", (uint8_t *)&buf, 2u);
    return;
  }
  if (!self->_indoorUniverse)
  {
    sub_1000D5048(__p, "");
    sub_100270578("IndoorUniverse not initialzied prior to requesting update.", &buf);
    sub_100174738((uint64_t)__p, (uint64_t)&buf, 1);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    if (v13 < 0)
      operator delete(__p[0]);
    sub_1000F2AE4((uint64_t)&v11);
  }
  v5 = sub_10005F0F0();
  indoorUniverse = self->_indoorUniverse;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3321888768;
  v9[2] = sub_10032BB34;
  v9[3] = &unk_1004071D0;
  v7 = self;
  v10 = v7;
  -[CLIndoorUniverse updateLocalizerUniverseIfAllowed:fromLocation:withUniverseUpdatedHandler:](indoorUniverse, "updateLocalizerUniverseIfAllowed:fromLocation:withUniverseUpdatedHandler:", v5, a3, v9);

}

- (void)clVisionNotificationARSessionStateAvailable:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  CombinedLogger *ptr;
  char *v16;
  std::__shared_weak_count *v17;
  _BYTE v18[60];
  int v19;
  _BYTE buf[12];
  _BYTE v21[56];

  v4 = a3;
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407200);
  v5 = (id)qword_100417F00;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    *(_QWORD *)&buf[4] = objc_msgSend(v4, "arSessionState");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Receiving CLVision notification - ARSessionState %{public}lu", buf, 0xCu);
  }

  v6 = objc_msgSend(v4, "arSessionState");
  if (v6)
  {
    if (v6 == (id)1)
    {
      v7 = 1;
      goto LABEL_15;
    }
    if (v6 == (id)2)
    {
      v7 = 2;
LABEL_15:
      v19 = v7;
      goto LABEL_16;
    }
    if (qword_100417EF8 == -1)
    {
      v8 = (id)qword_100417F00;
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
LABEL_14:

        v7 = -1;
        goto LABEL_15;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407200);
      v8 = (id)qword_100417F00;
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        goto LABEL_14;
    }
    v9 = objc_msgSend(v4, "arSessionState");
    *(_DWORD *)buf = 134349056;
    *(_QWORD *)&buf[4] = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "Invalid arSessionState %{public}lu", buf, 0xCu);
    goto LABEL_14;
  }
  v19 = 0;
LABEL_16:
  sub_10001B8F4((uint64_t)v18);
  v10 = *(_QWORD *)(*(uint64_t (**)(LocalizerApi *))(*(_QWORD *)self->_serviceLocalizer.__ptr_.__value_ + 120))(self->_serviceLocalizer.__ptr_.__value_);
  sub_1000C7494((uint64_t)buf, (uint64_t)v18, &v19);
  v11 = operator new(0x108uLL);
  v11[1] = 0;
  v11[2] = 0;
  *v11 = off_1003F0840;
  v11[4] = *(_QWORD *)buf;
  *((_DWORD *)v11 + 10) = *(_DWORD *)&buf[8];
  sub_100018EC4((uint64_t)(v11 + 6), (uint64_t)v21);
  *((_DWORD *)v11 + 6) = 17;
  v16 = (char *)(v11 + 3);
  v17 = (std::__shared_weak_count *)v11;
  sub_10001AEF8(v10, (uint64_t)&v16);
  v12 = v17;
  if (!v17)
    goto LABEL_20;
  p_shared_owners = (unint64_t *)&v17->__shared_owners_;
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
    sub_100051F2C((uint64_t)v21);
    ptr = self->_sensorLogger.__ptr_;
    if (!ptr)
      goto LABEL_23;
  }
  else
  {
LABEL_20:
    sub_100051F2C((uint64_t)v21);
    ptr = self->_sensorLogger.__ptr_;
    if (!ptr)
      goto LABEL_23;
  }
  if (self->_localizationActive)
    sub_1000C40A0((uint64_t)ptr);
LABEL_23:
  sub_100051F2C((uint64_t)v18);

}

- (void)clpOutdoorEstimatorLogEntryNotificationAvailable:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  CombinedLogger *ptr;
  NSObject *v11;
  NSObject *v13;
  void *__p;
  uint64_t v16;
  uint64_t v17;
  _BYTE v18[64];
  char *v19;
  std::__shared_weak_count *v20;
  _QWORD v21[12];
  _BYTE v22[56];

  v4 = a3;
  if (self->_serviceLocalizer.__ptr_.__value_)
  {
    if (qword_100417EF8 == -1)
    {
      v11 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
        goto LABEL_6;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407200);
      v11 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
        goto LABEL_6;
    }
    LOWORD(__p) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Receiving CLPOutdoorEstimatorLogEntry notification", (uint8_t *)&__p, 2u);
LABEL_6:
    sub_10001B8F4((uint64_t)v22);
    sub_1000C4E14((uint64_t)v21);
    if (v4)
    {
      objc_msgSend(v4, "serializedOutdoorEstimatorLogEntry");
    }
    else
    {
      __p = 0;
      v16 = 0;
      v17 = 0;
    }
    wireless_diagnostics::google::protobuf::MessageLite::ParseFromString(v21, &__p);
    if (SHIBYTE(v17) < 0)
      operator delete(__p);
    v5 = *(_QWORD *)(*(uint64_t (**)(LocalizerApi *))(*(_QWORD *)self->_serviceLocalizer.__ptr_.__value_
                                                              + 120))(self->_serviceLocalizer.__ptr_.__value_);
    sub_1000C65E8(&__p, (uint64_t)v22, (uint64_t)v21);
    v6 = operator new(0x108uLL);
    v6[1] = 0;
    v6[2] = 0;
    *v6 = off_1003F0840;
    v6[4] = __p;
    sub_1000333F0((uint64_t)(v6 + 5), (uint64_t)&v16);
    sub_100018EC4((uint64_t)(v6 + 17), (uint64_t)v18);
    *((_DWORD *)v6 + 6) = 21;
    v19 = (char *)(v6 + 3);
    v20 = (std::__shared_weak_count *)v6;
    sub_10001AEF8(v5, (uint64_t)&v19);
    v7 = v20;
    if (!v20)
      goto LABEL_19;
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
      sub_100051F2C((uint64_t)v18);
      sub_100052B6C(&v16);
      ptr = self->_sensorLogger.__ptr_;
      if (ptr)
      {
LABEL_20:
        if (self->_localizationActive)
          sub_1000C3FA0((uint64_t)ptr);
      }
    }
    else
    {
LABEL_19:
      sub_100051F2C((uint64_t)v18);
      sub_100052B6C(&v16);
      ptr = self->_sensorLogger.__ptr_;
      if (ptr)
        goto LABEL_20;
    }
    sub_100052B6C(v21);
    sub_100051F2C((uint64_t)v22);
    goto LABEL_23;
  }
  if (qword_100417EF8 == -1)
  {
    v13 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_23;
LABEL_11:
    LOWORD(__p) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Ignoring outdoor estimator update notification - not localizing yet", (uint8_t *)&__p, 2u);
    goto LABEL_23;
  }
  dispatch_once(&qword_100417EF8, &stru_100407200);
  v13 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
    goto LABEL_11;
LABEL_23:

}

- (id)getAvailabilityTileParserAndSetParams:(id)a3
{
  id v4;
  NSObject *v5;
  CLAvailabilityTileParser *v6;
  void *v7;
  void *v8;
  CLAvailabilityTileParser *v9;
  optional<proto::params::LocalizerParameters> *p_paramOverrides;
  uint64_t (**v12)();
  uint8_t buf[4];
  _QWORD v14[40];

  v4 = a3;
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407200);
  v5 = (id)qword_100417F00;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v14[0] = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "@IndoorAvl, load, getAvailabilityTileParserAndSetParams because %s", buf, 0xCu);
  }

  v6 = [CLAvailabilityTileParser alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorProvider workdir](self, "workdir"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CLIndoorProvider getAvailabilityTilePathFromWorkdir:](CLIndoorProvider, "getAvailabilityTilePathFromWorkdir:", v7));
  v9 = -[CLAvailabilityTileParser initWithTilePathIncrementalIO:](v6, "initWithTilePathIncrementalIO:", v8);

  if (v9)
  {
    sub_1000A73BC((uint64_t)-[CLAvailabilityTileParser getAvlTile](v9, "getAvlTile"), buf);
    p_paramOverrides = &self->_paramOverrides;
    if (self->_paramOverrides.m_initialized)
    {
      if (buf[0])
      {
        sub_10009E880((uint64_t)&self->_paramOverrides.m_storage.dummy_.aligner_ + 7, (uint64_t)v14 + 4);
        if (!buf[0])
          goto LABEL_15;
      }
      else
      {
        sub_1000A87F4((a8 *)((char *)&self->_paramOverrides.m_storage.dummy_.aligner_ + 7));
        p_paramOverrides->m_initialized = 0;
        if (!buf[0])
          goto LABEL_15;
      }
    }
    else if (!buf[0]
           || (sub_1000A7424((uint64_t)&self->_paramOverrides.m_storage.dummy_.aligner_ + 7, (uint64_t)v14 + 4),
               p_paramOverrides->m_initialized = 1,
               !buf[0]))
    {
LABEL_15:
      v12 = off_100407330;
      sub_10009EE58((uint64_t)buf, (uint64_t)&v12, &self->_paramOverrides.m_initialized);
    }
    sub_1000A87F4((_QWORD *)((char *)v14 + 4));
    goto LABEL_15;
  }

  return 0;
}

- (void)onConnectionQueueShutdown
{
  NSObject *v3;
  id v4;
  id WeakRetained;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;

  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407200);
  v3 = (id)qword_100417F00;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[CLIndoorServiceDelegate versionString](CLIndoorServiceDelegate, "versionString")));
    v10 = 136315138;
    v11 = objc_msgSend(v4, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Request to shutdown %s", (uint8_t *)&v10, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_queue"));
  v7 = v6;
  if (!v6)
  {
    if (qword_100417EF8 == -1)
    {
      v9 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_13;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407200);
      v9 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_13;
    }
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Already shut down?", (uint8_t *)&v10, 2u);
    goto LABEL_13;
  }
  dispatch_assert_queue_V2(v6);
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407200);
    v8 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    goto LABEL_8;
  }
  v8 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_8:
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Processing shutdown request", (uint8_t *)&v10, 2u);
  }
LABEL_9:
  -[CLIndoorProvider onQueueInvalidate:](self, "onQueueInvalidate:", 0);
LABEL_13:

}

- (void)requestLocationTilesForGroup:(id)a3 usingAvailabilityTile:(const void *)a4 forAction:(unsigned __int8)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  CLIndoorForegroundFetchRequest *v17;
  void *__p[2];
  uint64_t v19;
  unsigned __int8 v20;
  void *v21;
  void *v22[2];
  char v23;
  std::string buf;
  __int128 v25;
  uint64_t v26;
  std::string v27;
  std::string v28;

  v8 = a3;
  v20 = a5;
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407200);
  v9 = (id)qword_100417F00;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "))));
    LODWORD(buf.__r_.__value_.__l.__data_) = 136380675;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)objc_msgSend(v11, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "async fetch location tiles for group %{private}s", (uint8_t *)&buf, 0xCu);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorProvider locationRequests:usingAvailabilityTile:forAction:](self, "locationRequests:usingAvailabilityTile:forAction:", v8, a4, v20));
  if (!objc_msgSend(v12, "count"))
  {
    if (qword_100417EF8 == -1)
    {
      v13 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      goto LABEL_8;
    }
    dispatch_once(&qword_100417EF8, &stru_100407200);
    v13 = qword_100417F00;
    if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "No floors found in availability tile?!", (uint8_t *)&buf, 2u);
    }
  }
LABEL_9:
  v14 = objc_msgSend(v12, "count");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "ps_STLStringOnNil:", CFSTR("<nil location groups>"));
    if (!v14)
    {
LABEL_16:
      sub_1000D5048(v22, "");
      sub_10024E3EC("No floors found in availability tile? Group Ids: ", &buf);
      if (SHIBYTE(v19) < 0)
      {
        sub_10006CED8(&v25, __p[0], (unint64_t)__p[1]);
      }
      else
      {
        v25 = *(_OWORD *)__p;
        v26 = v19;
      }
      sub_1000FF2A8(" ,action: ", &v27);
      sub_10033021C((char *)&v20, &v28);
      sub_100174738((uint64_t)v22, (uint64_t)&buf, 4);
      if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v28.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v27.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_23:
          if ((SHIBYTE(v26) & 0x80000000) == 0)
            goto LABEL_24;
          goto LABEL_29;
        }
      }
      else if ((SHIBYTE(v27.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        goto LABEL_23;
      }
      operator delete(v27.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v26) & 0x80000000) == 0)
      {
LABEL_24:
        if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_25;
        goto LABEL_30;
      }
LABEL_29:
      operator delete((void *)v25);
      if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_25:
        if ((v23 & 0x80000000) == 0)
          goto LABEL_26;
LABEL_31:
        operator delete(v22[0]);
LABEL_26:
        sub_1000F2AE4((uint64_t)&v21);
      }
LABEL_30:
      operator delete(buf.__r_.__value_.__l.__data_);
      if ((v23 & 0x80000000) == 0)
        goto LABEL_26;
      goto LABEL_31;
    }
  }
  else
  {
    *(_OWORD *)__p = 0uLL;
    v19 = 0;
    if (!v14)
      goto LABEL_16;
  }
  if (SHIBYTE(v19) < 0)
    operator delete(__p[0]);

  v17 = -[CLIndoorForegroundFetchRequest initWithFloorRequests:forAction:]([CLIndoorForegroundFetchRequest alloc], "initWithFloorRequests:forAction:", v12, v20);
  -[CLIndoorProvider setCurrentForegroundFetchRequest:](self, "setCurrentForegroundFetchRequest:", v17);

  -[CLIndoorProvider requestForegroundTileDownload](self, "requestForegroundTileDownload");
}

- (void)onQueueNotify:(const void *)a3 onFloor:(const void *)a4
{
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t rep;
  NSObject *v13;
  double v14;
  int64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  CombinedLogger *ptr;
  void *v20;
  int v21;
  NSObject *v22;
  double v23;
  char v24[156];
  double v25;
  char v26[23];
  void *v27[2];
  char v28;
  uint8_t buf[4];
  double v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  uint64_t v34;
  double v35;
  std::string v36;
  std::string v37;

  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  if (WeakRetained && self->_localizationActive)
  {
    v8 = sub_100024E14(*((_DWORD *)a3 + 131));
    sub_10002459C(&self->_pipelinedFixCrossCheckMetrics.fSamplingFactor, (uint64_t)a3, v8, self->_lastGpsPositionAvailable, self->_lastGpsReceivedTime.__rep_, a4);
    v9 = sub_100024E14(*((_DWORD *)a3 + 131));
    sub_10002459C(&self->_pipelinedFixCrossCheckMetrics.fSamplingFactor, (uint64_t)a3, v9, self->_lastNonGpsPositionAvailable, self->_lastNonGpsReceivedTime.__rep_, a4);
    v10 = sub_10005F0F0();
    if (*((_DWORD *)a3 + 131) == 4)
    {
      if (!self->_lastGpsPositionAvailable)
      {
        if (qword_100417EF8 == -1)
        {
          v16 = qword_100417F00;
          if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
            goto LABEL_14;
        }
        else
        {
          dispatch_once(&qword_100417EF8, &stru_100407200);
          v16 = qword_100417F00;
          if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
            goto LABEL_14;
        }
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Yielding Wifi2 but no GPS available yet, therefore not copying GPS fields...", buf, 2u);
        goto LABEL_14;
      }
      v11 = v10;
      rep = self->_lastGpsReceivedTime.__rep_;
      if ((double)(uint64_t)(v10 - rep) / 1000000000.0 < sub_10026A7A0((uint64_t)&self->_params.m_storage.dummy_.aligner_ + 7))
      {
        v17 = objc_claimAutoreleasedReturnValue(+[CLIndoorLocation fromPoseEstimate:andGpsEstimate:](CLIndoorLocation, "fromPoseEstimate:andGpsEstimate:", a3, self->_lastGpsPositionAvailable));
LABEL_15:
        v18 = (void *)v17;
        if (!v17)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.pipelined"), -1, &__NSDictionary0__struct));
          -[CLIndoorProvider notify:failedWithReason:](self, "notify:failedWithReason:", WeakRetained, v20);
LABEL_33:

          goto LABEL_34;
        }
        ptr = self->_sensorLogger.__ptr_;
        if (ptr)
          sub_1000C41A0((uint64_t)ptr, (uint64_t)a3);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "remoteObjectProxy"));
        v21 = *((_DWORD *)a3 + 74);
        if ((v21 - 1) < 3)
          goto LABEL_19;
        if (v21)
        {
          if (v21 == 4)
          {
            if (qword_100417EF8 == -1)
            {
              v22 = qword_100417F00;
              if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
                goto LABEL_19;
            }
            else
            {
              dispatch_once(&qword_100417EF8, &stru_100407200);
              v22 = qword_100417F00;
              if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
              {
LABEL_19:
                if ((*((_BYTE *)a3 + 755) & 0x20) != 0)
                {
                  if (!*((_DWORD *)a3 + 75))
                    objc_msgSend(v20, "indoorGivesUpWithLocation:", 0);
                }
                else
                {
                  objc_msgSend(v20, "indoorIsUncertainWithLocation:", 0);
                }
                goto LABEL_32;
              }
            }
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Illegal yieldStatus emitted from localizer. We should never receive YIELD_DATA_MISSING. It means we forgot to set yieldStatus...", buf, 2u);
            goto LABEL_19;
          }
LABEL_32:
          objc_storeStrong((id *)&self->_latestFix, v18);
          goto LABEL_33;
        }
        objc_msgSend(v18, "location");
        objc_msgSend(v18, "location", v35);
        v23 = v35;
        objc_msgSend(v18, "location");
        if (v23 > 0.0)
        {
          objc_msgSend(v20, "indoorDidUpdateToLocation:fromLocation:", v18, self->_latestFix);
          objc_msgSend(v18, "location");
          -[CLIndoorProvider updateUniverseIfAllowedAndNecessary:](self, "updateUniverseIfAllowedAndNecessary:", v24);
          sub_100323BB0((uint64_t)&self->_localizationSessionMetrics, (uint64_t)a3);
          goto LABEL_32;
        }
        sub_1000D5048(v27, "");
        sub_10032F3FC("lifespan = ", &v36);
        sub_10016EE34(&v25, &v37);
        sub_100174738((uint64_t)v27, (uint64_t)&v36, 2);
        if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v37.__r_.__value_.__l.__data_);
          if ((SHIBYTE(v36.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
LABEL_41:
            if ((v28 & 0x80000000) == 0)
              goto LABEL_42;
LABEL_45:
            operator delete(v27[0]);
LABEL_42:
            sub_1000F2AE4((uint64_t)v26);
          }
        }
        else if ((SHIBYTE(v36.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
          goto LABEL_41;
        }
        operator delete(v36.__r_.__value_.__l.__data_);
        if ((v28 & 0x80000000) == 0)
          goto LABEL_42;
        goto LABEL_45;
      }
      if (qword_100417EF8 != -1)
        dispatch_once(&qword_100417EF8, &stru_100407200);
      v13 = (id)qword_100417F00;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = sub_10026A7A0((uint64_t)&self->_params.m_storage.dummy_.aligner_ + 7);
        v15 = self->_lastGpsReceivedTime.__rep_;
        *(_DWORD *)buf = 134218496;
        v30 = v14;
        v31 = 2048;
        v32 = v15;
        v33 = 2048;
        v34 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Yielding Wifi2 but available GPS's time mismatch is more than %f seconds (GPS timestamp: %llu, Current time: %llu), therefore not copying GPS fields...", buf, 0x20u);
      }

    }
LABEL_14:
    v17 = objc_claimAutoreleasedReturnValue(+[CLIndoorLocation fromPoseEstimate:](CLIndoorLocation, "fromPoseEstimate:", a3));
    goto LABEL_15;
  }
LABEL_34:

}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  __shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  __shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  __shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  __shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  __shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  __shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  LocalizerApi *value;
  FloorEnvironmentLoader *v29;

  if (self->_selectedLocation.m_initialized)
  {
    sub_100073074((a8 *)((char *)&self->_selectedLocation.m_storage.dummy_.aligner_ + 7));
    self->_selectedLocation.m_initialized = 0;
  }
  cntrl = self->_fsDb.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  objc_storeStrong((id *)&self->_currentForegroundFetchRequest, 0);
  objc_storeStrong((id *)&self->_indoorUniverse, 0);
  objc_storeStrong((id *)&self->_latestFix, 0);
  objc_storeStrong((id *)&self->_workdir, 0);
  objc_destroyWeak((id *)&self->_prefetcher);
  objc_destroyWeak((id *)&self->_xpcConnection);
  v6 = self->_sensorMetricsObserver.__cntrl_;
  if (v6)
  {
    v7 = (unint64_t *)((char *)v6 + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v6 + 16))(v6);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
    }
  }
  objc_storeStrong((id *)&self->_avlVenuesStateMachine, 0);
  objc_storeStrong((id *)&self->_lastNonGpsPositionAvailable, 0);
  objc_storeStrong((id *)&self->_lastGpsPositionAvailable, 0);
  objc_storeStrong((id *)&self->_lastOutdoorPositionAvailable, 0);
  if (self->_params.m_initialized)
  {
    v9 = *(_QWORD *)&self->_anon_251[7];
    *(_QWORD *)&self->_anon_251[7] = 0;
    if (v9)
      (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
    self->_params.m_initialized = 0;
  }
  if (self->_paramOverrides.m_initialized)
  {
    sub_1000A87F4((a8 *)((char *)&self->_paramOverrides.m_storage.dummy_.aligner_ + 7));
    self->_paramOverrides.m_initialized = 0;
  }
  v10 = self->_sensorLogger.__cntrl_;
  if (!v10)
    goto LABEL_23;
  v11 = (unint64_t *)((char *)v10 + 8);
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 - 1, v11));
  if (v12)
  {
LABEL_23:
    if (!self->_possibleLocationObserver.m_initialized)
      goto LABEL_25;
    goto LABEL_24;
  }
  (*(void (**)(__shared_weak_count *))(*(_QWORD *)v10 + 16))(v10);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v10);
  if (self->_possibleLocationObserver.m_initialized)
  {
LABEL_24:

    self->_possibleLocationObserver.m_initialized = 0;
  }
LABEL_25:
  if (self->_localizerObserver.m_initialized)
  {

    self->_localizerObserver.m_initialized = 0;
  }
  v13 = self->_scanPriorityObserver.__cntrl_;
  if (!v13)
    goto LABEL_31;
  v14 = (unint64_t *)((char *)v13 + 8);
  do
    v15 = __ldaxr(v14);
  while (__stlxr(v15 - 1, v14));
  if (!v15)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v13 + 16))(v13);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v13);
    v16 = self->_localizationSensorCollection.__cntrl_;
    if (!v16)
      goto LABEL_39;
  }
  else
  {
LABEL_31:
    v16 = self->_localizationSensorCollection.__cntrl_;
    if (!v16)
      goto LABEL_39;
  }
  v17 = (unint64_t *)((char *)v16 + 8);
  do
    v18 = __ldaxr(v17);
  while (__stlxr(v18 - 1, v17));
  if (!v18)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v16 + 16))(v16);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v16);
  }
LABEL_39:
  v19 = self->_eventBuses.__cntrl_;
  if (!v19)
    goto LABEL_43;
  v20 = (unint64_t *)((char *)v19 + 8);
  do
    v21 = __ldaxr(v20);
  while (__stlxr(v21 - 1, v20));
  if (!v21)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v19 + 16))(v19);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v19);
    v22 = self->_platformInfo.__cntrl_;
    if (!v22)
      goto LABEL_49;
  }
  else
  {
LABEL_43:
    v22 = self->_platformInfo.__cntrl_;
    if (!v22)
      goto LABEL_49;
  }
  v23 = (unint64_t *)((char *)v22 + 8);
  do
    v24 = __ldaxr(v23);
  while (__stlxr(v24 - 1, v23));
  if (!v24)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v22 + 16))(v22);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v22);
  }
LABEL_49:
  if (!self->_simulation.m_initialized)
    goto LABEL_57;
  v25 = *(std::__shared_weak_count **)&self->_anon_59[31];
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v27 = __ldaxr(p_shared_owners);
    while (__stlxr(v27 - 1, p_shared_owners));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
      if (((char)self->_anon_59[22] & 0x80000000) == 0)
        goto LABEL_56;
      goto LABEL_55;
    }
  }
  if ((char)self->_anon_59[22] < 0)
LABEL_55:
    operator delete(*(void **)((char *)&self->_simulation.m_storage.dummy_.aligner_ + 7));
LABEL_56:
  self->_simulation.m_initialized = 0;
LABEL_57:
  value = self->_serviceLocalizer.__ptr_.__value_;
  self->_serviceLocalizer.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(LocalizerApi *))(*(_QWORD *)value + 8))(value);
  v29 = self->_floorEnvironmentLoader.__ptr_.__value_;
  self->_floorEnvironmentLoader.__ptr_.__value_ = 0;
  if (v29)
    (*(void (**)(FloorEnvironmentLoader *))(*(_QWORD *)v29 + 8))(v29);
  if (self->_deferredState.m_initialized)
  {
    if (self->_anon_11[7])
    {
      sub_10007CDC0((uint64_t)&self->_anon_11[15]);
      self->_anon_11[7] = 0;
    }

    self->_deferredState.m_initialized = 0;
  }
}

- (void)initializeIndoorUniverse:(id)a3 atLocation:(id)a4
{
  id v6;
  const char *v7;
  int data;
  const char *v9;
  int v10;
  GeographicCoordinate *v11;
  double v12;
  double v13;
  GeographicCoordinate *v14;
  void *v15;
  id v16;
  _QWORD *v17;
  id v18;
  void *v19;
  id v20;
  void *v21[20];
  _BYTE v22[23];
  char v23;
  std::string __p[13];

  v18 = a3;
  v6 = a4;
  if (self->_indoorUniverse)
  {
    sub_1000D5048(v22, "");
    sub_100316750("IndoorUniverse already set and being asked to re-initialized", __p);
    sub_100174738((uint64_t)v22, (uint64_t)__p, 1);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p[0].__r_.__value_.__l.__data_);
    if (v23 < 0)
      operator delete(*(void **)v22);
    sub_1000F2AE4((uint64_t)v21);
  }
  v20 = objc_alloc_init((Class)NSMutableArray);
  v7 = sub_1000C3804();
  sub_1000B3964((uint64_t)v7);
  data = (int)__p[0].__r_.__value_.__l.__data_;
  sub_1000B3D5C((uint64_t)__p);
  if (data == data >> 31
    || (v9 = sub_1000C3804(),
        sub_1000B3964((uint64_t)v9),
        v10 = (int)__p[0].__r_.__value_.__l.__data_,
        sub_1000B3D5C((uint64_t)__p),
        v10 == v10 >> 31))
  {
    if (v6)
    {
      v11 = [GeographicCoordinate alloc];
      objc_msgSend(v6, "gpsLocation");
      v12 = *(double *)((char *)__p[0].__r_.__value_.__r.__words + 4);
      objc_msgSend(v6, "gpsLocation");
      v13 = *(double *)&v22[12];
      objc_msgSend(v6, "gpsLocation");
      v14 = -[GeographicCoordinate initWithLatitude:longitude:andAltitude:](v11, "initWithLatitude:longitude:andAltitude:", v12, v13, *(double *)((char *)&v21[3] + 4));
    }
    else
    {
      v14 = 0;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v20, v18));
    -[CLAvailableVenuesStateMachine setDisabledVenues:](self->_avlVenuesStateMachine, "setDisabledVenues:", v15);

    -[CLAvailableVenuesStateMachine clearLastFix](self->_avlVenuesStateMachine, "clearLastFix");
    objc_claimAutoreleasedReturnValue(-[CLAvailableVenuesStateMachine getNearbyLocationGroupsForTile:withUpdatedPos:](self->_avlVenuesStateMachine, "getNearbyLocationGroupsForTile:withUpdatedPos:", v19, v14));
    v16 = objc_msgSend(v19, "getAvlTile");
    v21[0] = off_100407330;
    sub_1000A73BC((uint64_t)v16, __p);
    v17 = operator new(0x28uLL);
    v17[1] = 0;
    v17[2] = 0;
    *v17 = off_1004074E0;
    sub_10009EE58((uint64_t)(v17 + 3), (uint64_t)v21, __p);
  }
  sub_1000D5048(v22, "");
  sub_10030CE3C("Override of DYNAMIC_UNIVERSE_DISABLED_VENUES is not supported.", __p);
  sub_100174738((uint64_t)v22, (uint64_t)__p, 1);
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p[0].__r_.__value_.__l.__data_);
    if ((v23 & 0x80000000) == 0)
      goto LABEL_6;
  }
  else if ((v23 & 0x80000000) == 0)
  {
    goto LABEL_6;
  }
  operator delete(*(void **)v22);
LABEL_6:
  sub_1000F2AE4((uint64_t)v21);
}

- (void)startUpdatingLocationAtLocation:(id)a3
{
  id v5;
  CLGpsPosition **p_lastOutdoorPositionAvailable;
  void *v7;
  char v8;
  int v9;
  NSObject *v10;
  void *v11;
  CLIndoorUniverse *indoorUniverse;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  std::string::size_type *v18;
  char v19;
  __int128 v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  CLIndoorUniverse *v24;
  _QWORD *v25;
  NSObject *v26;
  _QWORD *v27;
  _QWORD *v28;
  std::string::size_type v29;
  void *v30;
  _QWORD *v31;
  std::string::size_type v32;
  void *v33;
  NSObject *v34;
  void *v35;
  std::string *v36;
  int v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v42;
  _BOOL4 v44;
  unsigned int v45;
  unsigned int v46;
  void *context;
  _QWORD v48[5];
  void *__p[2];
  char v50;
  void *v51[2];
  std::string buf[2];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[28];

  v5 = a3;
  if (self->_indoorUniverse)
  {
    sub_1000D5048(__p, "");
    sub_100330F00("startUpdatingLocationAtLocation, indoorUniverse already initialized", buf);
    sub_100174738((uint64_t)__p, (uint64_t)buf, 1);
    if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf[0].__r_.__value_.__l.__data_);
    if (v50 < 0)
      operator delete(__p[0]);
    sub_1000F2AE4((uint64_t)v51);
  }
  if (!v5)
  {
    sub_1000D5048(__p, "");
    sub_10023038C("startUpdatingLocationAtLocation needs a valid location", buf);
    sub_100174738((uint64_t)__p, (uint64_t)buf, 1);
    if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf[0].__r_.__value_.__l.__data_);
    if (v50 < 0)
      operator delete(__p[0]);
    sub_1000F2AE4((uint64_t)v51);
  }
  p_lastOutdoorPositionAvailable = &self->_lastOutdoorPositionAvailable;
  objc_storeStrong((id *)&self->_lastOutdoorPositionAvailable, a3);
  if (!self->_fsDb.__ptr_)
  {
    if (qword_100417EF8 == -1)
    {
      v42 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_50;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407200);
      v42 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      {
LABEL_50:
        sub_10007CED4((uint64_t)buf, "deferred startUpdatingLocationAtLocation - locked");
        v27 = -[CLIndoorProvider mutableDeferredState](self, "mutableDeferredState");
        v28 = v27;
        v29 = buf[0].__r_.__value_.__r.__words[0];
        if (*((_BYTE *)v27 + 8))
        {
          buf[0].__r_.__value_.__r.__words[0] = 0;
          v30 = (void *)v27[2];
          v27[2] = v29;

        }
        else
        {
          v27[2] = buf[0].__r_.__value_.__l.__data_;
          *(_OWORD *)(v28 + 3) = *(_OWORD *)&buf[0].__r_.__value_.__r.__words[1];
          v28[5] = buf[1].__r_.__value_.__l.__data_;
          v35 = (void *)buf[0].__r_.__value_.__r.__words[0];
          memset(buf, 0, 32);

          *((_BYTE *)v28 + 8) = 1;
        }
        v36 = buf;
        goto LABEL_70;
      }
    }
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "[CLIndoorProvider] startUpdatingLocationAtLocation. Deferring request to start indoor - localizer DB is locked", (uint8_t *)buf, 2u);
    goto LABEL_50;
  }
  if (qword_100417EF8 == -1)
  {
    v40 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_8;
    goto LABEL_7;
  }
  dispatch_once(&qword_100417EF8, &stru_100407200);
  v40 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_7:
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "startUpdatingLocationAtLocation", (uint8_t *)buf, 2u);
  }
LABEL_8:
  sub_10007CED4((uint64_t)__p, "startUpdatingLocationAtLocation:");
  context = objc_autoreleasePoolPush();
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorProvider initializeServiceApi](self, "initializeServiceApi"));
  if (!v7)
  {
    if (qword_100417EF8 == -1)
    {
      v34 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      {
LABEL_61:
        v37 = 0;
        goto LABEL_62;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407200);
      v34 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_61;
    }
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Ignoring startUpdatingLocationAtLocation since connection to client is not alive", (uint8_t *)buf, 2u);
    goto LABEL_61;
  }
  v8 = 0;
  v9 = 6;
  while (1)
  {
    if ((v8 & 1) == 0)
      goto LABEL_15;
    if (qword_100417EF8 != -1)
    {
      dispatch_once(&qword_100417EF8, &stru_100407200);
      v10 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
LABEL_13:
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[CLIndoorProvider] Failed to startup the indoor provider due to missing availability tile, notifying locationd of failure then retrying", (uint8_t *)buf, 2u);
      goto LABEL_14;
    }
    v10 = qword_100417F00;
    if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
LABEL_14:
    -[CLIndoorProvider notifyProxyOfDownloadError](self, "notifyProxyOfDownloadError");
    sub_1000E019C();
LABEL_15:
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorProvider getAvailabilityTileParserAndSetParams:](self, "getAvailabilityTileParserAndSetParams:", CFSTR("startUpdatingLocationAtLocation")));
    if (v11)
      break;

    v8 = 1;
    if (!--v9)
    {
      if (qword_100417EF8 == -1)
      {
        v26 = qword_100417F00;
        if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_FAULT))
          goto LABEL_44;
      }
      else
      {
        dispatch_once(&qword_100417EF8, &stru_100407200);
        v26 = qword_100417F00;
        if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_FAULT))
        {
LABEL_44:
          LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "[CLIndoorProvider] Indoor is persistently failing to find the availability tile, something is wrong", (uint8_t *)buf, 2u);
        }
      }
      -[CLIndoorProvider notifyProxyOfDownloadError](self, "notifyProxyOfDownloadError");
      goto LABEL_61;
    }
  }
  if (!self->_indoorUniverse)
    -[CLIndoorProvider initializeIndoorUniverse:atLocation:](self, "initializeIndoorUniverse:atLocation:", v11, v5);
  v51[0] = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  indoorUniverse = self->_indoorUniverse;
  v13 = sub_10005F0F0();
  if (*p_lastOutdoorPositionAvailable)
  {
    -[CLGpsPosition gpsLocation](*p_lastOutdoorPositionAvailable, "gpsLocation");
  }
  else
  {
    v57 = 0u;
    memset(v58, 0, sizeof(v58));
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    memset(buf, 0, sizeof(buf));
  }
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3321888768;
  v48[2] = sub_100014850;
  v48[3] = &unk_1004071A0;
  v48[4] = v51;
  if (!-[CLIndoorUniverse updateLocalizerUniverseIfAllowed:fromLocation:withUniverseUpdatedHandler:](indoorUniverse, "updateLocalizerUniverseIfAllowed:fromLocation:withUniverseUpdatedHandler:", v13, buf, v48)|| !objc_msgSend(v51[0], "count"))
  {
    if (qword_100417EF8 == -1)
    {
      v22 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_31;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407200);
      v22 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      {
LABEL_31:
        if (qword_100417EF8 == -1)
        {
          v23 = qword_100417F00;
          if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
            goto LABEL_34;
        }
        else
        {
          dispatch_once(&qword_100417EF8, &stru_100407200);
          v23 = qword_100417F00;
          if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
          {
LABEL_34:
            v24 = self->_indoorUniverse;
            self->_indoorUniverse = 0;

            sub_10007CED4((uint64_t)buf, "deferred startUpdatingLocationAtLocation - universe");
            v25 = -[CLIndoorProvider mutableDeferredState](self, "mutableDeferredState");
            v31 = v25;
            v32 = buf[0].__r_.__value_.__r.__words[0];
            if (*((_BYTE *)v25 + 8))
            {
              buf[0].__r_.__value_.__r.__words[0] = 0;
              v33 = (void *)v25[2];
              v25[2] = v32;

            }
            else
            {
              v25[2] = buf[0].__r_.__value_.__l.__data_;
              *(_OWORD *)(v31 + 3) = *(_OWORD *)&buf[0].__r_.__value_.__r.__words[1];
              v31[5] = buf[1].__r_.__value_.__l.__data_;
              v38 = (void *)buf[0].__r_.__value_.__r.__words[0];
              memset(buf, 0, 32);

              *((_BYTE *)v31 + 8) = 1;
            }
            sub_10007CDC0((uint64_t)buf);

            goto LABEL_61;
          }
        }
        LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "_lastOutdoorPositionAvailable was available to compute Universe, but the universe did not update", (uint8_t *)buf, 2u);
        goto LABEL_34;
      }
    }
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[CLIndoorProvider] Ignoring startUpdatingLocationAtLocation since universe didn't update or no groups in universe", (uint8_t *)buf, 2u);
    goto LABEL_31;
  }
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407200);
  v14 = (id)qword_100417F00;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v46 = -[CLIndoorProvider localizationActive](self, "localizationActive");
    v45 = -[CLIndoorProvider localizationStarted](self, "localizationStarted");
    v44 = self->_serviceLocalizer.__ptr_.__value_ != 0;
    v15 = objc_msgSend(v51[0], "count");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51[0], "allObjects"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", ")));
    LODWORD(buf[0].__r_.__value_.__l.__data_) = 67110403;
    HIDWORD(buf[0].__r_.__value_.__r.__words[0]) = v46;
    LOWORD(buf[0].__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 2) = v45;
    HIWORD(buf[0].__r_.__value_.__r.__words[1]) = 1024;
    LODWORD(buf[0].__r_.__value_.__r.__words[2]) = v44;
    WORD2(buf[0].__r_.__value_.__r.__words[2]) = 1024;
    *(_DWORD *)((char *)&buf[0].__r_.__value_.__r.__words[2] + 6) = 1;
    *(_WORD *)&buf[1].__r_.__value_.__s.__data_[2] = 2050;
    *(std::string::size_type *)((char *)buf[1].__r_.__value_.__r.__words + 4) = (std::string::size_type)v15;
    WORD2(buf[1].__r_.__value_.__r.__words[1]) = 2113;
    *(std::string::size_type *)((char *)&buf[1].__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[CLIndoorProvider] Start state %d,%d,%d, didUpdate, %d, Universe size: %{public}lu with locationGroupIds: %{private}@", (uint8_t *)buf, 0x2Eu);

  }
  v18 = -[CLIndoorUniverse getAvailabilityData](self->_indoorUniverse, "getAvailabilityData");
  buf[0].__r_.__value_.__r.__words[0] = *v18;
  buf[0].__r_.__value_.__l.__size_ = (std::string::size_type)(id)v18[1];
  v19 = *((_BYTE *)v18 + 48);
  v20 = *((_OWORD *)v18 + 2);
  *(_OWORD *)&buf[0].__r_.__value_.__r.__words[2] = *((_OWORD *)v18 + 1);
  *(_OWORD *)&buf[1].__r_.__value_.__r.__words[1] = v20;
  LOBYTE(v53) = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v51[0]));
  -[CLIndoorProvider requestLocationTilesForGroup:usingAvailabilityTile:forAction:](self, "requestLocationTilesForGroup:usingAvailabilityTile:forAction:", v21, buf, 0);

  v37 = 1;
LABEL_62:

  objc_autoreleasePoolPop(context);
  if (v37)
  {
    -[CLIndoorProvider setLocalizationActive:](self, "setLocalizationActive:", 1);
    if (!self->_serviceLocalizer.__ptr_.__value_)
    {
      if (qword_100417EF8 == -1)
      {
        v39 = qword_100417F00;
        if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
          goto LABEL_69;
      }
      else
      {
        dispatch_once(&qword_100417EF8, &stru_100407200);
        v39 = qword_100417F00;
        if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
          goto LABEL_69;
      }
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "didn't select a location to localize against yet", (uint8_t *)buf, 2u);
      goto LABEL_69;
    }
    if (!-[CLIndoorProvider localizationStarted](self, "localizationStarted"))
      -[CLIndoorProvider startLocalizer](self, "startLocalizer");
  }
LABEL_69:
  v36 = (std::string *)__p;
LABEL_70:
  sub_10007CDC0((uint64_t)v36);

}

- (void)onQueueLocalizeOnSelection:(const void *)a3 withParameterOverrides:(optional<proto::params::LocalizerParameters>)a4
{
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  char v15[8];
  _QWORD v16[2];
  _QWORD v17[7];
  char v18;
  uint64_t v19;
  _QWORD v20[10];
  uint8_t buf[8];
  _QWORD v22[10];

  -[CLIndoorProvider selectedLocation](self, "selectedLocation");
  if (!buf[0])
    goto LABEL_10;
  -[CLIndoorProvider selectedLocation](self, "selectedLocation");
  v6 = sub_100229B14((uint64_t)a3, (uint64_t)v20);
  if ((_BYTE)v19)
    sub_100073074(v20);
  if (buf[0])
  {
    sub_100073074(v22);
    if (v6)
      goto LABEL_6;
LABEL_10:
    if (qword_100417EF8 == -1)
    {
      v8 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_13;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407200);
      v8 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      {
LABEL_13:
        v15[0] = 0;
        v9 = *((_QWORD *)a3 + 1);
        v16[0] = *(_QWORD *)a3;
        v16[1] = v9;
        if (v9)
        {
          v10 = (unint64_t *)(v9 + 8);
          do
            v11 = __ldxr(v10);
          while (__stxr(v11 + 1, v10));
        }
        sub_1000B347C((uint64_t)v17, (uint64_t)a3 + 16);
        v12 = *((_QWORD *)a3 + 8);
        v17[5] = *((_QWORD *)a3 + 7);
        v17[6] = v12;
        if (v12)
        {
          v13 = (unint64_t *)(v12 + 8);
          do
            v14 = __ldxr(v13);
          while (__stxr(v14 + 1, v13));
        }
        v18 = *((_BYTE *)a3 + 72);
        v15[0] = 1;
        -[CLIndoorProvider setSelectedLocation:](self, "setSelectedLocation:", v15);
        if (v15[0])
        {
          sub_100073074(v16);
          v15[0] = 0;
        }
        -[CLIndoorProvider setLocalizationStarted:](self, "setLocalizationStarted:", 0);
        sub_1000CB948();
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Setting up localizer", buf, 2u);
    goto LABEL_13;
  }
  if (!v6)
    goto LABEL_10;
LABEL_6:
  if (qword_100417EF8 == -1)
  {
    v7 = qword_100417F00;
    if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
    {
LABEL_8:
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Ignoring request to change to same set of selected venues", buf, 2u);
    }
  }
  else
  {
    dispatch_once(&qword_100417EF8, &stru_100407200);
    v7 = qword_100417F00;
    if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
      goto LABEL_8;
  }
}

- (void)requestForegroundTileDownload
{
  id WeakRetained;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *__p[2];
  char v13;
  std::string buf;

  WeakRetained = objc_loadWeakRetained((id *)&self->_prefetcher);
  if (!WeakRetained)
  {
    sub_1000D5048(__p, "");
    sub_10023DB80("No prefetcher initialized", &buf);
    sub_100174738((uint64_t)__p, (uint64_t)&buf, 1);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    if (v13 < 0)
      operator delete(__p[0]);
    sub_1000F2AE4((uint64_t)&v11);
  }
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407200);
  v4 = (id)qword_100417F00;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorProvider currentForegroundFetchRequest](self, "currentForegroundFetchRequest"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "floorRequests"));
    LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)objc_msgSend(v6, "count");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Starting foreground downloads for %lu floors", (uint8_t *)&buf, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorProvider currentForegroundFetchRequest](self, "currentForegroundFetchRequest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "floorRequests"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorProvider currentForegroundFetchRequest](self, "currentForegroundFetchRequest"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));
  objc_msgSend(WeakRetained, "requestForegroundFetchForFloors:withRequestUUID:", v8, v10);

}

- (void)foregroundTileDownloadComplete
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t prime;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  ITileDb *ptr;
  id v14;
  std::__shared_weak_count *size;
  unint64_t *v16;
  unint64_t v17;
  CLIndoorForegroundFetchRequest *v18;
  unint64_t v19;
  uint8x8_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  id v26;
  NSObject *v27;
  char *v28;
  std::__shared_weak_count *v29;
  unint64_t *p_shared_owners;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  ITileDb *v35;
  _QWORD *v36;
  void *v37;
  _QWORD *v38;
  void *v39;
  id WeakRetained;
  _QWORD *v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  _QWORD *v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  unsigned int v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  void *__p[2];
  _QWORD *v56;
  uint64_t v57;
  std::__shared_weak_count *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  void *v63[2];
  __int128 v64;
  float v65;
  void *v66;
  std::__shared_weak_count *v67;
  _BYTE v68[128];
  std::string buf[80];
  _BYTE v70[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorProvider currentForegroundFetchRequest](self, "currentForegroundFetchRequest"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "floorRequests"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorProvider currentForegroundFetchRequest](self, "currentForegroundFetchRequest"));
  v49 = objc_msgSend(v4, "action");

  v5 = objc_autoreleasePoolPush();
  -[CLIndoorProvider setCurrentForegroundFetchRequest:](self, "setCurrentForegroundFetchRequest:", 0);
  objc_autoreleasePoolPop(v5);
  if (!-[CLIndoorProvider onQueueProcessCompletedFetch:](self, "onQueueProcessCompletedFetch:", v50))
  {
    if (qword_100417EF8 == -1)
    {
      v7 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      {
LABEL_7:
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v8 = v50;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(_QWORD *)v52 != v10)
                objc_enumerationMutation(v8);
              v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
              ptr = self->_fsDb.__ptr_;
              v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "floorUuid")));
              sub_10004BE28(buf, (const char *)objc_msgSend(v14, "UTF8String"));
              objc_msgSend(v12, "setHasCompleteFloor:", (*(uint64_t (**)(ITileDb *, std::string *))(*(_QWORD *)ptr + 64))(ptr, buf));
              size = (std::__shared_weak_count *)buf[0].__r_.__value_.__l.__size_;
              if (buf[0].__r_.__value_.__l.__size_)
              {
                v16 = (unint64_t *)(buf[0].__r_.__value_.__l.__size_ + 8);
                do
                  v17 = __ldaxr(v16);
                while (__stlxr(v17 - 1, v16));
                if (!v17)
                {
                  ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
                  std::__shared_weak_count::__release_weak(size);
                }
              }

            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
          }
          while (v9);
        }

        v18 = -[CLIndoorForegroundFetchRequest initWithFloorRequests:forAction:]([CLIndoorForegroundFetchRequest alloc], "initWithFloorRequests:forAction:", v8, v49);
        -[CLIndoorProvider setCurrentForegroundFetchRequest:](self, "setCurrentForegroundFetchRequest:", v18);

        -[CLIndoorProvider requestForegroundTileDownload](self, "requestForegroundTileDownload");
        goto LABEL_63;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407200);
      v7 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_7;
    }
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "WARNING: Import failed. Signalling download is available and retrying fetch", (uint8_t *)buf, 2u);
    goto LABEL_7;
  }
  *(_OWORD *)v63 = 0u;
  v64 = 0u;
  v65 = 1.0;
  prime = vcvtps_u32_f32((float)(unint64_t)objc_msgSend(v50, "count") / 1.0);
  if (prime == 1)
  {
    prime = 2;
  }
  else if ((prime & (prime - 1)) != 0)
  {
    prime = std::__next_prime(prime);
  }
  if ((void *)prime > v63[1])
    goto LABEL_23;
  if ((void *)prime < v63[1])
  {
    v19 = vcvtps_u32_f32((float)*((unint64_t *)&v64 + 1) / v65);
    if (v63[1] < (void *)3
      || (v20 = (uint8x8_t)vcnt_s8((int8x8_t)v63[1]), v20.i16[0] = vaddlv_u8(v20), v20.u32[0] > 1uLL))
    {
      v19 = std::__next_prime(v19);
    }
    else
    {
      v21 = 1 << -(char)__clz(v19 - 1);
      if (v19 >= 2)
        v19 = v21;
    }
    if (prime <= v19)
      prime = v19;
    if ((void *)prime < v63[1])
LABEL_23:
      sub_100005DD8((uint64_t)v63, prime);
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v22 = v50;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(_QWORD *)v60 != v24)
          objc_enumerationMutation(v22);
        v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1)
                                                                                              + 8 * (_QWORD)j), "floorUuid")));
        sub_10004BE28(&v66, (const char *)objc_msgSend(v26, "UTF8String"));

        if (qword_100417EF8 != -1)
        {
          dispatch_once(&qword_100417EF8, &stru_100407200);
          v27 = (id)qword_100417F00;
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            goto LABEL_43;
LABEL_42:
          v28 = sub_10004BE10((char **)&v66);
          LODWORD(buf[0].__r_.__value_.__l.__data_) = 136380675;
          *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Fetching location configuration for floor UUID %{private}s", (uint8_t *)buf, 0xCu);
          goto LABEL_43;
        }
        v27 = (id)qword_100417F00;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          goto LABEL_42;
LABEL_43:

        (*(void (**)(uint64_t *__return_ptr, ITileDb *, void **))(*(_QWORD *)self->_fsDb.__ptr_ + 120))(&v57, self->_fsDb.__ptr_, &v66);
        sub_10007024C(&v57, (uint64_t)buf);
        sub_10004BA5C((uint64_t)v63, (uint64_t ***)&v66, &v66, (uint64_t)buf);
        sub_100073738(buf);
        v29 = v58;
        if (!v58)
          goto LABEL_47;
        p_shared_owners = (unint64_t *)&v58->__shared_owners_;
        do
          v31 = __ldaxr(p_shared_owners);
        while (__stlxr(v31 - 1, p_shared_owners));
        if (!v31)
        {
          ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
          std::__shared_weak_count::__release_weak(v29);
          v32 = v67;
          if (!v67)
            continue;
        }
        else
        {
LABEL_47:
          v32 = v67;
          if (!v67)
            continue;
        }
        v33 = (unint64_t *)&v32->__shared_owners_;
        do
          v34 = __ldaxr(v33);
        while (__stlxr(v34 - 1, v33));
        if (!v34)
        {
          ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
          std::__shared_weak_count::__release_weak(v32);
        }
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    }
    while (v23);
  }

  v35 = self->_fsDb.__ptr_;
  sub_1000B347C((uint64_t)__p, (uint64_t)v63);
  sub_1000C89E0(buf, v35, __p);
  -[CLIndoorProvider onQueueSelectedLocationDownloadCompleted:forAction:](self, "onQueueSelectedLocationDownloadCompleted:forAction:", buf, v49);
  sub_100073074(buf);
  v36 = v56;
  while (v36)
  {
    v41 = v36;
    v36 = (_QWORD *)*v36;
    sub_100073738(v41 + 4);
    v42 = (std::__shared_weak_count *)v41[3];
    if (v42)
    {
      v43 = (unint64_t *)&v42->__shared_owners_;
      do
        v44 = __ldaxr(v43);
      while (__stlxr(v44 - 1, v43));
      if (!v44)
      {
        ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
        std::__shared_weak_count::__release_weak(v42);
      }
    }
    operator delete(v41);
  }
  v37 = __p[0];
  __p[0] = 0;
  if (v37)
    operator delete(v37);
  v38 = (_QWORD *)v64;
  while (v38)
  {
    v45 = v38;
    v38 = (_QWORD *)*v38;
    sub_100073738(v45 + 4);
    v46 = (std::__shared_weak_count *)v45[3];
    if (v46)
    {
      v47 = (unint64_t *)&v46->__shared_owners_;
      do
        v48 = __ldaxr(v47);
      while (__stlxr(v48 - 1, v47));
      if (!v48)
      {
        ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
        std::__shared_weak_count::__release_weak(v46);
      }
    }
    operator delete(v45);
  }
  v39 = v63[0];
  v63[0] = 0;
  if (v39)
    operator delete(v39);
LABEL_63:
  WeakRetained = objc_loadWeakRetained((id *)&self->_prefetcher);
  if (!WeakRetained)
  {
    sub_1000D5048(v63, "");
    sub_10023DB80("No prefetcher initialized", buf);
    sub_100174738((uint64_t)v63, (uint64_t)buf, 1);
    if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf[0].__r_.__value_.__l.__data_);
    if (SBYTE7(v64) < 0)
      operator delete(v63[0]);
    sub_1000F2AE4((uint64_t)&v66);
  }
  objc_msgSend(WeakRetained, "allDownloadItemsCompleted");

}

- (CLIndoorForegroundFetchRequest)currentForegroundFetchRequest
{
  return self->_currentForegroundFetchRequest;
}

- (id)locationRequests:(id)a3 usingAvailabilityTile:(const void *)a4 forAction:(unsigned __int8)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *j;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  int v16;
  unsigned __int8 *p_p;
  void **p_s1;
  NSObject *v19;
  char v20;
  uint64_t *v21;
  NSObject *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t k;
  uint64_t *v28;
  void *v29;
  _BYTE *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  size_t v34;
  uint64_t v35;
  void **v36;
  uint64_t v37;
  uint64_t v38;
  ITileDb *ptr;
  uint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  id v44;
  CLPrefetchFloorRequest *v45;
  void *v46;
  CLPrefetchFloorRequest *v47;
  unsigned int v48;
  NSObject *v49;
  void **v50;
  void *v51;
  NSObject *v52;
  id v53;
  id v54;
  NSObject *v55;
  os_log_type_t v56;
  const char *v57;
  uint32_t v58;
  id v59;
  uint64_t *v60;
  uint64_t *v61;
  unsigned __int8 v62;
  void *v63;
  id v64;
  NSObject *v65;
  const char *v66;
  BOOL v67;
  id v68;
  NSObject *v69;
  const char *v70;
  NSObject *v71;
  id v72;
  id v73;
  id v74;
  int v76;
  id obj;
  uint64_t v78;
  id v80;
  void *i;
  id v82;
  id v83;
  uint64_t v84;
  id v85;
  id v86;
  uint64_t v88;
  uint64_t v89;
  int v90;
  void *__dst[2];
  int64_t v92;
  void *__p;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  void *__s1;
  size_t __n;
  uint64_t v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint8_t buf[4];
  _BYTE v108[18];
  __int16 v109;
  _BYTE v110[10];
  uint64_t v111;
  _BYTE v112[128];
  _BYTE v113[128];

  v76 = a5;
  v5 = a3;
  v85 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", v5));
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  obj = v5;
  v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
  if (v80)
  {
    v90 = 0;
    v78 = *(_QWORD *)v104;
    while (1)
    {
      for (i = 0; i != v80; i = (char *)i + 1)
      {
        if (*(_QWORD *)v104 != v78)
          objc_enumerationMutation(obj);
        v6 = *(id *)(*((_QWORD *)&v103 + 1) + 8 * (_QWORD)i);
        v7 = v6;
        if (v6)
        {
          objc_msgSend(v6, "ps_STLString");
        }
        else
        {
          __s1 = 0;
          __n = 0;
          v102 = 0;
        }
        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        v82 = *((id *)a4 + 1);
        v86 = v7;
        v8 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v96, v112, 16);
        if (!v8)
        {
          v88 = 0;
          v89 = 0;
          goto LABEL_94;
        }
        v88 = 0;
        v89 = 0;
        v84 = *(_QWORD *)v97;
        do
        {
          v83 = v8;
          for (j = 0; j != v83; j = (char *)j + 1)
          {
            if (*(_QWORD *)v97 != v84)
              objc_enumerationMutation(v82);
            v10 = *(id *)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)j);
            v11 = v10;
            if (v10)
            {
              objc_msgSend(v10, "getGroupId");
              v12 = HIBYTE(v95);
              v13 = v94;
            }
            else
            {
              v13 = 0;
              v12 = 0;
              __p = 0;
              v94 = 0;
              v95 = 0;
            }
            v14 = HIBYTE(v102);
            if (v102 >= 0)
              v15 = HIBYTE(v102);
            else
              v15 = __n;
            v16 = (char)v12;
            if ((v12 & 0x80u) != 0)
              v12 = v13;
            if (v15 != v12)
              goto LABEL_38;
            if (v16 >= 0)
              p_p = (unsigned __int8 *)&__p;
            else
              p_p = (unsigned __int8 *)__p;
            if (v102 < 0)
            {
              if (memcmp(__s1, p_p, __n))
                goto LABEL_38;
            }
            else if (HIBYTE(v102))
            {
              p_s1 = &__s1;
              while (*(unsigned __int8 *)p_s1 == *p_p)
              {
                p_s1 = (void **)((char *)p_s1 + 1);
                ++p_p;
                if (!--v14)
                  goto LABEL_33;
              }
LABEL_38:
              v20 = 1;
              if ((SHIBYTE(v95) & 0x80000000) == 0)
                goto LABEL_40;
LABEL_39:
              operator delete(__p);
              goto LABEL_40;
            }
LABEL_33:
            if (!-[CLIndoorProvider isRegionalEnabled](self, "isRegionalEnabled")
              && objc_msgSend(v11, "locationContext") == (id)1)
            {
              if (qword_100417EF8 == -1)
              {
                v19 = qword_100417F00;
                if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
                  goto LABEL_38;
              }
              else
              {
                dispatch_once(&qword_100417EF8, &stru_100407200);
                v19 = qword_100417F00;
                if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
                  goto LABEL_38;
              }
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "locationRequests include not allowed regional tile", buf, 2u);
              goto LABEL_38;
            }
            v21 = (uint64_t *)objc_msgSend(v11, "getLocationIds");
            if (qword_100417EF8 != -1)
              dispatch_once(&qword_100417EF8, &stru_100407200);
            v22 = (id)qword_100417F00;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              v23 = &__p;
              if (v95 < 0)
                v23 = __p;
              v24 = 0xAAAAAAAAAAAAAAABLL * ((v21[1] - *v21) >> 3);
              *(_DWORD *)buf = 136380931;
              *(_QWORD *)v108 = v23;
              *(_WORD *)&v108[8] = 2050;
              *(_QWORD *)&v108[10] = v24;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "TileLookup, groupId, %{private}s, %{public}lu", buf, 0x16u);
            }

            v26 = *v21;
            v25 = v21[1];
            if (v25 != *v21)
            {
              for (k = 0; k < 0xAAAAAAAAAAAAAAABLL * ((v25 - v26) >> 3); ++k)
              {
                v28 = (uint64_t *)(v26 + 24 * k);
                if (*((char *)v28 + 23) < 0)
                {
                  if (*(_BYTE *)*v28 == 76)
                  {
LABEL_56:
                    v29 = objc_autoreleasePoolPush();
                    v30 = v28;
                    if (*((char *)v28 + 23) < 0)
                      v30 = (_BYTE *)*v28;
                    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v30));
                    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "substringFromIndex:", 1));

                    if (*((char *)v28 + 23) < 0)
                    {
                      v35 = v28[1];
                      if (!v35)
LABEL_132:
                        sub_10018CB84();
                      v28 = (uint64_t *)*v28;
                      v34 = v35 - 1;
                      if ((unint64_t)(v35 - 1) >= 0x7FFFFFFFFFFFFFF8)
LABEL_133:
                        sub_1000CDE30();
                    }
                    else
                    {
                      v33 = *((unsigned __int8 *)v28 + 23);
                      if (!*((_BYTE *)v28 + 23))
                        goto LABEL_132;
                      v34 = v33 - 1;
                      if ((unint64_t)(v33 - 1) >= 0x7FFFFFFFFFFFFFF8)
                        goto LABEL_133;
                    }
                    if (v34 >= 0x17)
                    {
                      v37 = (v34 & 0xFFFFFFFFFFFFFFF8) + 8;
                      if ((v34 | 7) != 0x17)
                        v37 = v34 | 7;
                      v38 = v37 + 1;
                      v36 = (void **)operator new(v37 + 1);
                      __dst[1] = (void *)v34;
                      v92 = v38 | 0x8000000000000000;
                      __dst[0] = v36;
                    }
                    else
                    {
                      HIBYTE(v92) = v34;
                      v36 = __dst;
                      if (!v34)
                      {
LABEL_71:
                        *((_BYTE *)v36 + v34) = 0;
                        ptr = self->_fsDb.__ptr_;
                        sub_10008930C(buf, (uint64_t)__dst);
                        v40 = (*(uint64_t (**)(ITileDb *, uint8_t *))(*(_QWORD *)ptr + 64))(ptr, buf);
                        v41 = *(std::__shared_weak_count **)&v108[4];
                        if (*(_QWORD *)&v108[4])
                        {
                          v42 = (unint64_t *)(*(_QWORD *)&v108[4] + 8);
                          do
                            v43 = __ldaxr(v42);
                          while (__stlxr(v43 - 1, v42));
                          if (!v43)
                          {
                            ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
                            std::__shared_weak_count::__release_weak(v41);
                          }
                        }
                        v44 = objc_msgSend(v11, "allowCellularDownload:", k);
                        v45 = [CLPrefetchFloorRequest alloc];
                        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
                        v47 = -[CLPrefetchFloorRequest initWithFloor:inVenue:lastRelevant:hasCompleteFloor:allowCellularDownload:locationContext:](v45, "initWithFloor:inVenue:lastRelevant:hasCompleteFloor:allowCellularDownload:locationContext:", v32, v86, v46, v40, v44, objc_msgSend(v11, "locationContext"));

                        objc_msgSend(v85, "addObject:", v47);
                        v48 = +[CLLocationContextUtil isIndoor:](CLLocationContextUtil, "isIndoor:", -[CLPrefetchFloorRequest locationContext](v47, "locationContext"));
                        if (qword_100417EF8 != -1)
                          dispatch_once(&qword_100417EF8, &stru_100407200);
                        v90 |= v48;
                        v49 = (id)qword_100417F00;
                        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                        {
                          v50 = __dst;
                          if (v92 < 0)
                            v50 = (void **)__dst[0];
                          v51 = &__p;
                          if (v95 < 0)
                            v51 = __p;
                          *(_DWORD *)buf = 136381443;
                          *(_QWORD *)v108 = v50;
                          *(_WORD *)&v108[8] = 2081;
                          *(_QWORD *)&v108[10] = v51;
                          v109 = 1026;
                          *(_DWORD *)v110 = v90 & 1;
                          *(_WORD *)&v110[4] = 1026;
                          *(_DWORD *)&v110[6] = v40;
                          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "TileLookup, locationId, %{private}s, groupId, %{private}s,  containsIndoorRequest, %{public}d, completeFloor, %{public}d", buf, 0x22u);
                        }

                        if (SHIBYTE(v92) < 0)
                          operator delete(__dst[0]);

                        objc_autoreleasePoolPop(v29);
                        v88 += v40;
                        v89 += v40 ^ 1;
                        v26 = *v21;
                        v25 = v21[1];
                        continue;
                      }
                    }
                    memmove(v36, (char *)v28 + 1, v34);
                    goto LABEL_71;
                  }
                }
                else if (*(_BYTE *)(v26 + 24 * k) == 76)
                {
                  goto LABEL_56;
                }
              }
            }
            v20 = 0;
            if (SHIBYTE(v95) < 0)
              goto LABEL_39;
LABEL_40:

            if ((v20 & 1) == 0)
              goto LABEL_94;
          }
          v8 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v96, v112, 16);
        }
        while (v8);
LABEL_94:

        if (objc_msgSend(v85, "count"))
        {
          if (qword_100417EF8 != -1)
            dispatch_once(&qword_100417EF8, &stru_100407200);
          v52 = (id)qword_100417F00;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            v53 = objc_msgSend(v85, "count");
            v54 = objc_msgSend(objc_retainAutorelease(v86), "UTF8String");
            *(_DWORD *)buf = 134218755;
            *(_QWORD *)v108 = v53;
            *(_WORD *)&v108[8] = 2081;
            *(_QWORD *)&v108[10] = v54;
            v109 = 2048;
            *(_QWORD *)v110 = v88;
            *(_WORD *)&v110[8] = 2048;
            v111 = v89;
            v55 = v52;
            v56 = OS_LOG_TYPE_INFO;
            v57 = "Found %lu floors in availability tile for %{private}s, found %zu floors with data already, %zu floors without data";
            v58 = 42;
            goto LABEL_103;
          }
        }
        else
        {
          if (qword_100417EF8 != -1)
            dispatch_once(&qword_100417EF8, &stru_100407200);
          v52 = (id)qword_100417F00;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            v59 = objc_msgSend(objc_retainAutorelease(v86), "UTF8String");
            *(_DWORD *)buf = 136380675;
            *(_QWORD *)v108 = v59;
            v55 = v52;
            v56 = OS_LOG_TYPE_ERROR;
            v57 = "Couldn't find any floors within %{private}s in availability tile.";
            v58 = 12;
LABEL_103:
            _os_log_impl((void *)&_mh_execute_header, v55, v56, v57, buf, v58);
          }
        }

        if (SHIBYTE(v102) < 0)
          operator delete(__s1);

      }
      v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
      if (!v80)
        goto LABEL_110;
    }
  }
  v90 = 0;
LABEL_110:

  v60 = sub_1000C2FC0();
  v61 = v60;
  v62 = atomic_load((unsigned __int8 *)v60 + 20);
  if ((v62 & 1) != 0 || *((_BYTE *)v60 + 16))
  {
    if (*((_BYTE *)v60 + 17))
      goto LABEL_113;
LABEL_120:
    if (v76 != 0 || (v90 & 1) == 0)
      goto LABEL_127;
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "indexesOfObjectsPassingTest:", &stru_100407158));
    v68 = objc_msgSend(v63, "count");
    if (qword_100417EF8 == -1)
    {
      v69 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
        goto LABEL_126;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407200);
      v69 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
        goto LABEL_126;
    }
    v70 = "s";
    if (v68 == (id)1)
      v70 = "";
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)v108 = v68;
    *(_WORD *)&v108[8] = 2080;
    *(_QWORD *)&v108[10] = v70;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEBUG, "Ignoring %lu Regional tile %s", buf, 0x16u);
    goto LABEL_126;
  }
  v67 = sub_1000AC110((uint64_t)v60, (_BYTE *)v60 + 9);
  *((_BYTE *)v61 + 17) = v67;
  *((_BYTE *)v61 + 16) = 1;
  atomic_store(1u, (unsigned __int8 *)v61 + 20);
  if (!v67)
    goto LABEL_120;
LABEL_113:
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "indexesOfObjectsPassingTest:", &stru_100407138));
  v64 = objc_msgSend(v63, "count");
  if (qword_100417EF8 == -1)
  {
    v65 = qword_100417F00;
    if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
    {
LABEL_115:
      v66 = "s";
      if (v64 == (id)1)
        v66 = "";
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)v108 = v64;
      *(_WORD *)&v108[8] = 2080;
      *(_QWORD *)&v108[10] = v66;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEBUG, "Ignoring %lu Indoor tile %s", buf, 0x16u);
    }
  }
  else
  {
    dispatch_once(&qword_100417EF8, &stru_100407200);
    v65 = qword_100417F00;
    if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
      goto LABEL_115;
  }
LABEL_126:
  objc_msgSend(v85, "removeObjectsAtIndexes:", v63);

LABEL_127:
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407200);
  v71 = (id)qword_100417F00;
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    v72 = objc_msgSend(*((id *)a4 + 1), "count");
    v73 = objc_msgSend(obj, "count");
    v74 = objc_msgSend(v85, "count");
    *(_DWORD *)buf = 134349568;
    *(_QWORD *)v108 = v72;
    *(_WORD *)&v108[8] = 2050;
    *(_QWORD *)&v108[10] = v73;
    v109 = 2050;
    *(_QWORD *)v110 = v74;
    _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "@TileLookup, avlVenues, %{public}lu, groupIds, %{public}lu, requested, %{public}lu", buf, 0x20u);
  }

  return v85;
}

- (BOOL)isRegionalEnabled
{
  return self->_isRegionalEnabled;
}

- (void)onQueueInvalidate:(int)a3
{
  uint64_t v3;
  NSXPCConnection **p_xpcConnection;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  __shared_weak_count *cntrl;
  SensorCollection *ptr;
  __shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  std::string::size_type v17;
  std::string::size_type v18;
  NSObject *v19;
  __shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  NSObject *v23;
  id v24;
  id v25;
  void *v26[2];
  void *__p[2];
  char v28;
  std::string buf;
  id v30;

  v3 = *(_QWORD *)&a3;
  p_xpcConnection = &self->_xpcConnection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  if (qword_100417EF8 == -1)
  {
    v7 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417EF8, &stru_100407200);
  v7 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "invalidating for connection %p", (uint8_t *)&buf, 0xCu);
  }
LABEL_4:
  if (qword_100417EF8 == -1)
  {
    v8 = (id)qword_100417F00;
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    goto LABEL_6;
  }
  dispatch_once(&qword_100417EF8, &stru_100407200);
  v8 = (id)qword_100417F00;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
LABEL_6:
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[CLIndoorServiceDelegate versionString](CLIndoorServiceDelegate, "versionString")));
    v10 = objc_msgSend(v9, "UTF8String");
    LODWORD(buf.__r_.__value_.__l.__data_) = 134218498;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)self;
    WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
    *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)WeakRetained;
    HIWORD(buf.__r_.__value_.__r.__words[2]) = 2080;
    v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Tearing down server-side state %p for connection %p to %s", (uint8_t *)&buf, 0x20u);

  }
LABEL_7:

  -[CLIndoorProvider onQueueInterruptDownloads:](self, "onQueueInterruptDownloads:", v3);
  -[CLIndoorProvider stopLocalizer](self, "stopLocalizer");
  -[CLIndoorProvider onQueueStopUpdatingLocation:](self, "onQueueStopUpdatingLocation:", v3);
  if (self->_serviceLocalizer.__ptr_.__value_)
  {
    sub_1000D5048(__p, "");
    sub_100242D80("Service localizer should have already been torne down", &buf);
    sub_100174738((uint64_t)__p, (uint64_t)&buf, 1);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    if (v28 < 0)
      operator delete(__p[0]);
    sub_1000F2AE4((uint64_t)v26);
  }
  if (self->_sensorLogger.__ptr_)
  {
    sub_1000D5048(&buf, "");
    sub_100174738((uint64_t)&buf, 0, 0);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    sub_1000F2AE4((uint64_t)__p);
  }
  cntrl = self->_localizationSensorCollection.__cntrl_;
  if (cntrl && *((uint64_t *)cntrl + 1) >= 1)
  {
    sub_1000D5048(&buf, "");
    sub_100174738((uint64_t)&buf, 0, 0);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    sub_1000F2AE4((uint64_t)__p);
  }
  ptr = self->_localizationSensorCollection.__ptr_;
  if (!ptr)
    goto LABEL_27;
  v13 = self->_localizationSensorCollection.__cntrl_;
  if (v13)
  {
    v14 = (unint64_t *)((char *)v13 + 16);
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
    ptr = self->_localizationSensorCollection.__ptr_;
  }
  v16 = sub_10002A908((uint64_t)ptr);
  v18 = v17;
  if (v16 | v17)
  {
    if (qword_100417EF8 == -1)
    {
      v19 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      goto LABEL_19;
    }
    dispatch_once(&qword_100417EF8, &stru_100407200);
    v19 = qword_100417F00;
    if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
    {
LABEL_19:
      LODWORD(buf.__r_.__value_.__l.__data_) = 134218240;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v16;
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Still have %lu activ sensor observers, %lu inactive sensor observers", (uint8_t *)&buf, 0x16u);
    }
  }
LABEL_20:
  v20 = self->_localizationSensorCollection.__cntrl_;
  self->_localizationSensorCollection.__ptr_ = 0;
  self->_localizationSensorCollection.__cntrl_ = 0;
  if (!v20)
    goto LABEL_24;
  v21 = (unint64_t *)((char *)v20 + 8);
  do
    v22 = __ldaxr(v21);
  while (__stlxr(v22 - 1, v21));
  if (!v22)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v20 + 16))(v20);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v20);
    if (!v13)
      goto LABEL_27;
  }
  else
  {
LABEL_24:
    if (!v13)
      goto LABEL_27;
  }
  if (*((_QWORD *)v13 + 1) != -1)
  {
    sub_1000D5048(__p, "");
    sub_1002C0644("MEMORY LEAK!? sensor collection still alive", &buf);
    sub_100174738((uint64_t)__p, (uint64_t)&buf, 1);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    if (v28 < 0)
      operator delete(__p[0]);
    sub_1000F2AE4((uint64_t)v26);
  }
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v13);
LABEL_27:
  -[CLIndoorProvider setLocalizationStarted:](self, "setLocalizationStarted:", 0);
  -[CLIndoorProvider setLocalizationActive:](self, "setLocalizationActive:", 0);
  objc_storeWeak((id *)p_xpcConnection, 0);
  objc_msgSend(WeakRetained, "invalidate");
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407200);
    v23 = (id)qword_100417F00;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      goto LABEL_30;
    goto LABEL_29;
  }
  v23 = (id)qword_100417F00;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
LABEL_29:
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[CLIndoorServiceDelegate versionString](CLIndoorServiceDelegate, "versionString")));
    v25 = objc_msgSend(v24, "UTF8String");
    LODWORD(buf.__r_.__value_.__l.__data_) = 134218242;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)WeakRetained;
    WORD2(buf.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Client state torn-down (mostly) for connection %p to %s", (uint8_t *)&buf, 0x16u);

  }
LABEL_30:

}

- (void)setLocalizationStarted:(BOOL)a3
{
  self->_localizationStarted = a3;
}

- (void)stopLocalizer
{
  NSObject *v3;
  NSObject *v4;
  unsigned int v5;
  unsigned int v6;
  SensorCollection *ptr;
  CombinedLogger *v8;
  LocalizerApi *value;
  CombinedLogger *v10;
  char *v11;
  __shared_weak_count *cntrl;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  __shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  CLIndoorUniverse *indoorUniverse;
  CLGpsPosition *lastOutdoorPositionAvailable;
  _BYTE v23[8];
  _QWORD v24[10];
  uint8_t buf[8];
  __shared_weak_count *v26;

  if (qword_100417EF8 == -1)
  {
    v3 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417EF8, &stru_100407200);
  v3 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "stopLocalizer", buf, 2u);
  }
LABEL_4:
  if (!self->_serviceLocalizer.__ptr_.__value_)
    goto LABEL_28;
  if (qword_100417EF8 == -1)
  {
    v4 = (id)qword_100417F00;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      goto LABEL_8;
    goto LABEL_7;
  }
  dispatch_once(&qword_100417EF8, &stru_100407200);
  v4 = (id)qword_100417F00;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
LABEL_7:
    v5 = -[CLIndoorProvider localizationActive](self, "localizationActive");
    v6 = -[CLIndoorProvider localizationStarted](self, "localizationStarted");
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v5;
    LOWORD(v26) = 1024;
    *(_DWORD *)((char *)&v26 + 2) = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "estimation stopped. active=%d, started = %d", buf, 0xEu);
  }
LABEL_8:

  ptr = self->_localizationSensorCollection.__ptr_;
  (*(void (**)(LocalizerApi *))(*(_QWORD *)self->_serviceLocalizer.__ptr_.__value_ + 32))(self->_serviceLocalizer.__ptr_.__value_);
  v8 = self->_sensorLogger.__ptr_;
  if (v8 && sub_1000BFB68((uint64_t)v8))
  {
    (*(void (**)(SensorCollection *, uint64_t))(*(_QWORD *)ptr + 32))(ptr, 2);
    sub_100006D8C(self->_sensorLogger.__ptr_);
  }
  value = self->_serviceLocalizer.__ptr_.__value_;
  self->_serviceLocalizer.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(LocalizerApi *))(*(_QWORD *)value + 8))(value);
  v10 = self->_sensorLogger.__ptr_;
  if (v10)
  {
    v11 = (char *)v10 + 24;
    cntrl = self->_sensorLogger.__cntrl_;
    *(_QWORD *)buf = v11;
    v26 = cntrl;
    if (cntrl)
    {
      v13 = (unint64_t *)((char *)cntrl + 8);
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    sub_10003A40C((uint64_t)ptr, buf);
    v15 = (std::__shared_weak_count *)v26;
    if (v26)
    {
      v16 = (unint64_t *)((char *)v26 + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v18 = self->_sensorLogger.__cntrl_;
    self->_sensorLogger.__ptr_ = 0;
    self->_sensorLogger.__cntrl_ = 0;
    if (v18)
    {
      v19 = (unint64_t *)((char *)v18 + 8);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)v18 + 16))(v18);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v18);
      }
    }
  }
  self->_localizationSessionMetrics.sessionStopTimeNanos.__rep_ = sub_10005F0F0();
  sub_10001027C((uint64_t)&self->_localizationSessionMetrics);
  *(_OWORD *)&self->_localizationSessionMetrics.avgNumOfSelectedLocations = 0u;
  *(_OWORD *)&self->_localizationSessionMetrics.numOfIncomingVIOEstimates = 0u;
  *(_OWORD *)&self->_localizationSessionMetrics.ttffNanos.__rep_ = 0u;
  *(_OWORD *)&self->_localizationSessionMetrics.avgHorizontalAccuracy = 0u;
  *(_OWORD *)&self->_localizationSessionMetrics.sessionStartTimeNanos.__rep_ = 0u;
LABEL_28:
  -[CLIndoorProvider setLocalizationStarted:](self, "setLocalizationStarted:", 0);
  indoorUniverse = self->_indoorUniverse;
  self->_indoorUniverse = 0;

  lastOutdoorPositionAvailable = self->_lastOutdoorPositionAvailable;
  self->_lastOutdoorPositionAvailable = 0;

  v23[0] = 0;
  -[CLIndoorProvider setSelectedLocation:](self, "setSelectedLocation:", v23);
  if (v23[0])
    sub_100073074(v24);
}

- (void)setSelectedLocation:(optional<SelectedLocations>)a3
{
  sub_10005A53C((uint64_t)&self->_selectedLocation, *(uint64_t *)&a3.m_initialized);
}

- (void)onQueueStopUpdatingLocation:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = *(_QWORD *)&a3;
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407200);
    v5 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "stopUpdatingLocation", buf, 2u);
  }
LABEL_4:
  if (self->_deferredState.m_initialized && self->_anon_11[7])
  {
    sub_10007CDC0((uint64_t)&self->_anon_11[15]);
    self->_anon_11[7] = 0;
  }
  if (!self->_serviceLocalizer.__ptr_.__value_ && !-[CLIndoorProvider localizationStarted](self, "localizationStarted"))
  {
    if (qword_100417EF8 == -1)
    {
      v7 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_13;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407200);
      v7 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_13;
    }
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "request to stop localizing indoor is ignored because no localization active", v8, 2u);
    goto LABEL_13;
  }
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407200);
    v6 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_12;
    goto LABEL_11;
  }
  v6 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_11:
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "request to stop localizing indoor", v9, 2u);
  }
LABEL_12:
  -[CLIndoorProvider stopLocalizer](self, "stopLocalizer");
LABEL_13:
  -[CLIndoorProvider onQueueInterruptDownloads:](self, "onQueueInterruptDownloads:", v3);
  -[CLIndoorProvider setLocalizationActive:](self, "setLocalizationActive:", 0);
}

- (void)setLocalizationActive:(BOOL)a3
{
  self->_localizationActive = a3;
}

- (void)onQueueInterruptDownloads:(int)a3
{
  void *v4;

  v4 = objc_autoreleasePoolPush();
  -[CLIndoorProvider setCurrentForegroundFetchRequest:](self, "setCurrentForegroundFetchRequest:", 0);
  objc_autoreleasePoolPop(v4);
}

- (void)setCurrentForegroundFetchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentForegroundFetchRequest, a3);
}

- (void)outdoorLocationAvailable:(id)a3
{
  id v5;
  char v6;
  double v7;
  NSObject *v8;
  std::string::size_type v9;
  std::string::size_type v10;
  int v11;
  LocalizerApi *value;
  unsigned int v13;
  int v14;
  uint64_t v15;
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep;
  float v17;
  float v18;
  float v19;
  NSObject *v20;
  _QWORD *v21;
  uint64_t *v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  CombinedLogger *ptr;
  void *v27;
  char *v28;
  std::__shared_weak_count *v29;
  _QWORD v30[3];
  char v31;
  _QWORD v32[7];
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  __int16 v39;
  _OWORD v40[8];
  _OWORD v41[2];
  uint64_t (**v42)();
  std::string::size_type v43;
  std::string::size_type v44;
  char v45;
  _OWORD v46[4];
  __int128 v47;
  __int128 v48;
  int __val[4];
  __int128 v50;
  _OWORD v51[2];
  std::string buf;
  __int128 v53;
  uint64_t v54;
  float v55;

  v5 = a3;
  objc_storeStrong((id *)&self->_lastOutdoorPositionAvailable, a3);
  v50 = 0u;
  memset(v51, 0, 28);
  v48 = 0u;
  *(_OWORD *)__val = 0u;
  v47 = 0u;
  memset(v46, 0, sizeof(v46));
  if (self->_lastOutdoorPositionAvailable)
  {
    -[CLGpsPosition gpsLocation](self->_lastOutdoorPositionAvailable, "gpsLocation");
    v6 = v45;
    v7 = *(double *)((char *)v46 + 4);
  }
  else
  {
    v7 = 0.0;
  }
  v43 = 0;
  v44 = 0;
  v42 = off_1003F9A88;
  v45 = v6 & 0xFC;
  sub_1000504A8((uint64_t)&v42, v7);
  sub_1000504A0((uint64_t)&v42, *(double *)((char *)v46 + 12));
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407200);
  v8 = (id)qword_100417F00;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = v43;
    v10 = v44;
    v11 = __val[0];
    value = self->_serviceLocalizer.__ptr_.__value_;
    v13 = -[CLIndoorProvider localizationStarted](self, "localizationStarted");
    LODWORD(buf.__r_.__value_.__l.__data_) = 134284545;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v9;
    if (v13)
      v14 = 1;
    else
      v14 = 2;
    WORD2(buf.__r_.__value_.__r.__words[1]) = 2049;
    *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v10;
    HIWORD(buf.__r_.__value_.__r.__words[2]) = 1026;
    LODWORD(v53) = v11;
    WORD2(v53) = 1026;
    *(_DWORD *)((char *)&v53 + 6) = value != 0;
    WORD5(v53) = 1026;
    HIDWORD(v53) = v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[CLIndoorProvider] We just got notified about an outdoor position at %{private}.8lf, %{private}.8lf from provider %{public}d, localizing %{public}d, %{public}d", (uint8_t *)&buf, 0x28u);
  }

  if (__val[0] != 10)
  {
    v40[6] = *(_OWORD *)__val;
    v40[7] = v50;
    v41[0] = v51[0];
    *(_OWORD *)((char *)v41 + 12) = *(_OWORD *)((char *)v51 + 12);
    v40[2] = v46[2];
    v40[3] = v46[3];
    v40[4] = v47;
    v40[5] = v48;
    v40[0] = v46[0];
    v40[1] = v46[1];
    -[CLIndoorProvider updateUniverseIfAllowedAndNecessary:](self, "updateUniverseIfAllowedAndNecessary:", v40);
    v32[0] = off_1003F9E78;
    memset(&v32[1], 0, 24);
    v32[5] = 0;
    v32[6] = 0;
    v32[4] = off_1003F9A88;
    v33 &= 0xFCu;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0;
    v39 &= 0xF800u;
    v15 = sub_10003C888();
    rep = std::chrono::system_clock::now().__d_.__rep_;
    v30[1] = 0;
    v30[2] = 0;
    v30[0] = off_1003F9A88;
    v31 &= 0xFCu;
    sub_1000504A8((uint64_t)v30, *(double *)((char *)v46 + 4));
    sub_1000504A0((uint64_t)v30, *(double *)((char *)v46 + 12));
    sub_100060878((uint64_t)v32, v15);
    sub_100060870((uint64_t)v32, rep);
    sub_100063BA8((uint64_t)v32, v15);
    sub_1000C9120((uint64_t)v32, (uint64_t)v30);
    sub_1000C910C((uint64_t)v32, *(double *)((char *)&v46[1] + 12));
    sub_1000C9128((uint64_t)v32, *(double *)((char *)&v46[2] + 12));
    sub_1000C90BC((uint64_t)v32, *(double *)((char *)&v46[1] + 4));
    std::to_string(&buf, __val[0]);
    sub_100005C3C((uint64_t)v32, &buf);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(buf.__r_.__value_.__l.__data_);
      if (v5)
        goto LABEL_14;
    }
    else if (v5)
    {
LABEL_14:
      objc_msgSend(v5, "gpsLocationPrivate");
      v17 = *(float *)&v54;
      goto LABEL_17;
    }
    bzero(&buf, 0x230uLL);
    v17 = 0.0;
LABEL_17:
    sub_1000C90F8((uint64_t)v32, v17);
    if (v5)
    {
      objc_msgSend(v5, "gpsLocationPrivate");
      v18 = *((float *)&v54 + 1);
    }
    else
    {
      bzero(&buf, 0x230uLL);
      v18 = 0.0;
    }
    sub_1000C90E4((uint64_t)v32, v18);
    if (v5)
    {
      objc_msgSend(v5, "gpsLocationPrivate");
      v19 = v55;
    }
    else
    {
      bzero(&buf, 0x230uLL);
      v19 = 0.0;
    }
    sub_1000C90D0((uint64_t)v32, v19);
    if (!self->_serviceLocalizer.__ptr_.__value_
      || !-[CLIndoorProvider localizationStarted](self, "localizationStarted"))
    {
LABEL_34:
      ptr = self->_sensorLogger.__ptr_;
      if (ptr && self->_localizationActive)
        sub_100060320((uint64_t)ptr, (uint64_t)v32);
      if (self->_deferredState.m_initialized)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorProvider xpcConnection](self, "xpcConnection"));
        if (v27)
        {
          buf.__r_.__value_.__r.__words[0] = (std::string::size_type)objc_retain(*(id *)((char *)&self->_deferredState.m_storage.dummy_.aligner_
                                                                                       + 7));
          buf.__r_.__value_.__s.__data_[8] = 0;
          if (self->_anon_11[7])
          {
            buf.__r_.__value_.__r.__words[2] = (std::string::size_type)*(id *)&self->_anon_11[15];
            if ((char)self->_anon_11[46] < 0)
            {
              sub_10006CED8(&v53, *(void **)&self->_anon_11[23], *(_QWORD *)&self->_anon_11[31]);
            }
            else
            {
              v53 = *(_OWORD *)&self->_anon_11[23];
              v54 = *(_QWORD *)&self->_anon_11[39];
            }
            buf.__r_.__value_.__s.__data_[8] = 1;
          }
          if (self->_deferredState.m_initialized)
          {
            if (self->_anon_11[7])
            {
              sub_10007CDC0((uint64_t)&self->_anon_11[15]);
              self->_anon_11[7] = 0;
            }

            self->_deferredState.m_initialized = 0;
          }
          if (buf.__r_.__value_.__r.__words[0])
            -[CLIndoorProvider playbackDatarun:](self, "playbackDatarun:");
          if (buf.__r_.__value_.__s.__data_[8])
          {
            if (!self->_lastOutdoorPositionAvailable
              || (-[CLIndoorProvider startUpdatingLocationDeferred:](self, "startUpdatingLocationDeferred:"),
                  buf.__r_.__value_.__s.__data_[8]))
            {
              sub_10007CDC0((uint64_t)&buf.__r_.__value_.__r.__words[2]);
              buf.__r_.__value_.__s.__data_[8] = 0;
            }
          }

        }
      }
      nullsub_22(v30);
      sub_100051ED0((uint64_t)v32);
      goto LABEL_57;
    }
    if (qword_100417EF8 == -1)
    {
      v20 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
        goto LABEL_28;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407200);
      v20 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
      {
LABEL_28:
        sub_1000C85E4();
        v21 = operator new(0x108uLL);
        v21[1] = 0;
        v21[2] = 0;
        *v21 = off_1003F0840;
        sub_1000C90B8(v21 + 4, &buf);
        *((_DWORD *)v21 + 6) = 9;
        v28 = (char *)(v21 + 3);
        v29 = (std::__shared_weak_count *)v21;
        v22 = (uint64_t *)(*(uint64_t (**)(LocalizerApi *))(*(_QWORD *)self->_serviceLocalizer.__ptr_.__value_
                                                                   + 120))(self->_serviceLocalizer.__ptr_.__value_);
        sub_10001AEF8(*v22, (uint64_t)&v28);
        v23 = v29;
        if (v29)
        {
          p_shared_owners = (unint64_t *)&v29->__shared_owners_;
          do
            v25 = __ldaxr(p_shared_owners);
          while (__stlxr(v25 - 1, p_shared_owners));
          if (!v25)
          {
            ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
            std::__shared_weak_count::__release_weak(v23);
          }
        }
        sub_100051ED0((uint64_t)&buf);
        goto LABEL_34;
      }
    }
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Ignoring outdoor position estimate - not localizing yet", (uint8_t *)&buf, 2u);
    goto LABEL_28;
  }
LABEL_57:
  nullsub_22(&v42);

}

- (BOOL)localizationStarted
{
  return self->_localizationStarted;
}

- (void)onQueueRecordInputEventMetrics:(const void *)a3
{
  sub_10005C980((uint64_t)&self->_localizationSessionMetrics, (int **)a3, (uint64_t)a3);
}

- (void)startLocalizer
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int *v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int *v21;
  unsigned int v22;
  unsigned int v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  std::string *p_p;
  __int128 v30;
  uint64_t v31;
  NSObject *v33;
  uint64_t v34;
  int data;
  __darwin_time_t v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  unsigned int *v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int *v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int *v46;
  unsigned int v47;
  unsigned int *v48;
  unsigned int v49;
  unsigned int *v50;
  int v51;
  dirent *v52;
  __uint64_t *p_d_seekoff;
  int v54;
  NSObject *v55;
  __uint64_t v56;
  int v57;
  __darwin_time_t v58;
  NSObject *v59;
  int v60;
  unsigned int v61;
  unsigned int v62;
  dirent *v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int *v66;
  unsigned int v67;
  unsigned int v68;
  dirent *v69;
  unsigned int v70;
  unsigned int v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  int v81;
  uint64_t v82;
  const char *v83;
  NSObject *v84;
  os_log_type_t v85;
  uint32_t v86;
  uint64_t v87;
  int v88;
  unint64_t v89;
  void *v90;
  unsigned int *v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int *v94;
  unsigned int v95;
  unsigned int v96;
  PlatformInfo *ptr;
  NSObject *v98;
  std::string *v99;
  NSObject *v100;
  LocalizerApi *value;
  uint64_t v102;
  __n128 v103;
  _QWORD *v104;
  void *v105;
  _QWORD *v106;
  std::__shared_weak_count *v107;
  unint64_t *p_shared_owners;
  unint64_t v109;
  __int128 v110;
  int v111;
  int v112;
  int v113;
  time_t v114;
  int v115;
  unint64_t v116;
  std::string v117;
  unint64_t v118;
  void *v119;
  __int128 v120;
  void *v121[2];
  char v122;
  std::string __p;
  std::string v124;
  unsigned int *v125;
  dirent *v126;
  unsigned int *v127;
  unsigned int *v128;
  dirent *v129;
  unsigned int *v130;
  double v131;
  unsigned int *v132;
  unsigned int *v133;
  _BYTE *v134;
  _BYTE *v135;
  uint64_t v136;
  unsigned int *v137;
  unsigned int *v138;
  unsigned int *v139;
  unsigned int *v140;
  int v141;
  _BYTE buf[24];
  __int16 v143;
  time_t v144;
  char v145;

  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407200);
  v3 = (id)qword_100417F00;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "startLocalizer", buf, 2u);
  }

  if (self->_simulation.m_initialized)
  {
    if (qword_100417EF8 == -1)
    {
      v4 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      {
LABEL_9:
        (*(void (**)(LocalizerApi *, _QWORD))(*(_QWORD *)self->_serviceLocalizer.__ptr_.__value_ + 24))(self->_serviceLocalizer.__ptr_.__value_, 0);
        goto LABEL_280;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407200);
      v4 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "simulating estimation via event playback", buf, 2u);
    goto LABEL_9;
  }
  if (!self->_sensorLogger.__ptr_)
    goto LABEL_276;
  sub_1000C38C4((uint64_t)buf);
  sub_100023300((uint64_t)buf, (uint64_t)&buf[16], (uint64_t)&v117);
  v124 = v117;
  memset(&v117, 0, sizeof(v117));
  if (v145 < 0)
    operator delete(*(void **)&buf[16]);
  *(_QWORD *)buf = sub_10006D950();
  *(_QWORD *)&buf[8] = v5;
  if (sub_1000AC110((uint64_t)buf, &buf[9]))
  {
    v122 = 4;
    strcpy((char *)v121, "logs");
    if (SHIBYTE(v124.__r_.__value_.__r.__words[2]) < 0)
      sub_10006CED8(&__p, v124.__r_.__value_.__l.__data_, v124.__r_.__value_.__l.__size_);
    else
      __p = v124;
    sub_1000675EC(&__p, (uint64_t)v121);
    memset(&v117, 0, sizeof(v117));
    sub_10006DB18((const char *)&__p, (uint64_t)&v117, &v141);
    if ((v117.__r_.__value_.__s.__data_[16] & 1) == 0
      || v117.__r_.__value_.__r.__words[2] == 1 && !LODWORD(v117.__r_.__value_.__l.__data_))
    {
      if (v141 == 3)
      {
        *(_QWORD *)buf = sub_1000C3874();
        *(_QWORD *)&buf[8] = v6;
        v7 = sub_1000AAF28((uint64_t)buf, (unsigned int *)&buf[12]);
        *(_QWORD *)buf = std::chrono::system_clock::now().__d_.__rep_ - 86400000000 * v7;
        v114 = std::chrono::system_clock::to_time_t((const std::chrono::system_clock::time_point *)buf);
        v138 = 0;
        sub_10006D2F4((dirent **)&v138, (uint64_t)&__p, 0, 0);
        v137 = 0;
        sub_10006D098(&v138, &v137, &v139);
        v8 = v137;
        if (v137)
        {
          do
          {
            v9 = __ldaxr(v8);
            v10 = v9 - 1;
          }
          while (__stlxr(v10, v8));
          if (!v10)
          {
            sub_10006CF64((DIR **)v8 + 6, (void **)v8 + 7, buf);
            if (*((char *)v8 + 31) < 0)
              operator delete(*((void **)v8 + 1));
            operator delete();
          }
        }
        v11 = v138;
        if (v138)
        {
          do
          {
            v12 = __ldaxr(v11);
            v13 = v12 - 1;
          }
          while (__stlxr(v13, v11));
          if (!v13)
          {
            sub_10006CF64((DIR **)v11 + 6, (void **)v11 + 7, buf);
            if (*((char *)v11 + 31) < 0)
              operator delete(*((void **)v11 + 1));
            operator delete();
          }
        }
        v134 = 0;
        v135 = 0;
        v136 = 0;
        v14 = v139;
        v133 = v139;
        if (v139)
        {
          do
            v15 = __ldaxr(v14);
          while (__stlxr(v15 + 1, v14));
        }
        v16 = v140;
        v132 = v140;
        if (v140)
        {
          do
            v17 = __ldaxr(v16);
          while (__stlxr(v17 + 1, v16));
        }
        sub_10032D114(&v133, &v132, (uint64_t)&v134);
        v18 = v132;
        if (v132)
        {
          do
          {
            v19 = __ldaxr(v18);
            v20 = v19 - 1;
          }
          while (__stlxr(v20, v18));
          if (!v20)
          {
            sub_10006CF64((DIR **)v18 + 6, (void **)v18 + 7, buf);
            if (*((char *)v18 + 31) < 0)
              operator delete(*((void **)v18 + 1));
            operator delete();
          }
        }
        v21 = v133;
        if (v133)
        {
          do
          {
            v22 = __ldaxr(v21);
            v23 = v22 - 1;
          }
          while (__stlxr(v23, v21));
          if (!v23)
          {
            sub_10006CF64((DIR **)v21 + 6, (void **)v21 + 7, buf);
            if (*((char *)v21 + 31) < 0)
              operator delete(*((void **)v21 + 1));
            operator delete();
          }
        }
        v24 = 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * ((v135 - v134) >> 3));
        if (v135 == v134)
          v25 = 0;
        else
          v25 = v24;
        sub_1000BECA4((unint64_t)v134, (unint64_t)v135, (uint64_t)buf, v25, 1);
        *(_QWORD *)buf = sub_1000C3864();
        *(_QWORD *)&buf[8] = v26;
        v113 = sub_1000AAF28((uint64_t)buf, (unsigned int *)&buf[12]);
        *(_QWORD *)buf = sub_1000C3844();
        *(_QWORD *)&buf[8] = v27;
        v111 = sub_1000AAF28((uint64_t)buf, (unsigned int *)&buf[12]);
        if (qword_100417EF8 != -1)
          dispatch_once(&qword_100417EF8, &stru_100407200);
        v28 = (id)qword_100417F00;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          p_p = &__p;
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = p_p;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v113;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v111;
          v143 = 2048;
          v144 = v114;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "tracesDirectory,%s,maxNumberOfTraces,%d,maxDirectorySizeBytes,%d,traceTimeFloor,%ld", buf, 0x22u);
        }

        v31 = (uint64_t)v134;
        v116 = (unint64_t)v135;
        if (v134 != v135)
        {
          v112 = 0;
          v115 = 0;
          *(_QWORD *)&v30 = 136315138;
          v110 = v30;
          while (1)
          {
            sub_10006D828(v31, &v117, &v131);
            if ((v117.__r_.__value_.__s.__data_[16] & 1) == 0)
              break;
            if (v117.__r_.__value_.__r.__words[2] == 1 && LODWORD(v117.__r_.__value_.__l.__data_) == 0)
              break;
            if (qword_100417EF8 == -1)
            {
              v33 = qword_100417F00;
              if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
                goto LABEL_63;
            }
            else
            {
              dispatch_once(&qword_100417EF8, &stru_100407200);
              v33 = qword_100417F00;
              if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
                goto LABEL_63;
            }
            v34 = v31;
            if (*(char *)(v31 + 23) < 0)
              v34 = *(_QWORD *)v31;
            data = (int)v117.__r_.__value_.__l.__data_;
            if (v117.__r_.__value_.__r.__words[2] == 1)
              data = LODWORD(v117.__r_.__value_.__l.__data_) + 1000 * (v117.__r_.__value_.__l.__size_ % 0x1FFFF7);
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = v34;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = data;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "bad trace path,%s,ec,%d", buf, 0x12u);
LABEL_63:
            v31 += 40;
            if (v31 == v116)
            {
              v31 = (uint64_t)v134;
              goto LABEL_240;
            }
          }
          if (LODWORD(v131) != 3)
          {
            if (qword_100417EF8 == -1)
            {
              v38 = qword_100417F00;
              if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
                goto LABEL_63;
            }
            else
            {
              dispatch_once(&qword_100417EF8, &stru_100407200);
              v38 = qword_100417F00;
              if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
                goto LABEL_63;
            }
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "trace is not a directory", buf, 2u);
            goto LABEL_63;
          }
          v36 = sub_10006C9E4(v31, &v117);
          if ((v117.__r_.__value_.__s.__data_[16] & 1) != 0
            && ((v37 = v36, v117.__r_.__value_.__r.__words[2] != 1) || LODWORD(v117.__r_.__value_.__l.__data_)))
          {
            if (qword_100417EF8 != -1)
              dispatch_once(&qword_100417EF8, &stru_100407200);
            v39 = (id)qword_100417F00;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "could not get last write time of trace directory", buf, 2u);
            }

          }
          else
          {
            v37 = 0x7FFFFFFFFFFFFFFFLL;
          }
          v128 = 0;
          sub_10006D2F4((dirent **)&v128, v31, 0, 0);
          v127 = 0;
          sub_10006D098(&v128, &v127, &v129);
          v40 = v127;
          if (v127)
          {
            do
            {
              v41 = __ldaxr(v40);
              v42 = v41 - 1;
            }
            while (__stlxr(v42, v40));
            if (!v42)
            {
              sub_10006CF64((DIR **)v40 + 6, (void **)v40 + 7, buf);
              if (*((char *)v40 + 31) < 0)
                operator delete(*((void **)v40 + 1));
              operator delete();
            }
          }
          v43 = v128;
          if (v128)
          {
            do
            {
              v44 = __ldaxr(v43);
              v45 = v44 - 1;
            }
            while (__stlxr(v45, v43));
            if (!v45)
            {
              sub_10006CF64((DIR **)v43 + 6, (void **)v43 + 7, buf);
              if (*((char *)v43 + 31) < 0)
                operator delete(*((void **)v43 + 1));
              operator delete();
            }
          }
          v46 = (unsigned int *)v129;
          v126 = v129;
          if (v129)
          {
            do
              v47 = __ldaxr(v46);
            while (__stlxr(v47 + 1, v46));
          }
          v48 = v130;
          v125 = v130;
          if (v130)
          {
            do
              v49 = __ldaxr(v48);
            while (__stlxr(v49 + 1, v48));
            v50 = v125;
          }
          else
          {
            v50 = 0;
          }
          v51 = 0;
          while (1)
          {
            v52 = v126;
            if (v126 == (dirent *)v50)
            {
              if (!v50)
                goto LABEL_155;
              do
              {
LABEL_144:
                v61 = __ldaxr(v50);
                v62 = v61 - 1;
              }
              while (__stlxr(v62, v50));
              if (!v62)
              {
                sub_10006CF64((DIR **)v50 + 6, (void **)v50 + 7, buf);
                if (*((char *)v50 + 31) < 0)
                  operator delete(*((void **)v50 + 1));
                operator delete();
              }
LABEL_149:
              v63 = v126;
              if (v126)
              {
                do
                {
                  v64 = __ldaxr((unsigned int *)v63);
                  v65 = v64 - 1;
                }
                while (__stlxr(v65, (unsigned int *)v63));
                if (!v65)
                {
                  sub_10006CF64((DIR **)&v63->d_name[27], (void **)&v63->d_name[35], buf);
                  if (v63->d_name[10] < 0)
                    operator delete((void *)v63->d_seekoff);
                  operator delete();
                }
              }
LABEL_155:
              v66 = v130;
              if (v130)
              {
                do
                {
                  v67 = __ldaxr(v66);
                  v68 = v67 - 1;
                }
                while (__stlxr(v68, v66));
                if (!v68)
                {
                  sub_10006CF64((DIR **)v66 + 6, (void **)v66 + 7, buf);
                  if (*((char *)v66 + 31) < 0)
                    operator delete(*((void **)v66 + 1));
                  operator delete();
                }
              }
              v69 = v129;
              if (v129)
              {
                do
                {
                  v70 = __ldaxr((unsigned int *)v69);
                  v71 = v70 - 1;
                }
                while (__stlxr(v71, (unsigned int *)v69));
                if (!v71)
                {
                  sub_10006CF64((DIR **)&v69->d_name[27], (void **)&v69->d_name[35], buf);
                  if (v69->d_name[10] < 0)
                    operator delete((void *)v69->d_seekoff);
                  operator delete();
                }
              }
              if (v37 < v114 || v37 == 0x7FFFFFFFFFFFFFFFLL)
              {
                sub_1000D8970(v31, &v117);
                if ((v117.__r_.__value_.__s.__data_[16] & 1) != 0
                  && (v117.__r_.__value_.__r.__words[2] != 1 || LODWORD(v117.__r_.__value_.__l.__data_)))
                {
                  if (qword_100417EF8 != -1)
                    dispatch_once(&qword_100417EF8, &stru_100407200);
                  v72 = (id)qword_100417F00;
                  if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                  {
                    v76 = v31;
                    if (*(char *)(v31 + 23) < 0)
                      v76 = *(_QWORD *)v31;
                    v77 = (int)v117.__r_.__value_.__l.__data_;
                    if (v117.__r_.__value_.__r.__words[2] == 1)
                      v77 = LODWORD(v117.__r_.__value_.__l.__data_) + 1000 * (v117.__r_.__value_.__l.__size_ % 0x1FFFF7);
                    *(_DWORD *)buf = 136315394;
                    *(_QWORD *)&buf[4] = v76;
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = v77;
                    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "error deleting trace,%s,ec,%d", buf, 0x12u);
                  }
                }
                else
                {
                  if (qword_100417EF8 != -1)
                    dispatch_once(&qword_100417EF8, &stru_100407200);
                  v72 = (id)qword_100417F00;
                  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
                  {
                    v74 = v31;
                    if (*(char *)(v31 + 23) < 0)
                      v74 = *(_QWORD *)v31;
                    *(_DWORD *)buf = 136315394;
                    *(_QWORD *)&buf[4] = v74;
                    *(_WORD *)&buf[12] = 2048;
                    *(_QWORD *)&buf[14] = v37;
                    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "deleted due to age,%s,traceTime,%ld", buf, 0x16u);
                  }
                }
              }
              else
              {
                if (v115 < v113)
                {
                  v112 += v51;
                  if (v112 > v111)
                  {
                    sub_1000D8970(v31, &v117);
                    if ((v117.__r_.__value_.__s.__data_[16] & 1) != 0
                      && (v117.__r_.__value_.__r.__words[2] != 1 || LODWORD(v117.__r_.__value_.__l.__data_)))
                    {
                      if (qword_100417EF8 != -1)
                        dispatch_once(&qword_100417EF8, &stru_100407200);
                      v72 = (id)qword_100417F00;
                      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                      {
                        v80 = v31;
                        if (*(char *)(v31 + 23) < 0)
                          v80 = *(_QWORD *)v31;
                        v81 = (int)v117.__r_.__value_.__l.__data_;
                        if (v117.__r_.__value_.__r.__words[2] == 1)
                          v81 = LODWORD(v117.__r_.__value_.__l.__data_)
                              + 1000 * (v117.__r_.__value_.__l.__size_ % 0x1FFFF7);
                        *(_DWORD *)buf = 136315394;
                        *(_QWORD *)&buf[4] = v80;
                        *(_WORD *)&buf[12] = 1024;
                        *(_DWORD *)&buf[14] = v81;
                        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "error deleting trace,%s,ec,%d", buf, 0x12u);
                      }
                    }
                    else
                    {
                      if (qword_100417EF8 != -1)
                        dispatch_once(&qword_100417EF8, &stru_100407200);
                      v72 = (id)qword_100417F00;
                      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
                      {
                        v73 = v31;
                        if (*(char *)(v31 + 23) < 0)
                          v73 = *(_QWORD *)v31;
                        *(_DWORD *)buf = v110;
                        *(_QWORD *)&buf[4] = v73;
                        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "deleted due to size,%s", buf, 0xCu);
                      }
                    }
                    goto LABEL_61;
                  }
LABEL_62:
                  ++v115;
                  goto LABEL_63;
                }
                sub_1000D8970(v31, &v117);
                if ((v117.__r_.__value_.__s.__data_[16] & 1) != 0
                  && (v117.__r_.__value_.__r.__words[2] != 1 || LODWORD(v117.__r_.__value_.__l.__data_)))
                {
                  if (qword_100417EF8 != -1)
                    dispatch_once(&qword_100417EF8, &stru_100407200);
                  v72 = (id)qword_100417F00;
                  if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                  {
                    v78 = v31;
                    if (*(char *)(v31 + 23) < 0)
                      v78 = *(_QWORD *)v31;
                    v79 = (int)v117.__r_.__value_.__l.__data_;
                    if (v117.__r_.__value_.__r.__words[2] == 1)
                      v79 = LODWORD(v117.__r_.__value_.__l.__data_) + 1000 * (v117.__r_.__value_.__l.__size_ % 0x1FFFF7);
                    *(_DWORD *)buf = 136315394;
                    *(_QWORD *)&buf[4] = v78;
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = v79;
                    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "error deleting trace,%s,ec,%d", buf, 0x12u);
                  }
                }
                else
                {
                  if (qword_100417EF8 != -1)
                    dispatch_once(&qword_100417EF8, &stru_100407200);
                  v72 = (id)qword_100417F00;
                  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
                  {
                    v75 = v31;
                    if (*(char *)(v31 + 23) < 0)
                      v75 = *(_QWORD *)v31;
                    *(_DWORD *)buf = 136315394;
                    *(_QWORD *)&buf[4] = v75;
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = v115 + 1;
                    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "deleted due to num traces,%s,num traces,%d", buf, 0x12u);
                  }
                }
              }
LABEL_61:

              goto LABEL_62;
            }
            if (!v126 || !*(_QWORD *)&v126->d_name[27])
            {
              if (!v50)
                goto LABEL_149;
              if (!*((_QWORD *)v50 + 6))
                goto LABEL_144;
            }
            p_d_seekoff = &v126->d_seekoff;
            v54 = sub_10006CE40((uint64_t)&v126->d_seekoff, &v117);
            if ((v117.__r_.__value_.__s.__data_[16] & 1) != 0
              && (v117.__r_.__value_.__r.__words[2] != 1 || LODWORD(v117.__r_.__value_.__l.__data_)))
            {
              break;
            }
            v51 += v54;
LABEL_128:
            v58 = sub_10006C9E4((uint64_t)&v52->d_seekoff, &v117);
            if ((v117.__r_.__value_.__s.__data_[16] & 1) != 0
              && (v117.__r_.__value_.__r.__words[2] != 1 || LODWORD(v117.__r_.__value_.__l.__data_)))
            {
              if (qword_100417EF8 != -1)
                dispatch_once(&qword_100417EF8, &stru_100407200);
              v59 = (id)qword_100417F00;
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                if (v52->d_name[10] < 0)
                {
                  p_d_seekoff = (__uint64_t *)*p_d_seekoff;
                  v60 = (int)v117.__r_.__value_.__l.__data_;
                  if (v117.__r_.__value_.__r.__words[2] == 1)
LABEL_136:
                    v60 += 1000 * (v117.__r_.__value_.__l.__size_ % 0x1FFFF7);
                }
                else
                {
                  v60 = (int)v117.__r_.__value_.__l.__data_;
                  if (v117.__r_.__value_.__r.__words[2] == 1)
                    goto LABEL_136;
                }
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = p_d_seekoff;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v60;
                _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "could not get last write time of trace file,%s,ec,%d", buf, 0x12u);
              }

              goto LABEL_110;
            }
            if (v58 < v37)
              v37 = v58;
LABEL_110:
            sub_10006C494(&v126, 0);
          }
          if (qword_100417EF8 != -1)
            dispatch_once(&qword_100417EF8, &stru_100407200);
          v55 = (id)qword_100417F00;
          if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
LABEL_127:

            goto LABEL_128;
          }
          v56 = (__uint64_t)&v52->d_seekoff;
          if (v52->d_name[10] < 0)
          {
            v56 = *p_d_seekoff;
            v57 = (int)v117.__r_.__value_.__l.__data_;
            if (v117.__r_.__value_.__r.__words[2] != 1)
              goto LABEL_126;
          }
          else
          {
            v57 = (int)v117.__r_.__value_.__l.__data_;
            if (v117.__r_.__value_.__r.__words[2] != 1)
            {
LABEL_126:
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v56;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v57;
              _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "could not get size of trace file,%s,ec,%d", buf, 0x12u);
              goto LABEL_127;
            }
          }
          v57 += 1000 * (v117.__r_.__value_.__l.__size_ % 0x1FFFF7);
          goto LABEL_126;
        }
LABEL_240:
        if (v31)
        {
          v89 = (unint64_t)v135;
          v90 = (void *)v31;
          if (v135 != (_BYTE *)v31)
          {
            do
            {
              if (*(char *)(v89 - 17) < 0)
                operator delete(*(void **)(v89 - 40));
              v89 -= 40;
            }
            while (v89 != v31);
            v90 = v134;
          }
          v135 = (_BYTE *)v31;
          operator delete(v90);
        }
        v91 = v140;
        if (v140)
        {
          do
          {
            v92 = __ldaxr(v91);
            v93 = v92 - 1;
          }
          while (__stlxr(v93, v91));
          if (!v93)
          {
            sub_10006CF64((DIR **)v91 + 6, (void **)v91 + 7, buf);
            if (*((char *)v91 + 31) < 0)
              operator delete(*((void **)v91 + 1));
            operator delete();
          }
        }
        v94 = v139;
        if (v139)
        {
          do
          {
            v95 = __ldaxr(v94);
            v96 = v95 - 1;
          }
          while (__stlxr(v96, v94));
          if (!v96)
          {
            sub_10006CF64((DIR **)v94 + 6, (void **)v94 + 7, buf);
            if (*((char *)v94 + 31) < 0)
              operator delete(*((void **)v94 + 1));
            operator delete();
          }
        }
        goto LABEL_260;
      }
      if (qword_100417EF8 != -1)
      {
        dispatch_once(&qword_100417EF8, &stru_100407200);
        v82 = qword_100417F00;
        if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
          goto LABEL_260;
        goto LABEL_232;
      }
      v82 = qword_100417F00;
      if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
      {
LABEL_232:
        *(_WORD *)buf = 0;
        v83 = "trace path is not a directory";
        v84 = v82;
        v85 = OS_LOG_TYPE_ERROR;
        v86 = 2;
LABEL_238:
        _os_log_impl((void *)&_mh_execute_header, v84, v85, v83, buf, v86);
      }
LABEL_260:
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v122 < 0)
        operator delete(v121[0]);
      goto LABEL_264;
    }
    if (qword_100417EF8 == -1)
    {
      v87 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
        goto LABEL_260;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407200);
      v87 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
        goto LABEL_260;
    }
    v88 = (int)v117.__r_.__value_.__l.__data_;
    if (v117.__r_.__value_.__r.__words[2] == 1)
      v88 = LODWORD(v117.__r_.__value_.__l.__data_) + 1000 * (v117.__r_.__value_.__l.__size_ % 0x1FFFF7);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v88;
    v83 = "#Warning bad trace directory path,ec,%d";
    v84 = v87;
    v85 = OS_LOG_TYPE_DEFAULT;
    v86 = 8;
    goto LABEL_238;
  }
LABEL_264:
  ptr = self->_platformInfo.__ptr_;
  -[CLIndoorProvider selectedLocation](self, "selectedLocation", v110);
  v119 = operator new(0x28uLL);
  v120 = xmmword_10038A6C0;
  strcpy((char *)v119, "purple-loc-indoor-qa@group.apple.com");
  sub_10001A704((uint64_t)ptr, (uint64_t)&buf[8], (uint64_t)&v119, (uint64_t)&v124, (uint64_t)&v117);
  if (SHIBYTE(v120) < 0)
    operator delete(v119);
  if (buf[0])
    sub_100073074(&buf[8]);
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407200);
  v98 = (id)qword_100417F00;
  if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
  {
    v99 = &v117;
    if ((v117.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v99 = (std::string *)v117.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v99;
    _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_INFO, "logging trace %s", buf, 0xCu);
  }

  sub_100012D14(self->_sensorLogger.__ptr_, &v117);
  sub_10000DD14(self->_sensorLogger.__ptr_);
  (*(void (**)(SensorCollection *, uint64_t))(*(_QWORD *)self->_localizationSensorCollection.__ptr_ + 24))(self->_localizationSensorCollection.__ptr_, 2);
  if ((SHIBYTE(v117.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v124.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_276;
LABEL_294:
    operator delete(v124.__r_.__value_.__l.__data_);
    if (qword_100417EF8 == -1)
      goto LABEL_277;
LABEL_295:
    dispatch_once(&qword_100417EF8, &stru_100407200);
    goto LABEL_277;
  }
  operator delete(v117.__r_.__value_.__l.__data_);
  if (SHIBYTE(v124.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_294;
LABEL_276:
  if (qword_100417EF8 != -1)
    goto LABEL_295;
LABEL_277:
  v100 = (id)qword_100417F00;
  if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_INFO, "starting estimation", buf, 2u);
  }

  value = self->_serviceLocalizer.__ptr_.__value_;
  v102 = sub_10005F0F0();
  (*(void (**)(LocalizerApi *, _QWORD, uint64_t))(*(_QWORD *)value + 16))(value, 0, v102);
LABEL_280:
  -[CLIndoorProvider setLocalizationStarted:](self, "setLocalizationStarted:", 1);
  *(_OWORD *)&self->_localizationSessionMetrics.avgNumOfSelectedLocations = 0u;
  *(_OWORD *)&self->_localizationSessionMetrics.numOfIncomingVIOEstimates = 0u;
  *(_OWORD *)&self->_localizationSessionMetrics.ttffNanos.__rep_ = 0u;
  *(_OWORD *)&self->_localizationSessionMetrics.avgHorizontalAccuracy = 0u;
  *(_OWORD *)&self->_localizationSessionMetrics.sessionStartTimeNanos.__rep_ = 0u;
  self->_localizationSessionMetrics.sessionStartTimeNanos.__rep_ = sub_10005F0F0();
  -[CLIndoorProvider selectedLocation](self, "selectedLocation");
  if (buf[0])
  {
    sub_100073074(&buf[8]);
    -[CLIndoorProvider selectedLocation](self, "selectedLocation");
    sub_100030C1C((uint64_t)&buf[8], (uint64_t)&v117);
    v103.n128_f64[0] = sub_1000C67F4((uint64_t)&self->_localizationSessionMetrics, v118);
    v104 = (_QWORD *)v117.__r_.__value_.__r.__words[2];
    if (v117.__r_.__value_.__r.__words[2])
    {
      do
      {
        v106 = v104;
        v104 = (_QWORD *)*v104;
        v107 = (std::__shared_weak_count *)v106[3];
        if (v107)
        {
          p_shared_owners = (unint64_t *)&v107->__shared_owners_;
          do
            v109 = __ldaxr(p_shared_owners);
          while (__stlxr(v109 - 1, p_shared_owners));
          if (!v109)
          {
            ((void (*)(std::__shared_weak_count *, __n128))v107->__on_zero_shared)(v107, v103);
            std::__shared_weak_count::__release_weak(v107);
          }
        }
        operator delete(v106);
      }
      while (v104);
    }
    v105 = (void *)v117.__r_.__value_.__r.__words[0];
    v117.__r_.__value_.__r.__words[0] = 0;
    if (v105)
      operator delete(v105);
    if (buf[0])
      sub_100073074(&buf[8]);
  }
}

- (optional<SelectedLocations>)selectedLocation
{
  _BYTE *v2;
  _BYTE *v3;
  CLIndoorProvider *v4;
  Class isa;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  optional<SelectedLocations> result;

  v3 = v2;
  *v2 = 0;
  if (self->_selectedLocation.m_initialized)
  {
    v4 = self;
    isa = self[1].super.isa;
    *((_QWORD *)v3 + 1) = *(_QWORD *)((char *)&self->_selectedLocation.m_storage.dummy_.aligner_ + 7);
    *((_QWORD *)v3 + 2) = isa;
    if (isa)
    {
      v6 = (unint64_t *)((char *)isa + 8);
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
    }
    self = (CLIndoorProvider *)sub_1000B347C((uint64_t)(v3 + 24), (uint64_t)&self[1]._deferredState);
    v8 = *(_QWORD *)&v4[1]._anon_11[39];
    *((_QWORD *)v3 + 8) = *(_QWORD *)&v4[1]._anon_11[31];
    *((_QWORD *)v3 + 9) = v8;
    if (v8)
    {
      v9 = (unint64_t *)(v8 + 8);
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }
    v3[80] = v4[1]._floorEnvironmentLoader.__ptr_.__value_;
    *v3 = 1;
  }
  result.m_storage.dummy_.data[7] = (char)a2;
  result.m_initialized = (char)self;
  *(_DWORD *)result.m_storage.dummy_.data = *(_DWORD *)((char *)&self + 1);
  *((_WORD *)&result.m_storage.dummy_.aligner_ + 2) = *(_WORD *)((char *)&self + 5);
  result.m_storage.dummy_.data[6] = HIBYTE(self);
  return result;
}

- (void)foregroundRequestCompleted:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  void *__p;
  _BYTE buf[12];
  char v16;

  v4 = a3;
  if (!v4)
  {
    sub_1000D5048(buf, "");
    sub_100174738((uint64_t)buf, 0, 0);
    if (v16 < 0)
      operator delete(*(void **)buf);
    sub_10015C2DC((uint64_t)&__p);
  }
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407200);
  v5 = (id)qword_100417F00;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestUUID"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString")));
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = objc_msgSend(v7, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "download request finished for UUID: %s", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_queue"));

  if (!v9)
  {
    if (qword_100417EF8 == -1)
    {
      v10 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
        goto LABEL_11;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407200);
      v10 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
        goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "No queue so ignoring message", buf, 2u);
    goto LABEL_11;
  }
  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B990;
  block[3] = &unk_1004070F8;
  objc_copyWeak(&v13, (id *)buf);
  v12 = v4;
  dispatch_async(v9, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
LABEL_11:

}

- (BOOL)onQueueProcessCompletedFetch:(id)a3
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  id v8;
  const char *v9;
  size_t v10;
  size_t v11;
  __int128 *p_dst;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  size_t v17;
  size_t v18;
  __n128 *p_p;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  __int128 v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  _BYTE *v33;
  __int128 v34;
  std::chrono::system_clock::time_point v35;
  NSObject *v36;
  char *v37;
  char *v38;
  void *v39;
  id v42;
  id obj;
  __n128 __p;
  unint64_t v45;
  __int128 __dst;
  unint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  void *v52;
  char *v53;
  unint64_t v54;
  uint8_t v55[4];
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  int v60;
  _BYTE buf[24];
  __int128 v62;
  uint64_t v63;
  int v64;
  _BYTE v65[128];

  v42 = a3;
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407200);
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
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Immediate fetch completed.  Importing into localizer", buf, 2u);
  }
LABEL_4:
  v52 = 0;
  v53 = 0;
  v54 = 0;
  sub_1000BE1F8((uint64_t)&v52, (unint64_t)objc_msgSend(v42, "count"));
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v42;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
  if (!v4)
    goto LABEL_57;
  v5 = *(_QWORD *)v49;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v49 != v5)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "floorUuid")));
      v9 = (const char *)objc_msgSend(v8, "UTF8String");
      v10 = strlen(v9);
      if (v10 > 0x7FFFFFFFFFFFFFF7)
        sub_1000CDE30();
      v11 = v10;
      if (v10 >= 0x17)
      {
        v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v10 | 7) != 0x17)
          v13 = v10 | 7;
        v14 = v13 + 1;
        p_dst = (__int128 *)operator new(v13 + 1);
        *((_QWORD *)&__dst + 1) = v11;
        v47 = v14 | 0x8000000000000000;
        *(_QWORD *)&__dst = p_dst;
LABEL_17:
        memmove(p_dst, v9, v11);
        goto LABEL_18;
      }
      HIBYTE(v47) = v10;
      p_dst = &__dst;
      if (v10)
        goto LABEL_17;
LABEL_18:
      *((_BYTE *)p_dst + v11) = 0;
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "venueUuid")));
      v16 = (const char *)objc_msgSend(v15, "UTF8String");
      v17 = strlen(v16);
      if (v17 > 0x7FFFFFFFFFFFFFF7)
        sub_1000CDE30();
      v18 = v17;
      if (v17 >= 0x17)
      {
        v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v17 | 7) != 0x17)
          v20 = v17 | 7;
        v21 = v20 + 1;
        p_p = (__n128 *)operator new(v20 + 1);
        __p.n128_u64[1] = v18;
        v45 = v21 | 0x8000000000000000;
        __p.n128_u64[0] = (unint64_t)p_p;
LABEL_25:
        memmove(p_p, v16, v18);
        goto LABEL_26;
      }
      HIBYTE(v45) = v17;
      p_p = &__p;
      if (v17)
        goto LABEL_25;
LABEL_26:
      p_p->n128_u8[v18] = 0;
      sub_10008FD38((uint64_t)buf, &__dst, &__p, +[CLLocationContextConversions fromCLPipelinedLocationContext:](CLLocationContextConversions, "fromCLPipelinedLocationContext:", objc_msgSend(v7, "locationContext")));
      if (SHIBYTE(v45) < 0)
        operator delete((void *)__p.n128_u64[0]);

      if (SHIBYTE(v47) < 0)
        operator delete((void *)__dst);

      v22 = v53;
      if ((unint64_t)v53 >= v54)
      {
        v53 = sub_1003305FC(&v52, (uint64_t)buf);
        if (qword_100417EF8 == -1)
          goto LABEL_34;
LABEL_55:
        dispatch_once(&qword_100417EF8, &stru_100407200);
        goto LABEL_34;
      }
      if ((buf[23] & 0x80000000) != 0)
      {
        sub_10006CED8(v53, *(void **)buf, *(unint64_t *)&buf[8]);
      }
      else
      {
        v23 = *(_OWORD *)buf;
        *((_QWORD *)v53 + 2) = *(_QWORD *)&buf[16];
        *(_OWORD *)v22 = v23;
      }
      v33 = v22 + 24;
      if (SHIBYTE(v63) < 0)
      {
        sub_10006CED8(v33, (void *)v62, *((unint64_t *)&v62 + 1));
      }
      else
      {
        v34 = v62;
        *((_QWORD *)v22 + 5) = v63;
        *(_OWORD *)v33 = v34;
      }
      *((_DWORD *)v22 + 12) = v64;
      v53 = v22 + 56;
      if (qword_100417EF8 != -1)
        goto LABEL_55;
LABEL_34:
      v24 = (id)qword_100417F00;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = sub_10004F6AC((uint64_t)buf);
        if (*(char *)(v25 + 23) >= 0)
          v26 = v25;
        else
          v26 = *(_QWORD *)v25;
        v27 = nullsub_10(buf);
        v28 = *(char *)(v27 + 23);
        v29 = *(_QWORD *)v27;
        v30 = sub_10008FD28((uint64_t)buf);
        if (v28 >= 0)
          v31 = v27;
        else
          v31 = v29;
        *(_DWORD *)v55 = 136381187;
        v56 = v26;
        if (v30 == 1)
          v32 = 82;
        else
          v32 = 73;
        v57 = 2081;
        v58 = v31;
        v59 = 1026;
        v60 = v32;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "TileVisit, fetch, %{private}s, %{private}s, %{public}c", v55, 0x1Cu);
      }

      if (SHIBYTE(v63) < 0)
      {
        operator delete((void *)v62);
        if ((buf[23] & 0x80000000) == 0)
          continue;
      }
      else if ((buf[23] & 0x80000000) == 0)
      {
        continue;
      }
      operator delete(*(void **)buf);
    }
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
  }
  while (v4);
LABEL_57:

  v35.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
  (*(void (**)(ITileDb *, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep, void **))(*(_QWORD *)self->_fsDb.__ptr_ + 184))(self->_fsDb.__ptr_, v35.__d_.__rep_ - 1000000 * (v35.__d_.__rep_ % 21600), &v52);
  if (qword_100417EF8 == -1)
  {
    v36 = qword_100417F00;
    if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_59;
  }
  else
  {
    dispatch_once(&qword_100417EF8, &stru_100407200);
    v36 = qword_100417F00;
    if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
    {
LABEL_59:
      *(_DWORD *)buf = 134283777;
      *(std::chrono::system_clock::time_point *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 2049;
      *(_QWORD *)&buf[14] = v35.__d_.__rep_ - 1000000 * (v35.__d_.__rep_ % 21600);
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Prefetch complete, fuzz, %{private}lld, %{private}lld", buf, 0x16u);
    }
  }
  v37 = (char *)v52;
  if (v52)
  {
    v38 = v53;
    v39 = v52;
    if (v53 == v52)
    {
LABEL_70:
      v53 = v37;
      operator delete(v39);
      goto LABEL_71;
    }
    while (2)
    {
      if (*(v38 - 9) < 0)
      {
        operator delete(*((void **)v38 - 4));
        if (*(v38 - 33) < 0)
          goto LABEL_68;
      }
      else if (*(v38 - 33) < 0)
      {
LABEL_68:
        operator delete(*((void **)v38 - 7));
      }
      v38 -= 56;
      if (v38 == v37)
      {
        v39 = v52;
        goto LABEL_70;
      }
      continue;
    }
  }
LABEL_71:

  return 1;
}

- (CLIndoorProvider)initWithConnection:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  NSObject *v6;
  id v7;
  id v8;
  unsigned int v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  int v19;
  NSObject *v20;
  int v21;
  const char *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
  unsigned __int8 v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  _QWORD *v39;
  void *v40;
  _QWORD *v41;
  _BYTE *v42;
  std::__shared_weak_count *v43;
  unint64_t *p_shared_owners;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  CLAvailableVenuesStateMachine *v50;
  void *v51;
  void *v52;
  __int16 v53;
  unsigned __int8 *v54;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id from;
  _QWORD v61[4];
  id v62;
  id v63;
  id location;
  id to;
  id v66;
  objc_super v67;
  _BYTE buf[24];
  void *v69;
  id v70;
  id v71;

  v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)CLIndoorProvider;
  v5 = -[CLIndoorProvider init](&v67, "init");
  if (!v5)
    goto LABEL_37;
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407200);
  v6 = (id)qword_100417F00;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceName")));
    v8 = objc_msgSend(v7, "UTF8String");
    v9 = objc_msgSend(v4, "processIdentifier");
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Initting w/ NSXPCConnection serviceName = %s pid = %d", buf, 0x12u);

  }
  objc_storeWeak((id *)v5 + 101, v4);
  if (qword_100417EF8 == -1)
  {
    v10 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    goto LABEL_8;
  }
  dispatch_once(&qword_100417EF8, &stru_100407200);
  v10 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_8:
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Creating indoor service provider instance %p", buf, 0xCu);
  }
LABEL_9:
  v11 = (void *)*((_QWORD *)v5 + 104);
  *((_QWORD *)v5 + 104) = 0;

  *(_QWORD *)buf = sub_1000C3854();
  *(_QWORD *)&buf[8] = v12;
  *((_DWORD *)v5 + 195) = sub_1000AAF28((uint64_t)buf, (unsigned int *)&buf[12]);
  *(_QWORD *)buf = sub_1000C37F0();
  *(_QWORD *)&buf[8] = v13;
  *((_DWORD *)v5 + 197) = sub_1000AAF28((uint64_t)buf, (unsigned int *)&buf[12]);
  *(_QWORD *)buf = sub_1000C3834();
  *(_QWORD *)&buf[8] = v14;
  *((_DWORD *)v5 + 196) = sub_1000AAF28((uint64_t)buf, (unsigned int *)&buf[12]);
  *(_QWORD *)buf = sub_1000C37B0();
  *(_QWORD *)&buf[8] = v15;
  *((_DWORD *)v5 + 198) = sub_1000AAF28((uint64_t)buf, (unsigned int *)&buf[12]);
  *(_QWORD *)buf = sub_1000C37C4();
  *(_QWORD *)&buf[8] = v16;
  *((float *)v5 + 199) = sub_1000AB1D0((uint64_t)buf, (float *)&buf[12]);
  *(_QWORD *)buf = sub_1000C37A0();
  *(_QWORD *)&buf[8] = v17;
  *((float *)v5 + 200) = sub_1000AB1D0((uint64_t)buf, (float *)&buf[12]);
  v18 = sub_1000C38B4();
  sub_1000B3964((uint64_t)v18);
  v19 = *(_DWORD *)buf;
  sub_1000B3D5C((uint64_t)buf);
  if (v19 != v19 >> 31)
  {
    *(_QWORD *)buf = sub_1000C38B4();
    *(_QWORD *)&buf[8] = v23;
    LOBYTE(to) = 0;
    v5[779] = sub_1000AC110((uint64_t)buf, &to);
    if (qword_100417EF8 == -1)
    {
      v20 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_17;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407200);
      v20 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_17;
    }
    v24 = v5[779];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v24;
    v22 = "WARNING: Regional enabled overriden %d";
    goto LABEL_16;
  }
  v5[779] = sub_1000C9C2C();
  if (qword_100417EF8 == -1)
  {
    v20 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_17;
    goto LABEL_12;
  }
  dispatch_once(&qword_100417EF8, &stru_100407200);
  v20 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_12:
    v21 = v5[779];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v21;
    v22 = "Regional enabled %d";
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v22, buf, 8u);
  }
LABEL_17:
  v25 = sub_100014180();
  v26 = sub_1000141CC();
  v27 = v26;
  v28 = atomic_load((unsigned __int8 *)v26 + 26);
  if ((v28 & 1) == 0 && !*((_BYTE *)v26 + 16))
  {
    *((float *)v26 + 5) = sub_1000AB1D0((uint64_t)v26, (float *)v26 + 3);
    *((_BYTE *)v27 + 16) = 1;
    atomic_store(1u, (unsigned __int8 *)v27 + 26);
  }
  sub_1000BB82C(v25, *((float *)v27 + 5));
  v29 = sub_100014180();
  *(_QWORD *)buf = sub_1000C3780();
  *(_QWORD *)&buf[8] = v30;
  v31 = sub_1000AAF28((uint64_t)buf, (unsigned int *)&buf[12]);
  sub_1000C82A0(v29, v31);
  *(_QWORD *)buf = sub_1000AB4A0();
  *(_QWORD *)&buf[8] = v32;
  if (sub_1000AC110((uint64_t)buf, &buf[9]))
  {
    v33 = sub_100014180();
    sub_1000C838C(v33, 2);
  }
  *(_QWORD *)buf = sub_1000AC930();
  *(_QWORD *)&buf[8] = v34;
  if ((int)sub_1000AAF28((uint64_t)buf, (unsigned int *)&buf[12]) >= 1)
  {
    to = (id)sub_1000AB4A0();
    v66 = v35;
    if (!sub_1000AC110((uint64_t)&to, (_BYTE *)&v66 + 1))
    {
      v36 = sub_100014180();
      sub_1000C838C(v36, 3);
    }
  }
  objc_initWeak(&location, v5);
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3321888768;
  v61[2] = sub_100025010;
  v61[3] = &unk_100407090;
  objc_copyWeak((id *)buf, &location);
  *(_QWORD *)&buf[8] = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_queue"));
  objc_copyWeak(&v62, (id *)buf);
  v63 = *(id *)&buf[8];
  v37 = objc_retainBlock(v61);
  if (v5[200])
  {
    v38 = (void *)*((_QWORD *)v5 + 27);
    *((_QWORD *)v5 + 27) = v37;

  }
  else
  {
    *((_QWORD *)v5 + 26) = off_100407260;
    *((_QWORD *)v5 + 27) = v37;
    v5[200] = 1;
  }

  objc_destroyWeak((id *)buf);
  objc_initWeak(&from, v5);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3321888768;
  v57[2] = sub_1003295E4;
  v57[3] = &unk_1004070C0;
  objc_copyWeak((id *)buf, &from);
  *(_QWORD *)&buf[8] = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_queue"));
  objc_copyWeak(&v58, (id *)buf);
  v59 = *(id *)&buf[8];
  v39 = objc_retainBlock(v57);
  if (v5[224])
  {
    v40 = (void *)*((_QWORD *)v5 + 30);
    *((_QWORD *)v5 + 30) = v39;

  }
  else
  {
    *((_QWORD *)v5 + 29) = off_1004072E0;
    *((_QWORD *)v5 + 30) = v39;
    v5[224] = 1;
  }

  objc_destroyWeak((id *)buf);
  objc_initWeak(&v56, v5);
  objc_copyWeak(&to, &v56);
  v66 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_queue"));
  v41 = operator new(0x28uLL);
  v41[1] = 0;
  v41[2] = 0;
  *v41 = off_1004073D8;
  *(_QWORD *)buf = _NSConcreteStackBlock;
  *(_QWORD *)&buf[8] = 3321888768;
  *(_QWORD *)&buf[16] = sub_10005C60C;
  v69 = &unk_100407418;
  objc_copyWeak(&v70, &to);
  v71 = v66;
  v42 = objc_retainBlock(buf);

  objc_destroyWeak(&v70);
  v41[3] = off_100407488;
  v41[4] = objc_retainBlock(v42);

  *((_QWORD *)v5 + 93) = v41 + 3;
  v43 = (std::__shared_weak_count *)*((_QWORD *)v5 + 94);
  *((_QWORD *)v5 + 94) = v41;
  if (v43)
  {
    p_shared_owners = (unint64_t *)&v43->__shared_owners_;
    do
      v45 = __ldaxr(p_shared_owners);
    while (__stlxr(v45 - 1, p_shared_owners));
    if (!v45)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }

  objc_destroyWeak(&to);
  v46 = (void *)*((_QWORD *)v5 + 105);
  *((_QWORD *)v5 + 105) = 0;

  v47 = (void *)*((_QWORD *)v5 + 76);
  *((_QWORD *)v5 + 76) = 0;

  v48 = (void *)*((_QWORD *)v5 + 77);
  *((_QWORD *)v5 + 77) = 0;

  v49 = (void *)*((_QWORD *)v5 + 79);
  *((_OWORD *)v5 + 39) = 0u;

  *((_QWORD *)v5 + 80) = 0;
  v50 = objc_alloc_init(CLAvailableVenuesStateMachine);
  v51 = (void *)*((_QWORD *)v5 + 81);
  *((_QWORD *)v5 + 81) = v50;

  to = (id)sub_1000C3790();
  v66 = v52;
  v53 = sub_1000170A0((uint64_t)&to, (unsigned __int16 *)&v66 + 1);
  sub_1000C6E4C((uint64_t)buf, v53);
  *(_OWORD *)(v5 + 760) = *(_OWORD *)buf;
  v54 = v5;
  objc_destroyWeak(&v56);

  objc_destroyWeak(&v58);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v62);
  objc_destroyWeak(&location);
LABEL_37:

  return (CLIndoorProvider *)v5;
}

- (NSURL)workdir
{
  return self->_workdir;
}

- (void)stopUpdatingLocation
{
  -[CLIndoorProvider onQueueStopUpdatingLocation:](self, "onQueueStopUpdatingLocation:", 0);
}

- (void)setWorkdir:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 824);
}

- (void)setPrefetcher:(id)a3
{
  objc_storeWeak((id *)&self->_prefetcher, a3);
}

- (void)setPrefetchFloorLimitRegional:(int)a3
{
  self->_prefetchFloorLimitRegional = a3;
}

- (void)setPrefetchFloorLimitIndoor:(int)a3
{
  self->_prefetchFloorLimitIndoor = a3;
}

- (void)setPrefetchByteSizeLimitRegional:(int)a3
{
  self->_prefetchByteSizeLimitRegional = a3;
}

- (void)setPrefetchByteSizeLimitIndoor:(int)a3
{
  self->_prefetchByteSizeLimitIndoor = a3;
}

- (void)onQueueSelectedLocationDownloadCompleted:(const void *)a3 forAction:(unsigned __int8)a4
{
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  LocalizerApi *value;
  uint64_t v13;
  __n128 v14;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  void *__p;
  void *v22;
  unint64_t v23;
  char v24[8];
  _QWORD v25[2];
  _QWORD v26[7];
  char v27;
  char v28[8];
  _QWORD v29[39];

  if (a4 == 1)
  {
    if (self->_serviceLocalizer.__ptr_.__value_)
    {
      v24[0] = 0;
      v6 = *((_QWORD *)a3 + 1);
      v25[0] = *(_QWORD *)a3;
      v25[1] = v6;
      if (v6)
      {
        v7 = (unint64_t *)(v6 + 8);
        do
          v8 = __ldxr(v7);
        while (__stxr(v8 + 1, v7));
      }
      sub_1000B347C((uint64_t)v26, (uint64_t)a3 + 16);
      v9 = *((_QWORD *)a3 + 8);
      v26[5] = *((_QWORD *)a3 + 7);
      v26[6] = v9;
      if (v9)
      {
        v10 = (unint64_t *)(v9 + 8);
        do
          v11 = __ldxr(v10);
        while (__stxr(v11 + 1, v10));
      }
      v27 = *((_BYTE *)a3 + 72);
      v24[0] = 1;
      -[CLIndoorProvider setSelectedLocation:](self, "setSelectedLocation:", v24);
      if (v24[0])
      {
        sub_100073074(v25);
        v24[0] = 0;
      }
      value = self->_serviceLocalizer.__ptr_.__value_;
      v13 = sub_10005F0F0();
      (*(void (**)(LocalizerApi *, uint64_t, const void *))(*(_QWORD *)value + 48))(value, v13, a3);
      sub_100030C1C((uint64_t)a3, (uint64_t)&__p);
      v14.n128_f64[0] = sub_1000C67F4((uint64_t)&self->_localizationSessionMetrics, v23);
      v15 = v22;
      if (v22)
      {
        do
        {
          v17 = v15;
          v15 = (_QWORD *)*v15;
          v18 = (std::__shared_weak_count *)v17[3];
          if (v18)
          {
            p_shared_owners = (unint64_t *)&v18->__shared_owners_;
            do
              v20 = __ldaxr(p_shared_owners);
            while (__stlxr(v20 - 1, p_shared_owners));
            if (!v20)
            {
              ((void (*)(std::__shared_weak_count *, __n128))v18->__on_zero_shared)(v18, v14);
              std::__shared_weak_count::__release_weak(v18);
            }
          }
          operator delete(v17);
        }
        while (v15);
      }
      v16 = __p;
      __p = 0;
      if (v16)
        operator delete(v16);
    }
  }
  else if (!a4)
  {
    v28[0] = 0;
    if (self->_paramOverrides.m_initialized)
    {
      sub_1000A7424((uint64_t)v29, (uint64_t)&self->_paramOverrides.m_storage.dummy_.aligner_ + 7);
      v28[0] = 1;
    }
    -[CLIndoorProvider onQueueLocalizeOnSelection:withParameterOverrides:](self, "onQueueLocalizeOnSelection:withParameterOverrides:", a3, v28);
    if (v28[0])
      sub_1000A87F4(v29);
  }
}

- (BOOL)localizationActive
{
  return self->_localizationActive;
}

- (id).cxx_construct
{
  uint64_t v3;
  __int16 v4;
  const char *v6;
  uint64_t v7;

  self->_deferredState.m_initialized = 0;
  self->_possibleLocationObserver.m_initialized = 0;
  self->_params.m_initialized = 0;
  self->_floorEnvironmentLoader.__ptr_.__value_ = 0;
  self->_serviceLocalizer.__ptr_.__value_ = 0;
  self->_simulation.m_initialized = 0;
  self->_platformInfo = 0u;
  self->_eventBuses = 0u;
  self->_localizationSensorCollection = 0u;
  self->_scanPriorityObserver = 0u;
  self->_localizerObserver.m_initialized = 0;
  self->_sensorLogger.__ptr_ = 0;
  self->_sensorLogger.__cntrl_ = 0;
  self->_paramOverrides.m_initialized = 0;
  self->_localizationSessionMetrics._vptr$ILocalizerInputEventReceiver = (void **)off_100406DF8;
  *(_OWORD *)&self->_localizationSessionMetrics.sessionStartTimeNanos.__rep_ = 0u;
  *(_OWORD *)&self->_localizationSessionMetrics.ttffNanos.__rep_ = 0u;
  *(_OWORD *)&self->_localizationSessionMetrics.numOfIndoorFixes = 0u;
  *(_OWORD *)&self->_localizationSessionMetrics.numOfIncomingVIOEstimates = 0u;
  self->_sensorMetricsObserver = 0u;
  *(_OWORD *)&self->_localizationSessionMetrics.avgNumOfSelectedLocations = 0u;
  v6 = sub_1000C3790();
  v7 = v3;
  v4 = sub_1000170A0((uint64_t)&v6, (unsigned __int16 *)&v7 + 1);
  sub_1000C6E4C((uint64_t)&self->_pipelinedFixCrossCheckMetrics, v4);
  self->_selectedLocation.m_initialized = 0;
  self->_fsDb = 0u;
  return self;
}

- (CLIndoorProvider)init
{
  -[CLIndoorProvider doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)mutableDeferredState
{
  if (!self->_deferredState.m_initialized)
  {
    *(_QWORD *)((char *)&self->_deferredState.m_storage.dummy_.aligner_ + 7) = 0;
    self->_anon_11[7] = 0;
    self->_deferredState.m_initialized = 1;
  }
  return (char *)&self->_deferredState.m_storage.dummy_.aligner_ + 7;
}

- (void)setApiKey:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407200);
    v4 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    goto LABEL_3;
  }
  v4 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
  {
LABEL_3:
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "This API is unused", v5, 2u);
  }
LABEL_4:

}

- (void)setApiKey:(id)a3 onServer:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407200);
    v7 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_ERROR))
  {
LABEL_3:
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "This API is unused", v8, 2u);
  }
LABEL_4:

}

- (void)notifyProxyOfDownloadError
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[CLIndoorProvider makeReason:withCode:withFailure:](CLIndoorProvider, "makeReason:withCode:withFailure:", CFSTR("download request failed"), 2, 0));
  -[CLIndoorProvider notifyProxyOfDownloadError:](self, "notifyProxyOfDownloadError:");

}

- (void)notifyProxyOfDownloadError:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  uint64_t v7;
  int v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;
  uint64_t v15;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_queue"));

  if (!v6)
  {
    if (qword_100417EF8 == -1)
    {
      v10 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
        goto LABEL_6;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407200);
      v10 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
        goto LABEL_6;
    }
    LOWORD(location) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "No queue so unable to notify proxy of download error", (uint8_t *)&location, 2u);
    goto LABEL_6;
  }
  location = (id)sub_10016E268();
  v15 = v7;
  v8 = sub_1000AAF28((uint64_t)&location, (unsigned int *)&v15 + 1);
  v9 = dispatch_time(0, (uint64_t)((double)v8 * 1000000000.0));
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100329ACC;
  v11[3] = &unk_1004070F8;
  objc_copyWeak(&v13, &location);
  v12 = v4;
  dispatch_after(v9, v6, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
LABEL_6:

}

- (void)notify:(id)a3 failedWithReason:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "remoteObjectProxy"));
  objc_msgSend(v5, "indoorDidFailWithError:", v6);

}

+ (id)makeReason:(id)a3 withCode:(int64_t)a4 withFailure:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSErrorUserInfoKey v14;
  id v15;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v14 = NSLocalizedFailureReasonErrorKey;
    v15 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  }
  else
  {
    v11 = &__NSDictionary0__struct;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "makeReason:withCode:withInfo:", v8, a4, v11));

  return v12;
}

+ (id)makeReason:(id)a3 withCode:(int64_t)a4 withInfo:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", (char *)objc_msgSend(v8, "count") + 1));
  objc_msgSend(v9, "setObject:forKey:", v7, NSLocalizedDescriptionKey);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v14, (_QWORD)v18));
        objc_msgSend(v9, "setObject:forKey:", v15, v14);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.pipelined"), a4, v9));
  return v16;
}

- (void)changeLocationGroups:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (self->_serviceLocalizer.__ptr_.__value_ && -[CLIndoorProvider localizationStarted](self, "localizationStarted"))
  {
    -[CLIndoorProvider setLocationGroups:](self, "setLocationGroups:", v4);
LABEL_4:

    return;
  }
  if (qword_100417EF8 == -1)
  {
    v5 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_4;
  }
  else
  {
    dispatch_once(&qword_100417EF8, &stru_100407200);
    v5 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_4;
  }
  *(_WORD *)v6 = 0;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "WARNING: Ignoring changeLocationGroup request - not localizing yet", v6, 2u);

}

- (void)foregroundRequestCompleted:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void **v14;
  id WeakRetained;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  void *__p[2];
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void **v27;

  v6 = a3;
  v7 = a4;
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407200);
  v8 = (id)qword_100417F00;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestUUID"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString")));
    v11 = objc_msgSend(v10, "UTF8String");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "ps_STLStringOnNil:", &stru_100409048);
      if (v23 >= 0)
        v14 = __p;
      else
        v14 = (void **)__p[0];
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      v14 = __p;
      v23 = 0;
    }
    *(_DWORD *)buf = 136315394;
    v25 = v11;
    v26 = 2080;
    v27 = v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "download request finished for UUID: %s with an error %s", buf, 0x16u);
    if (SHIBYTE(v23) < 0)
      operator delete(__p[0]);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_queue"));

  if (!v16)
  {
    if (qword_100417EF8 == -1)
    {
      v17 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
        goto LABEL_17;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407200);
      v17 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
        goto LABEL_17;
    }
    LOWORD(__p[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "No queue so ignoring message", (uint8_t *)__p, 2u);
    goto LABEL_17;
  }
  objc_initWeak(__p, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10032A388;
  v18[3] = &unk_100407180;
  objc_copyWeak(&v21, __p);
  v18[4] = self;
  v19 = v6;
  v20 = v7;
  dispatch_async(v16, v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(__p);
LABEL_17:

}

- (void)playbackDatarun:(id)a3
{
  id v4;
  void *v5;
  ITileDb *ptr;
  optional<DataRun> *p_simulation;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  __int128 __p;
  uint64_t v17;
  void *__dst[2];
  char v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  std::string v24;
  char v25;
  std::__shared_weak_count *v26;
  _QWORD v27[2];
  _QWORD v28[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorProvider xpcConnection](self, "xpcConnection"));
  if (v5)
  {
    ptr = self->_fsDb.__ptr_;
    if (!ptr)
    {
      sub_1000D5048(__dst, "");
      sub_10023DB34("Localizer DB must be unlocked to playback dataruns", &v24);
      sub_100174738((uint64_t)__dst, (uint64_t)&v24, 1);
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v24.__r_.__value_.__l.__data_);
      if (v19 < 0)
        operator delete(__dst[0]);
      sub_10015AD4C((uint64_t)&__p);
    }
    (*(void (**)(ITileDb *))(*(_QWORD *)ptr + 240))(ptr);
    sub_100327B84(__dst);
    if (v4)
    {
      objc_msgSend(v4, "ps_STLString");
    }
    else
    {
      __p = 0uLL;
      v17 = 0;
    }
    sub_100327B88((uint64_t)__dst, (uint64_t)&__p, &v24);
    p_simulation = &self->_simulation;
    sub_10032CF24((uint64_t)&self->_simulation, (uint64_t)&v24);
    if (!v24.__r_.__value_.__s.__data_[0])
    {
LABEL_14:
      if (SHIBYTE(v17) < 0)
      {
        operator delete((void *)__p);
        if (p_simulation->m_initialized)
        {
LABEL_16:
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorProvider getAvailabilityTileParserAndSetParams:](self, "getAvailabilityTileParserAndSetParams:", CFSTR("playbackDatarun")));
          if (v11)
          {
            *(_QWORD *)&__p = off_100407330;
            sub_1000A73BC((uint64_t)objc_msgSend(v11, "getAvlTile"), &v24);
            v12 = operator new(0x28uLL);
            v12[1] = 0;
            v12[2] = 0;
            *v12 = off_1004074E0;
            sub_10009EE58((uint64_t)(v12 + 3), (uint64_t)&__p, &v24);
          }
          v24.__r_.__value_.__r.__words[0] = (std::string::size_type)off_100407330;
          v15 = operator new(0x28uLL);
          v15[1] = 0;
          v15[2] = 0;
          *v15 = off_1004074E0;
          sub_10026A66C();
        }
      }
      else if (p_simulation->m_initialized)
      {
        goto LABEL_16;
      }
      v27[0] = NSLocalizedDescriptionKey;
      v27[1] = CFSTR("datarunid");
      v28[0] = CFSTR("datarun not found");
      v28[1] = v4;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.pipelined"), -1, v13));

      -[CLIndoorProvider notify:failedWithReason:](self, "notify:failedWithReason:", v5, v14);
      if (v23 < 0)
      {
        operator delete(v22);
        if ((v21 & 0x80000000) == 0)
        {
LABEL_25:
          if ((v19 & 0x80000000) == 0)
            goto LABEL_26;
LABEL_29:
          operator delete(__dst[0]);
          goto LABEL_26;
        }
      }
      else if ((v21 & 0x80000000) == 0)
      {
        goto LABEL_25;
      }
      operator delete(v20);
      if ((v19 & 0x80000000) == 0)
        goto LABEL_26;
      goto LABEL_29;
    }
    v8 = v26;
    if (!v26)
      goto LABEL_11;
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
      if ((v25 & 0x80000000) == 0)
        goto LABEL_13;
    }
    else
    {
LABEL_11:
      if ((v25 & 0x80000000) == 0)
      {
LABEL_13:
        v24.__r_.__value_.__s.__data_[0] = 0;
        goto LABEL_14;
      }
    }
    operator delete((void *)v24.__r_.__value_.__l.__size_);
    goto LABEL_13;
  }
LABEL_26:

}

- (void)setLocationGroups:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD *v20;
  char v21;
  __int128 v22;
  void *v23;
  void *context;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *__p[2];
  char v30;
  void *v31[2];
  _BYTE buf[32];
  __int128 v33;
  char v34;
  _BYTE v35[128];

  v4 = a3;
  if (!self->_fsDb.__ptr_)
  {
    sub_1000D5048(__p, "");
    sub_10016A234("setLocationGroups fsDb is not set", (std::string *)buf);
    sub_100174738((uint64_t)__p, (uint64_t)buf, 1);
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
    if (v30 < 0)
      operator delete(__p[0]);
    sub_10015AD4C((uint64_t)v31);
  }
  if (!self->_indoorUniverse)
  {
    sub_1000D5048(__p, "");
    sub_10022B6C4("setLocationGroups, indoorUniverse is not set", (std::string *)buf);
    sub_100174738((uint64_t)__p, (uint64_t)buf, 1);
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
    if (v30 < 0)
      operator delete(__p[0]);
    sub_1000F2AE4((uint64_t)v31);
  }
  v5 = objc_loadWeakRetained((id *)&self->_xpcConnection);
  if (!v5)
  {
    sub_1000D5048(__p, "");
    sub_1002C0644("setLocationGroups, xpcConnection is not set", (std::string *)buf);
    sub_100174738((uint64_t)__p, (uint64_t)buf, 1);
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
    if (v30 < 0)
      operator delete(__p[0]);
    sub_10015AD4C((uint64_t)v31);
  }

  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407200);
  v6 = (id)qword_100417F00;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "))));
    *(_DWORD *)buf = 136380675;
    *(_QWORD *)&buf[4] = objc_msgSend(v8, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[CLIndoorProvider] Location group %{private}s request to change", buf, 0xCu);

  }
  sub_10007CED4((uint64_t)__p, "setLocationGroups:");
  context = objc_autoreleasePoolPush();
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v4, "count")));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v10);
        v14 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "addObject:", v14);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v11);
  }

  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407200);
    v15 = (id)qword_100417F00;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    goto LABEL_17;
  }
  v15 = (id)qword_100417F00;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
LABEL_17:
    v16 = objc_msgSend(v9, "count");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "componentsJoinedByString:", CFSTR(", "))));
    v19 = objc_msgSend(v18, "UTF8String");
    *(_DWORD *)buf = 134349315;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2081;
    *(_QWORD *)&buf[14] = v19;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Universe size: %{public}lu with locationGroupIds: %{private}s", buf, 0x16u);

  }
LABEL_18:

  v20 = -[CLIndoorUniverse getAvailabilityData](self->_indoorUniverse, "getAvailabilityData");
  *(_QWORD *)buf = *v20;
  *(_QWORD *)&buf[8] = (id)v20[1];
  v21 = *((_BYTE *)v20 + 48);
  v22 = *((_OWORD *)v20 + 2);
  *(_OWORD *)&buf[16] = *((_OWORD *)v20 + 1);
  v33 = v22;
  v34 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v9));
  -[CLIndoorProvider requestLocationTilesForGroup:usingAvailabilityTile:forAction:](self, "requestLocationTilesForGroup:usingAvailabilityTile:forAction:", v23, buf, 1);

  objc_autoreleasePoolPop(context);
  sub_10007CDC0((uint64_t)__p);

}

- (void)startUpdatingLocationDeferred:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18[2];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[28];
  void *v27[4];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[28];
  _BYTE __p[32];
  __int128 v36;
  __int128 v37;
  _OWORD v38[2];
  __int128 v39;
  __int128 v40;
  uint8_t v41[28];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;

  v4 = a3;
  if (self->_deferredState.m_initialized)
  {
    sub_1000D5048(v27, "");
    sub_100237160("startUpdatingLocationDeferred must be entered without a deferredState", (std::string *)__p);
    sub_100174738((uint64_t)v27, (uint64_t)__p, 1);
    if ((__p[23] & 0x80000000) != 0)
      operator delete(*(void **)__p);
    if (SHIBYTE(v27[2]) < 0)
      operator delete(v27[0]);
    sub_1000F2AE4((uint64_t)v18);
  }
  if (objc_msgSend(v4, "isStaleFix:", std::chrono::steady_clock::now().__d_.__rep_))
  {
    if (qword_100417EF8 != -1)
      dispatch_once(&qword_100417EF8, &stru_100407200);
    v5 = (id)qword_100417F00;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (v4)
      {
        objc_msgSend(v4, "gpsLocation");
        v6 = *(_QWORD *)((char *)v38 + 12);
        objc_msgSend(v4, "gpsLocation");
        v7 = *((_QWORD *)&v31 + 1);
        objc_msgSend(v4, "gpsLocation");
        v8 = *(_QWORD *)((char *)&v19 + 4);
      }
      else
      {
        v8 = 0;
        v7 = 0;
        v6 = 0;
        v40 = 0u;
        memset(v41, 0, sizeof(v41));
        v39 = 0u;
        v37 = 0u;
        memset(v38, 0, sizeof(v38));
        v36 = 0u;
        memset(__p, 0, sizeof(__p));
        v33 = 0u;
        memset(v34, 0, sizeof(v34));
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v28 = 0u;
        memset(v27, 0, sizeof(v27));
        v25 = 0u;
        memset(v26, 0, sizeof(v26));
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        *(_OWORD *)v18 = 0u;
      }
      *(_DWORD *)buf = 134349568;
      v43 = v6;
      v44 = 2050;
      v45 = v7;
      v46 = 2050;
      v47 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[CLIndoorProvider] startUpdatingLocationDeferred. Skip, stale location, %{public}lf, %{public}lf, %{public}.2lf", buf, 0x20u);
    }

    sub_10007CED4((uint64_t)__p, "deferred startUpdatingLocationAtLocation - location");
    v13 = -[CLIndoorProvider mutableDeferredState](self, "mutableDeferredState");
    v14 = v13;
    v15 = *(_QWORD *)__p;
    if (*((_BYTE *)v13 + 8))
    {
      *(_QWORD *)__p = 0;
      v16 = (void *)v13[2];
      v13[2] = v15;

    }
    else
    {
      v13[2] = *(id *)__p;
      *(_OWORD *)(v14 + 3) = *(_OWORD *)&__p[8];
      v17 = *(void **)__p;
      v14[5] = *(_QWORD *)&__p[24];
      memset(__p, 0, sizeof(__p));

      *((_BYTE *)v14 + 8) = 1;
    }
    sub_10007CDC0((uint64_t)__p);
  }
  else
  {
    if (qword_100417EF8 != -1)
      dispatch_once(&qword_100417EF8, &stru_100407200);
    v9 = (id)qword_100417F00;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (v4)
      {
        objc_msgSend(v4, "gpsLocation");
        v10 = *(_QWORD *)&__p[4];
        objc_msgSend(v4, "gpsLocation");
        v11 = *(uint64_t *)((char *)&v27[1] + 4);
        objc_msgSend(v4, "gpsLocation");
        v12 = *(_QWORD *)((char *)&v19 + 4);
      }
      else
      {
        v12 = 0;
        v11 = 0;
        v10 = 0;
        v40 = 0u;
        memset(v41, 0, sizeof(v41));
        v39 = 0u;
        v37 = 0u;
        memset(v38, 0, sizeof(v38));
        v36 = 0u;
        memset(__p, 0, sizeof(__p));
        v33 = 0u;
        memset(v34, 0, sizeof(v34));
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v28 = 0u;
        memset(v27, 0, sizeof(v27));
        v25 = 0u;
        memset(v26, 0, sizeof(v26));
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        *(_OWORD *)v18 = 0u;
      }
      *(_DWORD *)buf = 134284033;
      v43 = v10;
      v44 = 2049;
      v45 = v11;
      v46 = 2050;
      v47 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[CLIndoorProvider] startUpdatingLocationDeferred. Starting at latlon: %{private}.8lf,%{private}.8lf, %{public}.2lf", buf, 0x20u);
    }

    -[CLIndoorProvider startUpdatingLocationAtLocation:](self, "startUpdatingLocationAtLocation:", v4);
  }

}

- (void)gpsEstimateAvailable:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  int64_t rep;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  _QWORD *v20;
  uint64_t *v21;
  CombinedLogger *ptr;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  char *v26;
  std::__shared_weak_count *v27;
  uint64_t v28;
  int v29;
  _QWORD v30[10];
  int v31;
  _BYTE v32[56];
  _QWORD v33[2];
  uint64_t v34;
  __int128 v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  int v43;
  float64x2_t v44;
  double v45;
  uint64_t v46;
  int v47;
  _BYTE v48[16];
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  _OWORD v52[5];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[28];
  uint8_t buf[16];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  int v89;

  v5 = a3;
  v6 = v5;
  if (!v5 || (objc_msgSend(v5, "gpsLocation"), (_DWORD)v63 != 1) && (objc_msgSend(v6, "gpsLocation"), v31 != 9))
  {
    objc_storeStrong((id *)&self->_lastNonGpsPositionAvailable, a3);
    v9 = 0;
    self->_lastNonGpsReceivedTime.__rep_ = sub_10005F0F0();
    if (!self->_serviceLocalizer.__ptr_.__value_)
      goto LABEL_13;
    goto LABEL_10;
  }
  objc_storeStrong((id *)&self->_lastGpsPositionAvailable, a3);
  self->_lastGpsReceivedTime.__rep_ = sub_10005F0F0();
  if (qword_100417EF8 == -1)
  {
    v7 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
      goto LABEL_7;
    goto LABEL_6;
  }
  dispatch_once(&qword_100417EF8, &stru_100407200);
  v7 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
  {
LABEL_6:
    rep = self->_lastGpsReceivedTime.__rep_;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = rep;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Updated last available GPS estimate. New estimate's timestamp: %llu", buf, 0xCu);
  }
LABEL_7:
  v9 = 1;
  if (!self->_serviceLocalizer.__ptr_.__value_)
    goto LABEL_13;
LABEL_10:
  if (-[CLIndoorProvider localizationStarted](self, "localizationStarted"))
  {
    v55 = 0u;
    memset(v56, 0, sizeof(v56));
    v53 = 0u;
    v54 = 0u;
    memset(v52, 0, sizeof(v52));
    if (v6)
    {
      objc_msgSend(v6, "gpsLocation");
      v88 = 0u;
      v87 = 0u;
      v86 = 0u;
      v85 = 0u;
      v84 = 0u;
      v83 = 0u;
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      *(_OWORD *)buf = 0u;
      v58 = 0u;
      objc_msgSend(v6, "gpsLocationPrivate");
    }
    else
    {
      bzero(buf, 0x230uLL);
    }
    sub_10001B8F4((uint64_t)v48);
    sub_10014E054((uint64_t)v33);
    v47 |= 1u;
    v11 = v34;
    if (!v34)
      operator new();
    *(_DWORD *)(v34 + 52) |= 1u;
    v47 |= 1u;
    *(_DWORD *)(v11 + 52) |= 2u;
    *(_OWORD *)(v11 + 16) = v49;
    v47 |= 1u;
    v12 = v50;
    *(_DWORD *)(v11 + 52) |= 4u;
    *(_QWORD *)(v11 + 32) = v12;
    v47 |= 1u;
    v13 = v51;
    *(_DWORD *)(v11 + 52) |= 8u;
    *(_QWORD *)(v11 + 40) = v13;
    v14 = v47;
    v35 = *(_OWORD *)((char *)v52 + 4);
    v43 = DWORD1(v53);
    v36 = v54;
    v44 = vcvtq_f64_f32(*(float32x2_t *)((char *)&v59 + 8));
    v47 |= 0x3C10Eu;
    v45 = *(float *)&v60;
    v41 = *(_OWORD *)((char *)&v52[3] + 12);
    v42 = *(_OWORD *)((char *)&v52[2] + 12);
    v40 = *(_QWORD *)((char *)&v52[1] + 4);
    v38 = *(_QWORD *)((char *)&v52[1] + 12);
    if (!v9)
    {
      v16 = v14 | 0x3DF6E;
      v17 = 1;
LABEL_27:
      v37 = v17;
      v39 = *(_QWORD *)((char *)&v52[2] + 4);
      v47 = v16 | 0x40080;
      v18 = v46;
      if (!v46)
        operator new();
      v19 = v89;
      *(_DWORD *)(v46 + 24) |= 1u;
      *(_DWORD *)(v18 + 16) = v19;
      sub_100309DE0((uint64_t)&v28, 1, (uint64_t)v48, (uint64_t)v33);
      v20 = operator new(0x108uLL);
      v20[1] = 0;
      v20[2] = 0;
      *v20 = off_1003F0840;
      v20[4] = v28;
      *((_DWORD *)v20 + 10) = v29;
      sub_100157C2C((uint64_t)(v20 + 6), (uint64_t)v30);
      sub_100018EC4((uint64_t)(v20 + 26), (uint64_t)v32);
      *((_DWORD *)v20 + 6) = 20;
      v26 = (char *)(v20 + 3);
      v27 = (std::__shared_weak_count *)v20;
      v21 = (uint64_t *)(*(uint64_t (**)(LocalizerApi *))(*(_QWORD *)self->_serviceLocalizer.__ptr_.__value_
                                                                 + 120))(self->_serviceLocalizer.__ptr_.__value_);
      sub_10001AEF8(*v21, (uint64_t)&v26);
      ptr = self->_sensorLogger.__ptr_;
      if (ptr && self->_localizationActive)
        sub_100167AEC((uint64_t)ptr);
      v23 = v27;
      if (v27)
      {
        p_shared_owners = (unint64_t *)&v27->__shared_owners_;
        do
          v25 = __ldaxr(p_shared_owners);
        while (__stlxr(v25 - 1, p_shared_owners));
        if (!v25)
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
      }
      sub_100051F2C((uint64_t)v32);
      sub_100007738(v30);
      sub_100007738(v33);
      sub_100051F2C((uint64_t)v48);
      goto LABEL_38;
    }
    if (DWORD2(v76) == 1)
    {
      v15 = v14 | 0x3DF6E;
      v37 = 1;
    }
    else
    {
      v15 = v14 | 0x3DF2E;
      if (DWORD2(v76) != 2)
        goto LABEL_26;
    }
    v15 |= 0x40u;
    v37 = 2;
LABEL_26:
    v17 = 0;
    v16 = v15 | 0x40;
    goto LABEL_27;
  }
LABEL_13:
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407200);
    v10 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
      goto LABEL_38;
    goto LABEL_15;
  }
  v10 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
  {
LABEL_15:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Not passing the GPS estimate to the PF or the logger since we are not localizing yet", buf, 2u);
  }
LABEL_38:

}

- (void)gpsSignalQualityAvailable:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (self->_serviceLocalizer.__ptr_.__value_)
    goto LABEL_2;
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407200);
    v5 = qword_100417F00;
    if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_5;
LABEL_2:

    return;
  }
  v5 = qword_100417F00;
  if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
    goto LABEL_2;
LABEL_5:
  *(_WORD *)v6 = 0;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Ignoring GPS signal quality - not localizing yet", v6, 2u);

}

- (void)clVisionNotificationVIOEstimationAvailable:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  CombinedLogger *ptr;
  void *__p;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[64];
  char *v16;
  std::__shared_weak_count *v17;
  _QWORD v18[13];
  _BYTE v19[56];

  v4 = a3;
  if (qword_100417EF8 == -1)
  {
    v5 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417EF8, &stru_100407200);
  v5 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    LOWORD(__p) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Receiving CLVision notification - VIOEstimation", (uint8_t *)&__p, 2u);
  }
LABEL_4:
  sub_10001B8F4((uint64_t)v19);
  sub_100104948((uint64_t)v18);
  if (v4)
  {
    objc_msgSend(v4, "serializedVIOEstimation");
  }
  else
  {
    __p = 0;
    v13 = 0;
    v14 = 0;
  }
  wireless_diagnostics::google::protobuf::MessageLite::ParseFromString(v18, &__p);
  if (SHIBYTE(v14) < 0)
    operator delete(__p);
  v6 = *(_QWORD *)(*(uint64_t (**)(LocalizerApi *))(*(_QWORD *)self->_serviceLocalizer.__ptr_.__value_ + 120))(self->_serviceLocalizer.__ptr_.__value_);
  sub_100309B38(&__p, (uint64_t)v19, (uint64_t)v18);
  v7 = operator new(0x108uLL);
  v7[1] = 0;
  v7[2] = 0;
  *v7 = off_1003F0840;
  v7[4] = __p;
  sub_10010AFBC((uint64_t)(v7 + 5), (uint64_t)&v13);
  sub_100018EC4((uint64_t)(v7 + 18), (uint64_t)v15);
  *((_DWORD *)v7 + 6) = 18;
  v16 = (char *)(v7 + 3);
  v17 = (std::__shared_weak_count *)v7;
  sub_10001AEF8(v6, (uint64_t)&v16);
  v8 = v17;
  if (!v17)
    goto LABEL_13;
  p_shared_owners = (unint64_t *)&v17->__shared_owners_;
  do
    v10 = __ldaxr(p_shared_owners);
  while (__stlxr(v10 - 1, p_shared_owners));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    sub_100051F2C((uint64_t)v15);
    sub_10010B1CC(&v13);
    ptr = self->_sensorLogger.__ptr_;
    if (!ptr)
      goto LABEL_16;
  }
  else
  {
LABEL_13:
    sub_100051F2C((uint64_t)v15);
    sub_10010B1CC(&v13);
    ptr = self->_sensorLogger.__ptr_;
    if (!ptr)
      goto LABEL_16;
  }
  if (self->_localizationActive)
    sub_1001678CC((uint64_t)ptr);
LABEL_16:
  ++self->_localizationSessionMetrics.numOfIncomingVIOEstimates;
  sub_10010B1CC(v18);
  sub_100051F2C((uint64_t)v19);

}

- (void)clVisionNotificationVLLocalizationResultAvailable:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  CombinedLogger *ptr;
  void *__p;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[64];
  char *v16;
  std::__shared_weak_count *v17;
  _QWORD v18[9];
  _BYTE v19[56];

  v4 = a3;
  if (qword_100417EF8 == -1)
  {
    v5 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417EF8, &stru_100407200);
  v5 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    LOWORD(__p) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Receiving CLVision notification - VLLocalizationResult", (uint8_t *)&__p, 2u);
  }
LABEL_4:
  sub_10001B8F4((uint64_t)v19);
  sub_100104A58((uint64_t)v18);
  if (v4)
  {
    objc_msgSend(v4, "serializedVLLocalizationResult");
  }
  else
  {
    __p = 0;
    v13 = 0;
    v14 = 0;
  }
  wireless_diagnostics::google::protobuf::MessageLite::ParseFromString(v18, &__p);
  if (SHIBYTE(v14) < 0)
    operator delete(__p);
  v6 = *(_QWORD *)(*(uint64_t (**)(LocalizerApi *))(*(_QWORD *)self->_serviceLocalizer.__ptr_.__value_ + 120))(self->_serviceLocalizer.__ptr_.__value_);
  sub_100309C88(&__p, (uint64_t)v19, (uint64_t)v18);
  v7 = operator new(0x108uLL);
  v7[1] = 0;
  v7[2] = 0;
  *v7 = off_1003F0840;
  v7[4] = __p;
  sub_100114E28((uint64_t)(v7 + 5), (uint64_t)&v13);
  sub_100018EC4((uint64_t)(v7 + 14), (uint64_t)v15);
  *((_DWORD *)v7 + 6) = 19;
  v16 = (char *)(v7 + 3);
  v17 = (std::__shared_weak_count *)v7;
  sub_10001AEF8(v6, (uint64_t)&v16);
  v8 = v17;
  if (!v17)
    goto LABEL_13;
  p_shared_owners = (unint64_t *)&v17->__shared_owners_;
  do
    v10 = __ldaxr(p_shared_owners);
  while (__stlxr(v10 - 1, p_shared_owners));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    sub_100051F2C((uint64_t)v15);
    sub_100114EB8(&v13);
    ptr = self->_sensorLogger.__ptr_;
    if (!ptr)
      goto LABEL_16;
  }
  else
  {
LABEL_13:
    sub_100051F2C((uint64_t)v15);
    sub_100114EB8(&v13);
    ptr = self->_sensorLogger.__ptr_;
    if (!ptr)
      goto LABEL_16;
  }
  if (self->_localizationActive)
    sub_1001679DC((uint64_t)ptr);
LABEL_16:
  ++self->_localizationSessionMetrics.numOfIncomingVLLocalizationResults;
  sub_100114EB8(v18);
  sub_100051F2C((uint64_t)v19);

}

- (void)setXpcConnection:(id)a3
{
  objc_storeWeak((id *)&self->_xpcConnection, a3);
}

- (shared_ptr<ITileDb>)fsDb
{
  ITileDb **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<ITileDb> result;

  cntrl = self->_fsDb.__cntrl_;
  *v2 = self->_fsDb.__ptr_;
  v2[1] = (ITileDb *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (ITileDb *)self;
  return result;
}

- (CLIndoorTilePrefetcher)prefetcher
{
  return (CLIndoorTilePrefetcher *)objc_loadWeakRetained((id *)&self->_prefetcher);
}

- (int)prefetchFloorLimitIndoor
{
  return self->_prefetchFloorLimitIndoor;
}

- (int)prefetchFloorLimitRegional
{
  return self->_prefetchFloorLimitRegional;
}

- (int)prefetchByteSizeLimitIndoor
{
  return self->_prefetchByteSizeLimitIndoor;
}

- (int)prefetchByteSizeLimitRegional
{
  return self->_prefetchByteSizeLimitRegional;
}

- (float)numOfDaysBeforeIndoorTileRedownload
{
  return self->_numOfDaysBeforeIndoorTileRedownload;
}

- (void)setNumOfDaysBeforeIndoorTileRedownload:(float)a3
{
  self->_numOfDaysBeforeIndoorTileRedownload = a3;
}

- (float)numOfDaysBeforeRegionalTileRedownload
{
  return self->_numOfDaysBeforeRegionalTileRedownload;
}

- (void)setNumOfDaysBeforeRegionalTileRedownload:(float)a3
{
  self->_numOfDaysBeforeRegionalTileRedownload = a3;
}

- (BOOL)demoRunStarted
{
  return self->_demoRunStarted;
}

- (void)setDemoRunStarted:(BOOL)a3
{
  self->_demoRunStarted = a3;
}

- (CLIndoorLocation)latestFix
{
  return self->_latestFix;
}

- (void)setLatestFix:(id)a3
{
  objc_storeStrong((id *)&self->_latestFix, a3);
}

- (void)setIsRegionalEnabled:(BOOL)a3
{
  self->_isRegionalEnabled = a3;
}

- (CLIndoorUniverse)indoorUniverse
{
  return self->_indoorUniverse;
}

- (void)setIndoorUniverse:(id)a3
{
  objc_storeStrong((id *)&self->_indoorUniverse, a3);
}

@end
