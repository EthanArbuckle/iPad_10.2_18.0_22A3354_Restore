@implementation CSMSLDataRecording

- (CSMSLDataRecording)initWithURL:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  _BYTE *v20;
  NSObject *v21;
  _BYTE *v22;
  void *v23;
  void *v25;
  id v26;
  objc_super v27;
  __int128 v28;
  _BYTE buf[24];
  char v30;
  void *v31;
  char v32;
  void *__p;
  char v34;
  int v35;
  uint64_t v36;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CSMSLDataRecording;
  v6 = -[CSMSLDataRecording init](&v27, "init");
  if (v6)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByDeletingLastPathComponent"));

    v26 = 0;
    v9 = objc_msgSend(v25, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v26);
    v10 = v26;
    objc_storeStrong((id *)v6 + 6, a3);
    if ((v9 & 1) == 0)
    {
      if (qword_1003873F0 != -1)
        dispatch_once(&qword_1003873F0, &stru_1003587E8);
      v11 = qword_1003873F8;
      if (os_log_type_enabled((os_log_t)qword_1003873F8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Unable to create %@ directory: %@", buf, 0x16u);
      }
    }
    v12 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.anomalydetectiond"));
    objc_msgSend(v12, "setBool:forKey:", 1, CFSTR("LoggingEnabled"));
    if (qword_1003873F0 != -1)
      dispatch_once(&qword_1003873F0, &stru_1003587E8);
    v13 = qword_1003873F8;
    if (os_log_type_enabled((os_log_t)qword_1003873F8, OS_LOG_TYPE_DEBUG))
    {
      v14 = *((_QWORD *)v6 + 6);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Writing files to %@.", buf, 0xCu);
    }
    *(_QWORD *)buf = 1048576000;
    *(_QWORD *)&buf[8] = 0x3200015180;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "url"));
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path")));
    sub_100007088(&buf[16], (char *)objc_msgSend(v16, "UTF8String"));
    sub_100007088(&v31, "");
    sub_100007088(&__p, "msl");
    v35 = 4;
    v36 = 300;

    sub_100239670(&v28);
    sub_1000081AC((uint64_t)v6 + 8, &v28);
    v17 = (std::__shared_weak_count *)*((_QWORD *)&v28 + 1);
    if (*((_QWORD *)&v28 + 1))
    {
      v18 = (unint64_t *)(*((_QWORD *)&v28 + 1) + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    if (v30 >= 0)
      v20 = &buf[16];
    else
      v20 = *(_BYTE **)&buf[16];
    if ((CMMsl::Writer::open(*((_QWORD *)v6 + 1), (uint64_t)v20, v35) & 1) == 0)
    {
      if (qword_1003873F0 != -1)
        dispatch_once(&qword_1003873F0, &stru_1003587E8);
      v21 = qword_1003873F8;
      if (os_log_type_enabled((os_log_t)qword_1003873F8, OS_LOG_TYPE_FAULT))
      {
        if (v30 >= 0)
          v22 = &buf[16];
        else
          v22 = *(_BYTE **)&buf[16];
        LODWORD(v28) = 136315138;
        *(_QWORD *)((char *)&v28 + 4) = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "Error opening recording %s", (uint8_t *)&v28, 0xCu);
      }
      sub_100235EEC((_QWORD *)v6 + 1);
    }
    *((_QWORD *)v6 + 3) = 0;
    v23 = (void *)*((_QWORD *)v6 + 7);
    *((_QWORD *)v6 + 7) = 0;

    *((_WORD *)v6 + 17) = 256;
    if (v34 < 0)
      operator delete(__p);
    if (v32 < 0)
      operator delete(v31);
    if (v30 < 0)
      operator delete(*(void **)&buf[16]);

  }
  return (CSMSLDataRecording *)v6;
}

- (void)writeMetadataToDisk:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "absoluteString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("file:%@.metadata"), v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSMSLDataRecording metadata](self, "metadata"));
  v12 = 0;
  v8 = objc_msgSend(v7, "writeToURL:error:", v6, &v12);
  v9 = v12;

  if ((v8 & 1) == 0)
  {
    if (qword_1003873F0 != -1)
      dispatch_once(&qword_1003873F0, &stru_1003587E8);
    v10 = (id)qword_1003873F8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
      *(_DWORD *)buf = 138412290;
      v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "error writing meta data file: %@", buf, 0xCu);

    }
  }

}

- (void)stopAndKeep:(BOOL)a3
{
  _BOOL4 v3;
  Writer *ptr;
  CMMsl::Writer **p_writer;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 ttrManagedMsl;
  NSURL *urlToCopyToOnStop;
  NSObject *v12;
  NSURL *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSURL *url;
  void *v28;
  unsigned __int8 v29;
  id v30;
  NSObject *v31;
  NSURL *v32;
  id v33;
  id v34;
  id v35;
  _BYTE block[24];
  void *v37;
  Writer *v38;

  v3 = a3;
  p_writer = (CMMsl::Writer **)&self->_writer;
  ptr = self->_writer.__ptr_;
  self->_isComplete = 1;
  if (ptr)
  {
    v7 = *((_QWORD *)ptr + 1);
    *(_QWORD *)block = _NSConcreteStackBlock;
    *(_QWORD *)&block[8] = 3221225472;
    *(_QWORD *)&block[16] = sub_1002357D0;
    v37 = &unk_100355AA0;
    v38 = ptr;
    dispatch_sync(v7, block);
    CMMsl::Writer::sync(*p_writer);
    sub_100235EEC(p_writer);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (qword_1003873F0 != -1)
    dispatch_once(&qword_1003873F0, &stru_1003587E8);
  v9 = qword_1003873F8;
  if (os_log_type_enabled((os_log_t)qword_1003873F8, OS_LOG_TYPE_DEFAULT))
  {
    ttrManagedMsl = self->_ttrManagedMsl;
    urlToCopyToOnStop = self->_urlToCopyToOnStop;
    *(_DWORD *)block = 67109634;
    *(_DWORD *)&block[4] = v3;
    *(_WORD *)&block[8] = 1024;
    *(_DWORD *)&block[10] = ttrManagedMsl;
    *(_WORD *)&block[14] = 2112;
    *(_QWORD *)&block[16] = urlToCopyToOnStop;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "stopAndKeep,%d,%d,%@", block, 0x18u);
  }
  if (!v3)
    goto LABEL_32;
  if (self->_ttrManagedMsl && self->_urlToCopyToOnStop)
  {
    if (qword_1003873F0 != -1)
      dispatch_once(&qword_1003873F0, &stru_1003587E8);
    v12 = qword_1003873F8;
    if (os_log_type_enabled((os_log_t)qword_1003873F8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_urlToCopyToOnStop;
      *(_DWORD *)block = 138412290;
      *(_QWORD *)&block[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Copying MSL to: %@", block, 0xCu);
    }
    if (qword_1003873F0 != -1)
      dispatch_once(&qword_1003873F0, &stru_1003587E8);
    v14 = (id)qword_1003873F8;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_url, "path"));
      *(_DWORD *)block = 138412290;
      *(_QWORD *)&block[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "source path: %@", block, 0xCu);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByDeletingLastPathComponent](self->_urlToCopyToOnStop, "URLByDeletingLastPathComponent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "path"));
    v35 = 0;
    objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 1, 0, &v35);
    v18 = v35;

    if (v18)
    {
      if (qword_1003873F0 != -1)
        dispatch_once(&qword_1003873F0, &stru_1003587E8);
      v19 = (id)qword_1003873F8;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "description"));
        *(_DWORD *)block = 138412290;
        *(_QWORD *)&block[4] = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "dir create error: %@", block, 0xCu);

      }
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_url, "path"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_urlToCopyToOnStop, "path"));
    v34 = v18;
    objc_msgSend(v8, "copyItemAtPath:toPath:error:", v21, v22, &v34);
    v23 = v34;

    if (v23)
    {
      if (qword_1003873F0 != -1)
        dispatch_once(&qword_1003873F0, &stru_1003587E8);
      v24 = (id)qword_1003873F8;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "description"));
        *(_DWORD *)block = 138412290;
        *(_QWORD *)&block[4] = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "copy error: %@", block, 0xCu);

      }
    }

  }
  if (self->_shouldDeleteTTR)
  {
LABEL_32:
    if (qword_1003873F0 != -1)
      dispatch_once(&qword_1003873F0, &stru_1003587E8);
    v26 = qword_1003873F8;
    if (os_log_type_enabled((os_log_t)qword_1003873F8, OS_LOG_TYPE_DEBUG))
    {
      url = self->_url;
      *(_DWORD *)block = 138477827;
      *(_QWORD *)&block[4] = url;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "deleting MSL file: %{private}@", block, 0xCu);
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_url, "path"));
    v33 = 0;
    v29 = objc_msgSend(v8, "removeItemAtPath:error:", v28, &v33);
    v30 = v33;

    if ((v29 & 1) == 0)
    {
      if (qword_1003873F0 != -1)
        dispatch_once(&qword_1003873F0, &stru_1003587E8);
      v31 = qword_1003873F8;
      if (os_log_type_enabled((os_log_t)qword_1003873F8, OS_LOG_TYPE_FAULT))
      {
        v32 = self->_url;
        *(_DWORD *)block = 138478083;
        *(_QWORD *)&block[4] = v32;
        *(_WORD *)&block[12] = 2113;
        *(_QWORD *)&block[14] = v30;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "unable to delete file %{private}@: %{private}@", block, 0x16u);
      }
    }

  }
}

