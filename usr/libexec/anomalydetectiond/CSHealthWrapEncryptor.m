@implementation CSHealthWrapEncryptor

- (CSHealthWrapEncryptor)initWithOutputStream:(id)a3 certificate:(__SecCertificate *)a4 algorithm:(unsigned int)a5 options:(unsigned int)a6 keySize:(unsigned int)a7 uuid:(id)a8 studyUUID:(id)a9 compressionEnabled:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  CSHealthWrapEncryptor *v19;
  void *v21;
  objc_super v24;

  v16 = a3;
  v17 = a8;
  v18 = a9;
  v24.receiver = self;
  v24.super_class = (Class)CSHealthWrapEncryptor;
  v19 = -[CSHealthWrapEncryptor init](&v24, "init");
  if (v19)
  {
    if (!a4)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("CSHealthWrapEncryptor.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("certificate != NULL"));

    }
    objc_storeStrong((id *)&v19->_outputStream, a3);
    v19->_certificate = (__SecCertificate *)CFRetain(a4);
    v19->_algorithm = a5;
    v19->_options = a6;
    v19->_keySize = a7;
    v19->_cryptor = 0;
    objc_storeStrong((id *)&v19->_uuid, a8);
    objc_storeStrong((id *)&v19->_studyUUID, a9);
    v19->_hmacAlgorithm = 2;
    v19->_encryptedBytesCount = 0;
    v19->_compressionEnabled = a10;
  }

  return v19;
}

- (void)dealloc
{
  __SecCertificate *certificate;
  _CCCryptor *cryptor;
  objc_super v5;

  certificate = self->_certificate;
  if (certificate)
  {
    CFRelease(certificate);
    self->_certificate = 0;
  }
  cryptor = self->_cryptor;
  if (cryptor)
  {
    CCCryptorRelease(cryptor);
    self->_cryptor = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CSHealthWrapEncryptor;
  -[CSHealthWrapEncryptor dealloc](&v5, "dealloc");
}

- (__SecKey)_copyAndVerifyPublicKeyFromCertificate:(__SecCertificate *)a3 error:(id *)a4
{
  __SecKey *v8;
  void *v10;
  void *v11;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSHealthWrapEncryptor.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("certificate != NULL"));

    if (a4)
      goto LABEL_3;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSHealthWrapEncryptor.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != NULL"));

LABEL_3:
  v8 = SecCertificateCopyKey(a3);
  if (!v8)
    +[CSHealthWrapErrorHelper assignError:code:format:](CSHealthWrapErrorHelper, "assignError:code:format:", a4, 1, CFSTR("No public key found in certificate"));
  return v8;
}

