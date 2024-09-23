@implementation CLGatheringDiscoveryStore

- (CLGatheringDiscoveryStore)initWithQueue:(id)a3 withSettings:(id)a4
{
  CLGatheringDiscoveryStore *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLGatheringDiscoveryStore;
  v6 = -[CLGatheringDiscoveryStore init](&v8, "init");
  if (v6)
  {
    v6->_queue = (OS_dispatch_queue *)a3;
    -[CLGatheringDiscoveryStore setSettings:](v6, "setSettings:", a4);
    v6->_storage = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2400);
    if (-[CLGatheringSettings loggingPersistentEnabled](-[CLGatheringDiscoveryStore settings](v6, "settings"), "loggingPersistentEnabled"))
    {
      -[CLGatheringDiscoveryStore bootstrapAdvertisements](v6, "bootstrapAdvertisements");
      -[CLGatheringDiscoveryStore openAdvertisementsFile](v6, "openAdvertisementsFile");
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_storage = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLGatheringDiscoveryStore;
  -[CLGatheringDiscoveryStore dealloc](&v3, "dealloc");
}

- (void)bootstrapAdvertisements
{
  NSObject *v3;
  id v4;
  NSFileHandle *v5;
  NSObject *v6;
  double v7;
  uint8_t *v8;
  uint8_t *v9;
  NSObject *v10;
  NSData *v11;
  uint64_t v12;
  NSData *v13;
  double v14;
  uint8_t *v15;
  NSFileHandle *v16;
  NSData *v17;
  NSObject *v18;
  NSObject *v19;
  NSData *v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;
  unint64_t v25;
  id v26;
  NSObject *v27;
  const char *v28;
  uint8_t *v29;
  const char *v30;
  uint8_t *v31;
  uint64_t v32;
  NSData *v33;
  const char *v34;
  uint8_t *v35;
  const char *v36;
  uint8_t *v37;
  uint64_t v38;
  NSData *v39;
  int v40;
  NSData *v41;
  uint8_t buf[4];
  NSData *v43;

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_102184188);
  v3 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "bootstrapAdvertisements()", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    LOWORD(v40) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "bootstrapAdvertisements()", &v40, 2);
    v29 = (uint8_t *)v28;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore bootstrapAdvertisements]", "%s\n", v28);
    if (v29 != buf)
      free(v29);
  }
  v4 = objc_msgSend(-[CLGatheringDiscoveryStore persistenceDirectory](self, "persistenceDirectory"), "URLByAppendingPathComponent:", CFSTR("gathering_ble_advs_bootstrap.bin"));
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", objc_msgSend(v4, "path")))
  {
    v39 = 0;
    v5 = +[NSFileHandle fileHandleForReadingFromURL:error:](NSFileHandle, "fileHandleForReadingFromURL:error:", v4, &v39);
    if (v39)
    {
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_102184188);
      v6 = qword_1022A0158;
      if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v39;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "error opening file handle for bootstrapping: %@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0150 != -1)
          dispatch_once(&qword_1022A0150, &stru_102184188);
        v40 = 138412290;
        v41 = v39;
        LODWORD(v38) = 12;
        v7 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 16, "error opening file handle for bootstrapping: %@", &v40, v38);
        v9 = v8;
        sub_100512490("Generic", 1, 0, 0, "-[CLGatheringDiscoveryStore bootstrapAdvertisements]", "%s\n", v7);
