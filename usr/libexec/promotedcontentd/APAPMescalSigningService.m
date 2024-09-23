@implementation APAPMescalSigningService

- (APAPMescalSigningService)initWithInterval:(unint64_t)a3
{
  APAPMescalSigningService *v4;
  APAPMescalSigningService *v5;
  uint64_t v6;
  APMescalSigningSettings *mescalSigningSettings;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)APAPMescalSigningService;
  v4 = -[APAPMescalSigningService init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    v4->_intervalId = a3;
    v4->_version = 200;
    v6 = objc_claimAutoreleasedReturnValue(+[APMescalSigningSettings settings](APMescalSigningSettings, "settings"));
    mescalSigningSettings = v5->_mescalSigningSettings;
    v5->_mescalSigningSettings = (APMescalSigningSettings *)v6;

  }
  return v5;
}

- (void)setup
{
  -[APAPMescalSigningService setupRequestSigningWithCachedCertificate:](self, "setupRequestSigningWithCachedCertificate:", 1);
}

- (void)retrySetup
{
  -[APAPMescalSigningService setupRequestSigningWithCachedCertificate:](self, "setupRequestSigningWithCachedCertificate:", 0);
}

- (void)setState:(int64_t)a3
{
  void *v5;
  id WeakRetained;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APAPMescalSigningService delegate](self, "delegate"));

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
    objc_msgSend(WeakRetained, "mescalStateChanged:", a3);

  }
}

- (BOOL)signatureIsValid:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  _BYTE v29[14];
  __int16 v30;
  NSObject *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  const __CFString *v35;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v8, 0);
  if (!v10)
  {
    if (a5)
    {
      v34 = CFSTR("reason");
      v35 = CFSTR("Unable to decode signature string.");
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.MescalSigning"), 1102, v23));

    }
    v24 = APLogForCategory(28);
    v17 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136643075;
      v27 = "-[APAPMescalSigningService signatureIsValid:data:error:]";
      v28 = 2117;
      *(_QWORD *)v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Unable to decode signature string %{sensitive}@; cannot verify signature.",
        buf,
        0x16u);
    }
    goto LABEL_12;
  }
  v11 = objc_msgSend(v9, "mutableCopy");
  -[APAPMescalSigningService session](self, "session");
  v12 = objc_retainAutorelease(v10);
  objc_msgSend(v12, "bytes");
  objc_msgSend(v12, "length");
  v13 = objc_retainAutorelease(v11);
  objc_msgSend(v13, "mutableBytes");
  objc_msgSend(v13, "length");
  sub_100070BAC();
  v15 = v14;

  v16 = (_DWORD)v15 == 0;
  if ((_DWORD)v15)
  {
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "base64EncodedStringWithOptions:", 32));
    if (a5)
    {
      v32 = CFSTR("reason");
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Signature validation failed with error %d."), v15));
      v33 = v18;
      v19 = v9;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.MescalSigning"), 1103, v20));

      v9 = v19;
    }
    v21 = APLogForCategory(28);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136643587;
      v27 = "-[APAPMescalSigningService signatureIsValid:data:error:]";
      v28 = 1024;
      *(_DWORD *)v29 = v15;
      *(_WORD *)&v29[4] = 2117;
      *(_QWORD *)&v29[6] = v8;
      v30 = 2117;
      v31 = v17;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Signature validation failed with error %d\nBase64-encoded signature: %{sensitive}@\nBase64-encoded body: %{sensitive}@", buf, 0x26u);
    }

LABEL_12:
    v16 = 0;
  }

  return v16;
}

- (id)rawSignatureForData:(id)a3 error:(id *)a4
{
  id v6;
  FPSAPContextOpaque_ *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  const __CFString *v25;
  void *v26;

  v20 = 0;
  v19 = 0;
  v6 = a3;
  v7 = -[APAPMescalSigningService session](self, "session");
  v8 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");

  sub_10005EB64((uint64_t)v7, (uint64_t)v9, (uint64_t)v10, (uint64_t)&v20, (uint64_t)&v19);
  if ((_DWORD)v11)
  {
    v12 = v11;
    if (v20)
      sub_10005C568(v20);
    if (a4)
    {
      v25 = CFSTR("reason");
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed with error code %d."), v12));
      v26 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.MescalSigning"), 1104, v14));

    }
    v15 = APLogForCategory(28);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136643075;
      v22 = "-[APAPMescalSigningService rawSignatureForData:error:]";
      v23 = 1024;
      v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: FairPlaySAPSign failed with error code %d. Unable to generate signature - disabling request signing.", buf, 0x12u);
    }

    -[APAPMescalSigningService setState:](self, "setState:", 3);
    return 0;
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v20, v19));
    sub_10005C568(v20);
    return v18;
  }
}