- (void)recordAccel800:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  Writer *ptr;
  NSObject *v15;
  void (**v16)(CMMsl::Item *__hidden);
  uint64_t v17;
  CMMsl::Accel800 *v18;
  double v19;
  uint64_t v20;
  char v21;
  _QWORD block[6];

  v4 = a3;
  if (self->_writer.__ptr_)
  {
    v16 = off_100351C90;
    bzero(&v17, 0x260uLL);
    bzero(&v20, 0xBB4uLL);
    CMMsl::Item::makeAccel800((uint64_t)&v16);
    v5 = objc_msgSend(v4, "timestamp");
    v21 |= 1u;
    v19 = (double)(unint64_t)v5 * 0.000001;
    CMMsl::Accel800::makeSuper((uint64_t)v18);
    v6 = *((_QWORD *)v18 + 1);
    v7 = objc_msgSend(v4, "timestamp");
    *(_BYTE *)(v6 + 32) |= 1u;
    *(double *)(v6 + 8) = (double)(unint64_t)v7;
    v8 = *((_QWORD *)v18 + 1);
    v9 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 2);
    *(_BYTE *)(v8 + 32) |= 4u;
    *(_DWORD *)(v8 + 20) = v9;
    v10 = *((_QWORD *)v18 + 1);
    v11 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 3);
    *(_BYTE *)(v10 + 32) |= 8u;
    *(_DWORD *)(v10 + 24) = v11;
    v12 = *((_QWORD *)v18 + 1);
    v13 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 4);
    *(_BYTE *)(v12 + 32) |= 0x10u;
    *(_DWORD *)(v12 + 28) = v13;
    ptr = self->_writer.__ptr_;
    v15 = *((_QWORD *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100235590;
    block[3] = &unk_100355AC0;
    block[4] = ptr;
    block[5] = &v16;
    dispatch_sync(v15, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v16);
  }

}

- (void)recordHgAccel:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  Writer *ptr;
  NSObject *v15;
  void (**v16)(CMMsl::Item *__hidden);
  double v17[77];
  uint64_t v18;
  CMMsl::HgAccel *v19;
  char v20;
  _QWORD block[6];

  v4 = a3;
  if (self->_writer.__ptr_)
  {
    v16 = off_100351C90;
    bzero(v17, 0x260uLL);
    bzero(&v18, 0xBB4uLL);
    CMMsl::Item::makeHgAccel((uint64_t)&v16);
    v5 = objc_msgSend(v4, "timestamp");
    v20 |= 1u;
    v17[76] = (double)(unint64_t)v5 * 0.000001;
    CMMsl::HgAccel::makeSuper((uint64_t)v19);
    v6 = *((_QWORD *)v19 + 1);
    v7 = objc_msgSend(v4, "timestamp");
    *(_BYTE *)(v6 + 32) |= 1u;
    *(double *)(v6 + 8) = (double)(unint64_t)v7;
    v8 = *((_QWORD *)v19 + 1);
    v9 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 2);
    *(_BYTE *)(v8 + 32) |= 4u;
    *(_DWORD *)(v8 + 20) = v9;
    v10 = *((_QWORD *)v19 + 1);
    v11 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 3);
    *(_BYTE *)(v10 + 32) |= 8u;
    *(_DWORD *)(v10 + 24) = v11;
    v12 = *((_QWORD *)v19 + 1);
    v13 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 4);
    *(_BYTE *)(v12 + 32) |= 0x10u;
    *(_DWORD *)(v12 + 28) = v13;
    ptr = self->_writer.__ptr_;
    v15 = *((_QWORD *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100235590;
    block[3] = &unk_100355AC0;
    block[4] = ptr;
    block[5] = &v16;
    dispatch_sync(v15, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v16);
  }

}

- (void)recordDeviceMotion:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  Writer *ptr;
  NSObject *v29;
  void (**v30)(CMMsl::Item *__hidden);
  double v31[77];
  uint64_t v32;
  uint64_t v33;
  char v34;
  _QWORD block[6];

  v4 = a3;
  if (self->_writer.__ptr_)
  {
    v30 = off_100351C90;
    bzero(v31, 0x260uLL);
    bzero(&v32, 0xBB4uLL);
    CMMsl::Item::makeDeviceMotion((uint64_t)&v30);
    v5 = objc_msgSend(v4, "timestamp");
    v34 |= 1u;
    v31[76] = (double)(unint64_t)v5 * 0.000001;
    v6 = v33;
    v7 = objc_msgSend(v4, "timestamp");
    *(_DWORD *)(v6 + 124) |= 0x10u;
    *(double *)(v6 + 40) = (double)(unint64_t)v7;
    v8 = v33;
    v9 = *(float *)objc_msgSend(v4, "c_struct");
    *(_DWORD *)(v8 + 124) |= 2u;
    *(double *)(v8 + 16) = v9;
    v10 = v33;
    v11 = *((float *)objc_msgSend(v4, "c_struct") + 1);
    *(_DWORD *)(v10 + 124) |= 4u;
    *(double *)(v10 + 24) = v11;
    v12 = v33;
    v13 = *((float *)objc_msgSend(v4, "c_struct") + 2);
    *(_DWORD *)(v12 + 124) |= 8u;
    *(double *)(v12 + 32) = v13;
    v14 = v33;
    v15 = *((float *)objc_msgSend(v4, "c_struct") + 3);
    *(_DWORD *)(v14 + 124) |= 1u;
    *(double *)(v14 + 8) = v15;
    v16 = v33;
    v17 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 4);
    *(_DWORD *)(v16 + 124) |= 0x2000u;
    *(_DWORD *)(v16 + 80) = v17;
    v18 = v33;
    v19 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 5);
    *(_DWORD *)(v18 + 124) |= 0x4000u;
    *(_DWORD *)(v18 + 84) = v19;
    v20 = v33;
    v21 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 6);
    *(_DWORD *)(v20 + 124) |= 0x8000u;
    *(_DWORD *)(v20 + 88) = v21;
    v22 = v33;
    v23 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 7);
    *(_DWORD *)(v22 + 124) |= 0x40000u;
    *(_DWORD *)(v22 + 100) = v23;
    v24 = v33;
    v25 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 8);
    *(_DWORD *)(v24 + 124) |= 0x80000u;
    *(_DWORD *)(v24 + 104) = v25;
    v26 = v33;
    v27 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 9);
    *(_DWORD *)(v26 + 124) |= 0x100000u;
    *(_DWORD *)(v26 + 108) = v27;
    ptr = self->_writer.__ptr_;
    v29 = *((_QWORD *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100235590;
    block[3] = &unk_100355AC0;
    block[4] = ptr;
    block[5] = &v30;
    dispatch_sync(v29, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v30);
  }

}