LABEL_24:
        if (v9 != buf)
          free(v9);
      }
    }
    else
    {
      v16 = v5;
      v17 = -[NSFileHandle availableData](v5, "availableData");
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_102184188);
      v18 = qword_1022A0158;
      if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v43 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "bootstrapAdvertisements data %p", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0150 != -1)
          dispatch_once(&qword_1022A0150, &stru_102184188);
        v40 = 134217984;
        v41 = v17;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "bootstrapAdvertisements data %p", &v40);
        v31 = (uint8_t *)v30;
        sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore bootstrapAdvertisements]", "%s\n", v30);
        if (v31 != buf)
          free(v31);
      }
      if (-[NSData length](v17, "length"))
      {
        if (qword_1022A0150 != -1)
          dispatch_once(&qword_1022A0150, &stru_102184188);
        v19 = qword_1022A0158;
        if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
        {
          v20 = -[NSData length](v17, "length");
          *(_DWORD *)buf = 134217984;
          v43 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "available data for bootstrapping length: %zu", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A0150 != -1)
            dispatch_once(&qword_1022A0150, &stru_102184188);
          v32 = qword_1022A0158;
          v33 = -[NSData length](v17, "length");
          v40 = 134217984;
          v41 = v33;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v32, 2, "available data for bootstrapping length: %zu", (size_t)&v40);
          v35 = (uint8_t *)v34;
          sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore bootstrapAdvertisements]", "%s\n", v34);
          if (v35 != buf)
            free(v35);
        }
        v21 = -[NSData length](v17, "length");
        v22 = v21 / 0x54;
        v23 = -[NSData bytes](v17, "bytes");
        if (v21 >= 0x54)
        {
          v24 = v23;
          if (v22 <= 1)
            v25 = 1;
          else
            v25 = v21 / 0x54;
          do
          {
            v26 = objc_msgSend(objc_alloc((Class)CLGatheringBleAdvertisement), "initWithPersistenceBytes:", v24);
            -[NSMutableArray addObject:](self->_storage, "addObject:", v26);

            v24 += 84;
            --v25;
          }
          while (v25);
        }
        if (qword_1022A0150 != -1)
          dispatch_once(&qword_1022A0150, &stru_102184188);
        v27 = qword_1022A0158;
        if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          v43 = (NSData *)v22;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "bootstrapped %zu advs from persistent storage", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A0150 != -1)
            dispatch_once(&qword_1022A0150, &stru_102184188);
          v40 = 134217984;
          v41 = (NSData *)v22;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "bootstrapped %zu advs from persistent storage", (size_t)&v40);
          v37 = (uint8_t *)v36;
          sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore bootstrapAdvertisements]", "%s\n", v36);
          if (v37 != buf)
            free(v37);
        }
      }
      -[NSFileHandle closeAndReturnError:](v16, "closeAndReturnError:", &v39);
    }
  }
  else
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    v10 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
    {
      v11 = (NSData *)objc_msgSend(v4, "absoluteString");
      *(_DWORD *)buf = 138412290;
      v43 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "file %@ does not exist, bypass bootstrapping", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_102184188);
      v12 = qword_1022A0158;
      v13 = (NSData *)objc_msgSend(v4, "absoluteString");
      v40 = 138412290;
      v41 = v13;
      LODWORD(v38) = 12;
      v14 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v12, 2, "file %@ does not exist, bypass bootstrapping", &v40, v38);
      v9 = v15;
      sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore bootstrapAdvertisements]", "%s\n", v14);
      goto LABEL_24;
    }
  }
}

- (void)openAdvertisementsFile
{
  NSObject *v3;
  NSFileManager *v4;
  NSObject *v5;
  id v6;
  NSFileManager *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  id v12;
  const char *v13;
  uint8_t *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint8_t *v18;
  uint64_t v19;
  id v20;
  uint8_t *v21;
  const char *v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD block[5];
  int v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_102184188);
  v3 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "openAdvertisementsFile()", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    LOWORD(v27) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "openAdvertisementsFile()", &v27, 2);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore openAdvertisementsFile]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D8D8B4;
  block[3] = &unk_10212BB58;
  block[4] = self;
  if (qword_1023081C0 != -1)
    dispatch_once(&qword_1023081C0, block);
  v4 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  if (!-[NSFileManager fileExistsAtPath:](v4, "fileExistsAtPath:", objc_msgSend((id)qword_1023081B0, "path")))
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    v5 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend((id)qword_1023081B0, "absoluteString");
      *(_DWORD *)buf = 138412290;
      v30 = (uint64_t)v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "creating file %@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_102184188);
      v15 = qword_1022A0158;
      v16 = objc_msgSend((id)qword_1023081B0, "absoluteString");
      v27 = 138412290;
      v28 = (uint64_t)v16;
      LODWORD(v24) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v15, 0, "creating file %@", &v27, v24);
      v18 = (uint8_t *)v17;
      sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore openAdvertisementsFile]", "%s\n", v17);
      if (v18 != buf)
        free(v18);
    }
    v7 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    if (!-[NSFileManager createFileAtPath:contents:attributes:](v7, "createFileAtPath:contents:attributes:", objc_msgSend((id)qword_1023081B0, "path"), 0, 0))
    {
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_102184188);
      v8 = qword_1022A0158;
      if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = qword_1023081B0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "creating advertisements file %@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0150 != -1)
          dispatch_once(&qword_1022A0150, &stru_102184188);
        v27 = 138412290;
        v28 = qword_1023081B0;
        LODWORD(v24) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 16, "creating advertisements file %@", &v27, v24);
        v23 = (uint8_t *)v22;
        sub_100512490("Generic", 1, 0, 0, "-[CLGatheringDiscoveryStore openAdvertisementsFile]", "%s\n", v22);
        if (v23 != buf)
          free(v23);
      }
    }
  }
  v25 = 0;
  -[CLGatheringDiscoveryStore setFileHandleForReadWrite:](self, "setFileHandleForReadWrite:", +[NSFileHandle fileHandleForUpdatingURL:error:](NSFileHandle, "fileHandleForUpdatingURL:error:", qword_1023081B0, &v25));
  if (v25)
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    v9 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v25;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "error opening file handle for writing: %@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_102184188);
      v27 = 138412290;
      v28 = v25;
      LODWORD(v24) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "error opening file handle for writing: %@", &v27, v24);