- (BOOL)initializeFairPlay
{
  int v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  int v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;

  if (-[APAPMescalSigningService session](self, "session"))
  {
    sub_10004E448((uint64_t)-[APAPMescalSigningService session](self, "session"));
    -[APAPMescalSigningService setSession:](self, "setSession:", 0);
  }
  sub_100072054(0, 0, (uint64_t)&self->_hwInfo);
  if (v3)
  {
    v4 = v3;
    v5 = APLogForCategory(28);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v13 = 136643075;
      v14 = "-[APAPMescalSigningService initializeFairPlay]";
      v15 = 1026;
      v16 = v4;
      v7 = "[%{sensitive}s]: FairPlayGetHWInfo returned %{public}d";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v13, 0x12u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  sub_10005B7C0((uint64_t)&self->_session, (uint64_t)&self->_hwInfo);
  v9 = v8;
  v10 = APLogForCategory(28);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v6 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136643075;
      v14 = "-[APAPMescalSigningService initializeFairPlay]";
      v15 = 1026;
      v16 = v9;
      v7 = "[%{sensitive}s]: FairPlaySAPInit returned %{public}d";
      goto LABEL_9;
    }
LABEL_10:

    -[APAPMescalSigningService setState:](self, "setState:", 3);
    return 0;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136642819;
    v14 = "-[APAPMescalSigningService initializeFairPlay]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{sensitive}s]: Fairplay initialized successfully.", (uint8_t *)&v13, 0xCu);
  }

  return 1;
}

- (void)dealloc
{
  objc_super v3;

  if (-[APAPMescalSigningService session](self, "session"))
    sub_10004E448((uint64_t)-[APAPMescalSigningService session](self, "session"));
  v3.receiver = self;
  v3.super_class = (Class)APAPMescalSigningService;
  -[APAPMescalSigningService dealloc](&v3, "dealloc");
}

- (void)setupRequestSigningWithCachedCertificate:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  uint64_t v9;
  NSObject *v10;
  unint64_t v11;
  os_signpost_id_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  unint64_t v21;
  os_signpost_id_t v22;
  int v23;
  const char *v24;

  v3 = a3;
  v5 = APPerfLogForCategory(28);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = -[APAPMescalSigningService intervalId](self, "intervalId");
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v6))
    {
      LOWORD(v23) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "Initialize Fairplay", ", (uint8_t *)&v23, 2u);
    }
  }

  if (-[APAPMescalSigningService initializeFairPlay](self, "initializeFairPlay"))
  {
    v9 = APPerfLogForCategory(28);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = -[APAPMescalSigningService intervalId](self, "intervalId");
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v10))
      {
        LOWORD(v23) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, v12, "Initialize Fairplay", ", (uint8_t *)&v23, 2u);
      }
    }

    if (!v3)
    {
      -[APAPMescalSigningService requestCertificate](self, "requestCertificate");
      return;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[APAPMescalSigningService mescalSigningSettings](self, "mescalSigningSettings"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cachedCertificate"));

    v15 = APLogForCategory(28);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v17)
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Beginning Mescal negotiation with a cached certificate.", (uint8_t *)&v23, 2u);
      }

      -[APAPMescalSigningService fairPlaySAPExchange:certificateIsCached:](self, "fairPlaySAPExchange:certificateIsCached:", v14, 1);
    }
    else
    {
      if (v17)
      {
        v23 = 136642819;
        v24 = "-[APAPMescalSigningService setupRequestSigningWithCachedCertificate:]";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%{sensitive}s]: No cached Mescal certificate available.", (uint8_t *)&v23, 0xCu);
      }

      -[APAPMescalSigningService requestCertificate](self, "requestCertificate");
    }
  }
  else
  {
    v18 = APLogForCategory(28);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v23 = 136642819;
      v24 = "-[APAPMescalSigningService setupRequestSigningWithCachedCertificate:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Fairplay initialization failed.", (uint8_t *)&v23, 0xCu);
    }

    v20 = APPerfLogForCategory(28);
    v14 = objc_claimAutoreleasedReturnValue(v20);
    v21 = -[APAPMescalSigningService intervalId](self, "intervalId");
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v22 = v21;
      if (os_signpost_enabled(v14))
      {
        LOWORD(v23) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, v22, "Initialize Fairplay", ", (uint8_t *)&v23, 2u);
      }
    }
  }

}

