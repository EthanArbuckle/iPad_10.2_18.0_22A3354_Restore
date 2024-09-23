@implementation TMCache

- (TMCache)initWithPath:(id)a3 clock:(id)a4
{
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  TMCache *v11;
  id v13;
  uint8_t buf[4];
  id v15;

  v7 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = sub_100009CF0();
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "PMU presence: %d", buf, 8u);
    v7 = qword_100033718;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_10001A7B8();
  v13 = 0;
  v8 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", a3), &v13);
  v9 = qword_100033718;
  if (!v8 && os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v13, "userInfo");
    *(_DWORD *)buf = 138412290;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to read cache: %@", buf, 0xCu);
    v9 = qword_100033718;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "read cache: %@", buf, 0xCu);
  }
  v11 = -[TMCache initWithDictionary:clock:](self, "initWithDictionary:clock:", v8, a4);

  return v11;
}

- (TMCache)initWithDictionary:(id)a3 clock:(id)a4
{
  TMCache *v6;
  _UNKNOWN **v7;

  v6 = -[TMCache init](self, "init");
  if (v6)
  {
    -[TMCache setSystemTimeSet:](v6, "setSystemTimeSet:", objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMSystemTimeSet")), "BOOLValue"));
    v6->_clock = (TMMonotonicClock *)a4;
    if (-[TMCache readValidCache:clock:](v6, "readValidCache:clock:", a3, a4))
    {
      objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMLastRtcTime")), "doubleValue");
      -[TMCache setLastRtcTime:](v6, "setLastRtcTime:");
      objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMLastNtpFetchAttempt")), "doubleValue");
      -[TMCache setLastNTPFetchAttempt:](v6, "setLastNTPFetchAttempt:");
      -[TMCache setRtcResetCount:](v6, "setRtcResetCount:", objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RTCResetCount")), "unsignedIntValue"));
      v7 = (_UNKNOWN **)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMAccessoryUnc_s"));
      if (!v7)
        v7 = &off_10002C208;
      objc_msgSend(v7, "doubleValue");
      -[TMCache setAccessoryUnc_s:](v6, "setAccessoryUnc_s:");
      if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("BootUUID")))
        v6->_bootUUID = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("BootUUID")));
      if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TDTF")))
        -[TMCache setTDTF:](v6, "setTDTF:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TDTF")));
      if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("STF")))
        -[TMCache setSTF:](v6, "setSTF:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("STF")));
      v6->_valid = 1;
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_clock = 0;
  -[TMCache setBootUUID:](self, "setBootUUID:", 0);
  -[TMCache setHostUUID:](self, "setHostUUID:", 0);
  -[TMCache setSTF:](self, "setSTF:", 0);
  -[TMCache setTDTF:](self, "setTDTF:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TMCache;
  -[TMCache dealloc](&v3, "dealloc");
}

- (void)touchPath:(id)a3 tv:(timeval *)a4
{
  timeval v4;

  if (utimes((const char *)objc_msgSend(a3, "UTF8String", a4->tv_sec, *(_QWORD *)&a4->tv_usec, a4->tv_sec, *(_QWORD *)&a4->tv_usec), &v4))
  {
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
      sub_10001A818();
  }
}

- (void)emptyPath:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  -[TMCache setSystemTimeSet:](self, "setSystemTimeSet:", 0);
  -[TMCache setLastRtcTime:](self, "setLastRtcTime:", 0.0);
  -[TMCache setLastNTPFetchAttempt:](self, "setLastNTPFetchAttempt:", 0.0);
  -[TMCache setRtcResetCount:](self, "setRtcResetCount:", 0);
  -[TMCache setAccessoryUnc_s:](self, "setAccessoryUnc_s:", 1.79769313e308);
  -[TMCache setBootUUID:](self, "setBootUUID:", 0);
  -[TMCache setHostUUID:](self, "setHostUUID:", 0);
  -[TMCache setSTF:](self, "setSTF:", 0);
  -[TMCache setTDTF:](self, "setTDTF:", 0);
  self->_valid = 0;
  v5 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:", a3);
  if (v5)
  {
    v13 = 0;
    if (!-[NSFileManager removeItemAtURL:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtURL:error:", v5, &v13))
    {
      v6 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
        sub_10001A878((uint64_t)&v13, v6, v7, v8, v9, v10, v11, v12);
    }
  }

}

- (void)savePath:(id)a3
{
  NSMutableDictionary *v5;

  v5 = +[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[TMCache systemTimeSet](self, "systemTimeSet")), CFSTR("TMSystemTimeSet"));
  -[TMCache lastRtcTime](self, "lastRtcTime");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("TMLastRtcTime"));
  -[TMCache lastNTPFetchAttempt](self, "lastNTPFetchAttempt");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("TMLastNtpFetchAttempt"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", &off_10002C248, CFSTR("TMVersionKey"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[TMCache rtcResetCount](self, "rtcResetCount")), CFSTR("RTCResetCount"));
  -[TMCache accessoryUnc_s](self, "accessoryUnc_s");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("TMAccessoryUnc_s"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", -[NSUUID UUIDString](-[TMCache hostUUID](self, "hostUUID"), "UUIDString"), CFSTR("HostUUID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", -[NSUUID UUIDString](-[TMCache bootUUID](self, "bootUUID"), "UUIDString"), CFSTR("BootUUID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", -[TMCache STF](self, "STF"), CFSTR("STF"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", -[TMCache TDTF](self, "TDTF"), CFSTR("TDTF"));
  -[TMCache saveDict:toPath:](self, "saveDict:toPath:", v5, a3);
}

- (id)filesystemTimestampOfPath:(id)a3
{
  id result;
  id v5;
  NSDictionary *v6;
  NSDate *v7;
  NSObject *v8;
  NSDate *v9;
  double v10;
  long double v11;
  long double v12;
  long double v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  _QWORD v19[8];
  _QWORD v20[8];
  _BYTE buf[24];

  result = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:", a3);
  if (!result)
    return result;
  v5 = result;
  v18 = 0;
  v6 = -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(result, "path"), &v18);

  if (!v6)
  {
    v14 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v18;
      v15 = "Unable to stat cache for modification timestamp: %@";
      v16 = v14;
      v17 = 12;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    }
    return 0;
  }
  v7 = -[NSDictionary fileModificationDate](v6, "fileModificationDate");
  v8 = qword_100033718;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "Unable to access the modification timestamp for cache";
      v16 = v8;
      v17 = 2;
      goto LABEL_15;
    }
    return 0;
  }
  v9 = v7;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Saving modification timestamp from cache", buf, 2u);
  }
  -[NSDate timeIntervalSinceReferenceDate](v9, "timeIntervalSinceReferenceDate");
  v11 = v10;
  v19[0] = CFSTR("TMCommand");
  v19[1] = CFSTR("TMSource");
  v20[0] = CFSTR("TMSetSourceTime");
  v20[1] = CFSTR("FilesystemTimestamp");
  v19[2] = CFSTR("TMCurrentTime");
  v20[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v20[3] = &off_10002C218;
  v19[3] = CFSTR("TMTimeError");
  v19[4] = CFSTR("TMRtcTime");
  -[TMMonotonicClock coarseMonotonicTime](self->_clock, "coarseMonotonicTime");
  v20[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v19[5] = CFSTR("TMMachTime");
  v20[5] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", mach_absolute_time());
  v19[6] = CFSTR("TMAbsoluteNanoTime");
  if (v11 >= 9223372040.0)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 56, CFSTR("CFTimeInterval too large for TMNanoTimeInterval: %lf"), *(_QWORD *)&v11);
  if (v11 <= -9223372040.0)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 57, CFSTR("CFTimeInterval too small for TMNanoTimeInterval: %lf"), *(_QWORD *)&v11);
  *(_QWORD *)buf = 0;
  v12 = modf(v11, (long double *)buf);
  v20[6] = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", llround(v12 * 1000000000.0) + 1000000000 * (uint64_t)*(double *)buf);
  v19[7] = CFSTR("TMNanoTimeError");
  *(_QWORD *)buf = 0;
  v13 = modf(1500000000.0, (long double *)buf);
  v20[7] = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", llround(v13 * 1000000000.0) + 1000000000 * (uint64_t)*(double *)buf);
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 8);
}

