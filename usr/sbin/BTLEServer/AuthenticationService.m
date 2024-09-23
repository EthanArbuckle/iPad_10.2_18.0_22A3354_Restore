@implementation AuthenticationService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("8341F2B4-C013-4F04-8197-C4CDB42E26DC"));
}

- (AuthenticationService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  AuthenticationService *v5;
  AuthenticationService *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AuthenticationService;
  v5 = -[ClientService initWithManager:peripheral:service:](&v8, "initWithManager:peripheral:service:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[ClientService setIsPrimary:](v5, "setIsPrimary:", 1);
    -[ClientService setPriority:](v6, "setPriority:", 4);
    -[ClientService setStartTimeout:](v6, "setStartTimeout:", 0.0);
    v6->_authState = 0;
    v6->_authInfo = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  return v6;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[5];

  v12.receiver = self;
  v12.super_class = (Class)AuthenticationService;
  -[ClientService start](&v12, "start");
  objc_msgSend((id)qword_1000C9158, "addObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("9FBF120D-6301-42D9-8C58-25E699A21DBD")));
  v13[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0188BF66-463A-405D-91FD-0B8940B92254")));
  v13[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("2BDCAEBE-8746-45DF-A841-96B840980FB7")));
  v13[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("2BDCAEBE-8746-45DF-A841-96B840980FB8")));
  v13[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("30E69638-3752-4FEB-A3AA-3226BCD05ACE")));
  v13[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 5));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService service](self, "service"));
  objc_msgSend(v9, "discoverCharacteristics:forService:", v8, v10);

  -[AuthenticationService setAuthState:](self, "setAuthState:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "authTimeout", 0, 0, 90.0));
  -[AuthenticationService setAuthTimer:](self, "setAuthTimer:", v11);

}

- (void)stop
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService authTimer](self, "authTimer"));
  objc_msgSend(v3, "invalidate");

  objc_msgSend((id)qword_1000C9158, "removeObject:", self);
  v4.receiver = self;
  v4.super_class = (Class)AuthenticationService;
  -[ClientService stop](&v4, "stop");
}

+ (void)initialize
{
  id v2;
  void *v3;

  if ((id)objc_opt_class(AuthenticationService, a2) == a1)
  {
    v2 = objc_alloc_init((Class)NSMutableSet);
    v3 = (void *)qword_1000C9158;
    qword_1000C9158 = (uint64_t)v2;

  }
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_authInfo);
  v3.receiver = self;
  v3.super_class = (Class)AuthenticationService;
  -[AuthenticationService dealloc](&v3, "dealloc");
}

- (void)issueChallenge
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __CFData *Mutable;
  void *v16;
  id v17;
  const UInt8 *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  const UInt8 *v23;
  void *v24;
  void *v25;
  __CFDictionary *v26;
  __CFDictionary *v27;
  CFNumberRef v28;
  __CFDictionary *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *value;
  int valuePtr;
  __int16 v40;

  v37 = (id)objc_claimAutoreleasedReturnValue(-[AuthenticationService versionCharacteristic](self, "versionCharacteristic"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "value"));
  if (!v3)
    goto LABEL_9;
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate1Characteristic](self, "certificate1Characteristic"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
  if (!v6)
  {

LABEL_9:
    return;
  }
  v7 = (void *)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate2Characteristic](self, "certificate2Characteristic"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "value"));

  if (!v9)
    return;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService versionCharacteristic](self, "versionCharacteristic"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "value"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[DataInputStream inputStreamWithData:byteOrder:](DataInputStream, "inputStreamWithData:byteOrder:", v11, 1));

  v40 = 0;
  if ((objc_msgSend(v12, "readUint16:", &v40) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100071A24();
    goto LABEL_25;
  }
  if (v40 == 512)
  {
    v13 = 2;
    v14 = 20;
  }
  else
  {
    if (v40 != 768)
    {
      v36 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_100071778(v36, self);
      goto LABEL_25;
    }
    v13 = 3;
    v14 = 32;
  }
  valuePtr = v13;
  Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate1Characteristic](self, "certificate1Characteristic"));
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "value")));
  v18 = (const UInt8 *)objc_msgSend(v17, "bytes");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate1Characteristic](self, "certificate1Characteristic"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "value"));
  CFDataAppendBytes(Mutable, v18, (CFIndex)objc_msgSend(v20, "length"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate2Characteristic](self, "certificate2Characteristic"));
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "value")));
  v23 = (const UInt8 *)objc_msgSend(v22, "bytes");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate2Characteristic](self, "certificate2Characteristic"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "value"));
  CFDataAppendBytes(Mutable, v23, (CFIndex)objc_msgSend(v25, "length"));

  v26 = -[AuthenticationService authInfo](self, "authInfo");
  CFDictionarySetValue(v26, kAuthCertBufferKey, Mutable);
  CFRelease(Mutable);
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_100071980();
  if (VerifyCertSerialNumber(Mutable)
    && VerifyCertAuthority(Mutable)
    && -[AuthenticationService verifyCertificateIsUnique](self, "verifyCertificateIsUnique"))
  {
    value = 0;
    GetRandomDigest(v14, &value);
    v27 = -[AuthenticationService authInfo](self, "authInfo");
    CFDictionarySetValue(v27, kAuthNonceBufferKey, value);
    CFRelease(value);
    v28 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
    v29 = -[AuthenticationService authInfo](self, "authInfo");
    CFDictionarySetValue(v29, kAuthVersionKey, v28);
    CFRelease(v28);
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
      sub_100071848();
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService challengeResponseCharacteristic](self, "challengeResponseCharacteristic"));
    objc_msgSend(v30, "setNotifyValue:forCharacteristic:", 1, v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v33 = value;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService challengeResponseCharacteristic](self, "challengeResponseCharacteristic"));
    objc_msgSend(v32, "writeValue:forCharacteristic:type:", v33, v34, 0);

    -[AuthenticationService setAuthState:](self, "setAuthState:", 2);
    -[ClientService notifyDidStart](self, "notifyDidStart");
    goto LABEL_26;
  }
  v35 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_1000718EC(v35);