LABEL_46:
      v21 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore openAdvertisementsFile]", "%s\n", v10);
      if (v21 != buf)
        free(v21);
    }
  }
  else
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    v11 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
    {
      v12 = objc_msgSend((id)qword_1023081B0, "absoluteString");
      *(_DWORD *)buf = 138412290;
      v30 = (uint64_t)v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "opened advertisements file: %@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_102184188);
      v19 = qword_1022A0158;
      v20 = objc_msgSend((id)qword_1023081B0, "absoluteString");
      v27 = 138412290;
      v28 = (uint64_t)v20;
      LODWORD(v24) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 2, "opened advertisements file: %@", &v27, v24);
      goto LABEL_46;
    }
  }
}

- (void)writeAdvertisement:(id)a3
{
  if (-[CLGatheringDiscoveryStore fileHandleForReadWrite](self, "fileHandleForReadWrite"))
  {
    -[NSFileHandle seekToEndOfFile](-[CLGatheringDiscoveryStore fileHandleForReadWrite](self, "fileHandleForReadWrite"), "seekToEndOfFile");
    -[NSFileHandle writeData:](-[CLGatheringDiscoveryStore fileHandleForReadWrite](self, "fileHandleForReadWrite"), "writeData:", objc_msgSend(a3, "encodedBytes"));
  }
}

- (id)persistenceDirectory
{
  NSString *v3;
  NSString *v4;
  NSString *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v9;
  uint8_t *v10;
  const char *v11;
  uint8_t *v12;
  uint64_t v13;
  NSString *v14;
  int v15;
  NSString *v16;
  uint8_t buf[4];
  NSString *v18;

  v3 = (NSString *)objc_msgSend(-[NSArray firstObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1), "firstObject"), "stringByAppendingPathComponent:", CFSTR("locationd"));
  if (!v3
    || (v4 = v3,
        -[CLGatheringSettings loggingPersistentInTempFolder](-[CLGatheringDiscoveryStore settings](self, "settings"), "loggingPersistentInTempFolder")))
  {
    v4 = NSTemporaryDirectory();
  }
  v5 = -[NSString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", CFSTR("Gathering"));
  if (!-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v5))
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    v6 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "creating persistent storage directory %@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_102184188);
      v15 = 138412290;
      v16 = v5;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 0, "creating persistent storage directory %@", &v15, 12);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore persistenceDirectory]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
    v14 = 0;
    if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 0, 0, &v14))
    {
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_102184188);
      v7 = qword_1022A0158;
      if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v14;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "failed creating persistent storage directory: %@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0150 != -1)
          dispatch_once(&qword_1022A0150, &stru_102184188);
        v15 = 138412290;
        v16 = v14;
        LODWORD(v13) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 16, "failed creating persistent storage directory: %@", &v15, v13);
        v12 = (uint8_t *)v11;
        sub_100512490("Generic", 1, 0, 0, "-[CLGatheringDiscoveryStore persistenceDirectory]", "%s\n", v11);
        if (v12 != buf)
          free(v12);
      }
    }
  }
  return +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 1);
}

