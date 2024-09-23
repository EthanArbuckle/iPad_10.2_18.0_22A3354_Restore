@implementation CLMescalSigner

- (id)initInSilo:(id)a3
{
  CLMescalSigner *v4;
  CLMescalSigner *v5;
  int v6;
  NSObject *v7;
  const char *v9;
  uint8_t *v10;
  _WORD v11[8];
  objc_super v12;
  uint8_t buf[1640];

  v12.receiver = self;
  v12.super_class = (Class)CLMescalSigner;
  v4 = -[CLMescalSigner init](&v12, "init");
  v5 = v4;
  if (v4)
  {
    sub_1003EEC00(0, 0, (uint64_t)&v4->_hardwareInfo);
    if (v6)
    {
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_102142D80);
      v7 = qword_1022A02D8;
      if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "MESCAL: Could not derive hardware info for SAPInit", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A02D0 != -1)
          dispatch_once(&qword_1022A02D0, &stru_102142D80);
        v11[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 17, "MESCAL: Could not derive hardware info for SAPInit", v11, 2);
        v10 = (uint8_t *)v9;
        sub_100512490("Generic", 1, 0, 0, "-[CLMescalSigner initInSilo:]", "%s\n", v9);
        if (v10 != buf)
          free(v10);
      }

      return 0;
    }
    else
    {
      v5->_silo = (CLSilo *)a3;
      v5->_worklist = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v5->_replaceAfter = CFAbsoluteTimeGetCurrent() + 3600.0;
    }
  }
  return v5;
}

- (void)dealloc
{
  FPSAPContextOpaque_ *session;
  CLMescalSigner *v4;
  SEL v5;
  id v6;
  id v7;
  objc_super v8;

  self->_mescalVersion = 0;
  self->_mescalCertURL = 0;

  self->_mescalExchangeURL = 0;
  session = self->_session;
  if (session)
  {
    sub_1003C2E50((uint64_t)session);
    self->_session = 0;
  }
  if (-[NSMutableArray count](self->_worklist, "count"))
  {
    v4 = (CLMescalSigner *)sub_1018FEABC();
    -[CLMescalSigner signData:withCompletion:](v4, v5, v6, v7);
  }
  else
  {

    self->_worklist = 0;
    v8.receiver = self;
    v8.super_class = (Class)CLMescalSigner;
    -[CLMescalSigner dealloc](&v8, "dealloc");
  }
}

- (void)signData:(id)a3 withCompletion:(id)a4
{
  NSMutableArray *worklist;
  id v6;
  _QWORD v7[5];
  _QWORD v8[2];
  _QWORD v9[2];

  if (!a3)
  {
    v6 = (id)sub_1018FEC1C(self, a2, 0, a4);
    goto LABEL_9;
  }
  worklist = self->_worklist;
  v9[0] = a3;
  v8[0] = CFSTR("dataIn");
  v8[1] = CFSTR("hdlr");
  v9[1] = objc_msgSend(a4, "copy");
  v6 = -[NSMutableArray addObject:](worklist, "addObject:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
  if (self->_keyExchangeComplete)
  {
    -[CLMescalSigner _doSigningWhenReady](self, "_doSigningWhenReady");
    return;
  }
  if (!self->_keyExchangeStarted)
  {
    self->_keyExchangeStarted = 1;
    if (!self->_session)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10054B628;
      v7[3] = &unk_102142CC0;
      v7[4] = self;
      -[CLMescalSigner _initializeMescalWithCompletion:](self, "_initializeMescalWithCompletion:", v7);
      return;
    }
LABEL_9:
    sub_1018FED7C(v6);
  }
}