- (BOOL)readValidCache:(id)a3 clock:(id)a4
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  NSObject *v13;
  BOOL result;
  NSObject *v15;
  double v16;
  uint64_t v17;
  _BOOL4 v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  double v22;
  NSString *v23;
  _BOOL4 v24;
  uint64_t v25;
  _BOOL4 v26;
  _BOOL4 v27;
  int v28;
  double v29;
  __int16 v30;
  uint64_t v31;

  if (!objc_msgSend(a3, "count"))
  {
    v15 = qword_100033718;
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Cache is empty.", (uint8_t *)&v28, 2u);
    }
    return 1;
  }
  v7 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMVersionKey")), "integerValue");
  if (v7 != (id)18)
  {
    v16 = *(double *)&v7;
    v17 = qword_100033718;
    v18 = os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v18)
      return result;
    v28 = 134218240;
    v29 = v16;
    v30 = 2048;
    v31 = 18;
    v19 = "Cache format changed from %ld to %ld. Cache invalid.";
LABEL_14:
    v20 = v17;
    v21 = 22;
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v28, v21);
    return 0;
  }
  objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMLastRtcTime")), "doubleValue");
  v9 = v8;
  objc_msgSend(a4, "coarseMonotonicTime");
  v11 = v10;
  v12 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_INFO))
  {
    v28 = 134218240;
    v29 = v11;
    v30 = 2048;
    v31 = *(_QWORD *)&v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Current RTC: %lf Cached RTC: %lf", (uint8_t *)&v28, 0x16u);
  }
  if (v9 <= v11)
  {
    if (sub_10000A0A8(0))
    {
      if ((sub_100009CF0() & 1) != 0)
      {
        v22 = COERCE_DOUBLE(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("HostUUID")));
        v23 = -[NSUUID UUIDString](-[TMCache hostUUID](self, "hostUUID"), "UUIDString");
        if ((objc_msgSend(*(id *)&v22, "isEqual:", v23) & 1) == 0)
        {
          v17 = qword_100033718;
          v24 = os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT);
          result = 0;
          if (!v24)
            return result;
          v28 = 138412546;
          v29 = v22;
          v30 = 2112;
          v31 = (uint64_t)v23;
          v19 = "Host UUID has changed. Cache Invalid. Cached:%@ Host:%@";
          goto LABEL_14;
        }
        return 1;
      }
      v25 = qword_100033718;
      v27 = os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v27)
        return result;
      LOWORD(v28) = 0;
      v19 = "This platform is not equipped with a PMU RTC. Cache invalid.";
    }
    else
    {
      v25 = qword_100033718;
      v26 = os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v26)
        return result;
      LOWORD(v28) = 0;
      v19 = "Current RTC offset is zero. RTC reset likely. Cache invalid.";
    }
    v20 = v25;
    v21 = 2;
    goto LABEL_25;
  }
  v13 = qword_100033718;
  if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v28) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Current RTC value older than cache. RTC reset likely. Cache invalid.", (uint8_t *)&v28, 2u);
  }
  result = 0;
  self->_rtcReset = 1;
  return result;
}