- (id)fetchAllBleAdvertisements
{
  id v3;

  v3 = -[NSMutableArray copy](self->_storage, "copy");
  -[NSMutableArray removeAllObjects](self->_storage, "removeAllObjects");
  return v3;
}

- (void)fetchFromStatisticsNumberOfAdvs:(unint64_t *)p_uniqueAdvertisementsReceived accumulatedTime:(double *)a4
{
  double observationStopTimestamp;
  double observationDuration;
  double observationStartTimestamp;
  double v10;

  observationStopTimestamp = self->_observationStopTimestamp;
  observationDuration = self->_observationDuration;
  observationStartTimestamp = self->_observationStartTimestamp;
  if (observationStopTimestamp <= observationStartTimestamp
    && (observationStopTimestamp != 0.0 || observationStartTimestamp != 0.0))
  {
    v10 = sub_1001FCBB4();
    observationDuration = observationDuration + v10 - self->_observationStartTimestamp;
    self->_observationStartTimestamp = v10;
    self->_observationStopTimestamp = v10;
  }
  self->_observationDuration = 0.0;
  if (p_uniqueAdvertisementsReceived)
  {
    if (observationDuration > 0.0)
    {
      *p_uniqueAdvertisementsReceived = self->_uniqueAdvertisementsReceived;
      p_uniqueAdvertisementsReceived = &self->_uniqueAdvertisementsReceived;
    }
    *p_uniqueAdvertisementsReceived = 0;
  }
  if (a4)
    *a4 = observationDuration;
}

- (void)_cleanupVolatileStorage
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t *v6;
  NSObject *v7;
  unsigned int v8;
  double v9;
  double v10;
  NSMutableArray *storage;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  NSDate *v22;
  NSObject *v23;
  double v24;
  NSObject *v25;
  NSDate *v26;
  NSObject *v27;
  double v28;
  dispatch_time_t v29;
  NSObject *queue;
  NSObject *v31;
  uint64_t v32;
  unsigned int v33;
  const char *v34;
  uint8_t *v35;
  const char *v36;
  uint8_t *v37;
  uint64_t v38;
  NSDate *v39;
  const char *v40;
  uint8_t *v41;
  const char *v42;
  uint8_t *v43;
  const char *v44;
  uint8_t *v45;
  uint64_t v46;
  NSDate *v47;
  const char *v48;
  uint8_t *v49;
  uint64_t v50;
  _QWORD block[5];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  int v56;
  double v57;
  uint8_t v58[128];
  uint8_t buf[4];
  double v60;

  -[NSDate timeIntervalSince1970](+[NSDate now](NSDate, "now"), "timeIntervalSince1970");
  v4 = v3;
  v5 = -[CLGatheringSettings loggingVolatileMaxAge](-[CLGatheringDiscoveryStore settings](self, "settings"), "loggingVolatileMaxAge");
  v6 = &qword_1022A0000;
  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_102184188);
  v7 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[NSMutableArray count](self->_storage, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v60) = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "volatile storage cleanup (has %d)", buf, 8u);
  }
  v9 = (double)v5;
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    v32 = qword_1022A0158;
    v33 = -[NSMutableArray count](self->_storage, "count");
    v56 = 67109120;
    LODWORD(v57) = v33;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v32, 0, "volatile storage cleanup (has %d)", &v56);
    v35 = (uint8_t *)v34;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore _cleanupVolatileStorage]", "%s\n", v34);
    if (v35 != buf)
      free(v35);
  }
  v10 = v4 - v9;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  storage = self->_storage;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](storage, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v53;
    while (2)
    {
      v16 = 0;
      v17 = (uint64_t)v13 + v14;
      do
      {
        if (*(_QWORD *)v53 != v15)
          objc_enumerationMutation(storage);
        v18 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v16);
        objc_msgSend(v18, "unixTime");
        if (v19 >= v10)
        {
          objc_msgSend(v18, "unixTime");
          v10 = v20;
          if (qword_1022A0150 != -1)
            dispatch_once(&qword_1022A0150, &stru_102184188);
          v17 = (uint64_t)v16 + v14;
          v21 = qword_1022A0158;
          if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v18, "unixTime");
            *(double *)&v22 = COERCE_DOUBLE(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
            *(_DWORD *)buf = 138412290;
            v60 = *(double *)&v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "volatile storage oldest found %@", buf, 0xCu);
          }
          v6 = &qword_1022A0000;
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0150 != -1)
              dispatch_once(&qword_1022A0150, &stru_102184188);
            v38 = qword_1022A0158;
            objc_msgSend(v18, "unixTime");
            v39 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
            v56 = 138412290;
            v57 = *(double *)&v39;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v38, 0, "volatile storage oldest found %@", &v56, 12);
            v41 = (uint8_t *)v40;
            sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore _cleanupVolatileStorage]", "%s\n", v40);
            if (v41 != buf)
              free(v41);
          }
          goto LABEL_20;
        }
        v16 = (char *)v16 + 1;
      }
      while (v13 != v16);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](storage, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      v14 = v17;
      if (v13)
        continue;
      break;
    }
    v6 = &qword_1022A0000;