LABEL_25:
  -[AuthenticationService authenticationDidFail](self, "authenticationDidFail");
LABEL_26:

}

- (void)verifyChallenge
{
  void *v3;
  void *v4;
  void *v5;
  __CFDictionary *v6;
  const void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __CFDictionary *v17;
  int v18;
  __CFDictionary *v19;

  if ((id)-[AuthenticationService authState](self, "authState") == (id)2)
  {
    v3 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
      sub_100071A50(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService challengeResponseCharacteristic](self, "challengeResponseCharacteristic"));
    objc_msgSend(v4, "readValueForCharacteristic:", v5);

    -[AuthenticationService setAuthState:](self, "setAuthState:", 3);
  }
  else if ((id)-[AuthenticationService authState](self, "authState") == (id)3)
  {
    v6 = -[AuthenticationService authInfo](self, "authInfo");
    v7 = (const void *)kAuthResponseBufferKey;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService challengeResponseCharacteristic](self, "challengeResponseCharacteristic"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "value"));
    CFDictionarySetValue(v6, v7, v9);

    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
      sub_100071B88();
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService authTimer](self, "authTimer"));
    objc_msgSend(v10, "invalidate");

    -[AuthenticationService setAuthState:](self, "setAuthState:", 4);
    v11 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v18 = 138412290;
      v19 = -[AuthenticationService authInfo](self, "authInfo");
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "About to verify nonce with dictionary %@", (uint8_t *)&v18, 0xCu);

    }
    v13 = VerifyNonceSigned(-[AuthenticationService authInfo](self, "authInfo"));
    v14 = (void *)qword_1000C9178;
    if (v13)
    {
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        v17 = (__CFDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
        v18 = 138412290;
        v19 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Authentication has succeeded on peripheral \"%@\", (uint8_t *)&v18, 0xCu);

      }
      -[AuthenticationService authenticationDidSucceed](self, "authenticationDidSucceed");
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_100071AF4(v14);
      -[AuthenticationService authenticationDidFail](self, "authenticationDidFail");
    }
  }
}