- (void)recordGPS:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  Writer *ptr;
  NSObject *v25;
  void (**v26)(CMMsl::Item *__hidden);
  _QWORD v27[77];
  uint64_t v28;
  uint64_t v29;
  char v30;
  _QWORD block[6];

  v4 = a3;
  if (self->_writer.__ptr_)
  {
    v26 = off_100351C90;
    bzero(v27, 0x260uLL);
    bzero(&v28, 0xBB4uLL);
    CMMsl::Item::makeMotionGPSLocation((uint64_t)&v26);
    v5 = *((double *)objc_msgSend(v4, "c_struct") + 8) * 0.000001;
    v30 |= 1u;
    *(double *)&v27[76] = v5;
    v6 = v29;
    v7 = *((_QWORD *)objc_msgSend(v4, "c_struct") + 8);
    *(_DWORD *)(v6 + 180) |= 0x800u;
    *(_QWORD *)(v6 + 96) = v7;
    v8 = v29;
    v9 = *(float *)objc_msgSend(v4, "c_struct");
    *(_DWORD *)(v8 + 180) |= 0x200u;
    *(double *)(v8 + 80) = v9;
    v10 = v29;
    v11 = *((float *)objc_msgSend(v4, "c_struct") + 1);
    *(_DWORD *)(v10 + 180) |= 0x400u;
    *(double *)(v10 + 88) = v11;
    v12 = v29;
    v13 = *((float *)objc_msgSend(v4, "c_struct") + 2);
    *(_DWORD *)(v12 + 180) |= 2u;
    *(double *)(v12 + 16) = v13;
    v14 = v29;
    v15 = *((float *)objc_msgSend(v4, "c_struct") + 3);
    *(_DWORD *)(v14 + 180) |= 4u;
    *(double *)(v14 + 24) = v15;
    v16 = v29;
    v17 = *((float *)objc_msgSend(v4, "c_struct") + 12);
    *(_DWORD *)(v16 + 180) |= 0x20u;
    *(double *)(v16 + 48) = v17;
    v18 = v29;
    v19 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 13);
    *(_DWORD *)(v18 + 180) |= 0x8000u;
    *(_DWORD *)(v18 + 132) = v19;
    v20 = v29;
    v21 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 14);
    *(_DWORD *)(v20 + 180) |= 0x4000u;
    *(_DWORD *)(v20 + 128) = v21;
    v22 = v29;
    v23 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 15);
    *(_DWORD *)(v22 + 180) |= 0x800000u;
    *(_DWORD *)(v22 + 164) = v23;
    ptr = self->_writer.__ptr_;
    v25 = *((_QWORD *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100235590;
    block[3] = &unk_100355AC0;
    block[4] = ptr;
    block[5] = &v26;
    dispatch_sync(v25, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v26);
  }

}

- (void)recordSteps:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  Writer *ptr;
  NSObject *v17;
  void (**v18)(CMMsl::Item *__hidden);
  double v19[77];
  uint64_t v20;
  uint64_t v21;
  char v22;
  _QWORD block[6];

  v4 = a3;
  if (self->_writer.__ptr_)
  {
    v18 = off_100351C90;
    bzero(v19, 0x260uLL);
    bzero(&v20, 0xBB4uLL);
    CMMsl::Item::makeKappaSteps((uint64_t)&v18);
    v5 = objc_msgSend(v4, "timestamp");
    v22 |= 1u;
    v19[76] = (double)(unint64_t)v5 * 0.000001;
    v6 = v21;
    v7 = *(_QWORD *)objc_msgSend(v4, "c_struct");
    *(_BYTE *)(v6 + 32) |= 1u;
    *(_QWORD *)(v6 + 8) = v7;
    v8 = v21;
    v9 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 2);
    *(_BYTE *)(v8 + 32) |= 0x10u;
    *(_DWORD *)(v8 + 28) = v9;
    v10 = v21;
    v11 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 3);
    *(_BYTE *)(v10 + 32) |= 4u;
    *(_DWORD *)(v10 + 20) = v11;
    v12 = v21;
    v13 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 4);
    *(_BYTE *)(v12 + 32) |= 2u;
    *(_DWORD *)(v12 + 16) = v13;
    v14 = v21;
    v15 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 20);
    *(_BYTE *)(v14 + 32) |= 8u;
    *(_DWORD *)(v14 + 24) = v15;
    ptr = self->_writer.__ptr_;
    v17 = *((_QWORD *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100235590;
    block[3] = &unk_100355AC0;
    block[4] = ptr;
    block[5] = &v18;
    dispatch_sync(v17, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v18);
  }

}

- (void)recordKappaTrigger:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v25;
  uint64_t v28;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v44;
  uint64_t v47;
  uint64_t v50;
  int v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  int v55;
  Writer *ptr;
  NSObject *v57;
  void (**v58)(CMMsl::Item *__hidden);
  _QWORD v59[77];
  uint64_t v60;
  uint64_t v61;
  char v62;
  _QWORD block[6];

  v4 = a3;
  self->_triggerTime = (unint64_t)objc_msgSend(v4, "timestamp");
  if (self->_writer.__ptr_)
  {
    v58 = off_100351C90;
    bzero(v59, 0x260uLL);
    bzero(&v60, 0xBB4uLL);
    CMMsl::Item::makeKappaTrigger((uint64_t)&v58);
    v5 = (double)*((unint64_t *)objc_msgSend(v4, "c_struct") + 1) * 0.000001;
    v62 |= 1u;
    *(double *)&v59[76] = v5;
    v6 = v61;
    v7 = *((_QWORD *)objc_msgSend(v4, "c_struct") + 1);
    *(_DWORD *)(v6 + 212) |= 4u;
    *(_QWORD *)(v6 + 96) = v7;
    v8 = v61;
    v9 = *(_BYTE *)objc_msgSend(v4, "c_struct") & 1;
    *(_DWORD *)(v8 + 212) |= 0x20000000u;
    *(_BYTE *)(v8 + 209) = v9;
    v10 = v61;
    v11 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 4);
    *(_DWORD *)(v10 + 212) |= 0x10u;
    *(_DWORD *)(v10 + 112) = v11;
    v12 = v61;
    v13 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 5);
    *(_DWORD *)(v12 + 212) |= 0x100u;
    *(_DWORD *)(v12 + 128) = v13;
    v14 = v61;
    v15 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 1);
    *(_DWORD *)(v14 + 212) |= 0x1000000u;
    *(_DWORD *)(v14 + 192) = v15;
    v16 = v61;
    v17 = *((char *)objc_msgSend(v4, "c_struct") + 28);
    *(_DWORD *)(v16 + 212) |= 0x20u;
    *(_DWORD *)(v16 + 116) = v17;
    v18 = v61;
    _H0 = *((_WORD *)objc_msgSend(v4, "c_struct") + 20);
    __asm { FCVT            S0, H0 }
    *(_DWORD *)(v18 + 212) |= 0x2000000u;
    *(_DWORD *)(v18 + 196) = _S0;
    v25 = v61;
    _H0 = *((_WORD *)objc_msgSend(v4, "c_struct") + 21);
    __asm { FCVT            S0, H0 }
    *(_DWORD *)(v25 + 212) |= 0x4000000u;
    *(_DWORD *)(v25 + 200) = _S0;
    v28 = v61;
    _H0 = *((_WORD *)objc_msgSend(v4, "c_struct") + 22);
    __asm { FCVT            S0, H0 }
    *(_DWORD *)(v28 + 212) |= 0x8000000u;
    *(_DWORD *)(v28 + 204) = _S0;
    v31 = v61;
    v32 = *((_QWORD *)objc_msgSend(v4, "c_struct") + 4);
    *(_DWORD *)(v31 + 212) |= 8u;
    *(_QWORD *)(v31 + 104) = v32;
    v33 = v61;
    v34 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 46);
    *(_DWORD *)(v33 + 212) |= 0x800u;
    *(_DWORD *)(v33 + 140) = v34;
    v35 = v61;
    v36 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 47);
    *(_DWORD *)(v35 + 212) |= 0x80u;
    *(_DWORD *)(v35 + 124) = v36;
    v37 = v61;
    v38 = *((_QWORD *)objc_msgSend(v4, "c_struct") + 7);
    *(_DWORD *)(v37 + 212) |= 2u;
    *(_QWORD *)(v37 + 88) = v38;
    v39 = v61;
    v40 = *((_BYTE *)objc_msgSend(v4, "c_struct") + 94);
    *(_DWORD *)(v39 + 212) |= 0x40000000u;
    *(_BYTE *)(v39 + 210) = v40;
    v41 = v61;
    _H0 = *((_WORD *)objc_msgSend(v4, "c_struct") + 49);
    __asm { FCVT            S0, H0 }
    *(_DWORD *)(v41 + 212) |= 0x1000u;
    *(_DWORD *)(v41 + 144) = _S0;
    v44 = v61;
    _H0 = *((_WORD *)objc_msgSend(v4, "c_struct") + 50);
    __asm { FCVT            S0, H0 }
    *(_DWORD *)(v44 + 212) |= 0x200u;
    *(_DWORD *)(v44 + 132) = _S0;
    v47 = v61;
    _H0 = *((_WORD *)objc_msgSend(v4, "c_struct") + 51);
    __asm { FCVT            S0, H0 }
    *(_DWORD *)(v47 + 212) |= 0x40u;
    *(_DWORD *)(v47 + 120) = _S0;
    v50 = v61;
    v51 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 104);
    *(_DWORD *)(v50 + 212) |= 0x200000u;
    *(_DWORD *)(v50 + 180) = v51;
    v52 = v61;
    v53 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 92);
    *(_DWORD *)(v52 + 212) |= 0x400u;
    *(_DWORD *)(v52 + 136) = v53;
    v54 = v61;
    v55 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 93);
    *(_DWORD *)(v54 + 212) |= 0x800000u;
    *(_DWORD *)(v54 + 188) = v55;
    ptr = self->_writer.__ptr_;
    v57 = *((_QWORD *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100235590;
    block[3] = &unk_100355AC0;
    block[4] = ptr;
    block[5] = &v58;
    dispatch_sync(v57, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v58);
  }

}