LABEL_20:
    if (v17 >= 1)
    {
      if (v6[42] != -1)
        dispatch_once(&qword_1022A0150, &stru_102184188);
      v23 = qword_1022A0158;
      if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v60) = v17;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "volatile storage removing %d", buf, 8u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (v6[42] != -1)
          dispatch_once(&qword_1022A0150, &stru_102184188);
        v56 = 67109120;
        LODWORD(v57) = v17;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 0, "volatile storage removing %d", &v56);
        v43 = (uint8_t *)v42;
        sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore _cleanupVolatileStorage]", "%s\n", v42);
        if (v43 != buf)
          free(v43);
      }
      -[NSMutableArray removeObjectsInRange:](self->_storage, "removeObjectsInRange:", 0, v17);
    }
  }
  if (-[NSMutableArray count](self->_storage, "count"))
  {
    v24 = v10
        - v4
        + (double)-[CLGatheringSettings loggingVolatileMaxAge](-[CLGatheringDiscoveryStore settings](self, "settings"), "loggingVolatileMaxAge");
    if (v24 < 0.0)
    {
      if (v6[42] != -1)
        dispatch_once(&qword_1022A0150, &stru_102184188);
      v25 = qword_1022A0158;
      if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_ERROR))
      {
        *(double *)&v26 = COERCE_DOUBLE(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v10));
        *(_DWORD *)buf = 138412290;
        v60 = *(double *)&v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "volatile storage has negative cleanupTimeOffset! timeOldest %@", buf, 0xCu);
      }
      v24 = 0.0;
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (v6[42] != -1)
          dispatch_once(&qword_1022A0150, &stru_102184188);
        v46 = qword_1022A0158;
        v47 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v10);
        v56 = 138412290;
        v57 = *(double *)&v47;
        LODWORD(v50) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v46, 16, "volatile storage has negative cleanupTimeOffset! timeOldest %@", &v56, v50);
        v49 = (uint8_t *)v48;
        sub_100512490("Generic", 1, 0, 0, "-[CLGatheringDiscoveryStore _cleanupVolatileStorage]", "%s\n", v48);
        if (v49 != buf)
          free(v49);
      }
    }
    if (v6[42] != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    v27 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v60 = v24 + 60.0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "volatile storage cleaning again in %.3f s", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (v6[42] != -1)
        dispatch_once(&qword_1022A0150, &stru_102184188);
      v28 = v24 + 60.0;
      v56 = 134217984;
      v57 = v28;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 0, "volatile storage cleaning again in %.3f s", COERCE_DOUBLE(&v56));
      v37 = (uint8_t *)v36;
      sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore _cleanupVolatileStorage]", "%s\n", v36);
      if (v37 != buf)
        free(v37);
    }
    else
    {
      v28 = v24 + 60.0;
    }
    v29 = dispatch_time(0, (uint64_t)(v28 * 1000000000.0));
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100D8E830;
    block[3] = &unk_10212BB58;
    block[4] = self;
    dispatch_after(v29, queue, block);
  }
  else
  {
    if (v6[42] != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    v31 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "volatile storage emptied", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (v6[42] != -1)
        dispatch_once(&qword_1022A0150, &stru_102184188);
      LOWORD(v56) = 0;
      LODWORD(v50) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 0, "volatile storage emptied", &v56, v50);
      v45 = (uint8_t *)v44;
      sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore _cleanupVolatileStorage]", "%s\n", v44);
      if (v45 != buf)
        free(v45);
    }
    self->_volatileCleanupScheduled = 0;
  }
}

