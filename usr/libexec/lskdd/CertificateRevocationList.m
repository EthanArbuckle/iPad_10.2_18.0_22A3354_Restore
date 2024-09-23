@implementation CertificateRevocationList

- (CertificateRevocationList)init
{
  CertificateRevocationList *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CertificateRevocationList;
  v2 = -[CertificateRevocationList init](&v4, "init");
  if (v2)
  {
    -[CertificateRevocationList setConditionLock:](v2, "setConditionLock:", objc_alloc_init((Class)NSCondition));
    -[CertificateRevocationList setCatalogAvailable:](v2, "setCatalogAvailable:", 0);
    -[CertificateRevocationList setDispatchQueue:](v2, "setDispatchQueue:", dispatch_queue_create("CoreLSKDMobileAssetQueue", 0));
  }
  return v2;
}

- (void)downloadAsset:(BOOL)a3 :(id)a4 then:(id)a5
{
  _BOOL4 v7;
  id v9;
  void *v10;
  unint64_t v11;
  _QWORD v12[7];

  v7 = a3;
  v9 = (id)objc_opt_new(MADownloadOptions, a2);
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "setTimeoutIntervalForResource:", 60);
  objc_msgSend(v10, "setDiscretionary:", 0);
  v11 = (unint64_t)objc_msgSend(a4, "state");
  if (v11 > 5)
    goto LABEL_8;
  if (((1 << v11) & 0x2C) != 0)
  {
    -[CertificateRevocationList processDownloadedAsset:then:](self, "processDownloadedAsset:then:", a4, a5);
    return;
  }
  if (((1 << v11) & 0x12) != 0)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3254779904;
    v12[2] = sub_100004FD8;
    v12[3] = &unk_1015B4200;
    v12[4] = self;
    v12[5] = a4;
    v12[6] = a5;
    objc_msgSend(a4, "startDownload:then:", v10, v12);
  }
  else
  {
LABEL_8:
    (*((void (**)(id, uint64_t))a5 + 2))(a5, 4294924391);
  }
}

- (void)processDownloadedAsset:(id)a3 then:(id)a4
{
  uint64_t v5;

  sub_1004FED3C((uint64_t)objc_msgSend(objc_msgSend(objc_msgSend(a3, "getLocalUrl"), "path"), "UTF8String"));
  (*((void (**)(id, uint64_t))a4 + 2))(a4, v5);
}

- (void)queryCertificateRevocationList:(BOOL)a3 :(BOOL)a4 :(id)a5
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3254779904;
  v8[2] = sub_100005184;
  v8[3] = &unk_1015B4230;
  v8[4] = a5;
  LOBYTE(v7) = a3;
  v5 = objc_msgSend(objc_alloc((Class)MAAssetQuery), "initWithType:", CFSTR("com.apple.MobileAsset.AppleKeyServicesCRL2"), _NSConcreteStackBlock, 3254779904, sub_1000051AC, &unk_1015B4260, self, v8, v7);
  objc_msgSend(v5, "setDoNotBlockBeforeFirstUnlock:", 1);
  objc_msgSend(v5, "returnTypes:", 2);
  sub_1000051AC((uint64_t)&v6, v5, (unint64_t)objc_msgSend(v5, "queryMetaDataSync"));
}

- (void)downloadCertificateRevocationList:(BOOL)a3 :(BOOL)a4 :(id)a5
{
  id v9;
  _QWORD v10[6];
  BOOL v11;
  BOOL v12;

  v9 = (id)objc_opt_new(MADownloadOptions, a2);
  objc_msgSend(v9, "setTimeoutIntervalForResource:", 30);
  objc_msgSend(v9, "setDiscretionary:", 0);
  objc_msgSend(v9, "setCanUseLocalCacheServer:", 1);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3254779904;
  v10[2] = sub_100005464;
  v10[3] = &unk_1015B4290;
  v11 = a3;
  v12 = a4;
  v10[4] = self;
  v10[5] = a5;
  +[MAAsset startCatalogDownload:options:then:](MAAsset, "startCatalogDownload:options:then:", CFSTR("com.apple.MobileAsset.AppleKeyServicesCRL2"), v9, v10);
}

- (int)fetchCertificateRevocationList:(BOOL)a3 :(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  int v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v4 = a4;
  v5 = a3;
  objc_sync_enter(self);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -42905;
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3254779904;
    v9[2] = sub_100005570;
    v9[3] = &unk_1015B42C0;
    v9[4] = &v10;
    -[CertificateRevocationList queryCertificateRevocationList:::](self, "queryCertificateRevocationList:::", v5, 1, v9);
  }
  else
  {
    -[CertificateRevocationList downloadCertificateRevocationList:::](self, "downloadCertificateRevocationList:::", v5, 0, &stru_1015B4310);
  }
  v7 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  objc_sync_exit(self);
  return v7;
}

+ (id)getCertificateRevocationListObject
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = sub_100005630;
  block[3] = &unk_1015B4330;
  block[4] = a1;
  if (qword_1015FA5C0 != -1)
    dispatch_once(&qword_1015FA5C0, block);
  return (id)qword_1015FA5B8;
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDispatchQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSCondition)conditionLock
{
  return (NSCondition *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConditionLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)catalogAvailable
{
  return self->_catalogAvailable;
}

- (void)setCatalogAvailable:(BOOL)a3
{
  self->_catalogAvailable = a3;
}

@end