- (id)_encryptData:(id)a3 withCertificate:(__SecCertificate *)a4 error:(id *)a5
{
  const __CFData *v9;
  __SecKey *v10;
  __SecKey *v11;
  CFDataRef v12;
  CFDataRef v13;
  void *v15;
  void *v16;
  void *v17;
  CFErrorRef error;

  v9 = (const __CFData *)a3;
  if (v9)
  {
    if (a4)
      goto LABEL_3;
LABEL_12:
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSHealthWrapEncryptor.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("certificate != NULL"));

    if (a5)
      goto LABEL_4;
    goto LABEL_13;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSHealthWrapEncryptor.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data != nil"));

  if (!a4)
    goto LABEL_12;
LABEL_3:
  if (a5)
    goto LABEL_4;
LABEL_13:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSHealthWrapEncryptor.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != NULL"));

LABEL_4:
  v10 = -[CSHealthWrapEncryptor _copyAndVerifyPublicKeyFromCertificate:error:](self, "_copyAndVerifyPublicKeyFromCertificate:error:", a4, a5);
  if (v10)
  {
    v11 = v10;
    error = 0;
    v12 = SecKeyCreateEncryptedData(v10, kSecKeyAlgorithmRSAEncryptionOAEPSHA1, v9, &error);
    v13 = v12;
    if (a5 && !v12)
      *a5 = error;
    CFRelease(v11);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_updateHeaderWithKey:(id)a3 iv:(id)a4 hmacKey:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v20;
  void *v21;
  void *v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_11:
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSHealthWrapEncryptor.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("iv != nil"));

    if (a6)
      goto LABEL_4;
    goto LABEL_12;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSHealthWrapEncryptor.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

  if (!v12)
    goto LABEL_11;
LABEL_3:
  if (a6)
    goto LABEL_4;
LABEL_12:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSHealthWrapEncryptor.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != NULL"));

LABEL_4:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GPBMessage message](CSHWProtoMessageKey, "message"));
  objc_msgSend(v14, "setKey:", v11);
  objc_msgSend(v14, "setIv:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "data"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSHealthWrapEncryptor _encryptData:withCertificate:error:](self, "_encryptData:withCertificate:error:", v15, self->_certificate, a6));

  if (v16)
  {
    -[CSHWProtoMessageHeader setEncryptedMessageKey:](self->_header, "setEncryptedMessageKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSHealthWrapEncryptor _encryptData:withCertificate:error:](self, "_encryptData:withCertificate:error:", v13, self->_certificate, a6));
    v18 = v17 != 0;
    if (v17)
      -[CSHWProtoMessageHeader setEncryptedHmackey:](self->_header, "setEncryptedHmackey:", v17);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)_startCryptorWithError:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  size_t keySize;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  unsigned int v18;
  unsigned int data;
  CCCryptorRef cryptorRef;

  self->_encryptedBytesCount = 0;
  cryptorRef = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 16));
  v6 = objc_msgSend(v5, "length");
  v7 = objc_retainAutorelease(v5);
  if (!SecRandomCopyBytes(kSecRandomDefault, (size_t)v6, objc_msgSend(v7, "mutableBytes")))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", self->_keySize));
    keySize = self->_keySize;
    v11 = objc_retainAutorelease(v9);
    if (SecRandomCopyBytes(kSecRandomDefault, keySize, objc_msgSend(v11, "mutableBytes")))
    {
      +[CSHealthWrapErrorHelper assignError:code:format:](CSHealthWrapErrorHelper, "assignError:code:format:", a3, 1, CFSTR("Key generation: %d"), *__error());
      v8 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 32)));
    if (SecRandomCopyBytes(kSecRandomDefault, 0x20uLL, objc_msgSend(v12, "mutableBytes")))
    {
      +[CSHealthWrapErrorHelper assignError:code:format:](CSHealthWrapErrorHelper, "assignError:code:format:", a3, 1, CFSTR("HMAC key generation: %d"), *__error());
    }
    else if (-[CSHealthWrapEncryptor _updateHeaderWithKey:iv:hmacKey:error:](self, "_updateHeaderWithKey:iv:hmacKey:error:", v11, v7, v12, a3))
    {
      CCHmacInit((CCHmacContext *)&self->_hmacContext, self->_hmacAlgorithm, objc_msgSend(objc_retainAutorelease(v12), "bytes"), 0x20uLL);
      v13 = objc_retainAutorelease(v7);
      CCHmacUpdate((CCHmacContext *)&self->_hmacContext, objc_msgSend(v13, "bytes"), (size_t)objc_msgSend(v13, "length"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSHWProtoMessageHeader studyUuid](self->_header, "studyUuid"));
      if (objc_msgSend(v14, "length"))
      {
        v15 = objc_retainAutorelease(v14);
        CCHmacUpdate((CCHmacContext *)&self->_hmacContext, objc_msgSend(v15, "bytes"), (size_t)objc_msgSend(v15, "length"));
      }
      data = bswap32(-[CSHWProtoMessageHeader trailingHmaclength](self->_header, "trailingHmaclength"));
      v18 = bswap32(-[CSHWProtoMessageHeader trailingShalength](self->_header, "trailingShalength"));
      CCHmacUpdate((CCHmacContext *)&self->_hmacContext, &data, 4uLL);
      CCHmacUpdate((CCHmacContext *)&self->_hmacContext, &v18, 4uLL);
      v16 = CCCryptorCreate(0, self->_algorithm, self->_options, objc_msgSend(objc_retainAutorelease(v11), "bytes"), self->_keySize, objc_msgSend(objc_retainAutorelease(v13), "bytes"), &cryptorRef);
      v8 = (_DWORD)v16 == 0;
      if ((_DWORD)v16)
        +[CSHealthWrapErrorHelper assignError:code:format:](CSHealthWrapErrorHelper, "assignError:code:format:", a3, 1, CFSTR("cryptor create: %d"), v16);
      else
        self->_cryptor = cryptorRef;

      goto LABEL_13;
    }
    v8 = 0;
LABEL_13:

    goto LABEL_14;
  }
  +[CSHealthWrapErrorHelper assignError:code:format:](CSHealthWrapErrorHelper, "assignError:code:format:", a3, 1, CFSTR("IV generation: %d"), *__error());
  v8 = 0;