- (void)_cleanupPersistentStorage
{
  double v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  NSData *v7;
  unint64_t v8;
  NSObject *v9;
  const char *v10;
  double v11;
  unint64_t v12;
  double *v13;
  uint64_t v14;
  double v15;
  double *v16;
  unint64_t v17;
  double v18;
  _BOOL4 v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  double v23;
  NSObject *v24;
  NSDate *v25;
  dispatch_time_t v26;
  NSObject *queue;
  NSObject *v28;
  const char *v29;
  uint8_t *v30;
  uint8_t *v31;
  uint8_t *v32;
  uint64_t v33;
  NSDate *v34;
  const char *v35;
  uint8_t *v36;
  uint64_t v37;
  _QWORD block[5];
  int v39;
  unint64_t v40;
  uint8_t buf[4];
  unint64_t v42;

  -[NSDate timeIntervalSince1970](+[NSDate now](NSDate, "now"), "timeIntervalSince1970");
  v4 = v3;
  v5 = -[CLGatheringSettings loggingPersistentMaxAge](-[CLGatheringDiscoveryStore settings](self, "settings"), "loggingPersistentMaxAge");
  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_102184188);
  v6 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "persistent storage cleanup", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    LOWORD(v39) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "persistent storage cleanup", &v39, 2);
    v30 = (uint8_t *)v29;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore _cleanupPersistentStorage]", "%s\n", v29);
    if (v30 != buf)
      free(v30);
  }
  -[NSFileHandle seekToFileOffset:](-[CLGatheringDiscoveryStore fileHandleForReadWrite](self, "fileHandleForReadWrite"), "seekToFileOffset:", 0);
  v7 = -[NSFileHandle availableData](-[CLGatheringDiscoveryStore fileHandleForReadWrite](self, "fileHandleForReadWrite"), "availableData");
  v8 = -[NSData length](v7, "length");
  if (v8 <= 0x53)
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    v9 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "persistent storage is empty", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_50;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    LOWORD(v39) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "persistent storage is empty");
LABEL_63:
    v32 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore _cleanupPersistentStorage]", "%s\n", v10);
    if (v32 != buf)
      free(v32);
LABEL_50:
    self->_persistentCleanupScheduled = 0;
    return;
  }
  v11 = v4 - (double)v5;
  v12 = v8 / 0x54;
  v13 = -[NSData bytes](v7, "bytes");
  if (v12 <= 1)
    v14 = 1;
  else
    v14 = v12;
  v15 = *v13;
  if (*v13 > v11)
  {
LABEL_23:
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    v20 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "all advertisements kept in file", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_38;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    LOWORD(v39) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 0, "all advertisements kept in file");
    goto LABEL_58;
  }
  v16 = (double *)((char *)v13 + 84);
  v17 = 1;
  do
  {
    if (v14 == v17)
    {
      v19 = v17 < v12;
      goto LABEL_32;
    }
    v18 = *v16;
    v16 = (double *)((char *)v16 + 84);
    v15 = v18;
    ++v17;
  }
  while (v18 <= v11);
  v14 = v17 - 1;
  v19 = v17 - 1 < v12;
  if (v17 == 1)
    goto LABEL_23;
LABEL_32:
  -[NSFileHandle truncateAtOffset:error:](-[CLGatheringDiscoveryStore fileHandleForReadWrite](self, "fileHandleForReadWrite"), "truncateAtOffset:error:", 0, 0);
  if (!v19)
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    v28 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v42 = v12;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "emptied persistent storage (had %zu entries)", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_50;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    v39 = 134217984;
    v40 = v12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "emptied persistent storage (had %zu entries)", &v39);
    goto LABEL_63;
  }
  -[NSFileHandle writeData:](-[CLGatheringDiscoveryStore fileHandleForReadWrite](self, "fileHandleForReadWrite"), "writeData:", -[NSData subdataWithRange:](v7, "subdataWithRange:", 84 * v14, 84 * (v12 - v14)));
  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_102184188);
  v22 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v42 = v14;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "removed %zu entries from persistent storage", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    v39 = 134217984;
    v40 = v14;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "removed %zu entries from persistent storage", &v39);
