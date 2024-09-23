@implementation MSDSignedManifestFactory

+ (id)createSignedManifestFromManifestFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  __objc2_class **v9;
  void *v10;

  v3 = a3;
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSignedManifestFactory readManifestFromFile:](MSDSignedManifestFactory, "readManifestFromFile:", v3));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Version")));
    v8 = objc_msgSend(v7, "intValue");
    v9 = &off_10013C7F0;
    if (v8 != 7)
      v9 = off_10013C7E8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class signedManifestFromManifestData:](*v9, "signedManifestFromManifestData:", v6));

  }
  else
  {
    v10 = 0;
  }
  objc_autoreleasePoolPop(v4);

  return v10;
}

+ (id)readManifestFromFile:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  id v26;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) == 0)
  {
    v20 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000C4D9C();
    goto LABEL_28;
  }
  v6 = objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithFileAtPath:](NSInputStream, "inputStreamWithFileAtPath:", v3));
  if (!v6)
  {
    v21 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000C4B30();
    goto LABEL_28;
  }
  v7 = (void *)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v7, "scheduleInRunLoop:forMode:", v8, NSDefaultRunLoopMode);

  objc_msgSend(v7, "open");
  v26 = 0;
  v9 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithStream:options:format:error:](NSPropertyListSerialization, "propertyListWithStream:options:format:error:", v7, 2, 0, &v26));
  v10 = v26;
  objc_msgSend(v7, "close");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v7, "removeFromRunLoop:forMode:", v11, NSDefaultRunLoopMode);

  if (!v9)
  {
    v22 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000C4B9C(v10, v9);
    goto LABEL_27;
  }
  v13 = objc_opt_class(NSDictionary, v12);
  if ((objc_opt_isKindOfClass(v9, v13) & 1) == 0)
  {
    v23 = sub_1000604F0();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_1000C4D30();
    goto LABEL_26;
  }
  v14 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v9, "objectForKey:", CFSTR("Version")));
  if (!v14)
  {
    v25 = sub_1000604F0();
    v24 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_1000C4C30();
LABEL_26:

LABEL_27:
LABEL_28:
    v9 = 0;
    goto LABEL_12;
  }
  v15 = (void *)v14;
  if (+[MSDPlatform iOSHub](MSDPlatform, "iOSHub"))
    v16 = 6;
  else
    v16 = 7;
  if ((int)objc_msgSend(v15, "intValue") < v16 || (int)objc_msgSend(v15, "intValue") >= 8)
  {
    v18 = sub_1000604F0();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1000C4C9C(v15, v19);

    goto LABEL_28;
  }

LABEL_12:
  return v9;
}

@end
