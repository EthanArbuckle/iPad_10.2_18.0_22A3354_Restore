@implementation MBEncryptionUtilities

+ (id)decryptToString:(id)a3 withKey:(id)a4 salt:(id)a5 error:(id *)a6
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MBEncryptionUtilities decryptString:withKey:salt:error:](MBEncryptionUtilities, "decryptString:withKey:salt:error:", a3, a4, a5, a6));
  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v6, 4);

  return v7;
}

+ (id)decryptString:(id)a3 withKey:(id)a4 salt:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id dataOut;
  uint64_t v29;
  size_t dataOutMoved;
  __int128 iv;

  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "keyDataForKey:salt:", a4, a5));
  v12 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v10, 0);

  dataOutMoved = 0;
  iv = xmmword_10009D450;
  v13 = objc_retainAutorelease(v11);
  v14 = objc_msgSend(v13, "bytes");
  v15 = objc_msgSend(v13, "length");
  v16 = objc_retainAutorelease(v12);
  if (CCCrypt(1u, 0, 1u, v14, (size_t)v15, &iv, objc_msgSend(v16, "bytes"), (size_t)objc_msgSend(v16, "length"), 0, 0, &dataOutMoved) == -4301|| !objc_msgSend(v16, "length"))
  {
    v20 = objc_alloc((Class)NSMutableData);
    v21 = objc_msgSend(v20, "initWithLength:", dataOutMoved);
    v22 = objc_retainAutorelease(v13);
    v23 = objc_msgSend(v22, "bytes");
    v24 = objc_msgSend(v22, "length");
    v25 = objc_retainAutorelease(v16);
    v26 = objc_msgSend(v25, "bytes");
    v27 = objc_msgSend(v25, "length");
    v19 = objc_retainAutorelease(v21);
    dataOut = objc_msgSend(v19, "mutableBytes");
    v29 = CCCrypt(1u, 0, 1u, v23, (size_t)v24, &iv, v26, (size_t)v27, dataOut, dataOutMoved, &dataOutMoved);
    if (!(_DWORD)v29)
    {
      objc_msgSend(v19, "setLength:", dataOutMoved);
      v18 = v19;
      v19 = v18;
      goto LABEL_12;
    }
    if (!a6)
    {
      v18 = 0;
      goto LABEL_12;
    }
    v17 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Failed to encrypt data: %d"), v29));
    v18 = 0;
  }
  else
  {
    if (!a6)
    {
      v18 = 0;
      v19 = 0;
      goto LABEL_12;
    }
    v17 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("CCCrypt was OK with a zero-length buffer? No. Just no.")));
    v18 = 0;
    v19 = 0;
  }
  *a6 = v17;
LABEL_12:

  return v18;
}

+ (id)keyDataForKey:(id)a3 salt:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if (!v5 || (v7 = v6) == 0)
    objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 207, CFSTR("Key and salt must not be nil")));
  v8 = objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v8, "appendData:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MBDigest sha1ForData:](MBDigest, "sha1ForData:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subdataWithRange:", 0, 16));

  return v10;
}

@end