- (void)recordPressure:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  Writer *ptr;
  NSObject *v13;
  void (**v14)(CMMsl::Item *__hidden);
  _QWORD v15[77];
  uint64_t v16;
  uint64_t v17;
  char v18;
  _QWORD block[6];

  v4 = a3;
  if (self->_writer.__ptr_)
  {
    v14 = off_100351C90;
    bzero(v15, 0x260uLL);
    bzero(&v16, 0xBB4uLL);
    CMMsl::Item::makePressure((uint64_t)&v14);
    v5 = (double)*(unint64_t *)objc_msgSend(v4, "c_struct") * 0.000001;
    v18 |= 1u;
    *(double *)&v15[76] = v5;
    v6 = v17;
    v7 = (double)*(unint64_t *)objc_msgSend(v4, "c_struct");
    *(_BYTE *)(v6 + 24) |= 1u;
    *(double *)(v6 + 8) = v7;
    v8 = v17;
    v9 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 2);
    *(_BYTE *)(v8 + 24) |= 2u;
    *(_DWORD *)(v8 + 16) = v9;
    v10 = v17;
    v11 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 3);
    *(_BYTE *)(v10 + 24) |= 4u;
    *(_DWORD *)(v10 + 20) = v11;
    ptr = self->_writer.__ptr_;
    v13 = *((_QWORD *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100235590;
    block[3] = &unk_100355AC0;
    block[4] = ptr;
    block[5] = &v14;
    dispatch_sync(v13, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v14);
  }

}

- (void)recordSoundPressureLevel:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  Writer *ptr;
  NSObject *v11;
  void (**v12)(CMMsl::Item *__hidden);
  _QWORD v13[77];
  uint64_t v14;
  uint64_t v15;
  char v16;
  _QWORD block[6];

  v4 = a3;
  if (self->_writer.__ptr_)
  {
    v12 = off_100351C90;
    bzero(v13, 0x260uLL);
    bzero(&v14, 0xBB4uLL);
    CMMsl::Item::makeSpl((uint64_t)&v12);
    v5 = (double)*(unint64_t *)objc_msgSend(v4, "c_struct") * 0.000001;
    v16 |= 1u;
    *(double *)&v13[76] = v5;
    v6 = v15;
    v7 = *(_QWORD *)objc_msgSend(v4, "c_struct");
    *(_BYTE *)(v6 + 20) |= 1u;
    *(_QWORD *)(v6 + 8) = v7;
    v8 = v15;
    v9 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 2);
    *(_BYTE *)(v8 + 20) |= 2u;
    *(_DWORD *)(v8 + 16) = v9;
    ptr = self->_writer.__ptr_;
    v11 = *((_QWORD *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100235590;
    block[3] = &unk_100355AC0;
    block[4] = ptr;
    block[5] = &v12;
    dispatch_sync(v11, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v12);
  }

}

- (void)recordAccel:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  Writer *ptr;
  NSObject *v15;
  void (**v16)(CMMsl::Item *__hidden);
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  char v21;
  _QWORD block[6];

  v4 = a3;
  if (self->_writer.__ptr_)
  {
    v16 = off_100351C90;
    bzero(&v17, 0x260uLL);
    bzero(&v20, 0xBB4uLL);
    CMMsl::Item::makeAccel((uint64_t)&v16);
    v5 = objc_msgSend(v4, "timestamp");
    v21 |= 1u;
    v19 = (double)(unint64_t)v5 * 0.000001;
    v6 = v18;
    v7 = objc_msgSend(v4, "timestamp");
    *(_BYTE *)(v6 + 32) |= 1u;
    *(double *)(v6 + 8) = (double)(unint64_t)v7;
    v8 = v18;
    v9 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 2);
    *(_BYTE *)(v8 + 32) |= 4u;
    *(_DWORD *)(v8 + 20) = v9;
    v10 = v18;
    v11 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 3);
    *(_BYTE *)(v10 + 32) |= 8u;
    *(_DWORD *)(v10 + 24) = v11;
    v12 = v18;
    v13 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 4);
    *(_BYTE *)(v12 + 32) |= 0x10u;
    *(_DWORD *)(v12 + 28) = v13;
    ptr = self->_writer.__ptr_;
    v15 = *((_QWORD *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100235590;
    block[3] = &unk_100355AC0;
    block[4] = ptr;
    block[5] = &v16;
    dispatch_sync(v15, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v16);
  }

}