LABEL_15:

  return v8;
}

- (BOOL)startWithError:(id *)a3
{
  CSHWProtoMessageHeader *v5;
  CSHWProtoMessageHeader *header;
  void *v7;
  void *v8;
  NSMutableData *v9;
  NSMutableData *buffer;
  CFDataRef v11;
  void *v12;
  id v13;
  BOOL v14;
  unsigned int v16;
  _QWORD v17[2];

  CC_SHA256_Init(&self->_sha256Context);
  v5 = (CSHWProtoMessageHeader *)objc_claimAutoreleasedReturnValue(+[GPBMessage message](CSHWProtoMessageHeader, "message"));
  header = self->_header;
  self->_header = v5;

  -[CSHWProtoMessageHeader setVersion:](self->_header, "setVersion:", 3);
  v17[0] = 0;
  v17[1] = 0;
  -[NSUUID getUUIDBytes:](self->_uuid, "getUUIDBytes:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v17, 16));
  -[CSHWProtoMessageHeader setUploadUuid:](self->_header, "setUploadUuid:", v7);

  -[NSUUID getUUIDBytes:](self->_studyUUID, "getUUIDBytes:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v17, 16));
  -[CSHWProtoMessageHeader setStudyUuid:](self->_header, "setStudyUuid:", v8);

  -[CSHWProtoMessageHeader setTrailingHmaclength:](self->_header, "setTrailingHmaclength:", 32);
  -[CSHWProtoMessageHeader setTrailingShalength:](self->_header, "setTrailingShalength:", 32);
  -[CSHWProtoMessageHeader setCompressed:](self->_header, "setCompressed:", self->_compressionEnabled);
  v9 = (NSMutableData *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 0x2000));
  buffer = self->_buffer;
  self->_buffer = v9;

  if (self->_buffer && self->_header)
  {
    v11 = SecCertificateCopyData(self->_certificate);
    if (v11)
    {
      -[CSHWProtoMessageHeader setEncryptionIdentity:](self->_header, "setEncryptionIdentity:", v11);
      if (-[CSHealthWrapEncryptor _startCryptorWithError:](self, "_startCryptorWithError:", a3))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[GPBMessage data](self->_header, "data"));
        v16 = bswap32(objc_msgSend(v12, "length"));
        if (-[CSHealthWrapEncryptor _writeStream:length:hash:error:](self, "_writeStream:length:hash:error:", &v16, 4, 1, a3))
        {
          v13 = objc_retainAutorelease(v12);
          v14 = -[CSHealthWrapEncryptor _writeStream:length:hash:error:](self, "_writeStream:length:hash:error:", objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), 1, a3);
        }
        else
        {
          v14 = 0;
        }

        goto LABEL_12;
      }
    }
    else
    {
      +[CSHealthWrapErrorHelper assignError:code:format:](CSHealthWrapErrorHelper, "assignError:code:format:", a3, 1, CFSTR("Could not copy certificate"));
    }
    v14 = 0;
LABEL_12:

    return v14;
  }
  +[CSHealthWrapErrorHelper assignError:code:format:](CSHealthWrapErrorHelper, "assignError:code:format:", a3, 1, CFSTR("Could not allocate buffer or header"));
  return 0;
}

- (BOOL)_writeStream:(const char *)a3 length:(unint64_t)a4 hash:(BOOL)a5 error:(id *)a6
{
  unint64_t v7;
  const char *v8;
  uint64_t v10;
  BOOL v11;
  BOOL result;
  id v13;

  v7 = a4;
  v8 = a3;
  if (a5)
  {
    if (a4 >= 0xFFFFFFFF)
      sub_1002D3034();
    CC_SHA256_Update(&self->_sha256Context, a3, a4);
  }
  if (!v7)
    return 1;
  while (1)
  {
    v10 = -[NSOutputStream write:maxLength:](self->_outputStream, "write:maxLength:", v8, v7);
    if (v10 <= 0)
      break;
    v11 = v7 >= v10;
    v7 -= v10;
    if (!v11)
      sub_1002D305C();
    v8 += v10;
    if (!v7)
      return 1;
  }
  if (!a6)
    return 0;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[NSOutputStream streamError](self->_outputStream, "streamError"));
  result = 0;
  *a6 = v13;
  return result;
}

