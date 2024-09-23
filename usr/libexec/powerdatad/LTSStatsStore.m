@implementation LTSStatsStore

- (id)getfileNameForChannel:(id)a3
{
  uint64_t v4;
  __CFString *v5;

  v4 = 0;
  while (!objc_msgSend(a3, "isEqualToString:", off_100014940[v4]))
  {
    v4 += 4;
    if (v4 == 56)
    {
      v5 = 0;
      return v5;
    }
  }
  v5 = off_100014940[v4 + 1];
  return v5;
}

- (void)setChannelExistsForChannel:(id)a3
{
  uint64_t v4;

  v4 = 0;
  while (!objc_msgSend(a3, "isEqualToString:", off_100014940[v4]))
  {
    v4 += 4;
    if (v4 == 56)
      return;
  }
  LOBYTE(off_100014940[v4 + 3]) = 1;
}

- (id)getDeviceSerialNumber
{
  void *v2;
  void *v3;

  v2 = (void *)MGCopyAnswer(CFSTR("SerialNumber"), 0);
  if (v2)
  {
    v3 = v2;
    if (!objc_msgSend(v2, "length") && os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
      sub_10000AEDC();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
      sub_10000AEB0();
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString string](NSString, "string"));
  }
  return v3;
}

- (id)initForChannel:(id)a3
{
  id v4;
  LTSStatsStore *v5;
  uint64_t v6;
  NSString *fileName;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *lts;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *v15;
  uint64_t v16;
  NSMutableDictionary *v17;
  LTSStatsStore *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LTSStatsStore;
  v5 = -[LTSStatsStore init](&v20, "init");
  -[LTSStatsStore setChannelExistsForChannel:](v5, "setChannelExistsForChannel:", v4);
  v6 = objc_claimAutoreleasedReturnValue(-[LTSStatsStore getfileNameForChannel:](v5, "getfileNameForChannel:", v4));
  fileName = v5->_fileName;
  v5->_fileName = (NSString *)v6;

  if (!v5->_fileName)
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
      sub_10000AF08();
    goto LABEL_18;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LTSStatsStore getDeviceSerialNumber](v5, "getDeviceSerialNumber"));
  v9 = objc_claimAutoreleasedReturnValue(+[LTSStatsStore readFromFile:](LTSStatsStore, "readFromFile:", v5->_fileName));
  lts = v5->_lts;
  v5->_lts = (NSMutableDictionary *)v9;

  v11 = v5->_lts;
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("Serial")));
    v13 = v12;
    if (!v12 || objc_msgSend(v12, "compare:", v8))
    {
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
        sub_10000AFC8();
      v14 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v15 = v5->_lts;
      v5->_lts = (NSMutableDictionary *)v14;

      -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_lts, "setObject:forKeyedSubscript:", v8, CFSTR("Serial"));
    }

  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v17 = v5->_lts;
    v5->_lts = (NSMutableDictionary *)v16;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_lts, "setObject:forKeyedSubscript:", v8, CFSTR("Serial"));
  }
  if (!v5->_lts)
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
      sub_10000AF68();

LABEL_18:
    v18 = 0;
    goto LABEL_12;
  }
  v18 = v5;

LABEL_12:
  return v18;
}

+ (BOOL)writeDictionary:(id)a3 toFile:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  NSObject *v17;
  BOOL v18;
  void *v20;
  id v21;
  id v22;
  id v23;
  char v24;
  NSFileAttributeKey v25;
  NSFileProtectionType v26;
  NSFileAttributeKey v27;
  NSFileProtectionType v28;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("/var/db/SoC/")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v24 = 0;
  objc_msgSend(v7, "appendString:", v6);
  v27 = NSFileProtectionKey;
  v28 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
  v23 = 0;
  objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/db/SoC/"), 0, v9, &v23);
  v10 = v23;

  v20 = v5;
  if (objc_msgSend(v8, "fileExistsAtPath:isDirectory:", CFSTR("/var/db/SoC/"), &v24) && v24)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSOutputStream outputStreamToFileAtPath:append:](NSOutputStream, "outputStreamToFileAtPath:append:", v7, 0, v5));
    objc_msgSend(v11, "open");
    v22 = 0;
    v12 = +[NSPropertyListSerialization writePropertyList:toStream:format:options:error:](NSPropertyListSerialization, "writePropertyList:toStream:format:options:error:", v5, v11, 200, 0, &v22);
    v13 = v22;

    objc_msgSend(v11, "close");
    if (v12)
    {
      v25 = NSFileProtectionKey;
      v26 = NSFileProtectionCompleteUntilFirstUserAuthentication;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
      v21 = v13;
      v15 = objc_msgSend(v8, "setAttributes:ofItemAtPath:error:", v14, v7, &v21);
      v16 = v21;

      v17 = off_100014B00;
      if ((v15 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG))
          sub_10000B054((uint64_t)v7, v12, v17);
        v18 = 1;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
          sub_10000B0C4();
        v18 = 0;
      }
      v13 = v16;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
        sub_10000AFF4();
      v18 = 0;
    }

    v10 = v13;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
      sub_10000B124();
    v18 = 0;
  }

  return v18;
}

