@implementation Filer

+ (BOOL)writeDictionary:(id)a3 toFile:(id)a4
{
  void *v6;
  NSOutputStream *v7;
  NSInteger v8;
  NSObject *v9;
  uint64_t v11;
  uint8_t buf[4];
  NSInteger v13;
  __int16 v14;
  id v15;

  v11 = 0;
  v6 = objc_autoreleasePoolPush();
  v7 = +[NSOutputStream outputStreamToFileAtPath:append:](NSOutputStream, "outputStreamToFileAtPath:append:", a4, 0);
  -[NSOutputStream open](v7, "open");
  v8 = +[NSPropertyListSerialization writePropertyList:toStream:format:options:error:](NSPropertyListSerialization, "writePropertyList:toStream:format:options:error:", a3, v7, 200, 0, &v11);
  -[NSOutputStream close](v7, "close");
  if (v8)
  {
    if (byte_1000A2480)
    {
      v9 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v13 = v8;
        v14 = 2112;
        v15 = a4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> Wrote %ld bytes to file %@", buf, 0x16u);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_100053F94();
  }
  objc_autoreleasePoolPop(v6);
  return v8 != 0;
}

+ (id)copyDictionaryFromFile:(id)a3
{
  void *v4;
  NSInputStream *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v12;
  uint8_t buf[4];
  id v14;

  v12 = 0;
  v4 = objc_autoreleasePoolPush();
  v5 = +[NSInputStream inputStreamWithFileAtPath:](NSInputStream, "inputStreamWithFileAtPath:", a3);
  -[NSInputStream open](v5, "open");
  v6 = +[NSPropertyListSerialization propertyListWithStream:options:format:error:](NSPropertyListSerialization, "propertyListWithStream:options:format:error:", v5, 2, 0, &v12);
  -[NSInputStream close](v5, "close");
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100053FF8();
    goto LABEL_11;
  }
  v8 = objc_opt_class(NSMutableDictionary, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10005405C();
LABEL_11:
    v9 = 0;
    goto LABEL_6;
  }
  v9 = v6;
  if (byte_1000A2480)
  {
    v10 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> Successfully Read from file %@.", buf, 0xCu);
    }
  }
LABEL_6:
  objc_autoreleasePoolPop(v4);
  return v9;
}

- (id)copyDictionaryFromFile
{
  return +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", self->_fileDict);
}

- (id)getValueForKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_fileDict, "objectForKey:", a3);
}

- (id)copyValuesForKeys:(id)a3
{
  NSMutableDictionary *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = -[NSMutableDictionary alloc](+[NSMutableDictionary init](NSMutableDictionary, "init"), "alloc");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(a3);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v11 = -[Filer getValueForKey:](self, "getValueForKey:", v10);
        if (v11)
          -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v11, v10);
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  return v5;
}

- (void)setMultiple:(id)a3 remove:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(a3);
        -[Filer setValue:forKey:](self, "setValue:forKey:", objc_msgSend(a3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10)), *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v8);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(a4);
        -[Filer setValue:forKey:](self, "setValue:forKey:", 0, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14));
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *fileDict;

  fileDict = self->_fileDict;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](fileDict, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](fileDict, "removeObjectForKey:", a4);
}

- (BOOL)synchronizeToFile
{
  return +[Filer writeDictionary:toFile:](Filer, "writeDictionary:toFile:", self->_fileDict, self->_path);
}

- (Filer)initWithFileName:(char *)a3 inDirectory:(char *)a4
{
  Filer *v4;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSFileManager *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSString **p_path;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSString *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSMutableDictionary *v38;
  objc_super v39;
  timespec v40;
  uint64_t v41;
  char v42;
  NSFileAttributeKey v43;
  _UNKNOWN **v44;
  NSFileAttributeKey v45;
  _UNKNOWN **v46;
  uuid_t v47;

  v4 = 0;
  v40 = (timespec)xmmword_100061D70;
  if (a3 && a4)
  {
    v42 = 0;
    memset(v47, 0, sizeof(v47));
    v41 = 0;
    v8 = objc_autoreleasePoolPush();
    v39.receiver = self;
    v39.super_class = (Class)Filer;
    v4 = -[Filer init](&v39, "init");
    if (!v4)
    {
LABEL_8:
      objc_autoreleasePoolPop(v8);
      return v4;
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3);
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a4);
    v11 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    v12 = gethostuuid(v47, &v40);
    if ((_DWORD)v12)
    {
      v13 = v12;
      v14 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_1000541EC(v13, v14, v15, v16, v17, v18, v19, v20);
LABEL_7:

      v4 = 0;
      goto LABEL_8;
    }
    v4->_path = objc_retain(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@.%02X%02X%02X%02X-%02X%02X-%02X%02X-%02X%02X-%02X%02X%02X%02X%02X%02X.plist"), v10, v9, v47[0], v47[1], v47[2], v47[3], v47[4], v47[5], v47[6], v47[7], v47[8], v47[9], v47[10], v47[11], v47[12],
                    v47[13],
                    v47[14],
                    v47[15]));
    p_path = &v4->_path;
    if (-[NSFileManager fileExistsAtPath:isDirectory:](v11, "fileExistsAtPath:isDirectory:", v10, &v42))
    {
      if (!v42)
      {
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_1000540BC();
        goto LABEL_7;
      }
    }
    else if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 0, 0, &v41))
    {
      v31 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100054184((uint64_t)&v41, v31, v32, v33, v34, v35, v36, v37);
      goto LABEL_7;
    }
    if (-[NSFileManager fileExistsAtPath:isDirectory:](v11, "fileExistsAtPath:isDirectory:", *p_path, &v42))
    {
      if (v42)
      {
        v23 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_10005411C((uint64_t)&v4->_path, v23, v24, v25, v26, v27, v28, v29);
        goto LABEL_7;
      }
      v43 = NSFilePosixPermissions;
      v44 = &off_100085318;
      -[NSFileManager setAttributes:ofItemAtPath:error:](v11, "setAttributes:ofItemAtPath:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1), *p_path, &v41);
    }
    else
    {
      v30 = *p_path;
      v45 = NSFilePosixPermissions;
      v46 = &off_100085318;
      -[NSFileManager createFileAtPath:contents:attributes:](v11, "createFileAtPath:contents:attributes:", v30, 0, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1));
    }
    v38 = +[Filer copyDictionaryFromFile:](Filer, "copyDictionaryFromFile:", v4->_path);
    v4->_fileDict = v38;
    if (!v38)
      v4->_fileDict = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    goto LABEL_8;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_path = 0;
  self->_fileDict = 0;
  v3.receiver = self;
  v3.super_class = (Class)Filer;
  -[Filer dealloc](&v3, "dealloc");
}

@end
