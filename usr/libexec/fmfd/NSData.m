@implementation NSData

- (id)encryptWithKey:(id)a3 error:(id *)a4
{
  NSData *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSData *v19;
  id v20;
  NSUInteger v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  char *v40;
  id *v42;
  uint64_t v43;
  NSErrorUserInfoKey v44;
  void *v45;
  _QWORD bytes[2];

  v6 = self;
  v7 = a3;
  v42 = a4;
  if (SecRandomCopyBytes(kSecRandomDefault, 0x10uLL, bytes))
  {
    v8 = sub_100011D0C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100065960(v9);

    v10 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", bytes, 16));
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", -[NSData length](v6, "length")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 16));
  bytes[0] = 16;
  v13 = objc_retainAutorelease(v7);
  v14 = objc_msgSend(v13, "bytes");
  v15 = objc_msgSend(v13, "length");

  v16 = objc_retainAutorelease(v10);
  v17 = objc_msgSend(v16, "bytes");
  v18 = objc_msgSend(v16, "length");
  v19 = objc_retainAutorelease(v6);
  v20 = -[NSData bytes](v19, "bytes");
  v43 = (uint64_t)v19;
  v21 = -[NSData length](v19, "length");
  v22 = objc_retainAutorelease(v11);
  v23 = objc_msgSend(v22, "mutableBytes");
  v24 = objc_retainAutorelease(v12);
  v25 = CCCryptorGCM(0, 0, v14, v15, v17, v18, 0, 0, v20, v21, v23, objc_msgSend(v24, "mutableBytes"), bytes);
  if ((_DWORD)v25)
  {
    v26 = v25;
    v27 = sub_100011D0C();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    v35 = (void *)v43;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_1000658FC(v43, v28, v29, v30, v31, v32, v33, v34);

    if (!v42)
    {
      v38 = 0;
      goto LABEL_16;
    }
    v44 = NSLocalizedDescriptionKey;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CCCryptorGCM() encryption failed with status %d"), v26));
    v45 = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
    *v42 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("Encoder"), 1, v37));

    v38 = 0;
  }
  else
  {
    v39 = objc_msgSend(v16, "length");
    v40 = (char *)objc_msgSend(v22, "length");
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", &v40[(_QWORD)v39 + 1 + bytes[0]]));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 1));
    if (v36)
      objc_msgSend(v38, "appendData:", v36);
    objc_msgSend(v38, "appendData:", v16);
    objc_msgSend(v38, "appendData:", v22);
    objc_msgSend(v38, "appendData:", v24);
    v35 = (void *)v43;
  }

LABEL_16:
  return v38;
}

- (id)decryptWithKey:(id)a3 error:(id *)a4
{
  NSData *v5;
  id v6;
  NSUInteger v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v33;
  void *v34;
  void *v35;
  id *v36;
  const __CFString **v37;
  NSErrorUserInfoKey *v38;
  void *v39;
  id v41;
  NSObject *v42;
  id v43;
  void *v45;
  id v46;
  uint64_t v47;
  uint8_t buf[4];
  NSData *v49;
  NSErrorUserInfoKey v50;
  const __CFString *v51;
  NSErrorUserInfoKey v52;
  const __CFString *v53;
  NSErrorUserInfoKey v54;
  void *v55;

  v5 = self;
  v6 = a3;
  v7 = -[NSData length](v5, "length");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSData subdataWithRange:](v5, "subdataWithRange:", 1, 16));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSData subdataWithRange:](v5, "subdataWithRange:", 17, (uint64_t)((v7 << 32) - 0x2100000000) >> 32));
  v46 = (id)objc_claimAutoreleasedReturnValue(-[NSData subdataWithRange:](v5, "subdataWithRange:", ((uint64_t)((v7 << 32) - 0x1100000000) >> 32) + 1, 16));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", objc_msgSend(v9, "length")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 16));
  v47 = 16;
  v12 = objc_retainAutorelease(v6);
  v13 = objc_msgSend(v12, "bytes");
  v14 = objc_msgSend(v12, "length");

  v15 = objc_retainAutorelease(v8);
  v16 = objc_msgSend(v15, "bytes");
  v45 = v15;
  v17 = objc_msgSend(v15, "length");
  v18 = objc_retainAutorelease(v9);
  v19 = objc_msgSend(v18, "bytes");
  v20 = objc_msgSend(v18, "length");
  v43 = objc_retainAutorelease(v10);
  v21 = objc_msgSend(v43, "mutableBytes");
  v22 = objc_retainAutorelease(v11);
  v23 = CCCryptorGCM(1, 0, v13, v14, v16, v17, 0, 0, v19, v20, v21, objc_msgSend(v22, "mutableBytes"), &v47);
  if ((_DWORD)v23)
  {
    v24 = v23;
    v25 = sub_100011D0C();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_1000659E8((uint64_t)v5, v26, v27, v28, v29, v30, v31, v32);

    v33 = v46;
    if (!a4)
      goto LABEL_14;
    v54 = NSLocalizedDescriptionKey;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CCCryptorGCM() decryption failed with status %d"), v24));
    v55 = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("Decoder"), 1, v35));

LABEL_13:
LABEL_14:
    v36 = 0;
    goto LABEL_15;
  }
  if (v47 != 16)
  {
    v33 = v46;
    v36 = a4;
    if (a4)
    {
      v52 = NSLocalizedDescriptionKey;
      v53 = CFSTR("CCCryptorGCM() decryption failed tag lenght is not matching");
      v37 = &v53;
      v38 = &v52;
      goto LABEL_12;
    }
LABEL_15:
    v39 = v43;
    goto LABEL_16;
  }
  v33 = v46;
  v36 = a4;
  if (timingsafe_bcmp(objc_msgSend(objc_retainAutorelease(v46), "bytes"), objc_msgSend(objc_retainAutorelease(v22), "bytes"), 0x10uLL))
  {
    if (a4)
    {
      v50 = NSLocalizedDescriptionKey;
      v51 = CFSTR("CCCryptorGCM() decryption failed tag has been tempered with");
      v37 = &v51;
      v38 = &v50;
LABEL_12:
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v38, 1));
      *v36 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("Decoder"), 1, v34));
      goto LABEL_13;
    }
    goto LABEL_15;
  }
  v41 = sub_100011D0C();
  v42 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v5;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%@: Success decrypting....", buf, 0xCu);
  }

  v39 = v43;
  v36 = (id *)v43;
LABEL_16:

  return v36;
}

@end
