@implementation NIServerCryptoSession

- (NIServerCryptoSession)initWithKeyDerivationKey:(id)a3 sessionIdentifier:(id)a4 encrypt:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  NIServerCryptoSession *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString *logIdentifier;
  uint64_t v16;
  NSData *sessionKey;
  NSObject *v18;
  NSString *v19;
  const char *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NIServerCryptoSession *v45;
  NSString *v46;
  objc_super v48;
  uint8_t buf[4];
  NSString *v50;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v48.receiver = self;
  v48.super_class = (Class)NIServerCryptoSession;
  v11 = -[NIServerCryptoSession init](&v48, "init");
  if (!v11)
    goto LABEL_18;
  if (objc_msgSend(v9, "length"))
  {
    if (objc_msgSend(v10, "length"))
    {
      objc_storeStrong((id *)&v11->_keyDerivationKey, a3);
      objc_storeStrong((id *)&v11->_sessionIdentifier, a4);
      v13 = CUPrintNSObjectMasked(v11->_sessionIdentifier, v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      logIdentifier = v11->_logIdentifier;
      v11->_logIdentifier = (NSString *)v14;

      v11->_encrypt = v5;
      v16 = objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession _deriveSessionKeyFromKeyDerivationKey:sessionIdentifier:](v11, "_deriveSessionKeyFromKeyDerivationKey:sessionIdentifier:", v9, v10));
      sessionKey = v11->_sessionKey;
      v11->_sessionKey = (NSData *)v16;

      if (v11->_sessionKey)
      {
        if (v5)
        {
          v11->_nonce = arc4random_uniform(0xFFFF0000);
          v18 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            v19 = v11->_logIdentifier;
            *(_DWORD *)buf = 138477827;
            v50 = v19;
            v20 = "#crypto,[%{private}@][Encryptor] initialized";
LABEL_17:
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
          }
        }
        else
        {
          v11->_nonce = 0;
          v18 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            v46 = v11->_logIdentifier;
            *(_DWORD *)buf = 138477827;
            v50 = v46;
            v20 = "#crypto,[%{private}@][Decryptor] initialized";
            goto LABEL_17;
          }
        }
LABEL_18:
        v45 = v11;
        goto LABEL_19;
      }
      v37 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003DB9BC(v37, v38, v39, v40, v41, v42, v43, v44);
    }
    else
    {
      v29 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003DB98C(v29, v30, v31, v32, v33, v34, v35, v36);
    }
  }
  else
  {
    v21 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DB95C(v21, v22, v23, v24, v25, v26, v27, v28);
  }
  v45 = 0;
LABEL_19:

  return v45;
}

- (id)encrypt:(id)a3
{
  id v4;
  unint64_t nonce;
  unint64_t v6;
  CCCryptorStatus v7;
  NSObject *v8;
  NSMutableData *v9;
  NSString *logIdentifier;
  size_t OutputLength;
  _CCCryptor *v13;
  id v14;
  id v15;
  id v16;
  CCCryptorStatus v17;
  NSObject *v18;
  NSString *v19;
  uint64_t v20;
  size_t v21;
  void *__p;
  _BYTE *v23;
  size_t dataOutMoved;
  void *v25;
  _BYTE *v26;
  char v27;
  CCCryptorRef cryptorRef;
  int v29;
  _BYTE v30[18];
  __int16 v31;
  int v32;
  _BYTE buf[18];
  __int16 v34;
  _BOOL4 v35;

  v4 = a3;
  if (!self->_encrypt)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DB9EC();
    goto LABEL_23;
  }
  nonce = self->_nonce;
  if (nonce >= 0xFFFFFFFF)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DBA4C();
    goto LABEL_23;
  }
  v6 = nonce + 1;
  self->_nonce = v6;
  v29 = v6;
  cryptorRef = 0;
  v7 = CCCryptorCreateWithMode(0, 0xCu, 0, 0x3E8u, 0, -[NSData bytes](self->_sessionKey, "bytes"), -[NSData length](self->_sessionKey, "length"), 0, 0, 0, 0, &cryptorRef);
  if (v7 || !cryptorRef)
  {
    v8 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      logIdentifier = self->_logIdentifier;
      *(_DWORD *)buf = 138478339;
      *(_QWORD *)&buf[4] = logIdentifier;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v7;
      v34 = 1024;
      v35 = cryptorRef != 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#crypto,[%{private}@][Encryptor] create failed %d. Cryptor needs release: %d", buf, 0x18u);
    }
    if (!cryptorRef)
      goto LABEL_23;
    goto LABEL_22;
  }
  if (CCCryptorAddParameter(cryptorRef, 3, 0, objc_msgSend(v4, "length")))
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DBC8C();
LABEL_22:
    CCCryptorRelease(cryptorRef);