LABEL_58:
    v31 = (uint8_t *)v21;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore _cleanupPersistentStorage]", "%s\n", v21);
    if (v31 != buf)
      free(v31);
  }
LABEL_38:
  v23 = v15
      - v4
      + (double)-[CLGatheringSettings loggingPersistentMaxAge](-[CLGatheringDiscoveryStore settings](self, "settings"), "loggingPersistentMaxAge");
  if (v23 < 0.0)
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    v24 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_ERROR))
    {
      v25 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v15);
      *(_DWORD *)buf = 138412290;
      v42 = (unint64_t)v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "persistent storage has negative cleanupTimeOffset! timeOldest %@", buf, 0xCu);
    }
    v23 = 0.0;
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_102184188);
      v33 = qword_1022A0158;
      v34 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v15);
      v39 = 138412290;
      v40 = (unint64_t)v34;
      LODWORD(v37) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v33, 16, "persistent storage has negative cleanupTimeOffset! timeOldest %@", &v39, v37);
      v36 = (uint8_t *)v35;
      sub_100512490("Generic", 1, 0, 0, "-[CLGatheringDiscoveryStore _cleanupPersistentStorage]", "%s\n", v35);
      if (v36 != buf)
        free(v36);
    }
  }
  v26 = dispatch_time(0, (uint64_t)((v23 + 60.0) * 1000000000.0));
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D8F120;
  block[3] = &unk_10212BB58;
  block[4] = self;
  dispatch_after(v26, queue, block);
}

- (void)didReceiveAdvertisement:(id)a3
{
  NSObject *v5;
  id v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *queue;
  dispatch_time_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  const char *v16;
  uint8_t *v17;
  const char *v18;
  uint8_t *v19;
  _QWORD v20[5];
  _QWORD block[5];
  int v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;

  if ((-[NSMutableArray containsObject:](self->_storage, "containsObject:") & 1) == 0)
    ++self->_uniqueAdvertisementsReceived;
  -[NSMutableArray addObject:](self->_storage, "addObject:", a3);
  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_102184188);
  v5 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(a3, "description");
    v7 = -[NSMutableArray count](self->_storage, "count");
    *(_DWORD *)buf = 138412546;
    v27 = (uint64_t)v6;
    v28 = 2048;
    v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "rx adv %@, have %zu now", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    v13 = qword_1022A0158;
    v14 = objc_msgSend(a3, "description");
    v15 = -[NSMutableArray count](self->_storage, "count");
    v22 = 138412546;
    v23 = (uint64_t)v14;
    v24 = 2048;
    v25 = v15;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v13, 2, "rx adv %@, have %zu now", &v22, 22);
    v17 = (uint8_t *)v16;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore didReceiveAdvertisement:]", "%s\n", v16);
    if (v17 != buf)
      free(v17);
  }
  if (-[CLGatheringSettings loggingVolatileMaxAge](-[CLGatheringDiscoveryStore settings](self, "settings"), "loggingVolatileMaxAge") >= 1&& !self->_volatileCleanupScheduled)
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    v8 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v27 = 0x404E000000000000;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Volatile storage cleanup schedule in %.2f seconds", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_102184188);
      v22 = 134217984;
      v23 = 0x404E000000000000;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 0, "Volatile storage cleanup schedule in %.2f seconds", COERCE_DOUBLE(&v22));
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore didReceiveAdvertisement:]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
    v9 = dispatch_time(0, 60000000000);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100D8F590;
    block[3] = &unk_10212BB58;
    block[4] = self;
    dispatch_after(v9, queue, block);
    self->_volatileCleanupScheduled = 1;
  }
  if (-[CLGatheringSettings loggingPersistentEnabled](-[CLGatheringDiscoveryStore settings](self, "settings"), "loggingPersistentEnabled"))
  {
    -[CLGatheringDiscoveryStore writeAdvertisement:](self, "writeAdvertisement:", a3);
    if (-[CLGatheringSettings loggingPersistentMaxAge](-[CLGatheringDiscoveryStore settings](self, "settings"), "loggingPersistentMaxAge") >= 1&& !self->_persistentCleanupScheduled)
    {
      v11 = dispatch_time(0, 60000000000);
      v12 = self->_queue;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100D8F598;
      v20[3] = &unk_10212BB58;
      v20[4] = self;
      dispatch_after(v11, v12, v20);
      self->_persistentCleanupScheduled = 1;
    }
  }
}

