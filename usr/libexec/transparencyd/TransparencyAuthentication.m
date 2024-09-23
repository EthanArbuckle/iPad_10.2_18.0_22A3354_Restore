@implementation TransparencyAuthentication

+ (BOOL)isVirtualMachine
{
  if (qword_1002A7B88 != -1)
    dispatch_once(&qword_1002A7B88, &stru_10024C448);
  return byte_1002A7B90;
}

- (void)issueCert:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, KTBAAKey *);
  void *v7;
  KTBAAKey *v8;
  void *v9;
  _QWORD v10[5];
  void (**v11)(id, KTBAAKey *);

  v4 = a3;
  v6 = (void (**)(id, KTBAAKey *))a4;
  if (+[TransparencyAuthentication isVirtualMachine](TransparencyAuthentication, "isVirtualMachine"))
  {
    -[TransparencyAuthentication setIsSupported:](self, "setIsSupported:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInterface, -132, CFSTR("Device auth not supported for simulators")));
    v8 = -[KTBAAKey initWithKey:certificates:failure:]([KTBAAKey alloc], "initWithKey:certificates:failure:", 0, 0, v7);
    v6[2](v6, v8);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyAuthentication certFetcher](self, "certFetcher"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10019B164;
    v10[3] = &unk_10024C4D0;
    v10[4] = self;
    v11 = v6;
    objc_msgSend(v9, "getDeviceCertWithForcedFetch:completionHandler:", v4, v10);

  }
}

- (TransparencyAuthentication)initWithWorkloop:(id)a3
{
  id v3;
  TransparencyAuthentication *v4;
  TransparencyAuthentication *v5;
  TransparencyBAACertFetcher *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TransparencyAuthentication;
  v3 = a3;
  v4 = -[TransparencyAuthentication init](&v8, "init");
  v5 = v4;
  if (v4)
    -[TransparencyAuthentication setIsSupported:](v4, "setIsSupported:", 1, v8.receiver, v8.super_class);
  v6 = -[TransparencyBAACertFetcher initWithWorkloop:]([TransparencyBAACertFetcher alloc], "initWithWorkloop:", v3);

  -[TransparencyAuthentication setCertFetcher:](v5, "setCertFetcher:", v6);
  return v5;
}

- (BOOL)ready
{
  return 1;
}

- (void)signData:(id)a3 key:(__SecKey *)a4 certs:(id)a5 completionHandler:(id)a6
{
  id v9;
  void (**v10)(id, CFDataRef, id, _QWORD);
  CFDataRef v11;
  BOOL v12;
  NSObject *v13;
  CFErrorRef v14;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v17;

  v9 = a5;
  v10 = (void (**)(id, CFDataRef, id, _QWORD))a6;
  error = 0;
  v11 = SecKeyCreateSignature(a4, kSecKeyAlgorithmECDSASignatureMessageX962SHA256, (CFDataRef)a3, &error);
  if (v11)
    v12 = error == 0;
  else
    v12 = 0;
  if (v12)
  {
    v14 = v11;
    v10[2](v10, v11, v9, 0);
  }
  else
  {
    if (qword_1002A7B98 != -1)
      dispatch_once(&qword_1002A7B98, &stru_10024C4F0);
    v13 = qword_1002A7BA0;
    if (os_log_type_enabled((os_log_t)qword_1002A7BA0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = error;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to create signature: %@", buf, 0xCu);
    }
    v14 = error;
    ((void (**)(id, CFDataRef, id, CFErrorRef))v10)[2](v10, 0, 0, error);
  }

}

- (void)signData:(id)a3 fetchNow:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  TransparencyAuthentication *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  if (v6)
    goto LABEL_6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyAuthentication baaKey](v10, "baaKey"));
  if ((objc_msgSend(v11, "validBAAKey") & 1) == 0)
  {

    goto LABEL_6;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyAuthentication lastLocalFetchTime](v10, "lastLocalFetchTime"));
  objc_msgSend(v12, "timeIntervalSinceNow");
  v14 = v13;
  v15 = (double)(uint64_t)-kKTAuthenticationLifetime;

  if (v14 <= v15)
  {
LABEL_6:
    objc_sync_exit(v10);

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10019B8E0;
    v20[3] = &unk_10024C518;
    v20[4] = v10;
    v21 = v8;
    v22 = v9;
    -[TransparencyAuthentication issueCert:completionHandler:](v10, "issueCert:completionHandler:", v6, v20);

    goto LABEL_7;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyAuthentication baaKey](v10, "baaKey"));
  v17 = objc_msgSend(v16, "referenceKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyAuthentication baaKey](v10, "baaKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "certificates"));
  -[TransparencyAuthentication signData:key:certs:completionHandler:](v10, "signData:key:certs:completionHandler:", v8, v17, v19, v9);

  objc_sync_exit(v10);
LABEL_7:

}

- (void)signDataWithTimestamp:(id)a3 fetchNow:(BOOL)a4 timeShift:(double)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  double v12;
  double v13;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  unint64_t v24;

  v7 = a4;
  v10 = a6;
  v11 = a3;
  +[NSDate kt_currentTimeMs](NSDate, "kt_currentTimeMs");
  v13 = v12;
  if (a5 > 1.0 || a5 < -1.0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v15, "timeIntervalSince1970");
    v13 = (v16 + a5) * 1000.0;

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), (unint64_t)v13));
  v24 = bswap64((unint64_t)v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](NSMutableData, "dataWithData:", v11));

  objc_msgSend(v18, "appendBytes:length:", &v24, 8);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10019BB04;
  v21[3] = &unk_10024C540;
  v22 = v17;
  v23 = v10;
  v19 = v17;
  v20 = v10;
  -[TransparencyAuthentication signData:fetchNow:completionHandler:](self, "signData:fetchNow:completionHandler:", v18, v7, v21);

}

- (void)signDataWithTimestamp:(id)a3 fetchNow:(BOOL)a4 completionHandler:(id)a5
{
  -[TransparencyAuthentication signDataWithTimestamp:fetchNow:timeShift:completionHandler:](self, "signDataWithTimestamp:fetchNow:timeShift:completionHandler:", a3, a4, a5, 0.0);
}

- (BOOL)isSupported
{
  return self->_isSupported;
}

- (void)setIsSupported:(BOOL)a3
{
  self->_isSupported = a3;
}

- (NSDate)lastLocalFetchTime
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastLocalFetchTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (KTBAAKey)baaKey
{
  return (KTBAAKey *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBaaKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (KTBAAOperationProtocol)certFetcher
{
  return (KTBAAOperationProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCertFetcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certFetcher, 0);
  objc_storeStrong((id *)&self->_baaKey, 0);
  objc_storeStrong((id *)&self->_lastLocalFetchTime, 0);
}

@end