- (void)recordMag:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  Writer *ptr;
  NSObject *v17;
  void (**v18)(CMMsl::Item *__hidden);
  double v19[77];
  uint64_t v20;
  uint64_t v21;
  char v22;
  _QWORD block[6];

  v4 = a3;
  if (self->_writer.__ptr_)
  {
    v18 = off_100351C90;
    bzero(v19, 0x260uLL);
    bzero(&v20, 0xBB4uLL);
    CMMsl::Item::makeMagnetometer((uint64_t)&v18);
    v5 = objc_msgSend(v4, "timestamp");
    v22 |= 1u;
    v19[76] = (double)(unint64_t)v5 * 0.000001;
    v6 = v21;
    v7 = objc_msgSend(v4, "timestamp");
    *(_BYTE *)(v6 + 36) |= 1u;
    *(double *)(v6 + 8) = (double)(unint64_t)v7;
    v8 = v21;
    v9 = *(_DWORD *)objc_msgSend(v4, "c_struct");
    *(_BYTE *)(v8 + 36) |= 8u;
    *(_DWORD *)(v8 + 24) = v9;
    v10 = v21;
    v11 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 1);
    *(_BYTE *)(v10 + 36) |= 0x10u;
    *(_DWORD *)(v10 + 28) = v11;
    v12 = v21;
    v13 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 2);
    *(_BYTE *)(v12 + 36) |= 0x20u;
    *(_DWORD *)(v12 + 32) = v13;
    v14 = v21;
    v15 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 3);
    *(_BYTE *)(v14 + 36) |= 4u;
    *(_DWORD *)(v14 + 20) = v15;
    ptr = self->_writer.__ptr_;
    v17 = *((_QWORD *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100235590;
    block[3] = &unk_100355AC0;
    block[4] = ptr;
    block[5] = &v18;
    dispatch_sync(v17, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v18);
  }

}

- (void)recordPressureCalibration:(id)a3
{
  id v4;
  double triggerTime;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  Writer *ptr;
  NSObject *v19;
  void (**v20)(CMMsl::Item *__hidden);
  _QWORD v21[77];
  uint64_t v22;
  uint64_t v23;
  char v24;
  _QWORD block[6];

  v4 = a3;
  if (self->_writer.__ptr_)
  {
    v20 = off_100351C90;
    bzero(v21, 0x260uLL);
    bzero(&v22, 0xBB4uLL);
    CMMsl::Item::makePressureCalibration((uint64_t)&v20);
    triggerTime = (double)self->_triggerTime;
    v24 |= 1u;
    *(double *)&v21[76] = triggerTime;
    v6 = v23;
    objc_msgSend(v4, "medianToc");
    *(_BYTE *)(v6 + 32) |= 0x20u;
    *(_DWORD *)(v6 + 28) = v7;
    v8 = v23;
    objc_msgSend(v4, "medTocFactoryTemp");
    *(_BYTE *)(v8 + 32) |= 0x10u;
    *(_DWORD *)(v8 + 24) = v9;
    v10 = v23;
    objc_msgSend(v4, "maxTemp");
    *(_BYTE *)(v10 + 32) |= 8u;
    *(_DWORD *)(v10 + 20) = v11;
    v12 = v23;
    objc_msgSend(v4, "inertialX");
    *(_BYTE *)(v12 + 32) |= 1u;
    *(_DWORD *)(v12 + 8) = v13;
    v14 = v23;
    objc_msgSend(v4, "inertialY");
    *(_BYTE *)(v14 + 32) |= 2u;
    *(_DWORD *)(v14 + 12) = v15;
    v16 = v23;
    objc_msgSend(v4, "inertialZ");
    *(_BYTE *)(v16 + 32) |= 4u;
    *(_DWORD *)(v16 + 16) = v17;
    ptr = self->_writer.__ptr_;
    v19 = *((_QWORD *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100235590;
    block[3] = &unk_100355AC0;
    block[4] = ptr;
    block[5] = &v20;
    dispatch_sync(v19, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v20);
  }

}

- (void)recordRemoteAudioOutput:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  __int16 v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  __int16 v30;
  char v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  char v43;
  __int16 v44;
  char v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  char v51;
  __int16 v52;
  char v53;
  Writer *ptr;
  NSObject *v55;
  void (**v56)(CMMsl::Item *__hidden);
  _QWORD v57[77];
  uint64_t v58;
  uint64_t v59;
  char v60;
  _QWORD block[6];

  v4 = a3;
  if (self->_writer.__ptr_)
  {
    v56 = off_100351C90;
    bzero(v57, 0x260uLL);
    bzero(&v58, 0xBB4uLL);
    CMMsl::Item::makeKappaRemoteAudioResult((uint64_t)&v56);
    v5 = (double)*(unint64_t *)objc_msgSend(v4, "c_struct") * 0.000001;
    v60 |= 1u;
    *(double *)&v57[76] = v5;
    v6 = v59;
    v7 = *(_QWORD *)objc_msgSend(v4, "c_struct");
    *(_QWORD *)(v6 + 204) |= 1uLL;
    *(_QWORD *)(v6 + 8) = v7;
    v8 = v59;
    v9 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 2);
    *(_QWORD *)(v8 + 204) |= 0x200000uLL;
    *(_DWORD *)(v8 + 108) = v9;
    v10 = v59;
    v11 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 3);
    *(_QWORD *)(v10 + 204) |= 0x2000uLL;
    *(_DWORD *)(v10 + 76) = v11;
    v12 = v59;
    v13 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 4);
    *(_QWORD *)(v12 + 204) |= 0x20uLL;
    *(_DWORD *)(v12 + 44) = v13;
    v14 = v59;
    v15 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 5);
    *(_QWORD *)(v14 + 204) |= 0x2000000uLL;
    *(_DWORD *)(v14 + 124) = v15;
    v16 = v59;
    v17 = *((_BYTE *)objc_msgSend(v4, "c_struct") + 24);
    *(_QWORD *)(v16 + 204) |= 0x200000000000000uLL;
    *(_BYTE *)(v16 + 180) = v17;
    v18 = v59;
    v19 = *((_BYTE *)objc_msgSend(v4, "c_struct") + 25);
    *(_QWORD *)(v18 + 204) |= 0x200000000uLL;
    *(_BYTE *)(v18 + 156) = v19;
    v20 = v59;
    v21 = *((_BYTE *)objc_msgSend(v4, "c_struct") + 26);
    v22 = *(_WORD *)(v20 + 212);
    v20 += 212;
    v23 = *(_BYTE *)(v20 + 2);
    *(_WORD *)v20 = v22 | 0x200;
    *(_BYTE *)(v20 + 2) = v23;
    *(_BYTE *)(v20 - 16) = v21;
    v24 = v59;
    v25 = *((_BYTE *)objc_msgSend(v4, "c_struct") + 27);
    *(_QWORD *)(v24 + 204) |= 0x20000000000uLL;
    *(_BYTE *)(v24 + 164) = v25;
    v26 = v59;
    v27 = *((_BYTE *)objc_msgSend(v4, "c_struct") + 28);
    *(_QWORD *)(v26 + 204) |= 0x2000000000000uLL;
    *(_BYTE *)(v26 + 172) = v27;
    v28 = v59;
    v29 = *((_BYTE *)objc_msgSend(v4, "c_struct") + 29);
    v30 = *(_WORD *)(v28 + 212);
    v28 += 212;
    v31 = *(_BYTE *)(v28 + 2);
    *(_WORD *)v28 = v30 | 2;
    *(_BYTE *)(v28 + 2) = v31;
    *(_BYTE *)(v28 - 24) = v29;
    v32 = v59;
    v33 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 8);
    *(_QWORD *)(v32 + 204) |= 0x20000uLL;
    *(_DWORD *)(v32 + 92) = v33;
    v34 = v59;
    v35 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 9);
    *(_QWORD *)(v34 + 204) |= 0x200uLL;
    *(_DWORD *)(v34 + 60) = v35;
    v36 = v59;
    v37 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 10);
    *(_QWORD *)(v36 + 204) |= 0x20000000uLL;
    *(_DWORD *)(v36 + 140) = v37;
    v38 = v59;
    v39 = *((_BYTE *)objc_msgSend(v4, "c_struct") + 44);
    *(_QWORD *)(v38 + 204) |= 0x2000000000000000uLL;
    *(_BYTE *)(v38 + 184) = v39;
    v40 = v59;
    v41 = *((_BYTE *)objc_msgSend(v4, "c_struct") + 45);
    *(_QWORD *)(v40 + 204) |= 0x2000000000uLL;
    *(_BYTE *)(v40 + 160) = v41;
    v42 = v59;
    v43 = *((_BYTE *)objc_msgSend(v4, "c_struct") + 46);
    v44 = *(_WORD *)(v42 + 212);
    v42 += 212;
    v45 = *(_BYTE *)(v42 + 2);
    *(_WORD *)v42 = v44 | 0x2000;
    *(_BYTE *)(v42 + 2) = v45;
    *(_BYTE *)(v42 - 12) = v43;
    v46 = v59;
    v47 = *((_BYTE *)objc_msgSend(v4, "c_struct") + 47);
    *(_QWORD *)(v46 + 204) |= 0x200000000000uLL;
    *(_BYTE *)(v46 + 168) = v47;
    v48 = v59;
    v49 = *((_BYTE *)objc_msgSend(v4, "c_struct") + 48);
    *(_QWORD *)(v48 + 204) |= 0x20000000000000uLL;
    *(_BYTE *)(v48 + 176) = v49;
    v50 = v59;
    v51 = *((_BYTE *)objc_msgSend(v4, "c_struct") + 49);
    v52 = *(_WORD *)(v50 + 212);
    v50 += 212;
    v53 = *(_BYTE *)(v50 + 2);
    *(_WORD *)v50 = v52 | 4;
    *(_BYTE *)(v50 + 2) = v53;
    *(_BYTE *)(v50 - 23) = v51;
    ptr = self->_writer.__ptr_;
    v55 = *((_QWORD *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100235590;
    block[3] = &unk_100355AC0;
    block[4] = ptr;
    block[5] = &v56;
    dispatch_sync(v55, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v56);
  }

}