- (void)_doSigningWhenReady
{
  NSMutableArray *worklist;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void (**v10)(id, _QWORD);
  void (**v11)(id, _QWORD);
  FPSAPContextOpaque_ *session;
  int v13;
  int v14;
  NSObject *v15;
  NSData *v16;
  const char *v17;
  uint8_t *v18;
  id v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  int v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  _BYTE v31[128];

  if (!self->_keyExchangeComplete)
    sub_1018FF03C();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  worklist = self->_worklist;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](worklist, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(worklist);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v7);
        v9 = objc_msgSend(v8, "objectForKey:", CFSTR("dataIn"));
        v10 = (void (**)(id, _QWORD))objc_msgSend(v8, "objectForKey:", CFSTR("hdlr"));
        v11 = v10;
        session = self->_session;
        if (session)
        {
          v22 = 0;
          v21 = 0;
          sub_1003D2268((uint64_t)session, (uint64_t)objc_msgSend(v9, "bytes"), (uint64_t)objc_msgSend(v9, "length"), (uint64_t)&v22, (uint64_t)&v21);
          if (v13)
          {
            v14 = v13;
            if (qword_1022A02D0 != -1)
              dispatch_once(&qword_1022A02D0, &stru_102142D80);
            v15 = qword_1022A02D8;
            if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 134349056;
              v30 = v14;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "MESCAL: SAPSign failed with: %{public}ld", buf, 0xCu);
            }
            if (sub_1001BFF7C(115, 0))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1022A02D0 != -1)
                dispatch_once(&qword_1022A02D0, &stru_102142D80);
              v27 = 134349056;
              v28 = v14;
              LODWORD(v20) = 12;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 17, "MESCAL: SAPSign failed with: %{public}ld", &v27, v20);
              v18 = (uint8_t *)v17;
              sub_100512490("Generic", 1, 0, 0, "-[CLMescalSigner _doSigningWhenReady]", "%s\n", v17);
              if (v18 != buf)
                free(v18);
            }
            v16 = 0;
          }
          else
          {
            v16 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v22, v21);
            sub_1003D2210(v22);
          }
          ((void (**)(id, NSData *))v11)[2](v11, v16);
        }
        else
        {
          v10[2](v10, 0);
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](worklist, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      v5 = v19;
    }
    while (v19);
  }
  -[NSMutableArray removeAllObjects](self->_worklist, "removeAllObjects");
}

- (id)_mescalSignerNSURLSession
{
  return +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", +[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"), self, -[CLSilo operationQueue](self->_silo, "operationQueue"));
}

- (void)_initializeMescalWithCompletion:(id)a3
{
  int v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  const char *v8;
  id v9;
  NSObject *v10;
  uint8_t *v11;
  _QWORD v12[6];
  _QWORD v13[2];
  uint64_t (*v14)(uint64_t, char);
  void *v15;
  CLMescalSigner *v16;
  id v17;
  int v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v14 = sub_10054BD10;
  v15 = &unk_102142CE8;
  v16 = self;
  v17 = a3;
  sub_1003D135C((uint64_t)&self->_session, (uint64_t)&self->_hardwareInfo);
  if (v4)
  {
    v6 = v4;
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_102142D80);
    v7 = qword_1022A02D8;
    if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349056;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "MESCAL: SAPInit failed with: %{public}ld", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 0))
      goto LABEL_18;
    bzero(buf, 0x65CuLL);
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_102142D80);
    v18 = 134349056;
    v19 = v6;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 17, "MESCAL: SAPInit failed with: %{public}ld", &v18, 12);
    goto LABEL_22;
  }
  if (objc_opt_class(SSURLBag, v5))
  {
    v9 = +[SSURLBag URLBagForContext:](SSURLBag, "URLBagForContext:", objc_alloc_init((Class)SSURLBagContext));
    if (v9)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10054BED0;
      v12[3] = &unk_102142D60;
      v12[4] = self;
      v12[5] = v13;
      objc_msgSend(v9, "loadWithCompletionBlock:", v12);
      return;
    }
  }
  if (qword_1022A02D0 != -1)
    dispatch_once(&qword_1022A02D0, &stru_102142D80);
  v10 = qword_1022A02D8;
  if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "MESCAL: Could not obtain store URL bag", buf, 2u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_102142D80);
    LOWORD(v18) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 17, "MESCAL: Could not obtain store URL bag", &v18, 2);
LABEL_22:
    v11 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 0, "-[CLMescalSigner _initializeMescalWithCompletion:]", "%s\n", v8);
    if (v11 != buf)
      free(v11);
  }
LABEL_18:
  v14((uint64_t)v13, 0);
}

