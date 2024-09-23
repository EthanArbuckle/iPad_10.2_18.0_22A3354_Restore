@implementation TransparencyECVRFVerifier

- (TransparencyECVRFVerifier)initWithKey:(id)a3
{
  id v4;
  TransparencyECVRFVerifier *v5;
  TransparencyECVRFVerifier *v6;
  uint64_t v7;
  void *v8;
  id v9;
  TransparencyECVRFVerifier *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TransparencyECVRFVerifier;
  v5 = -[TransparencyVRFVerifier initWithKey:](&v12, "initWithKey:", v4);
  v6 = v5;
  if (v5
    && (ccvrf_factory_irtfdraft03_default(&v5->vrf),
        v7 = ccvrf_sizeof_public_key(&v6->vrf),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vrfKey")),
        v9 = objc_msgSend(v8, "length"),
        v8,
        (id)v7 != v9))
  {
    v10 = 0;
  }
  else
  {
    v10 = v6;
  }

  return v10;
}

- (int)vrfType
{
  return 3;
}

- (BOOL)verifyMessage:(id)a3 output:(id)a4 proof:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyVRFVerifier key](self, "key"));
  LOBYTE(a6) = +[TransparencyECVRFVerifier verifyMessage:salt:output:proof:key:error:](TransparencyECVRFVerifier, "verifyMessage:salt:output:proof:key:error:", v12, 0, v11, v10, v13, a6);

  return (char)a6;
}

+ (BOOL)verifyMessage:(id)a3 output:(id)a4 proof:(id)a5 key:(id)a6 error:(id *)a7
{
  return +[TransparencyECVRFVerifier verifyMessage:salt:output:proof:key:error:](TransparencyECVRFVerifier, "verifyMessage:salt:output:proof:key:error:", a3, 0, a4, a5, a6, a7);
}

- (BOOL)verifyMessage:(id)a3 salt:(id)a4 output:(id)a5 proof:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyVRFVerifier key](self, "key"));
  LOBYTE(a7) = +[TransparencyECVRFVerifier verifyMessage:salt:output:proof:key:error:](TransparencyECVRFVerifier, "verifyMessage:salt:output:proof:key:error:", v15, v14, v13, v12, v16, a7);

  return (char)a7;
}

+ (BOOL)verifyMessage:(id)a3 salt:(id)a4 output:(id)a5 proof:(id)a6 key:(id)a7 error:(id *)a8
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  _OWORD v29[5];
  uint64_t v30;
  uint8_t buf[4];
  int v32;

  v11 = a7;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyVRFVerifier saltMessage:salt:](TransparencyVRFVerifier, "saltMessage:salt:", a3, a4));
  v30 = 0;
  memset(v29, 0, sizeof(v29));
  ccvrf_factory_irtfdraft03_default(v29);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "vrfKey"));
  v15 = objc_msgSend(v14, "length");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "vrfKey"));

  v17 = objc_retainAutorelease(v16);
  v18 = objc_msgSend(v17, "bytes");
  v19 = objc_msgSend(v13, "length");
  v20 = objc_retainAutorelease(v13);
  v21 = objc_msgSend(v20, "bytes");
  v22 = objc_msgSend(v12, "length");
  v23 = objc_retainAutorelease(v12);
  v24 = objc_msgSend(v23, "bytes");

  v25 = ccvrf_verify(v29, v15, v18, v19, v21, v22, v24);
  if ((_DWORD)v25)
  {
    if (a8)
      *a8 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -2, CFSTR("ECVRF verification failed with result %d"), v25));
    if (qword_10012A5E0 != -1)
      dispatch_once(&qword_10012A5E0, &stru_100105BB0);
    v26 = qword_10012A5E8;
    if (os_log_type_enabled((os_log_t)qword_10012A5E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v32 = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "VRF verification failed with result %d", buf, 8u);
    }
  }

  return (_DWORD)v25 == 0;
}

@end