- (void)saveDict:(id)a3 toPath:(id)a4
{
  NSData *v5;
  NSData *v6;
  id v7;
  unsigned int v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17[16];
  uint64_t v18;
  uint64_t v19;

  v19 = 0;
  v5 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", a3, 200, 0, &v19);
  if (v19)
  {
    if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
      sub_10001A9E8();
  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:", a4);
    if (v7)
    {
      v18 = 0;
      v8 = -[NSData writeToURL:options:error:](v6, "writeToURL:options:error:", v7, 268435457, &v18);
      v9 = qword_100033718;
      if (v8)
      {
        if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v17 = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Cached state.", v17, 2u);
          v9 = qword_100033718;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          sub_10001A920();
      }
      else if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
      {
        sub_10001A980((uint64_t)&v18, v9, v11, v12, v13, v14, v15, v16);
      }
    }
    else
    {
      v10 = qword_100033718;
      if (os_log_type_enabled((os_log_t)qword_100033718, OS_LOG_TYPE_ERROR))
        sub_10001A8E0(v10);
    }

  }
}

- (NSUUID)hostUUID
{
  NSUUID *result;
  timespec v4;
  uuid_t v5;

  result = self->_hostUUID;
  if (!result)
  {
    v4.tv_sec = 0;
    v4.tv_nsec = 0;
    memset(v5, 0, sizeof(v5));
    gethostuuid(v5, &v4);
    result = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v5);
    self->_hostUUID = result;
  }
  return result;
}

- (BOOL)systemTimeSet
{
  return self->_systemTimeSet;
}

- (void)setSystemTimeSet:(BOOL)a3
{
  self->_systemTimeSet = a3;
}

- (double)lastRtcTime
{
  return self->_lastRtcTime;
}

- (void)setLastRtcTime:(double)a3
{
  self->_lastRtcTime = a3;
}

- (double)lastNTPFetchAttempt
{
  return self->_lastNTPFetchAttempt;
}

- (void)setLastNTPFetchAttempt:(double)a3
{
  self->_lastNTPFetchAttempt = a3;
}

- (unsigned)rtcResetCount
{
  return self->_rtcResetCount;
}

- (void)setRtcResetCount:(unsigned int)a3
{
  self->_rtcResetCount = a3;
}

- (double)accessoryUnc_s
{
  return self->_accessoryUnc_s;
}

- (void)setAccessoryUnc_s:(double)a3
{
  self->_accessoryUnc_s = a3;
}

- (NSUUID)bootUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBootUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSData)STF
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSTF:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSData)TDTF
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTDTF:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)rtcReset
{
  return self->_rtcReset;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setHostUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
