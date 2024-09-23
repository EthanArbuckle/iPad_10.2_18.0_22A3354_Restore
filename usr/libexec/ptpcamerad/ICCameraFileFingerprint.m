@implementation ICCameraFileFingerprint

- (ICCameraFileFingerprint)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICCameraFileFingerprint;
  return -[ICCameraFileFingerprint init](&v3, "init");
}

- (id)fixupFileHandleError:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v5 = objc_msgSend(v4, "isEqualToString:", NSCocoaErrorDomain);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", NSUnderlyingErrorKey));

    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, objc_msgSend(v3, "code"), 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
      v10 = objc_msgSend(v9, "mutableCopy");
      v11 = v10;
      if (v10)
        v12 = v10;
      else
        v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v13 = v12;

      objc_msgSend(v13, "setObject:forKey:", v8, NSUnderlyingErrorKey);
      v14 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, objc_msgSend(v3, "code"), v13));

      v3 = (id)v14;
    }

  }
  return v3;
}

- (void)_createSignatureGenerator
{
  void *v2;
  void **v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("MYSUPERSECRECTKEYPADDEDTO32BYTES"), "dataUsingEncoding:", 4));
  v3 = (void **)MMCSSignatureGeneratorCreateWithBoundaryKey();

  return v3;
}

- (id)fingerprintForFileAtURL:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForReadingFromURL:error:](NSFileHandle, "fileHandleForReadingFromURL:error:", a3));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCameraFileFingerprint fingerprintForFD:error:](self, "fingerprintForFD:error:", objc_msgSend(v6, "fileDescriptor"), a4));
    objc_msgSend(v7, "closeFile");
  }
  else if (a4)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[ICCameraFileFingerprint fixupFileHandleError:](self, "fixupFileHandleError:", *a4));
    v8 = 0;
    *a4 = v9;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)fingerprintForData:(id)a3 error:(id *)a4
{
  id v5;
  void **v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;

  v5 = a3;
  v6 = -[ICCameraFileFingerprint _createSignatureGenerator](self, "_createSignatureGenerator");
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");

  MMCSSignatureGeneratorUpdate(v6, v8, v9, 1);
  v10 = MMCSSignatureGeneratorFinish(v6);
  v11 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", v10, MMCSSignatureAndSchemeSize(v10), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "base64EncodedStringWithOptions:", 0));

  return v12;
}

- (id)fingerprintForFD:(int)a3 error:(id *)a4
{
  void *v6;
  void **i;
  ssize_t v8;
  uint64_t v9;
  id v10;
  void *v11;

  lseek(a3, 0, 0);
  v6 = malloc_type_malloc(0x20000uLL, 0xCD74D96CuLL);
  for (i = -[ICCameraFileFingerprint _createSignatureGenerator](self, "_createSignatureGenerator");
        ;
        MMCSSignatureGeneratorUpdate(i, v6, v8, 1))
  {
    v8 = read(a3, v6, 0x20000uLL);
    if (!v8)
      break;
    if (v8 == -1)
    {
      MMCSSignatureGeneratorFinish(i);
      i = 0;
      break;
    }
  }
  if (v6)
    free(v6);
  if (i)
  {
    v9 = MMCSSignatureGeneratorFinish(i);
    v10 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", v9, MMCSSignatureAndSchemeSize(v9), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "base64EncodedStringWithOptions:", 0));

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (NSString)zeroByteFileFingerprint
{
  os_unfair_lock_s *p_lock;
  void *v4;
  NSString *v5;
  id v6;
  NSString *zeroByteFileFingerprint;
  id v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_zeroByteFileFingerprint)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
    v9 = 0;
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[ICCameraFileFingerprint fingerprintForData:error:](self, "fingerprintForData:error:", v4, &v9));
    v6 = v9;
    zeroByteFileFingerprint = self->_zeroByteFileFingerprint;
    self->_zeroByteFileFingerprint = v5;

  }
  os_unfair_lock_unlock(p_lock);
  return self->_zeroByteFileFingerprint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zeroByteFileFingerprint, 0);
}

@end