LABEL_23:
    v9 = 0;
    goto LABEL_24;
  }
  if (CCCryptorAddParameter(cryptorRef, 2, 0, 6))
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DBC2C();
    goto LABEL_22;
  }
  if (CCCryptorAddParameter(cryptorRef, 0, &self->_nonce, 8))
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DBBCC();
    goto LABEL_22;
  }
  v27 = 1;
  LOBYTE(v25) = 0;
  sub_100191910(buf, 5uLL, &v25);
  **(_BYTE **)buf = v27;
  *(_DWORD *)(*(_QWORD *)buf + 1) = v29;
  if (CCCryptorAddParameter(cryptorRef, 1, *(_QWORD *)buf, *(_QWORD *)&buf[8] - *(_QWORD *)buf))
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DBB6C();
    CCCryptorRelease(cryptorRef);
    v9 = 0;
  }
  else
  {
    OutputLength = CCCryptorGetOutputLength(cryptorRef, (size_t)objc_msgSend(v4, "length"), 0);
    LOBYTE(__p) = 0;
    sub_100191910(&v25, OutputLength, &__p);
    dataOutMoved = 0;
    v13 = cryptorRef;
    v14 = objc_retainAutorelease(v4);
    v15 = objc_msgSend(v14, "bytes");
    v16 = objc_msgSend(v14, "length");
    if (CCCryptorUpdate(v13, v15, (size_t)v16, v25, v26 - (_BYTE *)v25, &dataOutMoved))
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003DBB0C();
      CCCryptorRelease(cryptorRef);
      v9 = 0;
    }
    else
    {
      if (dataOutMoved < v26 - (_BYTE *)v25)
        sub_1001F90EC((unint64_t *)&v25, dataOutMoved);
      v30[0] = 0;
      sub_100191910(&__p, 0x10uLL, v30);
      v21 = 0;
      v17 = CCCryptorFinal(cryptorRef, __p, v23 - (_BYTE *)__p, &v21);
      if (v17 || v21)
      {
        v18 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        {
          v19 = self->_logIdentifier;
          *(_DWORD *)v30 = 138478339;
          *(_QWORD *)&v30[4] = v19;
          *(_WORD *)&v30[12] = 1024;
          *(_DWORD *)&v30[14] = v17;
          v31 = 1024;
          v32 = v21;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#crypto,[%{private}@][Encryptor] cryptor-final failed %d. Leftover: %d", v30, 0x18u);
        }
        CCCryptorRelease(cryptorRef);
        v9 = 0;
      }
      else
      {
        LOBYTE(v20) = 0;
        sub_100191910(v30, 6uLL, &v20);
        v20 = *(_QWORD *)&v30[8] - *(_QWORD *)v30;
        if (CCCryptorGetParameter(cryptorRef, 4))
        {
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
            sub_1003DBAAC();
          CCCryptorRelease(cryptorRef);
          v9 = 0;
        }
        else
        {
          CCCryptorRelease(cryptorRef);
          v9 = objc_opt_new(NSMutableData);
          -[NSMutableData appendBytes:length:](v9, "appendBytes:length:", &v27, 1);
          -[NSMutableData appendBytes:length:](v9, "appendBytes:length:", &v29, 4);
          -[NSMutableData appendBytes:length:](v9, "appendBytes:length:", *(_QWORD *)v30, *(_QWORD *)&v30[8] - *(_QWORD *)v30);
          -[NSMutableData appendBytes:length:](v9, "appendBytes:length:", v25, v26 - (_BYTE *)v25);
        }
        if (*(_QWORD *)v30)
        {
          *(_QWORD *)&v30[8] = *(_QWORD *)v30;
          operator delete(*(void **)v30);
        }
      }
      if (__p)
      {
        v23 = __p;
        operator delete(__p);
      }
    }
    if (v25)
    {
      v26 = v25;
      operator delete(v25);
    }
  }
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }
LABEL_24:

  return v9;
}

- (id)decrypt:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v10;
  id v11;
  unint64_t v12;
  CCCryptorStatus v13;
  NSObject *v14;
  NSString *logIdentifier;
  size_t OutputLength;
  CCCryptorStatus v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSString *v21;
  uint64_t v22;
  size_t v23;
  void *v24;
  _BYTE *v25;
  size_t dataOutMoved;
  void *v27;
  _BYTE *v28;
  CCCryptorRef cryptorRef;
  uint64_t v30;
  unsigned int v31;
  char v32;
  _BYTE __p[18];
  __int16 v34;
  int v35;
  _BYTE buf[18];
  __int16 v37;
  _BOOL4 v38;
  _BYTE *v39;
  _BYTE *v40;
  uint64_t v41;
  _BYTE *v42;
  _BYTE *v43;

  v4 = a3;
  v5 = v4;
  if (self->_encrypt)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DC10C();
