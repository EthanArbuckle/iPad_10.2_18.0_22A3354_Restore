@implementation WifiSensor

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  GenericWifiSensor *value;

  if (self->_previousScanTimestamp.m_initialized)
    self->_previousScanTimestamp.m_initialized = 0;
  objc_storeStrong((id *)&self->_nextSettings, 0);
  cntrl = self->_scanStrategy.__cntrl_;
  if (!cntrl)
    goto LABEL_7;
  v4 = (unint64_t *)((char *)cntrl + 8);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 - 1, v4));
  if (v5)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_scanner, 0);
    value = self->fSensorBridge.__ptr_.__value_;
    self->fSensorBridge.__ptr_.__value_ = 0;
    if (!value)
      return;
    goto LABEL_8;
  }
  (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  objc_storeStrong((id *)&self->_scanner, 0);
  value = self->fSensorBridge.__ptr_.__value_;
  self->fSensorBridge.__ptr_.__value_ = 0;
  if (value)
LABEL_8:
    (*(void (**)(GenericWifiSensor *))(*(_QWORD *)value + 8))(value);
}

- (void)stop
{
  NSObject *v3;
  uint8_t v4[16];

  if (qword_100417ED8 == -1)
  {
    v3 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417ED8, &stru_100404E58);
  v3 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Stopping wifi scanning", v4, 2u);
  }
LABEL_4:
  -[NewWifiScanner stopListeningCachedScans](self->_scanner, "stopListeningCachedScans");
  -[NewWifiScanner stopScanning](self->_scanner, "stopScanning");
  if (self->_previousScanTimestamp.m_initialized)
    self->_previousScanTimestamp.m_initialized = 0;
}

- (void)start
{
  NSObject *v3;
  uint64_t v4;
  WifiScannerSettings *v5;
  WifiScannerSettings *nextSettings;
  uint8_t v7[16];

  if (qword_100417ED8 == -1)
  {
    v3 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417ED8, &stru_100404E58);
  v3 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting wifi scanning", v7, 2u);
  }
LABEL_4:
  if (self->_previousScanTimestamp.m_initialized)
    self->_previousScanTimestamp.m_initialized = 0;
  v4 = (*(uint64_t (**)(WifiScanStrategy *, _QWORD, _QWORD))(*(_QWORD *)self->_scanStrategy.__ptr_ + 40))(self->_scanStrategy.__ptr_, 0, 0);
  v5 = (WifiScannerSettings *)objc_claimAutoreleasedReturnValue(v4);
  nextSettings = self->_nextSettings;
  self->_nextSettings = v5;

  -[NewWifiScanner startListeningCachedScans](self->_scanner, "startListeningCachedScans");
  -[NewWifiScanner startScanning](self->_scanner, "startScanning");
}

