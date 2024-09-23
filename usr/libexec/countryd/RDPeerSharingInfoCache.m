@implementation RDPeerSharingInfoCache

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDPeerSharingInfoCache cache](self, "cache"));
  v6 = objc_msgSend(v4, "initWithCache:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RDPeerSharingInfoCache)init
{
  RDPeerSharingInfoCache *v2;
  uint64_t v3;
  NSMutableDictionary *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RDPeerSharingInfoCache;
  v2 = -[RDPeerSharingInfoCache init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (RDPeerSharingInfoCache)initWithCache:(id)a3
{
  id v5;
  RDPeerSharingInfoCache *v6;
  RDPeerSharingInfoCache *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RDPeerSharingInfoCache;
  v6 = -[RDPeerSharingInfoCache init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cache, a3);

  return v7;
}

- (RDPeerSharingInfoCache)initWithCoder:(id)a3
{
  id v4;
  RDPeerSharingInfoCache *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RDPeerSharingInfoCache;
  v5 = -[RDPeerSharingInfoCache init](&v13, "init");
  if (v5)
  {
    v6 = objc_opt_class(RDPeerSharingInfoDevice);
    v7 = objc_opt_class(NSMutableDictionary);
    v8 = objc_opt_class(NSDate);
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, objc_opt_class(NSString), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("kRDPeerSharingInfoCacheKeyCache")));
    v5 = -[RDPeerSharingInfoCache initWithCache:](v5, "initWithCache:", v11);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RDPeerSharingInfoCache cache](self, "cache"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kRDPeerSharingInfoCacheKeyCache"));

}

+ (id)getCachePath
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RDCachedData getCacheDirPath](RDCachedData, "getCacheDirPath"));
  v6[0] = v2;
  v6[1] = CFSTR("shareStamps.plist");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v3));

  return v4;
}

+ (id)loadCache
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSSet *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  RDPeerSharingInfoCache *v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  RDPeerSharingInfoCache *v27;
  void *v28;
  NSObject *v29;
  id v30;
  id v31;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RDPeerSharingInfoCache getCachePath](RDPeerSharingInfoCache, "getCachePath"));
  v34 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v2, 1, &v34));
  v4 = v34;
  v5 = v4;
  if (v3)
  {
    if (v4)
    {
      if (qword_100019398 != -1)
        dispatch_once(&qword_100019398, &stru_100014AD0);
      v6 = (void *)qword_1000193A0;
      if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_ERROR))
      {
        v7 = v6;
        v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description")));
        v9 = objc_msgSend(v8, "UTF8String");
        *(_DWORD *)buf = 136315138;
        v36 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Got an error while reading sharing data, but continuing anyway: %s", buf, 0xCu);

      }
    }
    v10 = objc_opt_class(RDPeerSharingInfoCache);
    v11 = objc_opt_class(NSMutableDictionary);
    v12 = objc_opt_class(NSDate);
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, objc_opt_class(NSString), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v33 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v14, v3, &v33));
    v16 = v33;
    v17 = v16;
    if (v15)
    {
      if (v16)
      {
        if (qword_100019398 != -1)
          dispatch_once(&qword_100019398, &stru_100014AD0);
        v18 = (void *)qword_1000193A0;
        if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_ERROR))
        {
          v19 = v18;
          v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "description")));
          v21 = objc_msgSend(v20, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v36 = v21;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Encountered error while unarchiving sharing cache: %s", buf, 0xCu);

        }
      }
      v22 = v15;
    }
    else
    {
      if (qword_100019398 != -1)
        dispatch_once(&qword_100019398, &stru_100014AD0);
      v28 = (void *)qword_1000193A0;
      if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_ERROR))
      {
        v29 = v28;
        v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "description")));
        v31 = objc_msgSend(v30, "UTF8String");
        *(_DWORD *)buf = 136315138;
        v36 = v31;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to read unarchive sharing cache: %s", buf, 0xCu);

      }
      v22 = objc_alloc_init(RDPeerSharingInfoCache);
    }
    v27 = v22;

  }
  else
  {
    if (qword_100019398 != -1)
      dispatch_once(&qword_100019398, &stru_100014AD0);
    v23 = (void *)qword_1000193A0;
    if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_ERROR))
    {
      v24 = v23;
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description")));
      v26 = objc_msgSend(v25, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v36 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to read sharing cached data file: %s", buf, 0xCu);

    }
    v27 = objc_alloc_init(RDPeerSharingInfoCache);
  }

  return v27;
}

