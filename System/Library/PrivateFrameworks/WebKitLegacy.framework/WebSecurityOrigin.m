@implementation WebSecurityOrigin

+ (id)webSecurityOriginFromDatabaseIdentifier:(id)a3
{
  WTF::StringImpl *v3;
  StringImpl *v5;
  WTF::StringImpl *v6;
  WebSecurityOrigin *v7;
  StringImpl *v8;
  WebSecurityOrigin *v9;
  unsigned int v10;
  unsigned int v11;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  uint64_t v15;
  WTF::StringImpl *v16;
  char v17;
  _BYTE v18[24];
  int v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WTF::initializeMainThread((WTF *)a1);
  MEMORY[0x1D82A3998](&v16, a3);
  WebCore::SecurityOriginData::fromDatabaseIdentifier();
  v6 = v16;
  v16 = 0;
  if (!v6)
  {
LABEL_4:
    if (v20)
      goto LABEL_5;
    return 0;
  }
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v6, v5);
  if (!v20)
    return 0;
LABEL_5:
  v7 = [WebSecurityOrigin alloc];
  if (v20)
  {
    v9 = v7;
    WebCore::SecurityOriginData::securityOrigin((WebCore::SecurityOriginData *)v18);
    a3 = (id)CFMakeCollectable(-[WebSecurityOrigin _initWithWebCoreSecurityOrigin:](v9, "_initWithWebCoreSecurityOrigin:", v16));
    v3 = v16;
    v16 = 0;
    if (!v3)
      goto LABEL_9;
    do
    {
      v10 = __ldaxr((unsigned int *)v3);
      v11 = v10 - 1;
    }
    while (__stlxr(v11, (unsigned int *)v3));
    if (v11)
    {
LABEL_9:
      if (!v20)
        return a3;
      goto LABEL_10;
    }
  }
  else
  {
    __break(1u);
  }
  atomic_store(1u, (unsigned int *)v3);
  v13 = (WTF::StringImpl *)*((_QWORD *)v3 + 6);
  *((_QWORD *)v3 + 6) = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v8);
    else
      *(_DWORD *)v13 -= 2;
  }
  v14 = (WTF::StringImpl *)*((_QWORD *)v3 + 5);
  *((_QWORD *)v3 + 5) = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      WTF::StringImpl::destroy(v14, v8);
    else
      *(_DWORD *)v14 -= 2;
  }
  v15 = *((unsigned int *)v3 + 8);
  if ((_DWORD)v15 != -1)
    ((void (*)(char *, char *))off_1E9D6E8E0[v15])(&v17, (char *)v3 + 8);
  *((_DWORD *)v3 + 8) = -1;
  WTF::fastFree(v3, v8);
  if (v20)
  {
LABEL_10:
    if (v19 != -1)
      ((void (*)(WTF::StringImpl **, _BYTE *))off_1E9D6E8E0[v19])(&v16, v18);
  }
  return a3;
}

- (WebSecurityOrigin)initWithURL:(id)a3
{
  WebSecurityOrigin *v5;
  const WTF::URL *v6;
  StringImpl *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v10[5];
  WebSecurityOriginPrivate *v11;
  objc_super v12;

  WTF::initializeMainThread((WTF *)self);
  v12.receiver = self;
  v12.super_class = (Class)WebSecurityOrigin;
  v5 = -[WebSecurityOrigin init](&v12, sel_init);
  if (!v5)
    return v5;
  MEMORY[0x1D82A38F0](v10, objc_msgSend(a3, "absoluteURL"));
  WebCore::SecurityOrigin::create((WebCore::SecurityOrigin *)v10, v6);
  v5->_private = v11;
  v11 = 0;
  v8 = v10[0];
  v10[0] = 0;
  if (!v8)
    return v5;
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    return v5;
  }
  WTF::StringImpl::destroy(v8, v7);
  return v5;
}

- (id)protocol
{
  WebSecurityOriginPrivate *v2;
  uint64_t v3;
  WebSecurityOrigin *v5;
  SEL v6;
  char v7;
  char *v8;

  v2 = self->_private;
  v3 = *((unsigned int *)v2 + 8);
  if ((_DWORD)v3 == -1)
  {
    v5 = (WebSecurityOrigin *)std::__throw_bad_variant_access[abi:sn180100]();
    return -[WebSecurityOrigin host](v5, v6);
  }
  else
  {
    v8 = &v7;
    if (*(_QWORD *)((uint64_t (*)(char **, char *))off_1E9D6E8F0[v3])(&v8, (char *)v2 + 8))
      return (id)WTF::StringImpl::operator NSString *();
    else
      return &stru_1E9D6EC48;
  }
}