- (void)_churnMescalExchangeData:(id)a3 withCompletion:(id)a4
{
  void (**v4)(id, _QWORD);
  uint64_t *v5;
  FPSAPContextOpaque_ *session;
  CLMescalSigner *v7;
  int v8;
  NSData *v9;
  NSObject *v10;
  NSData *v11;
  NSMutableURLRequest *v12;
  id v13;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  _QWORD v17[6];
  char v18;
  unsigned int v19;
  uint64_t v20;
  const __CFString *v21;
  NSData *v22;
  int v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;

  session = self->_session;
  if (!session)
  {
    self = (CLMescalSigner *)sub_1018FF19C();
    goto LABEL_22;
  }
  v5 = (uint64_t *)a3;
  if (!a3)
  {
LABEL_22:
    sub_1018FF2FC(self, a2);
    goto LABEL_23;
  }
  v4 = (void (**)(id, _QWORD))a4;
  v7 = self;
  v20 = 0;
  v19 = 0;
  v18 = -1;
  sub_1003F66B4(200, (uint64_t)&self->_hardwareInfo, (uint64_t)session, (uint64_t)objc_msgSend(a3, "bytes"), (uint64_t)objc_msgSend(a3, "length"), (uint64_t)&v20, (uint64_t)&v19, (uint64_t)&v18);
  LODWORD(session) = v8;
  v9 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v20, v19);
  sub_1003D2210(v20);
  if ((_DWORD)session)
  {
    v5 = &qword_1022A0000;
    if (qword_1022A02D0 == -1)
    {
LABEL_5:
      v10 = qword_1022A02D8;
      if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134349056;
        v26 = (int)session;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "MESCAL: SAPExchange failed with: %{public}ld", buf, 0xCu);
      }
      if (!sub_1001BFF7C(115, 0))
        goto LABEL_8;
      bzero(buf, 0x65CuLL);
      if (v5[90] != -1)
        dispatch_once(&qword_1022A02D0, &stru_102142D80);
      v23 = 134349056;
      v24 = (int)session;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 17, "MESCAL: SAPExchange failed with: %{public}ld", &v23, 12);
LABEL_27:
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 0, "-[CLMescalSigner _churnMescalExchangeData:withCompletion:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
LABEL_8:
      v4[2](v4, 0);
      return;
    }
LABEL_23:
    dispatch_once(&qword_1022A02D0, &stru_102142D80);
    goto LABEL_5;
  }
  if (v18 == 1)
  {
    v21 = CFSTR("sign-sap-setup-buffer");
    v22 = v9;
    v11 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1), 100, 0, 0);
    v12 = +[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", +[NSURL URLWithString:](NSURL, "URLWithString:", v7->_mescalExchangeURL));
    -[NSMutableURLRequest setValue:forHTTPHeaderField:](v12, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("content-type"));
    -[NSMutableURLRequest setHTTPMethod:](v12, "setHTTPMethod:", CFSTR("POST"));
    -[NSMutableURLRequest setHTTPBody:](v12, "setHTTPBody:", v11);
    v13 = -[CLMescalSigner _mescalSignerNSURLSession](v7, "_mescalSignerNSURLSession");
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10054CA38;
    v17[3] = &unk_102142D10;
    v17[4] = v7;
    v17[5] = v4;
    objc_msgSend(objc_msgSend(v13, "dataTaskWithRequest:completionHandler:", v12, v17), "resume");
    objc_msgSend(v13, "finishTasksAndInvalidate");
  }
  else
  {
    if (v18)
    {
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_102142D80);
      v14 = qword_1022A02D8;
      if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67240192;
        LODWORD(v26) = v18;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "MESCAL: SAPExchange unexpect non-erroneous return code: %{public}d", buf, 8u);
      }
      if (!sub_1001BFF7C(115, 0))
        goto LABEL_8;
      bzero(buf, 0x65CuLL);
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_102142D80);
      v23 = 67240192;
      LODWORD(v24) = v18;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 17, "MESCAL: SAPExchange unexpect non-erroneous return code: %{public}d", &v23, 8);
      goto LABEL_27;
    }
    v4[2](v4, 1);
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  +[CLCertificatePinningHelper URLSession:didReceiveChallenge:completionHandler:](CLCertificatePinningHelper, "URLSession:didReceiveChallenge:completionHandler:", a3, a4, a5);
}

- (double)replaceAfter
{
  return self->_replaceAfter;
}

@end
