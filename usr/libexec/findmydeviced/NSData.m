@implementation NSData

+ (NSData)dataWithHexString:(id)a3
{
  void *v3;
  void *v4;
  NSMutableData *v5;
  int v6;
  uint64_t v7;
  int v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char __str[2];
  __int16 v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString sanitizedHexString:](NSString, "sanitizedHexString:", a3));
  if ((objc_msgSend(v3, "length") & 1) != 0)
  {
    v9 = sub_1000031B8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_100227400((uint64_t)v3, v10, v11, v12, v13, v14, v15, v16);

    v5 = 0;
  }
  else
  {
    v19 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));

    v5 = objc_opt_new(NSMutableData);
    v6 = objc_msgSend(v4, "length");
    if (v6 >= 2)
    {
      v7 = 0;
      v8 = v6 - 1;
      do
      {
        __str[0] = objc_msgSend(v4, "characterAtIndex:", v7);
        __str[1] = objc_msgSend(v4, "characterAtIndex:", v7 + 1);
        HIBYTE(v19) = strtol(__str, 0, 16);
        -[NSMutableData appendBytes:length:](v5, "appendBytes:length:", (char *)&v19 + 1, 1);
        v7 += 2;
      }
      while (v8 > (int)v7);
    }
    v3 = v4;
  }

  return (NSData *)v5;
}

+ (NSData)dataWithMACAddressString:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString sanitizedHexString:](NSString, "sanitizedHexString:", a3));
  if (objc_msgSend(v3, "length") == (id)12)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithHexString:](NSData, "dataWithHexString:", v3));
  }
  else
  {
    v5 = sub_1000031B8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      sub_100227468((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

    v4 = 0;
  }

  return (NSData *)v4;
}

- (id)base64EncodedString
{
  return -[NSData base64EncodedStringWithOptions:](self, "base64EncodedStringWithOptions:", 0);
}

- (NSData)initWithBase64EncodedString:(id)a3
{
  return -[NSData initWithBase64EncodedString:options:](self, "initWithBase64EncodedString:options:", a3, 0);
}

- (id)hexString
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002EBB8;
  v6[3] = &unk_1002C24D8;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 2 * -[NSData length](self, "length")));
  v3 = v7;
  -[NSData enumerateByteRangesUsingBlock:](self, "enumerateByteRangesUsingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v3));

  return v4;
}

- (void)encryptWithcompletion:(id)a3
{
  void (**v4)(id, id, void *, void *);
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSUInteger v13;
  NSData *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSData *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;

  v4 = (void (**)(id, id, void *, void *))a3;
  v38 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSData defaultCipherWithError:](self, "defaultCipherWithError:", &v38));
  v6 = v38;
  v7 = v6;
  v8 = 0;
  if (v5 && !v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "initializationVector"));
    v35 = objc_msgSend(v9, "length");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "initializationVector"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "key"));
    v34 = objc_msgSend(v11, "length");

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "key"));
    v13 = -[NSData length](self, "length");
    v14 = self;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", v13));
    v16 = qword_100304AD8;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", qword_100304AD8));
    v37 = objc_retainAutorelease(v12);
    v33 = objc_msgSend(v37, "bytes");
    v36 = objc_retainAutorelease(v10);
    v18 = objc_msgSend(v36, "bytes");
    v19 = objc_retainAutorelease(v14);
    v20 = -[NSData bytes](v19, "bytes");

    v8 = objc_retainAutorelease(v15);
    v21 = objc_msgSend(v8, "mutableBytes");
    v22 = objc_retainAutorelease(v17);
    v23 = CCCryptorGCMOneshotEncrypt(0, v33, v34, v18, v35, 0, 0, v20, v13, v21, objc_msgSend(v22, "mutableBytes"), v16);
    if ((_DWORD)v23)
    {
      v24 = v23;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("kFMDEncryptableErrorDomain"), 2, 0));
      v25 = sub_1000031B8();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_100227808(v24, v26, v27, v28, v29, v30, v31, v32);

    }
    else
    {
      objc_msgSend(v5, "setTag:", v22);
      v7 = 0;
    }

  }
  if (v4)
    v4[2](v4, v8, v5, v7);

}

- (void)decryptWithCipher:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSUInteger v11;
  NSData *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSData *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void (**v39)(id, id, id, void *);

  v6 = a3;
  v39 = (void (**)(id, id, id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "initializationVector"));
  v36 = objc_msgSend(v7, "length");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "initializationVector"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "key"));
  v35 = objc_msgSend(v9, "length");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "key"));
  v11 = -[NSData length](self, "length");
  v12 = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tag"));
  v14 = objc_msgSend(v13, "length");

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tag"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", v11));
  v38 = objc_retainAutorelease(v10);
  v17 = objc_msgSend(v38, "bytes");
  v37 = objc_retainAutorelease(v8);
  v18 = objc_msgSend(v37, "bytes");
  v19 = objc_retainAutorelease(v12);
  v20 = -[NSData bytes](v19, "bytes");

  v21 = objc_retainAutorelease(v16);
  v22 = objc_msgSend(v21, "mutableBytes");
  v23 = objc_retainAutorelease(v15);
  v24 = CCCryptorGCMOneshotDecrypt(0, v17, v35, v18, v36, 0, 0, v20, v11, v22, objc_msgSend(v23, "bytes"), v14);
  if ((_DWORD)v24)
  {
    v25 = v24;
    v26 = sub_1000031B8();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_10022786C(v25, v27, v28, v29, v30, v31, v32, v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("kFMDEncryptableErrorDomain"), 3, 0));
  }
  else
  {
    v34 = 0;
  }
  if (v39)
    v39[2](v39, v21, v6, v34);

}

- (id)defaultCipherWithError:(id *)a3
{
  FMDOneShotCipher *v5;
  void *v6;
  id v7;
  FMDOneShotCipher *v8;
  void *v9;
  id v11;
  id v12;

  v5 = objc_alloc_init(FMDOneShotCipher);
  v12 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSData randomBytesWithLength:error:](self, "randomBytesWithLength:error:", qword_100304AE0, &v12));
  v7 = v12;
  -[FMDOneShotCipher setInitializationVector:](v5, "setInitializationVector:", v6);

  if (!v7)
  {
    v11 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSData randomBytesWithLength:error:](self, "randomBytesWithLength:error:", qword_100304AE8, &v11));
    v7 = v11;
    -[FMDOneShotCipher setKey:](v5, "setKey:", v9);

    if (!v7)
    {
      v8 = v5;
      goto LABEL_8;
    }
    if (a3)
      goto LABEL_3;
LABEL_6:
    v8 = 0;
    goto LABEL_8;
  }
  if (!a3)
    goto LABEL_6;
LABEL_3:
  v7 = objc_retainAutorelease(v7);
  v8 = 0;
  *a3 = v7;
LABEL_8:

  return v8;
}

- (id)randomBytesWithLength:(unint64_t)a3 error:(id *)a4
{
  id v6;
  uint64_t Bytes;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:")));
  Bytes = CCRandomGenerateBytes(objc_msgSend(v6, "mutableBytes"), a3);
  if ((_DWORD)Bytes)
  {
    v8 = Bytes;
    v9 = sub_1000031B8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1002278D0(v8, v10, v11, v12, v13, v14, v15, v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("kFMDEncryptableErrorDomain"), 1, 0));
    v18 = v17;
    if (a4)
      *a4 = objc_retainAutorelease(v17);

    v19 = 0;
  }
  else
  {
    v19 = v6;
  }

  return v19;
}

@end
