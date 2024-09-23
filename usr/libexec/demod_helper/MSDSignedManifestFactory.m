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
    v9 = &off_1000482D8;
    if (v8 != 7)
      v9 = off_1000482D0;
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
  void *v14;
  int v15;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) == 0)
  {
    v19 = sub_100024A40();
    v10 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000295BC();
    goto LABEL_28;
  }
  v6 = objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithFileAtPath:](NSInputStream, "inputStreamWithFileAtPath:", v3));
  if (!v6)
  {
    v20 = sub_100024A40();
    v10 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100029350();
    goto LABEL_28;
  }
  v7 = (void *)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v7, "scheduleInRunLoop:forMode:", v8, NSDefaultRunLoopMode);

  objc_msgSend(v7, "open");
  v25 = 0;
  v9 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithStream:options:format:error:](NSPropertyListSerialization, "propertyListWithStream:options:format:error:", v7, 2, 0, &v25));
  v10 = v25;
  objc_msgSend(v7, "close");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v7, "removeFromRunLoop:forMode:", v11, NSDefaultRunLoopMode);

  if (!v9)
  {
    v21 = sub_100024A40();
    v9 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000293BC(v10, v9);
    goto LABEL_27;
  }
  v12 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v9, v12) & 1) == 0)
  {
    v22 = sub_100024A40();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_100029550();
    goto LABEL_26;
  }
  v13 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v9, "objectForKey:", CFSTR("Version")));
  if (!v13)
  {
    v24 = sub_100024A40();
    v23 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_100029450();
LABEL_26:

LABEL_27:
LABEL_28:
    v9 = 0;
    goto LABEL_12;
  }
  v14 = (void *)v13;
  if (+[MSDPlatform iOSHub](MSDPlatform, "iOSHub"))
    v15 = 6;
  else
    v15 = 7;
  if ((int)objc_msgSend(v14, "intValue") < v15 || (int)objc_msgSend(v14, "intValue") >= 8)
  {
    v17 = sub_100024A40();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000294BC(v14, v18);

    goto LABEL_28;
  }

LABEL_12:
  return v9;
}

@end