- (void)requestCertificate
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  _QWORD v9[5];
  uint8_t buf[4];
  const char *v11;

  v3 = APLogForCategory(28);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136642819;
    v11 = "-[APAPMescalSigningService requestCertificate]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{sensitive}s]: Requesting Mescal certificate from AdServer", buf, 0xCu);
  }

  v5 = APPerfLogForCategory(28);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = -[APAPMescalSigningService intervalId](self, "intervalId");
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "Request Certificate", ", buf, 2u);
    }
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100121014;
  v9[3] = &unk_100215690;
  v9[4] = self;
  +[APMescalSigningLegacyInterface requestCertificateWithCompletion:](APMescalSigningLegacyInterface, "requestCertificateWithCompletion:", v9);
}

- (void)fairPlaySAPExchange:(id)a3 certificateIsCached:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  FPSAPContextOpaque_ *v15;
  id v16;
  id v17;
  id v18;
  int v19;
  int v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  NSObject *v25;
  unint64_t v26;
  os_signpost_id_t v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  unint64_t v34;
  os_signpost_id_t v35;
  uint64_t v36;
  NSObject *v37;
  _BOOL4 v38;
  APAPMescalSigningService *v39;
  uint64_t v40;
  void *v41;
  _QWORD v42[5];
  BOOL v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  double v50;

  v4 = a4;
  v6 = a3;
  v7 = APPerfLogForCategory(28);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = -[APAPMescalSigningService intervalId](self, "intervalId");
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SAP Exchange", ", buf, 2u);
    }
  }

  v46 = 0;
  v45 = 0;
  v44 = -1;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v11, "timeIntervalSince1970");
  v13 = v12;

  v14 = -[APAPMescalSigningService version](self, "version");
  v15 = -[APAPMescalSigningService session](self, "session");
  v16 = objc_retainAutorelease(v6);
  v17 = objc_msgSend(v16, "bytes");
  v18 = objc_msgSend(v16, "length");

  sub_1000754A0(v14, (uint64_t)&self->_hwInfo, (uint64_t)v15, (uint64_t)v17, (uint64_t)v18, (uint64_t)&v46, (uint64_t)&v45, (uint64_t)&v44);
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v21, "timeIntervalSince1970");
  v23 = v22;

  v24 = APPerfLogForCategory(28);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  v26 = -[APAPMescalSigningService intervalId](self, "intervalId");
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v27 = v26;
    if (os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, v27, "SAP Exchange", ", buf, 2u);
    }
  }

  v28 = APLogForCategory(28);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136643075;
    v48 = "-[APAPMescalSigningService fairPlaySAPExchange:certificateIsCached:]";
    v49 = 2048;
    v50 = v23 - v13;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%{sensitive}s]: FairPlaySAPExchange took %.2f seconds", buf, 0x16u);
  }

  if (v44 == 1)
  {
    v30 = objc_alloc((Class)NSData);
    v31 = objc_msgSend(v30, "initWithBytes:length:", v46, v45);
  }
  else
  {
    v31 = 0;
  }
  sub_10005C568(v46);
  if (v44 != -1)
  {
    if (v44)
    {
      if (v44 == 1)
      {
        v32 = APPerfLogForCategory(28);
        v33 = objc_claimAutoreleasedReturnValue(v32);
        v34 = -[APAPMescalSigningService intervalId](self, "intervalId");
        if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v35 = v34;
          if (os_signpost_enabled(v33))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_BEGIN, v35, "SAP Negotiating", ", buf, 2u);
          }
        }

        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_100121580;
        v42[3] = &unk_1002156B8;
        v42[4] = self;
        v43 = v4;
        +[APMescalSigningLegacyInterface requestMescalSetupForData:completionHandler:](APMescalSigningLegacyInterface, "requestMescalSetupForData:completionHandler:", v31, v42);
      }
      else
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FairPlaySAPExchange returned unexpected code: %d."), v44));
        APSimulateCrash(5, v41, 1);

      }
      goto LABEL_29;
    }
    v39 = self;
    v40 = 2;
LABEL_28:
    -[APAPMescalSigningService setState:](v39, "setState:", v40);
    goto LABEL_29;
  }
  v36 = APLogForCategory(28);
  v37 = objc_claimAutoreleasedReturnValue(v36);
  v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
  if (!v4)
  {
    if (v38)
    {
      *(_DWORD *)buf = 136643075;
      v48 = "-[APAPMescalSigningService fairPlaySAPExchange:certificateIsCached:]";
      v49 = 1026;
      LODWORD(v50) = v20;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Negotiation using a fresh certificate failed with error %{public}d; request signing will be disabled.",
        buf,
        0x12u);
    }

    v39 = self;
    v40 = 3;
    goto LABEL_28;
  }
  if (v38)
  {
    *(_DWORD *)buf = 136643075;
    v48 = "-[APAPMescalSigningService fairPlaySAPExchange:certificateIsCached:]";
    v49 = 1026;
    LODWORD(v50) = v20;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Negotiation using cached certificate failed with error %{public}d; requesting a fresh certificate"
      " and trying again.",
      buf,
      0x12u);
  }

  -[APAPMescalSigningService requestCertificate](self, "requestCertificate");