- (void)authTimeout
{
  int64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;

  v3 = -[AuthenticationService authState](self, "authState");
  v4 = (void *)qword_1000C9178;
  v5 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR);
  if (v3 == 2)
  {
    if (v5)
      sub_100071C2C(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService challengeResponseCharacteristic](self, "challengeResponseCharacteristic"));
    objc_msgSend(v6, "readValueForCharacteristic:", v7);

    -[AuthenticationService setAuthState:](self, "setAuthState:", 3);
  }
  else
  {
    if (v5)
      sub_100071CC0(v4, self);
    -[AuthenticationService authenticationDidFail](self, "authenticationDidFail");
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  AuthenticationService *v38;
  id v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v39 = a3;
  if (!a5)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "characteristics"));
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v42;
      v38 = self;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v42 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService versionCharacteristic](self, "versionCharacteristic"));
          if (v13)
          {

          }
          else
          {
            v15 = v9;
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUID"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("9FBF120D-6301-42D9-8C58-25E699A21DBD")));
            if (objc_msgSend(v16, "isEqual:", v17))
            {

              v9 = v15;
LABEL_22:
              -[AuthenticationService setVersionCharacteristic:](self, "setVersionCharacteristic:", v12);
              goto LABEL_23;
            }
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUID"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0188BF66-463A-405D-91FD-0B8940B92254")));
            v28 = objc_msgSend(v26, "isEqual:", v27);

            self = v38;
            v9 = v15;
            if (v28)
              goto LABEL_22;
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate1Characteristic](self, "certificate1Characteristic"));
          if (v14)
          {

          }
          else
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUID"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("2BDCAEBE-8746-45DF-A841-96B840980FB7")));
            v20 = objc_msgSend(v18, "isEqual:", v19);

            if (v20)
            {
              -[AuthenticationService setCertificate1Characteristic:](self, "setCertificate1Characteristic:", v12);
              goto LABEL_23;
            }
          }
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate2Characteristic](self, "certificate2Characteristic"));
          if (v21)
          {

LABEL_19:
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService challengeResponseCharacteristic](self, "challengeResponseCharacteristic"));
            if (v25)
            {

            }
            else
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUID"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("30E69638-3752-4FEB-A3AA-3226BCD05ACE")));
              v32 = objc_msgSend(v30, "isEqual:", v31);

              if (v32)
                -[AuthenticationService setChallengeResponseCharacteristic:](self, "setChallengeResponseCharacteristic:", v12);
            }
            goto LABEL_27;
          }
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUID"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("2BDCAEBE-8746-45DF-A841-96B840980FB8")));
          v24 = objc_msgSend(v22, "isEqual:", v23);

          if (!v24)
            goto LABEL_19;
          -[AuthenticationService setCertificate2Characteristic:](self, "setCertificate2Characteristic:", v12);
LABEL_23:
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));

          if (!v29)
            objc_msgSend(v39, "readValueForCharacteristic:", v12);
LABEL_27:
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v9);
    }

    -[AuthenticationService issueChallenge](self, "issueChallenge");
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService versionCharacteristic](self, "versionCharacteristic"));

    if (!v33 && os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100071DD0();
    v34 = objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate1Characteristic](self, "certificate1Characteristic"));
    if (!v34
      || (v35 = (void *)v34,
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate2Characteristic](self, "certificate2Characteristic")),
          v36,
          v35,
          !v36))
    {
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_100071DA4();
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService challengeResponseCharacteristic](self, "challengeResponseCharacteristic"));

    if (!v37 && os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_100071D78();
  }

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[AuthenticationService challengeResponseCharacteristic](self, "challengeResponseCharacteristic"));

    if (v11 == v9)
    {
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_100071DFC();
      -[AuthenticationService authenticationDidFail](self, "authenticationDidFail");
    }
    goto LABEL_14;
  }
  v12 = objc_claimAutoreleasedReturnValue(-[AuthenticationService versionCharacteristic](self, "versionCharacteristic"));
  v13 = v9;
  if ((id)v12 == v9)
    goto LABEL_12;
  v14 = (void *)v12;
  v15 = objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate1Characteristic](self, "certificate1Characteristic"));
  if ((id)v15 == v9)
  {

    v13 = v14;
LABEL_12:

    goto LABEL_13;
  }
  v16 = (void *)v15;
  v17 = (id)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate2Characteristic](self, "certificate2Characteristic"));

  if (v17 == v9)
  {
LABEL_13:
    -[AuthenticationService issueChallenge](self, "issueChallenge");
    goto LABEL_14;
  }
  v18 = (id)objc_claimAutoreleasedReturnValue(-[AuthenticationService challengeResponseCharacteristic](self, "challengeResponseCharacteristic"));

  if (v18 == v9)
    -[AuthenticationService verifyChallenge](self, "verifyChallenge");
LABEL_14:

}