LABEL_15:
    v8 = 0;
    goto LABEL_16;
  }
  v32 = 0;
  if (!objc_msgSend(v4, "length"))
  {
    v7 = (id)qword_10085F520;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1003DBCEC((uint64_t)self->_logIdentifier, (int)objc_msgSend(v5, "length"), (uint64_t)&v42);

    goto LABEL_15;
  }
  objc_msgSend(v5, "getBytes:range:", &v32, 0, 1);
  if (v32 != 1)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DC0AC();
    goto LABEL_15;
  }
  v31 = 0;
  if ((unint64_t)objc_msgSend(v5, "length") <= 4)
  {
    v6 = (id)qword_10085F520;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1003DBD2C((uint64_t)self->_logIdentifier, (int)objc_msgSend(v5, "length"), (uint64_t)&v42);

    goto LABEL_15;
  }
  objc_msgSend(v5, "getBytes:range:", &v31, 1, 4);
  v30 = v31;
  LOBYTE(v39) = 0;
  sub_100191910(&v42, 6uLL, &v39);
  if ((unint64_t)objc_msgSend(v5, "length") > 0xA)
  {
    objc_msgSend(v5, "getBytes:range:", v42, 5, 6);
    v39 = 0;
    v40 = 0;
    v41 = 0;
    v11 = objc_msgSend(v5, "length");
    v12 = (unint64_t)v11 - 11;
    if (v11 == (id)11)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003DBDAC();
      goto LABEL_41;
    }
    buf[0] = 0;
    sub_1001F9A38(&v39, v12, buf);
    objc_msgSend(v5, "getBytes:range:", v39, 11, v12);
    if (v11 != objc_msgSend(v5, "length"))
      __assert_rtn("-[NIServerCryptoSession decrypt:]", "NIServerCryptoSession.mm", 306, "byteOffset == ciphertext.length");
    cryptorRef = 0;
    v13 = CCCryptorCreateWithMode(1u, 0xCu, 0, 0x3E8u, 0, -[NSData bytes](self->_sessionKey, "bytes"), -[NSData length](self->_sessionKey, "length"), 0, 0, 0, 0, &cryptorRef);
    if (v13 || !cryptorRef)
    {
      v14 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      {
        logIdentifier = self->_logIdentifier;
        *(_DWORD *)buf = 138478339;
        *(_QWORD *)&buf[4] = logIdentifier;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v13;
        v37 = 1024;
        v38 = cryptorRef != 0;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#crypto,[%{private}@][Decryptor] create failed %d. Cryptor needs release: %d", buf, 0x18u);
      }
      if (!cryptorRef)
        goto LABEL_41;
    }
    else if (CCCryptorAddParameter(cryptorRef, 3, 0, v40 - v39))
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003DC04C();
    }
    else if (CCCryptorAddParameter(cryptorRef, 2, 0, 6))
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003DBFEC();
    }
    else
    {
      if (!CCCryptorAddParameter(cryptorRef, 0, &v30, 8))
      {
        LOBYTE(v27) = 0;
        sub_100191910(buf, 5uLL, &v27);
        **(_BYTE **)buf = v32;
        *(_DWORD *)(*(_QWORD *)buf + 1) = v31;
        if (CCCryptorAddParameter(cryptorRef, 1, *(_QWORD *)buf, *(_QWORD *)&buf[8] - *(_QWORD *)buf))
        {
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
            sub_1003DBF2C();
          CCCryptorRelease(cryptorRef);
          v8 = 0;
        }
        else
        {
          OutputLength = CCCryptorGetOutputLength(cryptorRef, v40 - v39, 0);
          LOBYTE(v24) = 0;
          sub_100191910(&v27, OutputLength, &v24);
          dataOutMoved = 0;
          if (CCCryptorUpdate(cryptorRef, v39, v40 - v39, v27, v28 - (_BYTE *)v27, &dataOutMoved))
          {
            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
              sub_1003DBECC();
            CCCryptorRelease(cryptorRef);
            v8 = 0;
          }
          else
          {
            if (dataOutMoved < v28 - (_BYTE *)v27)
              sub_1001F90EC((unint64_t *)&v27, dataOutMoved);
            __p[0] = 0;
            sub_100191910(&v24, 0x10uLL, __p);
            v23 = 0;
            v17 = CCCryptorFinal(cryptorRef, v24, v25 - (_BYTE *)v24, &v23);
            if (v17 || v23)
            {
              v18 = qword_10085F520;
              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
              {
                v21 = self->_logIdentifier;
                *(_DWORD *)__p = 138478339;
                *(_QWORD *)&__p[4] = v21;
                *(_WORD *)&__p[12] = 1024;
                *(_DWORD *)&__p[14] = v17;
                v34 = 1024;
                v35 = v23;
                _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#crypto,[%{private}@][Decryptor] cryptor-final failed %d. Leftover: %d", __p, 0x18u);
              }
              CCCryptorRelease(cryptorRef);
              v8 = 0;
            }
            else
            {
              LOBYTE(v22) = 0;
              sub_100191910(__p, 6uLL, &v22);
              v22 = *(_QWORD *)&__p[8] - *(_QWORD *)__p;
              if (CCCryptorGetParameter(cryptorRef, 4))
              {
                if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
                  sub_1003DBE6C();
                CCCryptorRelease(cryptorRef);
                v8 = 0;
              }
              else
              {
                CCCryptorRelease(cryptorRef);
                v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v42, v43 - v42));
                v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", *(_QWORD *)__p, *(_QWORD *)&__p[8] - *(_QWORD *)__p));
                if ((objc_msgSend(v19, "isEqualToData:", v20) & 1) != 0)
                {
                  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v27, v28 - (_BYTE *)v27));
                }
                else
                {
                  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
                    sub_1003DBE0C();
                  v8 = 0;
                }

              }
              if (*(_QWORD *)__p)
              {
                *(_QWORD *)&__p[8] = *(_QWORD *)__p;
                operator delete(*(void **)__p);
              }
            }
            if (v24)
            {
              v25 = v24;
              operator delete(v24);
            }
          }
          if (v27)
          {
            v28 = v27;
            operator delete(v27);
          }
        }
        if (*(_QWORD *)buf)
        {
          *(_QWORD *)&buf[8] = *(_QWORD *)buf;
          operator delete(*(void **)buf);
        }
        goto LABEL_42;
      }
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003DBF8C();
    }
    CCCryptorRelease(cryptorRef);
