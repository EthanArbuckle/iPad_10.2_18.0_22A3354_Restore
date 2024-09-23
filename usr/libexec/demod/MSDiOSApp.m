@implementation MSDiOSApp

+ (id)appWithPath:(id)a3
{
  id v3;
  MSDiOSApp *v4;

  v3 = a3;
  v4 = -[MSDiOSApp initWithPath:]([MSDiOSApp alloc], "initWithPath:", v3);

  return v4;
}

- (MSDiOSApp)initWithPath:(id)a3
{
  id v4;
  MSDiOSApp *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  MSDiOSApp *v10;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MSDiOSApp;
  v5 = -[MSDiOSApp init](&v16, "init");
  if (!v5)
  {
    v10 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "rangeOfString:", CFSTR(".app")) == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000C8A44();
    goto LABEL_16;
  }
  v6 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v4));
  if (!v6)
  {
    v13 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000C8AA8();
    goto LABEL_16;
  }
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject infoDictionary](v6, "infoDictionary"));

  if (!v8)
  {
    v14 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1000C8B0C();

LABEL_16:
    v10 = 0;
    goto LABEL_6;
  }
  -[MSDiOSApp setPath:](v5, "setPath:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject infoDictionary](v7, "infoDictionary"));
  -[MSDiOSApp setInfo:](v5, "setInfo:", v9);

  v10 = v5;
LABEL_6:

LABEL_8:
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[MSDiOSApp setPath:](self, "setPath:", 0);
  -[MSDiOSApp setInfo:](self, "setInfo:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MSDiOSApp;
  -[MSDiOSApp dealloc](&v3, "dealloc");
}

- (id)uniqueIdentifier
{
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  CC_SHA1_CTX v30;
  unsigned __int8 md[20];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp getExcutableURL](self, "getExcutableURL", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (!v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000C8B70(self, v6);

    goto LABEL_23;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
    *(_DWORD *)buf = 136315394;
    v33 = "-[MSDiOSApp uniqueIdentifier]";
    v34 = 2114;
    v35 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s - executableFileURL:  %{public}@", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp getCodeResourcesURL](self, "getCodeResourcesURL"));
  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (!v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000C8BFC(self, v11);

LABEL_23:
    v8 = 0;
LABEL_27:
    v16 = 0;
    v19 = 0;
    v22 = 0;
    goto LABEL_16;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
    *(_DWORD *)buf = 136315394;
    v33 = "-[MSDiOSApp uniqueIdentifier]";
    v34 = 2114;
    v35 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s - codeResourcesURL:  %{public}@", buf, 0x16u);

  }
  CC_SHA1_Init(&v30);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithFileAtPath:](NSInputStream, "inputStreamWithFileAtPath:", v13));

  if (!v14)
  {
    v24 = sub_1000604F0();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_1000C8C88(v3, v25);

    goto LABEL_27;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v14, "scheduleInRunLoop:forMode:", v15, NSDefaultRunLoopMode);

  objc_msgSend(v14, "open");
  v16 = malloc_type_calloc(0x40000uLL, 1uLL, 0xF66F3526uLL);
  v17 = (uint64_t)objc_msgSend(v14, "read:maxLength:", v16, 0x40000);
  if (v17 >= 1)
  {
    do
    {
      CC_SHA1_Update(&v30, v16, v17);
      v17 = (uint64_t)objc_msgSend(v14, "read:maxLength:", v16, 0x40000);
    }
    while (v17 > 0);
  }
  if (v17)
  {
    v26 = sub_1000604F0();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_1000C8D08(v3, v27);
  }
  else
  {
    objc_msgSend(v14, "close");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithFileAtPath:](NSInputStream, "inputStreamWithFileAtPath:", v18));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
      objc_msgSend(v19, "scheduleInRunLoop:forMode:", v20, NSDefaultRunLoopMode);

      objc_msgSend(v19, "open");
      v21 = (uint64_t)objc_msgSend(v19, "read:maxLength:", v16, 0x40000);
      if (v21 >= 1)
      {
        do
        {
          CC_SHA1_Update(&v30, v16, v21);
          v21 = (uint64_t)objc_msgSend(v19, "read:maxLength:", v16, 0x40000);
        }
        while (v21 > 0);
      }
      if (!v21)
      {
        objc_msgSend(v19, "close");
        free(v16);
        CC_SHA1_Final(md, &v30);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", md, 20));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "hexStringRepresentation"));
        goto LABEL_16;
      }
      v29 = sub_1000604F0();
      v27 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_1000C8D08(v8, v27);
      v14 = v19;
    }
    else
    {
      v28 = sub_1000604F0();
      v27 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_1000C8C88(v8, v27);
      v14 = 0;
    }
  }

  if (v16)
  {
    free(v16);
    v16 = 0;
  }
  v22 = 0;
  v19 = v14;
