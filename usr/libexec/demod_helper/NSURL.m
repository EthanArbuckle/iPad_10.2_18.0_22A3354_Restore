@implementation NSURL

- (id)fileHash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;
  NSObject *v16;
  id v17;
  CC_SHA1_CTX c;
  unsigned __int8 md[20];

  if (-[NSURL isFileURL](self, "isFileURL"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self, "path"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForReadingAtPath:](NSFileHandle, "fileHandleForReadingAtPath:", v3));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self, "absoluteString"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByRemovingPercentEncoding"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForReadingAtPath:](NSFileHandle, "fileHandleForReadingAtPath:", v5));

  }
  memset(&c, 0, sizeof(c));
  if (v4)
  {
    fcntl((int)objc_msgSend(v4, "fileDescriptor"), 48, 1);
    CC_SHA1_Init(&c);
    while (1)
    {
      v6 = objc_autoreleasePoolPush();
      v17 = 0;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "readDataUpToLength:error:", 0x40000, &v17));
      v8 = v17;
      if (v8)
        break;
      if (!objc_msgSend(v7, "length"))
      {

        objc_autoreleasePoolPop(v6);
        CC_SHA1_Final(md, &c);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", md, 20));
        v10 = 0;
        goto LABEL_12;
      }
      v9 = objc_retainAutorelease(v7);
      CC_SHA1_Update(&c, objc_msgSend(v9, "bytes"), (CC_LONG)objc_msgSend(v9, "length"));

      objc_autoreleasePoolPop(v6);
    }
    v10 = v8;

    objc_autoreleasePoolPop(v6);
    v11 = sub_100024A40();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10002D494(self, (uint64_t)v10, v12);

    v13 = 0;
LABEL_12:
    objc_msgSend(v4, "closeFile");
  }
  else
  {
    v15 = sub_100024A40();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10002D3F4(self, v16);

    v13 = 0;
    v10 = 0;
  }

  return v13;
}

- (id)directoryHash
{
  return 0;
}

+ (id)fileURLWithString:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("file://")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("file://"), "length")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));
  }

  return v5;
}

@end
