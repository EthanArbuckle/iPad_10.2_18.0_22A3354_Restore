@implementation CLPeopleDensityClassifier

- (id)initAndMarkScanningStarted:(id)a3
{
  CLPeopleDensityClassifier *v4;
  id result;
  _OWORD v6[2];
  int v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLPeopleDensityClassifier;
  v4 = -[CLPeopleDensityClassifier init](&v8, "init");
  result = 0;
  if (a3)
  {
    if (v4)
    {
      v4->_classifierConfig = (CLPeopleDensityMediumSignalClassifierConfig *)objc_msgSend(a3, "copy");
      v4->_scanSessionStartTimestamp = +[NSDate date](NSDate, "date");
      memset(v6, 0, sizeof(v6));
      v7 = 1065353216;
      sub_100600DF4((uint64_t)&v4->_advertisementsByAddress, (uint64_t *)v6);
      sub_100600D3C((uint64_t)v6);
      return v4;
    }
  }
  return result;
}

- (BOOL)ingestBTLEAdvertisement:(const void *)a3
{
  unordered_map<std::string, std::vector<CLPeopleDensityBTLEAdvertisement>, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, std::vector<CLPeopleDensityBTLEAdvertisement>>>> *p_advertisementsByAddress;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  void *v11[3];
  void *__p[2];
  char v13;
  uint64_t v14;
  void **v15;

  p_advertisementsByAddress = &self->_advertisementsByAddress;
  if (!sub_1001987C8(&self->_advertisementsByAddress.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)a3))
  {
    memset(v11, 0, sizeof(v11));
    sub_100600CA0((char *)__p, (__int128 *)a3, (uint64_t)v11);
    sub_100600EE8((uint64_t)p_advertisementsByAddress, (unsigned __int8 *)__p, (uint64_t)__p);
    v15 = (void **)&v14;
    sub_100356DFC(&v15);
    if (v13 < 0)
      operator delete(__p[0]);
    v15 = v11;
    sub_100356DFC(&v15);
  }
  v5 = sub_1001987C8(p_advertisementsByAddress, (unsigned __int8 *)a3);
  if (!v5)
    sub_100263950("unordered_map::at: key not found");
  v6 = v5;
  v7 = (uint64_t *)(v5 + 40);
  v8 = *((_QWORD *)v6 + 6);
  if (v8 >= *((_QWORD *)v6 + 7))
  {
    v9 = sub_1006011D8(v7, (__int128 *)a3);
  }
  else
  {
    sub_100356F74((uint64_t)v7, (__int128 *)a3);
    v9 = v8 + 40;
  }
  *((_QWORD *)v6 + 6) = v9;
  return 1;
}