LABEL_16:

  return v22;
}

- (id)versionInfo
{
  void *v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  NSObject *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp info](self, "info"));
  v4 = CFSTR("CFBundleShortVersionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("CFBundleShortVersionString")));

  if (v5)
  {
    v7 = objc_opt_class(NSString, v6);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) == 0)
    {
      v8 = sub_1000604F0();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1000C8DEC(v9, v10, v11);

      v12 = 0;
      v4 = CFSTR("CFBundleShortVersionString");
      goto LABEL_9;
    }
LABEL_8:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, v4, 0));
    goto LABEL_9;
  }
  v4 = (id)kCFBundleVersionKey;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp info](self, "info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v4));

  if (v5)
  {
    v15 = objc_opt_class(NSString, v14);
    if ((objc_opt_isKindOfClass(v5, v15) & 1) != 0)
      goto LABEL_8;
  }
  v17 = sub_1000604F0();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_1000C8D88();

  v12 = 0;
LABEL_9:

  return v12;
}

- (id)getExcutableURL
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  NSObject *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp path](self, "path"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v3));

  if (!v4)
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000C8E60(self, v8);
    goto LABEL_8;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executableURL"));
  if (!v5)
  {
    v9 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000C8EE0(self, v8);
LABEL_8:

    v5 = 0;
  }

  return v5;
}

- (id)getCodeResourcesURL
{
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp path](self, "path"));
  v4 = +[MSDMacAppPkg isMacApp:](MSDMacAppPkg, "isMacApp:", v3);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp path](self, "path"));
    v6 = objc_claimAutoreleasedReturnValue(+[MSDMacAppPkg codeSignaturePath:](MSDMacAppPkg, "codeSignaturePath:", v5));
  }
  else
  {
    if (-[MSDiOSApp isAlmondApp](self, "isAlmondApp"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp codeSignaturePathForAlmondApp](self, "codeSignaturePathForAlmondApp"));
      goto LABEL_7;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp path](self, "path"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("_CodeSignature")));
  }
  v7 = (void *)v6;

LABEL_7:
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("CodeResources")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp path](self, "path"));
    NSLog(CFSTR("Error - Failed to get CodeSignature path for app:  %@"), v8);
    v9 = 0;
  }

  return v9;
}

- (BOOL)isAlmondApp
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  char v8;

  v8 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp path](self, "path"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Wrapper")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v8);

  if (v8)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (id)codeSignaturePathForAlmondApp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  NSObject *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp path](self, "path"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Wrapper")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp serachForFileWithSuffix:inFolder:](self, "serachForFileWithSuffix:inFolder:", CFSTR(".app"), v4));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@/%@"), v4, v5, CFSTR("_CodeSignature")));
  }
  else
  {
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000C8F60();

    v6 = 0;
  }

  return v6;
}

- (id)serachForFileWithSuffix:(id)a3 inFolder:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v22 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v6, &v22));
  v9 = v22;

  if (v8)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v8;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v11)
    {
      v12 = 0;
      v13 = *(_QWORD *)v19;
      while (2)
      {
        v14 = 0;
        v15 = v12;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v12 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v14);

          if ((objc_msgSend(v12, "hasSuffix:", v5, (_QWORD)v18) & 1) != 0)
          {
            v11 = v12;

            v10 = v11;
            goto LABEL_12;
          }
          v14 = ((char *)v14 + 1);
          v15 = v12;
        }
        while (v11 != v14);
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v11)
          continue;
        break;
      }

    }
  }
  else
  {
    v17 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000C8FD0((uint64_t)v6, v9, v10);
    v11 = 0;
  }
LABEL_12:

  return v11;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)info
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