- (WifiSensor)init
{
  id v2;
  uint64_t v3;
  __int128 v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  __int128 v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WifiSensor;
  v2 = -[WifiSensor init](&v13, "init");
  if (v2)
  {
    v3 = sub_100014180();
    sub_1000C82A8(v3, &v12);
    v4 = v12;
    v12 = 0uLL;
    v5 = (std::__shared_weak_count *)*((_QWORD *)v2 + 5);
    *((_OWORD *)v2 + 2) = v4;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    v8 = (std::__shared_weak_count *)*((_QWORD *)&v12 + 1);
    if (*((_QWORD *)&v12 + 1))
    {
      v9 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    operator new();
  }
  return 0;
}

- (void)invalidate
{
  unint64_t *p_strategyChangeListener;
  uint64_t v4;
  uint64_t v5;

  -[NewWifiScanner invalidate](self->_scanner, "invalidate");
  p_strategyChangeListener = (unint64_t *)&self->_strategyChangeListener;
  do
    v4 = __ldaxr(p_strategyChangeListener);
  while (__stlxr(0, p_strategyChangeListener));
  if (v4)
  {
    v5 = sub_100014180();
    sub_10000AEA0(v5, v4);
  }
}

- (void)wifiScanFailed:(id)a3
{
  id v4;
  uint64_t v5;
  WifiScannerSettings *v6;
  WifiScannerSettings *nextSettings;
  GenericWifiSensor *value;
  id v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  __int128 v13;

  v4 = a3;
  if ((objc_msgSend(v4, "cachedScan") & 1) == 0)
  {
    v5 = (*(uint64_t (**)(WifiScanStrategy *, id, _QWORD))(*(_QWORD *)self->_scanStrategy.__ptr_ + 40))(self->_scanStrategy.__ptr_, objc_msgSend(v4, "timestamp"), 0);
    v6 = (WifiScannerSettings *)objc_claimAutoreleasedReturnValue(v5);
    nextSettings = self->_nextSettings;
    self->_nextSettings = v6;

  }
  value = self->fSensorBridge.__ptr_.__value_;
  v9 = objc_msgSend(v4, "timestamp");
  sub_100055B14(&v13, v4);
  sub_1000C8F00((uint64_t)value, (uint64_t)v9, &v13);
  v10 = (std::__shared_weak_count *)*((_QWORD *)&v13 + 1);
  if (!*((_QWORD *)&v13 + 1))
    goto LABEL_7;
  v11 = (unint64_t *)(*((_QWORD *)&v13 + 1) + 8);
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 - 1, v11));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);

  }
  else
  {
LABEL_7:

  }
}