+ (id)readFromFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("/var/db/SoC/")));
  objc_msgSend(v4, "appendString:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithFileAtPath:](NSInputStream, "inputStreamWithFileAtPath:", v4));
  objc_msgSend(v5, "open");
  v9 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithStream:options:format:error:](NSPropertyListSerialization, "propertyListWithStream:options:format:error:", v5, 2, 0, &v9));
  v7 = v9;
  objc_msgSend(v5, "close");
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG))
      sub_10000B1E4();
  }
  else if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
  {
    sub_10000B184();
  }

  return v6;
}

- (id)getLifetimeStats
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_lts, "objectForKeyedSubscript:", CFSTR("LifetimeStats")));
  if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG))
    sub_10000B244();
  return v2;
}

- (id)getLifetimeStatsForVersion:(unint64_t)a3
{
  NSString *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSString *v12;
  NSString *fileName;
  int v15;
  NSString *v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  NSString *v20;

  v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_lts, "objectForKeyedSubscript:", CFSTR("version")));
  v6 = v5;
  if (v5 && -[NSString unsignedLongLongValue](v5, "unsignedLongLongValue") == (id)a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LTSStatsStore getLifetimeStats](self, "getLifetimeStats"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v7));
    v9 = v8;
    if (v7)
      goto LABEL_11;
  }
  else
  {
    v10 = off_100014B00;
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
    {
      fileName = self->_fileName;
      v15 = 138543874;
      v16 = v6;
      v17 = 2048;
      v18 = a3;
      v19 = 2114;
      v20 = fileName;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "LTS on-disk version(%{public}@) doesn't match with current version(%lld) for domain %{public}@\n", (uint8_t *)&v15, 0x20u);
    }
    -[NSMutableDictionary removeObjectForKey:](self->_lts, "removeObjectForKey:", CFSTR("version"));
    -[NSMutableDictionary removeObjectForKey:](self->_lts, "removeObjectForKey:", CFSTR("LifetimeStats"));
    v8 = 0;
  }
  v9 = objc_alloc_init((Class)NSMutableDictionary);

  v11 = off_100014B00;
  if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
  {
    v12 = self->_fileName;
    v15 = 138543362;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Returning empty dictionary for lifetime stats of domain %{public}@", (uint8_t *)&v15, 0xCu);
  }
  v7 = 0;
LABEL_11:

  return v9;
}

- (void)saveLifetimeStats:(id)a3 forVersion:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSString *fileName;
  int v10;
  NSString *v11;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKey:](self->_lts, "setObject:forKey:", v7, CFSTR("version"));
  -[NSMutableDictionary setObject:forKey:](self->_lts, "setObject:forKey:", v6, CFSTR("LifetimeStats"));

  +[LTSStatsStore writeDictionary:toFile:](LTSStatsStore, "writeDictionary:toFile:", self->_lts, self->_fileName);
  v8 = off_100014B00;
  if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
  {
    fileName = self->_fileName;
    v10 = 138543362;
    v11 = fileName;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Saved lifetime stats of domain %{public}@", (uint8_t *)&v10, 0xCu);
  }

}

+ (id)getBootUUID
{
  int v2;
  uint64_t v3;
  void *v4;
  NSObject *v6;
  int v7;
  size_t v8;
  _BYTE v9[37];

  memset(v9, 0, sizeof(v9));
  v8 = 37;
  if (!qword_100014B38)
  {
    v2 = sysctlbyname("kern.bootsessionuuid", v9, &v8, 0, 0);
    if (v2)
    {
      v7 = v2;
      v6 = off_100014B00;
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
        sub_10000B2B4(v7, v6);
    }
    else
    {
      v3 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 1));
      v4 = (void *)qword_100014B38;
      qword_100014B38 = v3;

    }
  }
  return (id)qword_100014B38;
}

+ (void)saveStatsSinceBoot:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LTSStatsStore getBootUUID](LTSStatsStore, "getBootUUID"));
  if (v5)
  {
    objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("PrevStatsSinceBoot"));
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("bootuuid"));
    +[LTSStatsStore writeDictionary:toFile:](LTSStatsStore, "writeDictionary:toFile:", v4, CFSTR("lts.statssinceboot.plist"));
  }
  else if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
  {
    sub_10000B324();
  }

}

+ (id)getPrevStatsSinceBoot
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t v10[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LTSStatsStore getBootUUID](LTSStatsStore, "getBootUUID"));
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
      sub_10000B324();
    v5 = 0;
    v3 = 0;
    goto LABEL_8;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LTSStatsStore readFromFile:](LTSStatsStore, "readFromFile:", CFSTR("lts.statssinceboot.plist")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bootuuid")));
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
      sub_10000B350();
    v5 = 0;
    goto LABEL_8;
  }
  v5 = v4;
  if ((objc_msgSend(v4, "isEqualToString:", v2) & 1) == 0)
  {
    v7 = off_100014B00;
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "On-disk stats since boot are with different boot session UUID", v10, 2u);
    }
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("PrevStatsSinceBoot"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("bootuuid"));
    +[LTSStatsStore writeDictionary:toFile:](LTSStatsStore, "writeDictionary:toFile:", v3, CFSTR("lts.statssinceboot.plist"));
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("PrevStatsSinceBoot")));
LABEL_9:
  v8 = v6;

  return v8;
}

- (NSMutableDictionary)lts
{
  return self->_lts;
}

- (void)setLts:(id)a3
{
  objc_storeStrong((id *)&self->_lts, a3);
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fileName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_lts, 0);
}

@end