LABEL_29:

}

- (void)certificateRetrievalDidFinish:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  APAPMescalSigningService *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = APLogForCategory(28);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(v7, "code");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedDescription"));
      v18 = 136643331;
      v19 = "-[APAPMescalSigningService certificateRetrievalDidFinish:error:]";
      v20 = 2048;
      v21 = v10;
      v22 = 2114;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Error %ld retrieving Mescal certificate from AdServer - %{public}@. Requests will not be signed.", (uint8_t *)&v18, 0x20u);

    }
    v12 = self;
    v13 = 3;
LABEL_5:
    -[APAPMescalSigningService setState:](v12, "setState:", v13);
    goto LABEL_10;
  }
  v14 = APLogForCategory(28);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v16)
    {
      v18 = 136642819;
      v19 = "-[APAPMescalSigningService certificateRetrievalDidFinish:error:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%{sensitive}s]: Server returned an empty certificate for Mescal setup; requests will not be signed.",
        (uint8_t *)&v18,
        0xCu);
    }

    v12 = self;
    v13 = 4;
    goto LABEL_5;
  }
  if (v16)
  {
    v18 = 136642819;
    v19 = "-[APAPMescalSigningService certificateRetrievalDidFinish:error:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%{sensitive}s]: Successfully retrieved certificate; continuing negotiation.",
      (uint8_t *)&v18,
      0xCu);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[APAPMescalSigningService mescalSigningSettings](self, "mescalSigningSettings"));
  objc_msgSend(v17, "setCachedCertificate:", v6);

  -[APAPMescalSigningService fairPlaySAPExchange:certificateIsCached:](self, "fairPlaySAPExchange:certificateIsCached:", v6, 0);
LABEL_10:

}

- (void)setupNegotiationStepDidFinish:(id)a3 certificateIsCached:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v10 = APLogForCategory(28);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(v9, "code");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedDescription"));
      v16 = 136643331;
      v17 = "-[APAPMescalSigningService setupNegotiationStepDidFinish:certificateIsCached:error:]";
      v18 = 2050;
      v19 = v12;
      v20 = 2114;
      v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Mescal negotiation failed with error code %{public}ld. %{public}@", (uint8_t *)&v16, 0x20u);

    }
LABEL_4:

    -[APAPMescalSigningService setState:](self, "setState:", 3);
    goto LABEL_9;
  }
  v14 = APLogForCategory(28);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v11 = v15;
  if (!v8)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = 136642819;
      v17 = "-[APAPMescalSigningService setupNegotiationStepDidFinish:certificateIsCached:error:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[%{sensitive}s]: Failed to retrieve Mescal negotiation response; requests will not be signed.",
        (uint8_t *)&v16,
        0xCu);
    }
    goto LABEL_4;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136642819;
    v17 = "-[APAPMescalSigningService setupNegotiationStepDidFinish:certificateIsCached:error:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{sensitive}s]: Successfully retrieved setup buffer; continuing negotiation.",
      (uint8_t *)&v16,
      0xCu);
  }

  -[APAPMescalSigningService fairPlaySAPExchange:certificateIsCached:](self, "fairPlaySAPExchange:certificateIsCached:", v8, v6);
LABEL_9:

}

- (APMescalSigningStateChangedDelegate)delegate
{
  return (APMescalSigningStateChangedDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (FPSAPContextOpaque_)session
{
  return self->_session;
}

- (void)setSession:(FPSAPContextOpaque_ *)a3
{
  self->_session = a3;
}

- (FairPlayHWInfo_)hwInfo
{
  *retstr = self[2];
  return self;
}

- (void)setHwInfo:(FairPlayHWInfo_ *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->IDLength;
  *(_QWORD *)&self->_hwInfo.ID[12] = *(_QWORD *)&a3->ID[12];
  *(_OWORD *)&self->_hwInfo.IDLength = v3;
}

- (APMescalSigningSettings)mescalSigningSettings
{
  return self->_mescalSigningSettings;
}

- (void)setMescalSigningSettings:(id)a3
{
  objc_storeStrong((id *)&self->_mescalSigningSettings, a3);
}

- (unint64_t)intervalId
{
  return self->_intervalId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mescalSigningSettings, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