- (void)wifiScanData:(id)a3 forSettings:(id)a4
{
  uint64_t v6;
  WifiScannerSettings *v7;
  WifiScannerSettings *nextSettings;
  double v9;
  id v10;
  NSObject *v11;
  id v12;
  __objc2_class *v13;
  unint64_t v14;
  unint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  std::string *p_buf;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  int v28;
  std::string::size_type v29;
  id v30;
  std::string *v31;
  double v32;
  char *v33;
  int data;
  std::string *v35;
  NSObject *v36;
  _BYTE *v37;
  NSObject *v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  std::string *v42;
  int v43;
  std::string::size_type v44;
  std::string *v45;
  std::string *v46;
  NSObject *v47;
  unint64_t v48;
  std::string *v49;
  std::string *v50;
  int v51;
  std::string::size_type v52;
  std::string *v53;
  std::string *v54;
  uint64_t value;
  id v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  char *v60;
  char *j;
  WifiSensor *v62;
  id v63;
  id v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  __int128 v68;
  std::string v69;
  double v70;
  unsigned int v71;
  char v72;
  char v73;
  int v74;
  unsigned int v75;
  unsigned int v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  void *v81;
  char *v82;
  unint64_t v83;
  std::string v84;
  std::string v85;
  int v86;
  _BYTE v87[12];
  __int16 v88;
  _BYTE v89[18];
  __int128 v90;
  char v91;
  _BYTE v92[128];
  std::string buf;
  double v94;

  v63 = a3;
  v64 = a4;
  if ((objc_msgSend(v64, "cachedScan") & 1) == 0)
  {
    v6 = (*(uint64_t (**)(WifiScanStrategy *, id, id))(*(_QWORD *)self->_scanStrategy.__ptr_ + 40))(self->_scanStrategy.__ptr_, objc_msgSend(v64, "timestamp"), v63);
    v7 = (WifiScannerSettings *)objc_claimAutoreleasedReturnValue(v6);
    nextSettings = self->_nextSettings;
    self->_nextSettings = v7;

  }
  v81 = 0;
  v82 = 0;
  v83 = 0;
  sub_1000547D8((uint64_t)&v81, (unint64_t)objc_msgSend(v63, "count"));
  if (self->_previousScanTimestamp.m_initialized)
    v9 = (double)((unint64_t)objc_msgSend(v64, "timestamp")
                - *(_QWORD *)((char *)&self->_previousScanTimestamp.m_storage.dummy_.aligner_ + 7))
       / 1000000.0;
  else
    v9 = 1.79769313e308;
  v10 = objc_msgSend(v64, "timestamp");
  if (!self->_previousScanTimestamp.m_initialized)
    self->_previousScanTimestamp.m_initialized = 1;
  v62 = self;
  *(_QWORD *)((char *)&self->_previousScanTimestamp.m_storage.dummy_.aligner_ + 7) = v10;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v11 = v63;
  v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
  v13 = &OBJC_METACLASS___CLPrefetchFloorRequest;
  if (!v12)
  {
    v15 = 0;
    v14 = 0;
    v65 = 0;
    v36 = v11;
    goto LABEL_88;
  }
  v65 = 0;
  v14 = 0;
  v15 = 0;
  v66 = 0;
  v67 = *(_QWORD *)v78;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(_QWORD *)v78 != v67)
        objc_enumerationMutation(v11);
      v17 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bssid"));
      v19 = v18;
      if (v18)
        objc_msgSend(v18, "ps_STLString");
      else
        memset(&buf, 0, sizeof(buf));
      sub_100054BDC((unint64_t)&buf, (uint64_t)v87);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf.__r_.__value_.__l.__data_);

      if (!v87[0])
      {
        if (v13[95].isa == (__objc2_class *)-1)
        {
          v21 = (id)qword_100417EE0;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            goto LABEL_25;
        }
        else
        {
          dispatch_once(&qword_100417ED8, &stru_100404E58);
          v21 = (id)qword_100417EE0;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
LABEL_25:
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bssid"));
            v23 = v22;
            if (v22)
            {
              objc_msgSend(v22, "ps_STLString");
              p_buf = &buf;
              if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
            }
            else
            {
              memset(&buf, 0, sizeof(buf));
              p_buf = &buf;
            }
            LODWORD(v85.__r_.__value_.__l.__data_) = 136380675;
            *(std::string::size_type *)((char *)v85.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_buf;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "ap %{private}s filtered out. invalid mac address", (uint8_t *)&v85, 0xCu);
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
              operator delete(buf.__r_.__value_.__l.__data_);

          }
        }

        ++v66;
        if (v91 < 0)
          goto LABEL_11;
        continue;
      }
      v20 = *(int *)&v87[8] >> 31;
      if (*(int *)&v87[8] >> 31 == *(_DWORD *)&v87[8])
      {
        v85.__r_.__value_.__l.__size_ = *(_QWORD *)&v89[2];
        v20 = *(_DWORD *)&v87[8];
      }
      else
      {
        *(_OWORD *)&v85.__r_.__value_.__r.__words[1] = *(_OWORD *)&v89[2];
        v86 = v90;
      }
      LODWORD(v85.__r_.__value_.__l.__data_) = v20 ^ *(_DWORD *)&v87[8];
      if (v9 * 1000000.0 <= (double)(uint64_t)objc_msgSend(v17, "age"))
      {
        if (v13[95].isa == (__objc2_class *)-1)
        {
          v25 = (id)qword_100417EE0;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            goto LABEL_33;
        }
        else
        {
          dispatch_once(&qword_100417ED8, &stru_100404E58);
          v25 = (id)qword_100417EE0;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
LABEL_33:
            v69.__r_.__value_.__r.__words[0] = (std::string::size_type)&v70;
            if (LODWORD(v85.__r_.__value_.__l.__data_) != SLODWORD(v85.__r_.__value_.__l.__data_) >> 31)
              sub_1001D79E4();
            std::to_string(&v84, v85.__r_.__value_.__l.__size_);
            v27 = v11;
            v28 = SHIBYTE(v84.__r_.__value_.__r.__words[2]);
            v29 = v84.__r_.__value_.__r.__words[0];
            v30 = objc_msgSend(v17, "age");
            v31 = &v84;
            if (v28 < 0)
              v31 = (std::string *)v29;
            LODWORD(buf.__r_.__value_.__l.__data_) = 136381187;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v31;
            WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
            *(double *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (double)(uint64_t)v30 / 1000000.0;
            HIWORD(buf.__r_.__value_.__r.__words[2]) = 2048;
            v94 = v9;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "ap %{private}s filtered out. %f ms old, %f ms since last scan", (uint8_t *)&buf, 0x20u);
            if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v84.__r_.__value_.__l.__data_);
            v11 = v27;
            v13 = &OBJC_METACLASS___CLPrefetchFloorRequest;
          }
        }

        ++v15;
        if (v91 < 0)
          goto LABEL_11;
        continue;
      }
      if (objc_msgSend(v17, "personalHotspot"))
      {
        if (v13[95].isa == (__objc2_class *)-1)
        {
          v26 = (id)qword_100417EE0;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            goto LABEL_38;
        }
        else
        {
          dispatch_once(&qword_100417ED8, &stru_100404E58);
          v26 = (id)qword_100417EE0;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
LABEL_38:
            v69.__r_.__value_.__r.__words[0] = (std::string::size_type)&v70;
            if (LODWORD(v85.__r_.__value_.__l.__data_) != SLODWORD(v85.__r_.__value_.__l.__data_) >> 31)
              sub_1001D79E4();
            std::to_string(&buf, v85.__r_.__value_.__l.__size_);
            v35 = &buf;
            if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
              v35 = (std::string *)buf.__r_.__value_.__r.__words[0];
            LODWORD(v84.__r_.__value_.__l.__data_) = 136380675;
            *(std::string::size_type *)((char *)v84.__r_.__value_.__r.__words + 4) = (std::string::size_type)v35;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "ap %{private}s filtered out - personal hotspot", (uint8_t *)&v84, 0xCu);
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
              operator delete(buf.__r_.__value_.__l.__data_);
          }
        }

        ++v14;
        if (v91 < 0)
          goto LABEL_11;
        continue;
      }
      if (objc_msgSend(v17, "requestsAnonymity"))
      {
        ++v65;
        if (v91 < 0)
          goto LABEL_11;
      }
      else
      {
        v69.__r_.__value_.__r.__words[0] = 0;
        v69.__r_.__value_.__r.__words[0] = (std::string::size_type)objc_msgSend(v64, "timestamp");
        v76 = objc_msgSend(v17, "rssi");
        v75 = objc_msgSend(v17, "channelFlags");
        v74 = sub_1000B7B10((int)objc_msgSend(v17, "channel"));
        v73 = objc_msgSend(v17, "adHoc") ^ 1;
        v72 = objc_msgSend(v17, "personalHotspot");
        v71 = objc_msgSend(v17, "mode");
        v32 = (double)(uint64_t)objc_msgSend(v17, "age") / 1000000000.0;
        v70 = v32;
        v33 = v82;
        if ((unint64_t)v82 >= v83)
        {
          v82 = (char *)sub_1002F623C(&v81, (int *)&v85, (int *)&v76, (int *)&v75, &v74, &v73, &v72, (int *)&v71, &v70, (uint64_t *)&v69);
          if (v91 < 0)
            goto LABEL_11;
        }
        else
        {
          data = SLODWORD(v85.__r_.__value_.__l.__data_) >> 31;
          if (SLODWORD(v85.__r_.__value_.__l.__data_) >> 31 == LODWORD(v85.__r_.__value_.__l.__data_))
          {
            buf.__r_.__value_.__l.__size_ = v85.__r_.__value_.__l.__size_;
            data = (int)v85.__r_.__value_.__l.__data_;
          }
          else
          {
            *(_OWORD *)&buf.__r_.__value_.__r.__words[1] = *(_OWORD *)&v85.__r_.__value_.__r.__words[1];
            LODWORD(v94) = v86;
          }
          LODWORD(buf.__r_.__value_.__l.__data_) = data ^ LODWORD(v85.__r_.__value_.__l.__data_);
          HIDWORD(v84.__r_.__value_.__r.__words[0]) = v75;
          v84.__r_.__value_.__s.__data_[0] = 1;
          sub_100054B44((uint64_t)v82, &buf, (uint64_t)&v84, v74, v73, v72, v71, (uint64_t)v69.__r_.__value_.__l.__data_, (double)(int)v76, v32);
          v82 = v33 + 88;
          if (v91 < 0)
          {
LABEL_11:
            operator delete(*((void **)&v90 + 1));
            continue;
          }
        }
      }
    }
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
  }
  while (v12);

  if (v66)
  {
    if (v13[95].isa == (__objc2_class *)-1)
    {
      v36 = (id)qword_100417EE0;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
LABEL_82:
        std::to_string((std::string *)v87, v66);
        if (v89[9] >= 0)
          v37 = v87;
        else
          v37 = *(_BYTE **)v87;
        LODWORD(buf.__r_.__value_.__l.__data_) = 136380675;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Omitting %{private}s APs with invalid mac address", (uint8_t *)&buf, 0xCu);
        if ((v89[9] & 0x80000000) != 0)
          operator delete(*(void **)v87);
      }
    }
    else
    {
      dispatch_once(&qword_100417ED8, &stru_100404E58);
      v36 = (id)qword_100417EE0;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        goto LABEL_82;
    }