- (BOOL)_appendEncryptedBytes:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  CCHmacUpdate((CCHmacContext *)&self->_hmacContext, a3, a4);
  self->_encryptedBytesCount += a4;
  return -[CSHealthWrapEncryptor _writeStream:length:hash:error:](self, "_writeStream:length:hash:error:", a3, a4, 1, a5);
}

- (BOOL)_updateCryptorWithData:(id)a3 error:(id *)a4
{
  id v6;
  char *v7;
  id v8;
  char *v9;
  unint64_t v10;
  size_t v11;
  uint64_t v12;
  id v13;
  BOOL v14;
  size_t dataOutMoved;

  v6 = a3;
  v7 = (char *)objc_msgSend(v6, "length");
  v8 = objc_retainAutorelease(v6);
  v9 = (char *)objc_msgSend(v8, "bytes");
  if (objc_msgSend(v8, "length"))
  {
    v10 = 0;
    while (1)
    {
      v11 = (unint64_t)&v7[-v10] >= 0x1FF0 ? 8176 : (size_t)&v7[-v10];
      dataOutMoved = 0;
      v12 = CCCryptorUpdate(self->_cryptor, &v9[v10], v11, -[NSMutableData mutableBytes](self->_buffer, "mutableBytes"), 0x2000uLL, &dataOutMoved);
      if ((_DWORD)v12)
        break;
      if (dataOutMoved)
      {
        v13 = -[NSMutableData bytes](self->_buffer, "bytes");
        if (!-[CSHealthWrapEncryptor _appendEncryptedBytes:length:error:](self, "_appendEncryptedBytes:length:error:", v13, dataOutMoved, a4))goto LABEL_12;
      }
      v10 += v11;
      if (v10 >= (unint64_t)objc_msgSend(v8, "length"))
        goto LABEL_10;
    }
    +[CSHealthWrapErrorHelper assignError:code:format:](CSHealthWrapErrorHelper, "assignError:code:format:", a4, 1, CFSTR("crpytor update: %d"), v12);
LABEL_12:
    v14 = 0;
  }
  else
  {
LABEL_10:
    v14 = 1;
  }

  return v14;
}

- (BOOL)_finalizeCryptorWithError:(id *)a3
{
  uint64_t v5;
  _BOOL4 v6;
  id v7;
  unint64_t data;
  size_t dataOutMoved;

  dataOutMoved = 0;
  v5 = CCCryptorFinal(self->_cryptor, -[NSMutableData mutableBytes](self->_buffer, "mutableBytes"), 0x2000uLL, &dataOutMoved);
  if ((_DWORD)v5)
  {
    +[CSHealthWrapErrorHelper assignError:code:format:](CSHealthWrapErrorHelper, "assignError:code:format:", a3, 1, CFSTR("crpytor update: %d"), v5);
    LOBYTE(v6) = 0;
  }
  else if (!dataOutMoved
         || (v7 = -[NSMutableData bytes](self->_buffer, "bytes"),
             v6 = -[CSHealthWrapEncryptor _appendEncryptedBytes:length:error:](self, "_appendEncryptedBytes:length:error:", v7, dataOutMoved, a3)))
  {
    data = bswap64(self->_encryptedBytesCount);
    CCHmacUpdate((CCHmacContext *)&self->_hmacContext, &data, 8uLL);
    LOBYTE(v6) = -[CSHealthWrapEncryptor _writeStream:length:hash:error:](self, "_writeStream:length:hash:error:", &data, 8, 1, a3);
  }
  return v6;
}

- (BOOL)appendData:(id)a3 error:(id *)a4
{
  return -[CSHealthWrapEncryptor _updateCryptorWithData:error:](self, "_updateCryptorWithData:error:", a3, a4);
}

- (BOOL)finalizeWithError:(id *)a3
{
  _BOOL4 v5;
  unsigned __int8 md[32];
  _BYTE macOut[32];

  v5 = -[CSHealthWrapEncryptor _finalizeCryptorWithError:](self, "_finalizeCryptorWithError:");
  if (v5)
  {
    CCHmacFinal((CCHmacContext *)&self->_hmacContext, macOut);
    v5 = -[CSHealthWrapEncryptor _writeStream:length:hash:error:](self, "_writeStream:length:hash:error:", macOut, 32, 1, a3);
    if (v5)
    {
      CC_SHA256_Final(md, &self->_sha256Context);
      LOBYTE(v5) = -[CSHealthWrapEncryptor _writeStream:length:hash:error:](self, "_writeStream:length:hash:error:", md, 32, 0, a3);
    }
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_studyUUID, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
}

@end
