@implementation GKFairPlaySAPSession

- (GKFairPlaySAPSession)init
{
  GKFairPlaySAPSession *v2;
  GKFairPlaySAPSession *v3;
  uint64_t v4;
  int v5;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  int v10;

  v8.receiver = self;
  v8.super_class = (Class)GKFairPlaySAPSession;
  v2 = -[GKFairPlaySAPSession init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    if (!-[GKFairPlaySAPSession _getHardwareInfo:](v2, "_getHardwareInfo:", &v2->_hardwareInfo))
    {
LABEL_8:

      return 0;
    }
    sub_1001DC398((uint64_t)&v3->_session, (uint64_t)&v3->_hardwareInfo);
    if ((_DWORD)v4)
    {
      v5 = v4;
      if (!os_log_GKGeneral)
        GKOSLoggers(v4);
      v6 = os_log_GKHTTP;
      if (os_log_type_enabled(os_log_GKHTTP, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v10 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "MESCAL:Could not create SAP session: %d", buf, 8u);
      }
      goto LABEL_8;
    }
  }
  return v3;
}

- (void)dealloc
{
  FPSAPContextOpaque_ *session;
  objc_super v4;

  session = self->_session;
  if (session)
    sub_1001CDE8C((uint64_t)session);

  v4.receiver = self;
  v4.super_class = (Class)GKFairPlaySAPSession;
  -[GKFairPlaySAPSession dealloc](&v4, "dealloc");
}

- (id)exchangeData:(id)a3 error:(id *)a4
{
  FPSAPContextOpaque_ *session;
  uint64_t v7;
  int v8;
  NSObject *v9;
  CFDataRef v10;
  NSError *v11;
  char v13;
  unsigned int v14;
  const UInt8 *v15;
  uint8_t buf[4];
  uint64_t v17;

  session = self->_session;
  if (session)
  {
    v15 = 0;
    v14 = 0;
    v13 = -1;
    sub_1002016F0(200, (uint64_t)&self->_hardwareInfo, (uint64_t)session, (uint64_t)objc_msgSend(a3, "bytes"), (uint64_t)objc_msgSend(a3, "length"), (uint64_t)&v15, (uint64_t)&v14, (uint64_t)&v13);
    if ((_DWORD)v7)
    {
      v8 = v7;
      if (!os_log_GKGeneral)
        GKOSLoggers(v7);
      v9 = os_log_GKHTTP;
      if (os_log_type_enabled(os_log_GKHTTP, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "MESCAL:Could not SAP exchange: %li", buf, 0xCu);
      }
      v11 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("GKFairPlay"), v8, 0);
      v10 = 0;
    }
    else
    {
      v10 = sub_100119038(v15, v14);
      v11 = 0;
      self->_complete = v13 == 0;
    }
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  if (a4 && !v10)
    *a4 = v11;
  return v10;
}

- (id)processSignedData:(id)a3 withSignature:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  NSError *v13;
  NSError *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  NSError *v22;

  if (!self->_session)
  {
    v8 = 0;
    goto LABEL_14;
  }
  v8 = objc_msgSend(a3, "mutableCopy");
  objc_msgSend(a4, "bytes");
  objc_msgSend(a4, "length");
  objc_msgSend(v8, "mutableBytes");
  objc_msgSend(v8, "length");
  sub_1001F82FC();
  v10 = v9;
  if (!os_log_GKGeneral)
    GKOSLoggers(v9);
  v11 = os_log_GKHTTP;
  if (os_log_type_enabled(os_log_GKHTTP, OS_LOG_TYPE_INFO))
  {
    v19 = 138412546;
    v20 = objc_opt_class(self, v12);
    v21 = 2048;
    v22 = (NSError *)v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "SIGNATURE VERIF1:%@: processed signature of SAP response: %li", (uint8_t *)&v19, 0x16u);
  }
  if (!v10)
  {
LABEL_14:
    v14 = 0;
    if (!a5)
      return v8;
    goto LABEL_15;
  }
  v13 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("GKFairPlay"), v10, 0);
  v14 = v13;
  if (!os_log_GKGeneral)
    GKOSLoggers(v13);
  v15 = os_log_GKHTTP;
  if (os_log_type_enabled(os_log_GKHTTP, OS_LOG_TYPE_INFO))
  {
    v17 = objc_opt_class(self, v16);
    v19 = 138412546;
    v20 = v17;
    v21 = 2112;
    v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "SIGNATURE VERIF2:%@: Could not process SAP response: %@", (uint8_t *)&v19, 0x16u);
  }

  v8 = 0;
  if (a5)
  {
LABEL_15:
    if (!v8)
      *a5 = v14;
  }
  return v8;
}

- (id)signatureForData:(id)a3 error:(id *)a4
{
  FPSAPContextOpaque_ *session;
  uint64_t v6;
  int v7;
  NSObject *v8;
  CFDataRef v9;
  NSError *v10;
  unsigned int v12;
  const UInt8 *v13;
  uint8_t buf[4];
  uint64_t v15;

  session = self->_session;
  if (!session)
  {
    v9 = 0;
    goto LABEL_9;
  }
  v13 = 0;
  v12 = 0;
  sub_1001DD2A4((uint64_t)session, (uint64_t)objc_msgSend(a3, "bytes"), (uint64_t)objc_msgSend(a3, "length"), (uint64_t)&v13, (uint64_t)&v12);
  if (!(_DWORD)v6)
  {
    v9 = sub_100119038(v13, v12);
LABEL_9:
    v10 = 0;
    if (!a4)
      return v9;
    goto LABEL_12;
  }
  v7 = v6;
  if (!os_log_GKGeneral)
    GKOSLoggers(v6);
  v8 = os_log_GKHTTP;
  if (os_log_type_enabled(os_log_GKHTTP, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Could not SAP sign: %li", buf, 0xCu);
  }
  v10 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("GKFairPlay"), v7, 0);
  v9 = 0;
  if (a4)
  {
LABEL_12:
    if (!v9)
      *a4 = v10;
  }
  return v9;
}

- (id)signatureStringForData:(id)a3 error:(id *)a4
{
  id v5;
  id result;
  void *v7;

  v7 = 0;
  v5 = -[GKFairPlaySAPSession signatureForData:error:](self, "signatureForData:error:", a3, &v7);
  result = objc_msgSend(v5, "length");
  if (result)
    result = objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  if (a4)
  {
    if (!result)
      *a4 = v7;
  }
  return result;
}

- (BOOL)_getHardwareInfo:(FairPlayHWInfo_ *)a3
{
  uint64_t v3;
  int v4;
  NSObject *v5;

  sub_1001F9C3C(0, 0, (uint64_t)a3);
  v4 = v3;
  if ((_DWORD)v3)
  {
    if (!os_log_GKGeneral)
      GKOSLoggers(v3);
    v5 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_100119510(v5);
  }
  return v4 == 0;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (NSString)SAPVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSAPVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

@end