LABEL_41:
    v8 = 0;
LABEL_42:
    if (v39)
    {
      v40 = v39;
      operator delete(v39);
    }
    goto LABEL_44;
  }
  v10 = (id)qword_10085F520;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_1003DBD6C((uint64_t)self->_logIdentifier, (int)objc_msgSend(v5, "length"), (uint64_t)&v39);

  v8 = 0;
LABEL_44:
  if (v42)
  {
    v43 = v42;
    operator delete(v42);
  }
LABEL_16:

  return v8;
}

- (id)_deriveSessionKeyFromKeyDerivationKey:(id)a3 sessionIdentifier:(id)a4
{
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSString *logIdentifier;
  char v17;
  uint64_t v18;
  _BYTE __p[18];
  __int16 v20;
  _BOOL4 v21;

  v6 = a3;
  v18 = 0;
  v7 = objc_retainAutorelease(a4);
  v8 = CCKDFParametersCreateHkdf(&v18, 0, 0, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  if (v8 || !v18)
  {
    v14 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      logIdentifier = self->_logIdentifier;
      *(_DWORD *)__p = 138478339;
      *(_QWORD *)&__p[4] = logIdentifier;
      *(_WORD *)&__p[12] = 1024;
      *(_DWORD *)&__p[14] = v8;
      v20 = 1024;
      v21 = v18 != 0;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#crypto,[%{private}@][KDF] create parameters failed %d. Parameters need release: %d", __p, 0x18u);
    }
    if (v18)
      ((void (*)(void))CCKDFParametersDestroy)();
    v13 = 0;
  }
  else
  {
    v17 = 0;
    sub_100191910(__p, 0x20uLL, &v17);
    v9 = v18;
    v10 = objc_retainAutorelease(v6);
    v11 = objc_msgSend(v10, "bytes");
    v12 = objc_msgSend(v10, "length");
    if (CCDeriveKey(v9, 10, v11, v12, *(_QWORD *)__p, *(_QWORD *)&__p[8] - *(_QWORD *)__p))
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003DC16C();
      CCKDFParametersDestroy(v18);
      v13 = 0;
    }
    else
    {
      CCKDFParametersDestroy(v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", *(_QWORD *)__p, *(_QWORD *)&__p[8] - *(_QWORD *)__p));
    }
    if (*(_QWORD *)__p)
    {
      *(_QWORD *)&__p[8] = *(_QWORD *)__p;
      operator delete(*(void **)__p);
    }
  }

  return v13;
}

- (NSData)keyDerivationKey
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)sessionIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_keyDerivationKey, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionKey, 0);
}

@end