- (id)host
{
  WebSecurityOriginPrivate *v2;
  uint64_t v3;
  WebSecurityOrigin *v5;
  SEL v6;
  char v7;
  char *v8;

  v2 = self->_private;
  v3 = *((unsigned int *)v2 + 8);
  if ((_DWORD)v3 == -1)
  {
    v5 = (WebSecurityOrigin *)std::__throw_bad_variant_access[abi:sn180100]();
    return -[WebSecurityOrigin databaseIdentifier](v5, v6);
  }
  else
  {
    v8 = &v7;
    if (*(_QWORD *)((uint64_t (*)(char **, char *))off_1E9D6E900[v3])(&v8, (char *)v2 + 8))
      return (id)WTF::StringImpl::operator NSString *();
    else
      return &stru_1E9D6EC48;
  }
}

- (id)databaseIdentifier
{
  StringImpl *v2;
  void *v3;
  WTF::StringImpl *v5;

  WebCore::SecurityOriginData::databaseIdentifier((WebCore::SecurityOriginData *)((char *)self->_private + 8));
  if (!v5)
    return &stru_1E9D6EC48;
  v3 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v5 == 2)
  {
    WTF::StringImpl::destroy(v5, v2);
    return v3;
  }
  else
  {
    *(_DWORD *)v5 -= 2;
    return v3;
  }
}

- (id)toString
{
  StringImpl *v2;
  void *v3;
  WTF::StringImpl *v5;

  WebCore::SecurityOrigin::toString((WebCore::SecurityOrigin *)self->_private);
  if (!v5)
    return &stru_1E9D6EC48;
  v3 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v5 == 2)
  {
    WTF::StringImpl::destroy(v5, v2);
    return v3;
  }
  else
  {
    *(_DWORD *)v5 -= 2;
    return v3;
  }
}

- (id)stringValue
{
  StringImpl *v2;
  void *v3;
  WTF::StringImpl *v5;

  WebCore::SecurityOrigin::toString((WebCore::SecurityOrigin *)self->_private);
  if (!v5)
    return &stru_1E9D6EC48;
  v3 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v5 == 2)
  {
    WTF::StringImpl::destroy(v5, v2);
    return v3;
  }
  else
  {
    *(_DWORD *)v5 -= 2;
    return v3;
  }
}

- (unsigned)port
{
  WebSecurityOriginPrivate *v2;
  uint64_t v3;
  uint64_t v4;
  WebSecurityOrigin *v7;
  SEL v8;
  id v9;
  char v10;
  char *v11;

  v2 = self->_private;
  v3 = *((unsigned int *)v2 + 8);
  if ((_DWORD)v3 == -1)
  {
    v7 = (WebSecurityOrigin *)std::__throw_bad_variant_access[abi:sn180100]();
    return -[WebSecurityOrigin isEqual:](v7, v8, v9);
  }
  else
  {
    v11 = &v10;
    v4 = ((uint64_t (*)(char **, char *))off_1E9D6E910[v3])(&v11, (char *)v2 + 8);
    if ((v4 & 0xFF0000) != 0)
      return v4;
    else
      return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
    LOBYTE(v5) = WebCore::SecurityOrigin::equal((WebCore::SecurityOrigin *)-[WebSecurityOrigin _core](self, "_core"), (const WebCore::SecurityOrigin *)objc_msgSend(a3, "_core"));
  return v5;
}

- (void)dealloc
{
  WebSecurityOriginPrivate *v3;
  unsigned int v4;
  unsigned int v5;
  WebQuotaManager *databaseQuotaManager;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  uint64_t v9;
  objc_super v10;
  char v11;

  v3 = self->_private;
  if (!v3)
    goto LABEL_4;
  do
  {
    v4 = __ldaxr((unsigned int *)v3);
    v5 = v4 - 1;
  }
  while (__stlxr(v5, (unsigned int *)v3));
  if (!v5)
  {
    atomic_store(1u, (unsigned int *)v3);
    v7 = (WTF::StringImpl *)*((_QWORD *)v3 + 6);
    *((_QWORD *)v3 + 6) = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2)
        WTF::StringImpl::destroy(v7, (StringImpl *)a2);
      else
        *(_DWORD *)v7 -= 2;
    }
    v8 = (WTF::StringImpl *)*((_QWORD *)v3 + 5);
    *((_QWORD *)v3 + 5) = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2)
        WTF::StringImpl::destroy(v8, (StringImpl *)a2);
      else
        *(_DWORD *)v8 -= 2;
    }
    v9 = *((unsigned int *)v3 + 8);
    if ((_DWORD)v9 != -1)
      ((void (*)(char *, char *))off_1E9D6E8E0[v9])(&v11, (char *)v3 + 8);
    *((_DWORD *)v3 + 8) = -1;
    WTF::fastFree((WTF *)v3, (void *)a2);
    databaseQuotaManager = self->_databaseQuotaManager;
    if (databaseQuotaManager)
      goto LABEL_5;
  }
  else
  {
LABEL_4:
    databaseQuotaManager = self->_databaseQuotaManager;
    if (databaseQuotaManager)
LABEL_5:

  }
  v10.receiver = self;
  v10.super_class = (Class)WebSecurityOrigin;
  -[WebSecurityOrigin dealloc](&v10, sel_dealloc);
}