- (void)recordRoadInfo:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  Writer *ptr;
  NSObject *v13;
  void (**v14)(CMMsl::Item *__hidden);
  _QWORD v15[77];
  uint64_t v16;
  uint64_t v17;
  char v18;
  _QWORD block[6];

  v4 = a3;
  if (self->_writer.__ptr_)
  {
    v14 = off_100351C90;
    bzero(v15, 0x260uLL);
    bzero(&v16, 0xBB4uLL);
    CMMsl::Item::makeKappaRoads((uint64_t)&v14);
    v5 = (double)*(unint64_t *)objc_msgSend(v4, "c_struct") * 0.000001;
    v18 |= 1u;
    *(double *)&v15[76] = v5;
    v6 = v17;
    v7 = *(_QWORD *)objc_msgSend(v4, "c_struct");
    *(_BYTE *)(v6 + 32) |= 2u;
    *(_QWORD *)(v6 + 16) = v7;
    v8 = *((double *)objc_msgSend(v4, "c_struct") + 1);
    if (v8 > 1000.0)
      v8 = 1000.0;
    v9 = v17;
    *(_BYTE *)(v17 + 32) |= 4u;
    *(float *)(v9 + 24) = v8;
    v10 = v17;
    v11 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 16);
    *(_BYTE *)(v10 + 32) |= 8u;
    *(_DWORD *)(v10 + 28) = v11;
    ptr = self->_writer.__ptr_;
    v13 = *((_QWORD *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100235590;
    block[3] = &unk_100355AC0;
    block[4] = ptr;
    block[5] = &v14;
    dispatch_sync(v13, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v14);
  }

}

- (void)recordTrustedAudio:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  int v79;
  Writer *ptr;
  NSObject *v81;
  void (**v82)(CMMsl::Item *__hidden);
  _QWORD v83[77];
  uint64_t v84;
  uint64_t v85;
  char v86;
  _QWORD block[6];

  v4 = a3;
  if (self->_writer.__ptr_)
  {
    v82 = off_100351C90;
    bzero(v83, 0x260uLL);
    bzero(&v84, 0xBB4uLL);
    CMMsl::Item::makeSafetyTrustedAudioResult((uint64_t)&v82);
    v5 = (double)*(unint64_t *)objc_msgSend(v4, "c_struct") * 0.000001;
    v86 |= 1u;
    *(double *)&v83[76] = v5;
    v6 = v85;
    v7 = objc_msgSend(v4, "timestamp");
    *(_QWORD *)(v6 + 188) |= 0x100uLL;
    *(_QWORD *)(v6 + 72) = v7;
    v8 = v85;
    v9 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 2);
    *(_QWORD *)(v8 + 188) |= 0x40000uLL;
    *(_DWORD *)(v8 + 116) = v9;
    v10 = v85;
    v11 = *((_QWORD *)objc_msgSend(v4, "c_struct") + 2);
    *(_QWORD *)(v10 + 188) |= 8uLL;
    *(_QWORD *)(v10 + 32) = v11;
    v12 = v85;
    v13 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 6);
    *(_QWORD *)(v12 + 188) |= 0x2000uLL;
    *(_DWORD *)(v12 + 96) = v13;
    v14 = v85;
    v15 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 7);
    *(_QWORD *)(v14 + 188) |= 0x200000uLL;
    *(_DWORD *)(v14 + 128) = v15;
    v16 = v85;
    v17 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 8);
    *(_QWORD *)(v16 + 188) |= 0x20000uLL;
    *(_DWORD *)(v16 + 112) = v17;
    v18 = v85;
    v19 = *((_QWORD *)objc_msgSend(v4, "c_struct") + 5);
    *(_QWORD *)(v18 + 188) |= 4uLL;
    *(_QWORD *)(v18 + 24) = v19;
    v20 = v85;
    v21 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 12);
    *(_QWORD *)(v20 + 188) |= 0x8000uLL;
    *(_DWORD *)(v20 + 104) = v21;
    v22 = v85;
    v23 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 13);
    *(_QWORD *)(v22 + 188) |= 0x100000uLL;
    *(_DWORD *)(v22 + 124) = v23;
    v24 = v85;
    v25 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 14);
    *(_QWORD *)(v24 + 188) |= 0x80000uLL;
    *(_DWORD *)(v24 + 120) = v25;
    v26 = v85;
    v27 = *((_QWORD *)objc_msgSend(v4, "c_struct") + 8);
    *(_QWORD *)(v26 + 188) |= 0x10uLL;
    *(_QWORD *)(v26 + 40) = v27;
    v28 = v85;
    v29 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 18);
    *(_QWORD *)(v28 + 188) |= 0x4000uLL;
    *(_DWORD *)(v28 + 100) = v29;
    v30 = v85;
    v31 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 19);
    *(_QWORD *)(v30 + 188) |= 0x10000uLL;
    *(_DWORD *)(v30 + 108) = v31;
    v32 = v85;
    v33 = *((_BYTE *)objc_msgSend(v4, "c_struct") + 80);
    *(_QWORD *)(v32 + 188) |= 0x800000000uLL;
    *(_BYTE *)(v32 + 184) = v33;
    v34 = v85;
    v35 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 22);
    *(_QWORD *)(v34 + 188) |= 0x8000000uLL;
    *(_DWORD *)(v34 + 152) = v35;
    v36 = v85;
    v37 = *((_QWORD *)objc_msgSend(v4, "c_struct") + 12);
    *(_QWORD *)(v36 + 188) |= 0x40uLL;
    *(_QWORD *)(v36 + 56) = v37;
    v38 = v85;
    v39 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 26);
    *(_QWORD *)(v38 + 188) |= 0x400000uLL;
    *(_DWORD *)(v38 + 132) = v39;
    v40 = v85;
    v41 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 27);
    *(_QWORD *)(v40 + 188) |= 0x40000000uLL;
    *(_DWORD *)(v40 + 164) = v41;
    v42 = v85;
    v43 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 28);
    *(_QWORD *)(v42 + 188) |= 0x4000000uLL;
    *(_DWORD *)(v42 + 148) = v43;
    v44 = v85;
    v45 = *((_QWORD *)objc_msgSend(v4, "c_struct") + 15);
    *(_QWORD *)(v44 + 188) |= 0x20uLL;
    *(_QWORD *)(v44 + 48) = v45;
    v46 = v85;
    v47 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 32);
    *(_QWORD *)(v46 + 188) |= 0x1000000uLL;
    *(_DWORD *)(v46 + 140) = v47;
    v48 = v85;
    v49 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 33);
    *(_QWORD *)(v48 + 188) |= 0x20000000uLL;
    *(_DWORD *)(v48 + 160) = v49;
    v50 = v85;
    v51 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 34);
    *(_QWORD *)(v50 + 188) |= 0x10000000uLL;
    *(_DWORD *)(v50 + 156) = v51;
    v52 = v85;
    v53 = *((_QWORD *)objc_msgSend(v4, "c_struct") + 18);
    *(_QWORD *)(v52 + 188) |= 0x80uLL;
    *(_QWORD *)(v52 + 64) = v53;
    v54 = v85;
    v55 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 38);
    *(_QWORD *)(v54 + 188) |= 0x800000uLL;
    *(_DWORD *)(v54 + 136) = v55;
    v56 = v85;
    v57 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 39);
    *(_QWORD *)(v56 + 188) |= 0x2000000uLL;
    *(_DWORD *)(v56 + 144) = v57;
    v58 = v85;
    v59 = *((_BYTE *)objc_msgSend(v4, "c_struct") + 160);
    *(_QWORD *)(v58 + 188) |= 0x1000000000uLL;
    *(_BYTE *)(v58 + 185) = v59;
    v60 = v85;
    v61 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 46);
    *(_QWORD *)(v60 + 188) |= 0x400uLL;
    *(_DWORD *)(v60 + 84) = v61;
    v62 = v85;
    v63 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 47);
    *(_QWORD *)(v62 + 188) |= 0x1000uLL;
    *(_DWORD *)(v62 + 92) = v63;
    v64 = v85;
    v65 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 48);
    *(_QWORD *)(v64 + 188) |= 0x800uLL;
    *(_DWORD *)(v64 + 88) = v65;
    v66 = v85;
    v67 = *((_QWORD *)objc_msgSend(v4, "c_struct") + 25);
    *(_QWORD *)(v66 + 188) |= 2uLL;
    *(_QWORD *)(v66 + 16) = v67;
    v68 = v85;
    v69 = *((_QWORD *)objc_msgSend(v4, "c_struct") + 26);
    *(_QWORD *)(v68 + 188) |= 1uLL;
    *(_QWORD *)(v68 + 8) = v69;
    v70 = v85;
    v71 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 54);
    *(_QWORD *)(v70 + 188) |= 0x200uLL;
    *(_DWORD *)(v70 + 80) = v71;
    v72 = v85;
    v73 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 42);
    *(_QWORD *)(v72 + 188) |= (unint64_t)&_mh_execute_header;
    *(_DWORD *)(v72 + 172) = v73;
    v74 = v85;
    v75 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 43);
    *(_QWORD *)(v74 + 188) |= 0x400000000uLL;
    *(_DWORD *)(v74 + 180) = v75;
    v76 = v85;
    v77 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 44);
    *(_QWORD *)(v76 + 188) |= 0x200000000uLL;
    *(_DWORD *)(v76 + 176) = v77;
    v78 = v85;
    v79 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 45);
    *(_QWORD *)(v78 + 188) |= 0x80000000uLL;
    *(_DWORD *)(v78 + 168) = v79;
    ptr = self->_writer.__ptr_;
    v81 = *((_QWORD *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100235590;
    block[3] = &unk_100355AC0;
    block[4] = ptr;
    block[5] = &v82;
    dispatch_sync(v81, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v82);
  }

}