LABEL_88:

  }
  if (!(v15 | v14))
  {
    v14 = 0;
    goto LABEL_109;
  }
  if (v13[95].isa != (__objc2_class *)-1)
  {
    dispatch_once(&qword_100417ED8, &stru_100404E58);
    v38 = (id)qword_100417EE0;
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      goto LABEL_108;
LABEL_92:
    v39 = v15;
    v40 = v14;
    v41 = v39;
    std::to_string(&buf, v39);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v42 = &buf;
    else
      v42 = (std::string *)buf.__r_.__value_.__r.__words[0];
    std::to_string(&v85, v40);
    v43 = SHIBYTE(v85.__r_.__value_.__r.__words[2]);
    v44 = v85.__r_.__value_.__r.__words[0];
    std::to_string(&v84, v65);
    v45 = &v85;
    if (v43 < 0)
      v45 = (std::string *)v44;
    if ((v84.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v46 = &v84;
    else
      v46 = (std::string *)v84.__r_.__value_.__r.__words[0];
    *(_DWORD *)v87 = 136381187;
    *(_QWORD *)&v87[4] = v42;
    v88 = 2081;
    *(_QWORD *)v89 = v45;
    *(_WORD *)&v89[8] = 2081;
    *(_QWORD *)&v89[10] = v46;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Omitting %{private}s old APs, %{private}s hotspots, and %{private}s private APs", v87, 0x20u);
    if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v84.__r_.__value_.__l.__data_);
      v14 = v40;
      v13 = &OBJC_METACLASS___CLPrefetchFloorRequest;
      if ((SHIBYTE(v85.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_102:
        v15 = v41;
        if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_108;
LABEL_107:
        operator delete(buf.__r_.__value_.__l.__data_);
        goto LABEL_108;
      }
    }
    else
    {
      v14 = v40;
      v13 = &OBJC_METACLASS___CLPrefetchFloorRequest;
      if ((SHIBYTE(v85.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_102;
    }
    operator delete(v85.__r_.__value_.__l.__data_);
    v15 = v41;
    if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_108;
    goto LABEL_107;
  }
  v38 = (id)qword_100417EE0;
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    goto LABEL_92;
LABEL_108:

LABEL_109:
  if (v81 != v82 || !-[NSObject count](v11, "count"))
    goto LABEL_132;
  if (v13[95].isa != (__objc2_class *)-1)
  {
    dispatch_once(&qword_100417ED8, &stru_100404E58);
    v47 = (id)qword_100417EE0;
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      goto LABEL_131;
LABEL_113:
    v48 = v14;
    v49 = &buf;
    std::to_string(&buf, (unint64_t)-[NSObject count](v11, "count"));
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v49 = (std::string *)buf.__r_.__value_.__r.__words[0];
    v50 = &v85;
    std::to_string(&v85, v15);
    if ((v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v50 = (std::string *)v85.__r_.__value_.__r.__words[0];
    std::to_string(&v84, v48);
    v51 = SHIBYTE(v84.__r_.__value_.__r.__words[2]);
    v52 = v84.__r_.__value_.__r.__words[0];
    std::to_string(&v69, v65);
    v53 = &v84;
    if (v51 < 0)
      v53 = (std::string *)v52;
    if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v54 = &v69;
    else
      v54 = (std::string *)v69.__r_.__value_.__r.__words[0];
    *(_DWORD *)v87 = 136381443;
    *(_QWORD *)&v87[4] = v49;
    v88 = 2081;
    *(_QWORD *)v89 = v50;
    *(_WORD *)&v89[8] = 2081;
    *(_QWORD *)&v89[10] = v53;
    LOWORD(v90) = 2081;
    *(_QWORD *)((char *)&v90 + 2) = v54;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "All aps filtered out (actually received %{private}s). %{private}s were too old. %{private}s were personal. %{private}s were private", v87, 0x2Au);
    if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v69.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v84.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_124:
        if ((SHIBYTE(v85.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_125;
        goto LABEL_129;
      }
    }
    else if ((SHIBYTE(v84.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_124;
    }
    operator delete(v84.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v85.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_125:
      if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_131;
LABEL_130:
      operator delete(buf.__r_.__value_.__l.__data_);
      goto LABEL_131;
    }
LABEL_129:
    operator delete(v85.__r_.__value_.__l.__data_);
    if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_131;
    goto LABEL_130;
  }
  v47 = (id)qword_100417EE0;
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    goto LABEL_113;
LABEL_131:

LABEL_132:
  value = (uint64_t)v62->fSensorBridge.__ptr_.__value_;
  v56 = objc_msgSend(v64, "timestamp");
  sub_100055B14(&v68, v64);
  sub_100054960(value, (uint64_t)v56, &v68, (uint64_t *)&v81);
  v57 = (std::__shared_weak_count *)*((_QWORD *)&v68 + 1);
  if (*((_QWORD *)&v68 + 1))
  {
    v58 = (unint64_t *)(*((_QWORD *)&v68 + 1) + 8);
    do
      v59 = __ldaxr(v58);
    while (__stlxr(v59 - 1, v58));
    if (!v59)
    {
      ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
      std::__shared_weak_count::__release_weak(v57);
    }
  }
  v60 = (char *)v81;
  if (v81)
  {
    for (j = v82; j != v60; j -= 88)
    {
      if (*(j - 48))
        *(j - 48) = 0;
    }
    v82 = v60;
    operator delete(v60);
  }

}

- (void)updateWifiSettingsForNextScan:(id)a3
{
  id v4;
  void *v5;
  void *v6[2];
  char v7;
  std::string __p;

  v4 = a3;
  if (!self->_nextSettings)
  {
    sub_1000D5048(v6, "");
    sub_10023DC18("No settings available for scan", &__p);
    sub_100174738((uint64_t)v6, (uint64_t)&__p, 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v7 < 0)
      operator delete(v6[0]);
    sub_1000F2AE4((uint64_t)&v5);
  }
  objc_msgSend(v4, "updateFrom:");

}

- (void)strategyChanged:(const void *)a3
{
  __shared_weak_count *v3;
  WifiScanStrategy *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;

  v4 = *(WifiScanStrategy **)a3;
  v3 = (__shared_weak_count *)*((_QWORD *)a3 + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->_scanStrategy.__cntrl_;
  self->_scanStrategy.__ptr_ = v4;
  self->_scanStrategy.__cntrl_ = v3;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (BOOL)sensorPresent
{
  return -[NewWifiScanner sensorPresent](self->_scanner, "sensorPresent");
}

- (void)getSensor
{
  return self->fSensorBridge.__ptr_.__value_;
}

- (void)dealloc
{
  objc_super v3;

  -[WifiSensor invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WifiSensor;
  -[WifiSensor dealloc](&v3, "dealloc");
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_BYTE *)self + 56) = 0;
  return self;
}

- (id)currentScanOptions
{
  return self->_nextSettings;
}

@end