- (id)_initWithWebCoreSecurityOrigin:(void *)a3
{
  id result;
  unsigned int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WebSecurityOrigin;
  result = -[WebSecurityOrigin init](&v6, sel_init);
  if (result)
  {
    do
      v5 = __ldaxr((unsigned int *)a3);
    while (__stlxr(v5 + 1, (unsigned int *)a3));
    *((_QWORD *)result + 1) = a3;
  }
  return result;
}

- (id)_initWithString:(id)a3
{
  const WTF::String *v3;
  StringImpl *v4;
  WTF::StringImpl *v5;
  WebSecurityOrigin *v6;
  id result;
  StringImpl *v8;
  id v9;
  WTF *v10;
  unsigned int v11;
  unsigned int v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  uint64_t v15;
  WTF::StringImpl *v16;
  WTF *v17;

  MEMORY[0x1D82A3998](&v16, a3);
  WebCore::SecurityOrigin::createFromString((WebCore::SecurityOrigin *)&v16, v3);
  v5 = v16;
  v16 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
  v6 = [WebSecurityOrigin alloc];
  result = (id)CFMakeCollectable(-[WebSecurityOrigin _initWithWebCoreSecurityOrigin:](v6, "_initWithWebCoreSecurityOrigin:", v17, v16));
  v9 = result;
  v10 = v17;
  v17 = 0;
  if (v10)
  {
    do
    {
      v11 = __ldaxr((unsigned int *)v10);
      v12 = v11 - 1;
    }
    while (__stlxr(v12, (unsigned int *)v10));
    if (!v12)
    {
      atomic_store(1u, (unsigned int *)v10);
      v13 = (WTF::StringImpl *)*((_QWORD *)v10 + 6);
      *((_QWORD *)v10 + 6) = 0;
      if (v13)
      {
        if (*(_DWORD *)v13 == 2)
          WTF::StringImpl::destroy(v13, v8);
        else
          *(_DWORD *)v13 -= 2;
      }
      v14 = (WTF::StringImpl *)*((_QWORD *)v10 + 5);
      *((_QWORD *)v10 + 5) = 0;
      if (v14)
      {
        if (*(_DWORD *)v14 == 2)
          WTF::StringImpl::destroy(v14, v8);
        else
          *(_DWORD *)v14 -= 2;
      }
      v15 = *((unsigned int *)v10 + 8);
      if ((_DWORD)v15 != -1)
        ((void (*)(WTF::StringImpl **, char *))off_1E9D6E8E0[v15])(&v16, (char *)v10 + 8);
      *((_DWORD *)v10 + 8) = -1;
      WTF::fastFree(v10, v8);
      return v9;
    }
  }
  return result;
}

- (void)_core
{
  return self->_private;
}

- (id)databaseQuotaManager
{
  id result;

  result = self->_databaseQuotaManager;
  if (!result)
  {
    result = -[WebDatabaseQuotaManager initWithOrigin:]([WebDatabaseQuotaManager alloc], "initWithOrigin:", self);
    self->_databaseQuotaManager = (WebQuotaManager *)result;
  }
  return result;
}

- (unint64_t)usage
{
  WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
  return WebCore::DatabaseTracker::usage();
}

- (unint64_t)quota
{
  WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
  return WebCore::DatabaseTracker::quota();
}

- (void)setQuota:(unint64_t)a3
{
  WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
  WebCore::DatabaseTracker::setQuota();
}

@end