- (void)recordActivityPhone:(id)a3
{
  id v4;
  double v5;
  char *v6;
  uint64_t v7;
  char *v8;
  int v9;
  char *v10;
  uint64_t v11;
  char *v12;
  int v13;
  char *v14;
  int v15;
  char *v16;
  int v17;
  char *v18;
  int v19;
  Writer *ptr;
  NSObject *v21;
  void (**v22)(CMMsl::Item *__hidden);
  _QWORD v23[77];
  uint64_t v24;
  char *v25;
  char v26;
  void **block;
  uint64_t v28;
  _QWORD v29[4];

  v4 = a3;
  if (self->_writer.__ptr_)
  {
    v22 = off_100351C90;
    bzero(v23, 0x260uLL);
    bzero(&v24, 0xBB4uLL);
    CMMsl::Item::makeKappaActivityPhone((uint64_t)&v22);
    v5 = (double)*(unint64_t *)objc_msgSend(v4, "c_struct", v22) * 0.000001;
    v26 |= 1u;
    *(double *)&v23[76] = v5;
    v6 = v25;
    v7 = *(_QWORD *)objc_msgSend(v4, "c_struct");
    v6[140] |= 1u;
    *((_QWORD *)v6 + 13) = v7;
    block = (void **)*((_QWORD *)objc_msgSend(v4, "c_struct") + 1);
    LODWORD(v28) = *((_DWORD *)objc_msgSend(v4, "c_struct") + 4);
    sub_100020CE4(v25 + 8, (char *)&block, (uint64_t)&v28 + 4, 3uLL);
    v8 = v25;
    v9 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 20);
    v8[140] |= 4u;
    *((_DWORD *)v8 + 30) = v9;
    block = (void **)*((_QWORD *)objc_msgSend(v4, "c_struct") + 3);
    LODWORD(v28) = *((_DWORD *)objc_msgSend(v4, "c_struct") + 8);
    sub_100020CE4(v25 + 80, (char *)&block, (uint64_t)&v28 + 4, 3uLL);
    v10 = v25;
    v11 = *((_QWORD *)objc_msgSend(v4, "c_struct") + 5);
    v10[140] |= 2u;
    *((_QWORD *)v10 + 14) = v11;
    LODWORD(block) = *((unsigned __int16 *)objc_msgSend(v4, "c_struct") + 24);
    HIDWORD(block) = *((unsigned __int16 *)objc_msgSend(v4, "c_struct") + 25);
    LODWORD(v28) = *((unsigned __int16 *)objc_msgSend(v4, "c_struct") + 26);
    HIDWORD(v28) = *((unsigned __int16 *)objc_msgSend(v4, "c_struct") + 27);
    LODWORD(v29[0]) = *((unsigned __int16 *)objc_msgSend(v4, "c_struct") + 28);
    sub_100020CE4(v25 + 32, (char *)&block, (uint64_t)v29 + 4, 5uLL);
    LODWORD(block) = *((unsigned __int16 *)objc_msgSend(v4, "c_struct") + 29);
    HIDWORD(block) = *((unsigned __int16 *)objc_msgSend(v4, "c_struct") + 30);
    LODWORD(v28) = *((unsigned __int16 *)objc_msgSend(v4, "c_struct") + 31);
    HIDWORD(v28) = *((unsigned __int16 *)objc_msgSend(v4, "c_struct") + 32);
    LODWORD(v29[0]) = *((unsigned __int16 *)objc_msgSend(v4, "c_struct") + 33);
    sub_100020CE4(v25 + 56, (char *)&block, (uint64_t)v29 + 4, 5uLL);
    v12 = v25;
    v13 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 17);
    v12[140] |= 0x20u;
    *((_DWORD *)v12 + 33) = v13;
    v14 = v25;
    v15 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 18);
    v14[140] |= 8u;
    *((_DWORD *)v14 + 31) = v15;
    v16 = v25;
    v17 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 19);
    v16[140] |= 0x10u;
    *((_DWORD *)v16 + 32) = v17;
    v18 = v25;
    v19 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 20);
    v18[140] |= 0x40u;
    *((_DWORD *)v18 + 34) = v19;
    ptr = self->_writer.__ptr_;
    v21 = *((_QWORD *)ptr + 1);
    block = _NSConcreteStackBlock;
    v28 = 3221225472;
    v29[0] = sub_100235590;
    v29[1] = &unk_100355AC0;
    v29[2] = ptr;
    v29[3] = &v22;
    dispatch_sync(v21, &block);
    CMMsl::Item::~Item((CMMsl::Item *)&v22);
  }

}