- (void)markScanStartTimeFromBoot:(double)a3 withReason:(int64_t)a4 withRate:(int64_t)a5
{
  double scanStop;
  NSObject *v9;
  char *v10;
  double scanIntervalSinceLast;
  char *v12;
  double v13;
  const char *v14;
  uint8_t *v15;
  double v16;
  int v17;
  char *v18;
  __int16 v19;
  double v20;
  uint8_t buf[4];
  char *v22;
  __int16 v23;
  double v24;

  self->_scanStart = a3;
  self->_observationStartTimestamp = a3;
  scanStop = self->_scanStop;
  if (scanStop > 0.0)
  {
    self->_scanIntervalSinceLast = a3 - scanStop;
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    v9 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_INFO))
    {
      v10 = (&off_1022FAC70)[a4];
      scanIntervalSinceLast = self->_scanIntervalSinceLast;
      *(_DWORD *)buf = 136315394;
      v22 = v10;
      v23 = 2048;
      v24 = scanIntervalSinceLast;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "mark start, reason %s, timeSinceLast %.3f", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_102184188);
      v12 = (&off_1022FAC70)[a4];
      v13 = self->_scanIntervalSinceLast;
      v17 = 136315394;
      v18 = v12;
      v19 = 2048;
      v20 = v13;
      LODWORD(v16) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 1, "mark start, reason %s, timeSinceLast %.3f", (const char *)&v17, v16);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore markScanStartTimeFromBoot:withReason:withRate:]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
  }
  self->_scanReason = a4;
  self->_scanRate = a5;
}

- (void)markScanEndTimeFromBoot:(double)a3 withReason:(int64_t)a4 withPolicy:(BOOL)a5
{
  double scanStart;
  double v10;
  double v11;
  NSObject *v12;
  char *v13;
  char *v14;
  const char *v15;
  uint8_t *v16;
  double v17;
  _QWORD v18[7];
  BOOL v19;
  int v20;
  char *v21;
  __int16 v22;
  double v23;
  uint8_t buf[4];
  char *v25;
  __int16 v26;
  double v27;

  if (self->_scanReason)
  {
    self->_scanStop = a3;
    scanStart = self->_scanStart;
    v10 = self->_observationDuration + a3 - self->_observationStartTimestamp;
    self->_observationStopTimestamp = a3;
    self->_observationDuration = v10;
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102184188);
    v11 = a3 - scanStart;
    v12 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_INFO))
    {
      v13 = (&off_1022FAC70)[a4];
      *(_DWORD *)buf = 136315394;
      v25 = v13;
      v26 = 2048;
      v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "mark stop, reason %s, duration %.3f", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_102184188);
      v14 = (&off_1022FAC70)[a4];
      v20 = 136315394;
      v21 = v14;
      v22 = 2048;
      v23 = v11;
      LODWORD(v17) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 1, "mark stop, reason %s, duration %.3f", (const char *)&v20, v17);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore markScanEndTimeFromBoot:withReason:withPolicy:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100D8FA14;
    v18[3] = &unk_102184168;
    v18[4] = self;
    v18[5] = a4;
    v19 = a5;
    *(double *)&v18[6] = v11;
    AnalyticsSendEventLazy(CFSTR("com.apple.locationd.gathering.scan"), v18);
  }
  self->_scanReason = 0;
}

- (CLGatheringSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  self->_settings = (CLGatheringSettings *)a3;
}

- (NSURL)basePersistenceURL
{
  return (NSURL *)objc_getProperty(self, a2, 112, 1);
}

- (void)setBasePersistenceURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSFileHandle)fileHandleForReadWrite
{
  return (NSFileHandle *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFileHandleForReadWrite:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

@end