- (BOOL)save
{
  const char **v3;
  NSObject *v4;
  NSObject *v5;
  BOOL v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  id v23;
  id v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;

  v3 = (const char **)_CFGetProgname(self, a2);
  if (!strcmp(*v3, "countryd"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RDPeerSharingInfoCache getCachePath](RDPeerSharingInfoCache, "getCachePath"));
    v24 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v24));
    v9 = v24;
    if (v9)
    {
      if (qword_100019398 != -1)
        dispatch_once(&qword_100019398, &stru_100014AD0);
      v10 = (void *)qword_1000193A0;
      if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedFailureReason"));
        *(_DWORD *)buf = 68289538;
        v26 = 0;
        v27 = 2082;
        v28 = "";
        v29 = 2114;
        v30 = v12;
        v31 = 2114;
        v32 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Failed to archive sharing data\", \"description\":%{public, location:escape_only}@, \"failureReason\":%{public, location:escape_only}@}", buf, 0x26u);

        if (qword_100019398 != -1)
          dispatch_once(&qword_100019398, &stru_100014AD0);
      }
      v14 = (void *)qword_1000193A0;
      if (!os_signpost_enabled((os_log_t)qword_1000193A0))
        goto LABEL_32;
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedFailureReason"));
      *(_DWORD *)buf = 68289538;
      v26 = 0;
      v27 = 2082;
      v28 = "";
      v29 = 2114;
      v30 = v16;
      v31 = 2114;
      v32 = v17;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to archive sharing data", "{\"msg%{public}.0s\":\"Failed to archive sharing data\", \"description\":%{public, location:escape_only}@, \"failureReason\":%{public, location:escape_only}@}", buf, 0x26u);

    }
    else
    {
      v23 = 0;
      v18 = objc_msgSend(v8, "writeToFile:options:error:", v7, 268435457, &v23);
      v15 = v23;
      if ((v18 & 1) != 0)
      {
        if (qword_100019398 != -1)
          dispatch_once(&qword_100019398, &stru_100014AD0);
        v19 = qword_1000193A0;
        if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 68289026;
          v26 = 0;
          v27 = 2082;
          v28 = "";
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Saved sharing cache\"}", buf, 0x12u);
        }

        v6 = 1;
        goto LABEL_33;
      }
      if (qword_100019398 != -1)
        dispatch_once(&qword_100019398, &stru_100014AD0);
      v20 = qword_1000193A0;
      if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289282;
        v26 = 0;
        v27 = 2082;
        v28 = "";
        v29 = 2114;
        v30 = v7;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Failed to write sharing cache\", \"path\":%{public, location:escape_only}@}", buf, 0x1Cu);
        if (qword_100019398 != -1)
          dispatch_once(&qword_100019398, &stru_100014AD0);
      }
      v21 = qword_1000193A0;
      if (os_signpost_enabled((os_log_t)qword_1000193A0))
      {
        *(_DWORD *)buf = 68289282;
        v26 = 0;
        v27 = 2082;
        v28 = "";
        v29 = 2114;
        v30 = v7;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to write sharing cache", "{\"msg%{public}.0s\":\"Failed to write sharing cache\", \"path\":%{public, location:escape_only}@}", buf, 0x1Cu);
      }
    }

LABEL_32:
    v6 = 0;
LABEL_33:

    return v6;
  }
  if (qword_100019398 != -1)
    dispatch_once(&qword_100019398, &stru_100014AD0);
  v4 = qword_1000193A0;
  if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68289026;
    v26 = 0;
    v27 = 2082;
    v28 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Only countryd can save the sharing cache\"}", buf, 0x12u);
    if (qword_100019398 != -1)
      dispatch_once(&qword_100019398, &stru_100014AD0);
  }
  v5 = qword_1000193A0;
  if (os_signpost_enabled((os_log_t)qword_1000193A0))
  {
    *(_DWORD *)buf = 68289026;
    v26 = 0;
    v27 = 2082;
    v28 = "";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Only countryd can save the sharing cache", "{\"msg%{public}.0s\":\"Only countryd can save the sharing cache\"}", buf, 0x12u);
  }
  return 0;
}

- (NSMutableDictionary)cache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