- (void)recordSafetyHertzSample:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  Writer *ptr;
  NSObject *v13;
  void (**v14)(CMMsl::Item *__hidden);
  _QWORD v15[77];
  uint64_t v16;
  uint64_t v17;
  char v18;
  _QWORD block[6];

  v4 = a3;
  if (self->_writer.__ptr_)
  {
    v14 = off_100351C90;
    bzero(v15, 0x260uLL);
    bzero(&v16, 0xBB4uLL);
    v5 = (double)*(unint64_t *)objc_msgSend(v4, "c_struct") * 0.000001;
    v18 |= 1u;
    *(double *)&v15[76] = v5;
    CMMsl::Item::makeSafetyHertzSample((uint64_t)&v14);
    v6 = v17;
    v7 = *(_QWORD *)objc_msgSend(v4, "c_struct");
    *(_BYTE *)(v6 + 24) |= 1u;
    *(_QWORD *)(v6 + 8) = v7;
    v8 = v17;
    v9 = *((unsigned __int16 *)objc_msgSend(v4, "c_struct") + 4);
    *(_BYTE *)(v8 + 24) |= 2u;
    *(_DWORD *)(v8 + 16) = v9;
    v10 = v17;
    v11 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 10);
    *(_BYTE *)(v10 + 24) |= 4u;
    *(_DWORD *)(v10 + 20) = v11;
    ptr = self->_writer.__ptr_;
    v13 = *((_QWORD *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100235590;
    block[3] = &unk_100355AC0;
    block[4] = ptr;
    block[5] = &v14;
    dispatch_sync(v13, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v14);
  }

}

- (void)recordCompanionStatus:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  Writer *ptr;
  NSObject *v11;
  void (**v12)(CMMsl::Item *__hidden);
  _QWORD v13[77];
  uint64_t v14;
  uint64_t v15;
  char v16;
  _QWORD block[6];

  v4 = a3;
  if (self->_writer.__ptr_)
  {
    v12 = off_100351C90;
    bzero(v13, 0x260uLL);
    bzero(&v14, 0xBB4uLL);
    v5 = (double)*(unint64_t *)objc_msgSend(v4, "c_struct") * 0.000001;
    v16 |= 1u;
    *(double *)&v13[76] = v5;
    CMMsl::Item::makeSafetyCompanionStatus((uint64_t)&v12);
    v6 = v15;
    v7 = *(_QWORD *)objc_msgSend(v4, "c_struct");
    *(_BYTE *)(v6 + 20) |= 1u;
    *(_QWORD *)(v6 + 8) = v7;
    v8 = v15;
    v9 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 2);
    *(_BYTE *)(v8 + 20) |= 2u;
    *(_DWORD *)(v8 + 16) = v9;
    ptr = self->_writer.__ptr_;
    v11 = *((_QWORD *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100235590;
    block[3] = &unk_100355AC0;
    block[4] = ptr;
    block[5] = &v12;
    dispatch_sync(v11, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v12);
  }

}

- (void)recordRemoteSample:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  Writer *ptr;
  NSObject *v21;
  void (**v22)(CMMsl::Item *__hidden);
  double v23[77];
  uint64_t v24;
  uint64_t v25;
  char v26;
  _QWORD block[6];

  v4 = a3;
  if (self->_writer.__ptr_)
  {
    v22 = off_100351C90;
    bzero(v23, 0x260uLL);
    bzero(&v24, 0xBB4uLL);
    v5 = objc_msgSend(v4, "timestamp");
    v26 |= 1u;
    v23[76] = (double)(unint64_t)v5 * 0.000001;
    CMMsl::Item::makeSafetyRemoteSample((uint64_t)&v22);
    v6 = v25;
    v7 = *(unsigned __int8 *)objc_msgSend(v4, "c_struct");
    *(_BYTE *)(v6 + 52) |= 0x20u;
    *(_DWORD *)(v6 + 44) = v7;
    v8 = v25;
    v9 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 1);
    *(_BYTE *)(v8 + 52) |= 0x40u;
    *(_DWORD *)(v8 + 48) = v9;
    v10 = v25;
    v11 = *((_DWORD *)objc_msgSend(v4, "c_struct") + 2);
    *(_BYTE *)(v10 + 52) |= 0x10u;
    *(_DWORD *)(v10 + 40) = v11;
    v12 = v25;
    v13 = *((_QWORD *)objc_msgSend(v4, "c_struct") + 2);
    *(_BYTE *)(v12 + 52) |= 1u;
    *(_QWORD *)(v12 + 8) = v13;
    v14 = v25;
    v15 = *((_QWORD *)objc_msgSend(v4, "c_struct") + 3);
    *(_BYTE *)(v14 + 52) |= 8u;
    *(_QWORD *)(v14 + 32) = v15;
    v16 = v25;
    v17 = *((_QWORD *)objc_msgSend(v4, "c_struct") + 4);
    *(_BYTE *)(v16 + 52) |= 4u;
    *(_QWORD *)(v16 + 24) = v17;
    v18 = v25;
    v19 = *((_QWORD *)objc_msgSend(v4, "c_struct") + 5);
    *(_BYTE *)(v18 + 52) |= 2u;
    *(_QWORD *)(v18 + 16) = v19;
    ptr = self->_writer.__ptr_;
    v21 = *((_QWORD *)ptr + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100235590;
    block[3] = &unk_100355AC0;
    block[4] = ptr;
    block[5] = &v22;
    dispatch_sync(v21, block);
    CMMsl::Item::~Item((CMMsl::Item *)&v22);
  }

}

- (void)updateMetadata:(id)a3
{
  uint64_t v4;
  NSDictionary *metadata;
  NSDictionary *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  id v9;

  v9 = a3;
  metadata = self->_metadata;
  if (metadata)
    v6 = (NSDictionary *)-[NSDictionary mutableCopy](metadata, "mutableCopy");
  else
    v6 = (NSDictionary *)objc_opt_new(NSMutableDictionary, v4);
  v7 = v6;
  -[NSDictionary addEntriesFromDictionary:](v6, "addEntriesFromDictionary:", v9);
  v8 = self->_metadata;
  self->_metadata = v7;

}

- (void)dumpMetadata
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_metadata, "allKeys"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sortedArrayUsingSelector:", "caseInsensitiveCompare:"));

  if (qword_1003873F0 != -1)
    dispatch_once(&qword_1003873F0, &stru_1003587E8);
  v4 = qword_1003873F8;
  if (os_log_type_enabled((os_log_t)qword_1003873F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "metadata begin", buf, 2u);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8);
        if (qword_1003873F0 != -1)
          dispatch_once(&qword_1003873F0, &stru_1003587E8);
        v10 = (id)qword_1003873F8;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", v9));
          *(_DWORD *)buf = 67109634;
          v20 = v6 + (_DWORD)v8;
          v21 = 2112;
          v22 = v9;
          v23 = 2112;
          v24 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%d:%@ %@", buf, 0x1Cu);

        }
        v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
      v6 += (int)v8;
    }
    while (v5);
  }

  if (qword_1003873F0 != -1)
    dispatch_once(&qword_1003873F0, &stru_1003587E8);
  v12 = qword_1003873F8;
  if (os_log_type_enabled((os_log_t)qword_1003873F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "metadata end", buf, 2u);
  }

}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)ttrManagedMsl
{
  return self->_ttrManagedMsl;
}

- (void)setTtrManagedMsl:(BOOL)a3
{
  self->_ttrManagedMsl = a3;
}

- (NSURL)urlToCopyToOnStop
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUrlToCopyToOnStop:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)shouldDeleteTTR
{
  return self->_shouldDeleteTTR;
}

- (void)setShouldDeleteTTR:(BOOL)a3
{
  self->_shouldDeleteTTR = a3;
}

- (BOOL)shouldUpload
{
  return self->_shouldUpload;
}

- (void)setShouldUpload:(BOOL)a3
{
  self->_shouldUpload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlToCopyToOnStop, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  sub_10000A718((uint64_t)&self->_writer);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