- (id)isUserAloneAt:(double)a3 withHints:(id)a4
{
  NSDate *scanSessionStopTimestamp;
  _QWORD *i;
  __int128 *v7;
  __int128 *v8;
  __int128 v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  CLPeopleDensityResult *v14;
  uint64_t v15;
  CLPeopleDensityResult *v16;
  CLPeopleDensityResult *v17;
  NSObject *v18;
  const char *v19;
  uint8_t *v20;
  NSObject *v21;
  const char *v23;
  void *__p[2];
  uint64_t v25;
  __int128 v26;
  uint8_t buf[16];
  __int128 v28;
  int v29;

  scanSessionStopTimestamp = self->_scanSessionStopTimestamp;
  if (!scanSessionStopTimestamp)
  {
    if (qword_1022A0270 != -1)
      dispatch_once(&qword_1022A0270, &stru_102147FC8);
    v18 = qword_1022A0278;
    if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Session hasn't stopped yet; failed to infer any people density result from the current session",
        buf,
        2u);
    }
    if (!sub_1001BFF7C(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0270 != -1)
      dispatch_once(&qword_1022A0270, &stru_102147FC8);
    LOWORD(__p[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 16, "Session hasn't stopped yet; failed to infer any people density result from the current session",
      __p,
      2);
    v20 = (uint8_t *)v19;
    sub_100512490("Generic", 1, 0, 0, "-[CLPeopleDensityClassifier isUserAloneAt:withHints:]", "%s\n", v19);
    goto LABEL_38;
  }
  if (-[NSDate compare:](scanSessionStopTimestamp, "compare:", self->_scanSessionStartTimestamp, a3) == NSOrderedAscending)
  {
    if (qword_1022A0270 != -1)
      dispatch_once(&qword_1022A0270, &stru_102147FC8);
    v21 = qword_1022A0278;
    if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Session stop time is earlier than the start time; failed to infer any people density result from the current session",
        buf,
        2u);
    }
    if (!sub_1001BFF7C(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0270 != -1)
      dispatch_once(&qword_1022A0270, &stru_102147FC8);
    LOWORD(__p[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 16, "Session stop time is earlier than the start time; failed to infer any people density result from the current session",
      __p,
      2);
    v20 = (uint8_t *)v23;
    sub_100512490("Generic", 1, 0, 0, "-[CLPeopleDensityClassifier isUserAloneAt:withHints:]", "%s\n", v23);
LABEL_38:
    if (v20 != buf)
      free(v20);
    return 0;
  }
  *(_OWORD *)buf = 0u;
  v28 = 0u;
  v29 = 1065353216;
  for (i = self->_advertisementsByAddress.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
  {
    v7 = (__int128 *)i[5];
    v8 = (__int128 *)i[6];
    while (v7 != v8)
    {
      if (*((char *)v7 + 23) < 0)
      {
        sub_100115CE4(__p, *(void **)v7, *((_QWORD *)v7 + 1));
      }
      else
      {
        v9 = *v7;
        v25 = *((_QWORD *)v7 + 2);
        *(_OWORD *)__p = v9;
      }
      v26 = *(__int128 *)((char *)v7 + 24);
      if (-[CLPeopleDensityMediumSignalClassifierConfig isInMidRangeRssi:](self->_classifierConfig, "isInMidRangeRssi:", DWORD1(v26)))
      {
        sub_100311C38((uint64_t)buf, (unsigned __int8 *)__p, (uint64_t)__p);
        if (SHIBYTE(v25) < 0)
          operator delete(__p[0]);
        break;
      }
      if (SHIBYTE(v25) < 0)
        operator delete(__p[0]);
      v7 = (__int128 *)((char *)v7 + 40);
    }
  }
  v10 = objc_alloc((Class)NSDictionary);
  v11 = objc_msgSend(v10, "initWithObjectsAndKeys:", +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", *((_QWORD *)&v28 + 1)), CFSTR("NumOfMidRangeRssiDevices"), 0);
  v12 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", self->_scanSessionStartTimestamp, self->_scanSessionStopTimestamp);
  v13 = *((_QWORD *)&v28 + 1);
  v14 = [CLPeopleDensityResult alloc];
  if (v13)
    v15 = 100;
  else
    v15 = 0;
  v16 = -[CLPeopleDensityResult initWithState:confidence:observationInterval:additionalInfo:](v14, "initWithState:confidence:observationInterval:additionalInfo:", v15, v12, v11, 1.0);

  v17 = v16;
  sub_1002A1C94((uint64_t)buf);
  return v16;
}

- (void)markScanningStopped
{
  if (!self->_scanSessionStopTimestamp)
    self->_scanSessionStopTimestamp = +[NSDate date](NSDate, "date");
}

- (void)dealloc
{
  NSObject *v3;
  NSDate *scanSessionStartTimestamp;
  NSDate *v5;
  const char *v6;
  uint8_t *v7;
  objc_super v8;
  int v9;
  NSDate *v10;
  uint8_t buf[4];
  NSDate *v12;

  if (qword_1022A0270 != -1)
    dispatch_once(&qword_1022A0270, &stru_102147FC8);
  v3 = qword_1022A0278;
  if (os_log_type_enabled((os_log_t)qword_1022A0278, OS_LOG_TYPE_DEBUG))
  {
    scanSessionStartTimestamp = self->_scanSessionStartTimestamp;
    *(_DWORD *)buf = 138477827;
    v12 = scanSessionStartTimestamp;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Dealloc classification session: start,%{private}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0270 != -1)
      dispatch_once(&qword_1022A0270, &stru_102147FC8);
    v5 = self->_scanSessionStartTimestamp;
    v9 = 138477827;
    v10 = v5;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0278, 2, "Dealloc classification session: start,%{private}@", &v9, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLPeopleDensityClassifier dealloc]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }

  v8.receiver = self;
  v8.super_class = (Class)CLPeopleDensityClassifier;
  -[CLPeopleDensityClassifier dealloc](&v8, "dealloc");
}

- (CLPeopleDensityMediumSignalClassifierConfig)classifierConfig
{
  return self->_classifierConfig;
}

- (NSDate)scanSessionStartTimestamp
{
  return self->_scanSessionStartTimestamp;
}

- (NSDate)scanSessionStopTimestamp
{
  return self->_scanSessionStopTimestamp;
}

- (void).cxx_destruct
{
  sub_100600D3C((uint64_t)&self->_advertisementsByAddress);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

@end
