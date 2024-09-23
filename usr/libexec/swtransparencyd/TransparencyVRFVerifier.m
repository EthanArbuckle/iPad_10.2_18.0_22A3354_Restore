@implementation TransparencyVRFVerifier

+ (id)verifierOfType:(int)a3 key:(id)a4
{
  id v5;
  TransparencyECVRFVerifier *v6;
  NSObject *v7;
  NSObject *v8;
  _DWORD v10[2];

  v5 = a4;
  if (a3 == 3)
  {
    v6 = -[TransparencyECVRFVerifier initWithKey:]([TransparencyECVRFVerifier alloc], "initWithKey:", v5);
    if (v6)
      goto LABEL_12;
    if (qword_10012A5E0 != -1)
      dispatch_once(&qword_10012A5E0, &stru_100105B70);
    v7 = qword_10012A5E8;
    if (os_log_type_enabled((os_log_t)qword_10012A5E8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to create ECVRF_ED25519_SHA512_Elligator2 verifier, falling back to unknown algorithm", (uint8_t *)v10, 2u);
    }
  }
  if (qword_10012A5E0 != -1)
    dispatch_once(&qword_10012A5E0, &stru_100105B90);
  v8 = qword_10012A5E8;
  if (os_log_type_enabled((os_log_t)qword_10012A5E8, OS_LOG_TYPE_ERROR))
  {
    v10[0] = 67109120;
    v10[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unknown VRF algorithm: %d", (uint8_t *)v10, 8u);
  }
  v6 = -[TransparencyVRFVerifier initWithKey:]([TransparencyVRFVerifier alloc], "initWithKey:", v5);
LABEL_12:

  return v6;
}

- (TransparencyVRFVerifier)initWithKey:(id)a3
{
  id v4;
  TransparencyVRFVerifier *v5;
  TransparencyVRFVerifier *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TransparencyVRFVerifier;
  v5 = -[TransparencyVRFVerifier init](&v8, "init");
  v6 = v5;
  if (v5)
    -[TransparencyVRFVerifier setKey:](v5, "setKey:", v4);

  return v6;
}

- (int)vrfType
{
  return 0;
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
  LOBYTE(a6) = +[TransparencyVRFVerifier verifyMessage:salt:output:proof:key:error:](TransparencyVRFVerifier, "verifyMessage:salt:output:proof:key:error:", v12, 0, v11, v10, v13, a6);

  return (char)a6;
}

+ (BOOL)verifyMessage:(id)a3 output:(id)a4 proof:(id)a5 key:(id)a6 error:(id *)a7
{
  return +[TransparencyVRFVerifier verifyMessage:salt:output:proof:key:error:](TransparencyVRFVerifier, "verifyMessage:salt:output:proof:key:error:", a3, 0, a4, a5, a6, a7);
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
  LOBYTE(a7) = +[TransparencyVRFVerifier verifyMessage:salt:output:proof:key:error:](TransparencyVRFVerifier, "verifyMessage:salt:output:proof:key:error:", v15, v14, v13, v12, v16, a7);

  return (char)a7;
}

+ (BOOL)verifyMessage:(id)a3 salt:(id)a4 output:(id)a5 proof:(id)a6 key:(id)a7 error:(id *)a8
{
  if (a8)
    *a8 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -135, CFSTR("unknown VRF algorithm"), a6, a7));
  return 0;
}

+ (id)saltMessage:(id)a3 salt:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData kt_dataWithUint64:length:](NSData, "kt_dataWithUint64:length:", objc_msgSend(v6, "length"), 8));
    objc_msgSend(v7, "appendData:", v8);

    objc_msgSend(v7, "appendData:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData kt_dataWithUint64:length:](NSData, "kt_dataWithUint64:length:", objc_msgSend(v5, "length"), 8));
    objc_msgSend(v7, "appendData:", v9);

  }
  objc_msgSend(v7, "appendData:", v5);

  return v7;
}

- (VRFPublicKey)key
{
  return (VRFPublicKey *)objc_getProperty(self, a2, 8, 1);
}

- (void)setKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