- (id)certificateSerialNumber
{
  __CFDictionary *v2;
  const __CFData *Value;
  const __CFData *v4;
  const UInt8 *BytePtr;
  CFIndex Length;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  _QWORD v11[2];

  v2 = -[AuthenticationService authInfo](self, "authInfo");
  Value = (const __CFData *)CFDictionaryGetValue(v2, kAuthCertBufferKey);
  if (Value)
  {
    v4 = Value;
    v11[0] = 0;
    v11[1] = 0;
    v10 = v11;
    v9 = 16;
    BytePtr = CFDataGetBytePtr(Value);
    Length = CFDataGetLength(v4);
    v7 = IapAuthCertSerial(BytePtr, Length, &v10, &v9);
    Value = 0;
    if (v7)
      Value = (const __CFData *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v11, v9));
  }
  return Value;
}

- (BOOL)verifyCertificateIsUnique
{
  void *v3;
  char v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  AuthenticationService *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificateSerialNumber](self, "certificateSerialNumber"));
  v4 = v3 != 0;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)qword_1000C9158;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(AuthenticationService **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (v10 != self)
        {
          v11 = objc_claimAutoreleasedReturnValue(-[AuthenticationService certificateSerialNumber](v10, "certificateSerialNumber", (_QWORD)v14));
          v12 = (void *)v11;
          if (v11)
            LOBYTE(v11) = objc_msgSend(v3, "isEqualToData:", v11);
          v4 &= v11 ^ 1;

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4 & 1;
}

- (void)authenticationDidSucceed
{
  __CFDictionary *v3;
  void *v4;
  int v5;
  uint64_t CertClass;
  __CFDictionary *v7;
  const void *Value;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];

  v3 = -[AuthenticationService authInfo](self, "authInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", kAuthVersionKey));
  v5 = objc_msgSend(v4, "intValue");
  CertClass = 0x7FFFFFFFLL;
  if (v5 <= 2
    && (v7 = -[AuthenticationService authInfo](self, "authInfo", 0x7FFFFFFFLL),
        Value = CFDictionaryGetValue(v7, kAuthCertBufferKey),
        CertClass = GetCertClass(Value),
        (_DWORD)CertClass == 0x7FFFFFFF))
  {
    -[AuthenticationService authenticationDidFail](self, "authenticationDidFail", CertClass);
  }
  else
  {
    v13[0] = CFSTR("AuthenticationServiceCertClassUserInfoKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", CertClass));
    v13[1] = CFSTR("AuthenticationServiceAuthVersionKey");
    v14[0] = v9;
    v14[1] = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("AuthenticationServiceAuthDidSucceedNotification"), v12, v10);

  }
}

- (void)authenticationDidFail
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("AuthenticationServiceAuthDidFailNotification"), v3);

}

- (id)authStateString
{
  int64_t v2;

  v2 = -[AuthenticationService authState](self, "authState");
  if ((unint64_t)(v2 - 1) > 3)
    return CFSTR("Invalid");
  else
    return off_1000AE330[v2 - 1];
}

- (CBCharacteristic)versionCharacteristic
{
  return self->_versionCharacteristic;
}

- (void)setVersionCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_versionCharacteristic, a3);
}

- (CBCharacteristic)certificate1Characteristic
{
  return self->_certificate1Characteristic;
}

- (void)setCertificate1Characteristic:(id)a3
{
  objc_storeStrong((id *)&self->_certificate1Characteristic, a3);
}

- (CBCharacteristic)certificate2Characteristic
{
  return self->_certificate2Characteristic;
}

- (void)setCertificate2Characteristic:(id)a3
{
  objc_storeStrong((id *)&self->_certificate2Characteristic, a3);
}

- (CBCharacteristic)challengeResponseCharacteristic
{
  return self->_challengeResponseCharacteristic;
}

- (void)setChallengeResponseCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_challengeResponseCharacteristic, a3);
}

- (int64_t)authState
{
  return self->_authState;
}

- (void)setAuthState:(int64_t)a3
{
  self->_authState = a3;
}

- (__CFDictionary)authInfo
{
  return self->_authInfo;
}

- (void)setAuthInfo:(__CFDictionary *)a3
{
  self->_authInfo = a3;
}

- (NSTimer)authTimer
{
  return self->_authTimer;
}

- (void)setAuthTimer:(id)a3
{
  objc_storeStrong((id *)&self->_authTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authTimer, 0);
  objc_storeStrong((id *)&self->_challengeResponseCharacteristic, 0);
  objc_storeStrong((id *)&self->_certificate2Characteristic, 0);
  objc_storeStrong((id *)&self->_certificate1Characteristic, 0);
  objc_storeStrong((id *)&self->_versionCharacteristic, 0);
}

@end
