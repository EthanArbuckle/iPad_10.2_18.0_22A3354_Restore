@implementation CLContextManagerElevationProfileBase

- (CLContextManagerElevationProfileBase)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  CLContextManagerElevationProfileBase *v6;
  NSObject *v7;
  const char *v9;
  uint8_t *v10;
  _WORD v11[8];
  objc_super v12;
  uint8_t buf[1640];

  v12.receiver = self;
  v12.super_class = (Class)CLContextManagerElevationProfileBase;
  v6 = -[CLBarometerCalibrationContextManager initWithUniverse:delegate:withBuffer:withSourceAggregator:](&v12, "initWithUniverse:delegate:withBuffer:withSourceAggregator:", a3, a4, a5, a6);
  if (v6)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021A8DB0);
    v7 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Elevation Profile Context created", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021A8DB0);
      v11[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "Elevation Profile Context created", v11, 2);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerElevationProfileBase initWithUniverse:delegate:withBuffer:withSourceAggregator:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
  }
  return v6;
}

- (void)dealloc
{
  void *elevationDb;
  objc_super v4;

  self->_elevationProfileEstimator = 0;
  elevationDb = self->_elevationDb;
  if (elevationDb)
    (*(void (**)(void *))(*(_QWORD *)elevationDb + 24))(elevationDb);
  self->_elevationDb = 0;
  v4.receiver = self;
  v4.super_class = (Class)CLContextManagerElevationProfileBase;
  -[CLBarometerCalibrationContextManager dealloc](&v4, "dealloc");
}

- (void)initElevationProfileEstimator:(id)a3 withElevationDbInMemory:(BOOL)a4
{
  self->_elevationProfileEstimator = -[CLElevationProfileEstimator initWithContextManager:]([CLElevationProfileEstimator alloc], "initWithContextManager:", a3);
  self->_isElevationDbInMemory = a4;
  operator new();
}

- (void)getHistoricalMeanSeaLevelPressureWithStartTime:(double)a3 andEndTime:(double)a4 andCompletionBlock:(id)a5
{
  CLElevationProfileEstimator *elevationProfileEstimator;
  _QWORD v6[5];

  elevationProfileEstimator = self->_elevationProfileEstimator;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1011FCDD8;
  v6[3] = &unk_1021A8D90;
  v6[4] = a5;
  -[CLElevationProfileEstimator computeHistoricalMeanSeaLevelPressureWithStartTime:andEndTime:andCompletionBlock:](elevationProfileEstimator, "computeHistoricalMeanSeaLevelPressureWithStartTime:andEndTime:andCompletionBlock:", v6, a3, a4);
}

- (void)pushElevationsFromTime:(double)a3 toTime:(double)a4
{
  -[CLElevationProfileEstimator computeElevationProfileWithStartTime:andEndTime:](self->_elevationProfileEstimator, "computeElevationProfileWithStartTime:andEndTime:", a3, a4);
}

- (void)queryElevationsFromDate:(id)a3 toDate:(id)a4 withBatchSize:(id)a5 fromRecordId:(id)a6 withReply:(id)a7
{
  (*((void (**)(id, void *, uint64_t, _QWORD))a7 + 2))(a7, &__NSArray0__struct, 1, 0);
}

- (void)fetchLocationsWithStartTime:(double)a3 andEndTime:(double)a4 andBatchSize:(unsigned int)a5 andLocationArray:(id)a6 andVisitSearchStartIndex:(int)a7 andCompletionBlock:(id)a8
{
  id v9;

  v9 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CMErrorDomain, 103, &off_1022201A0);
  (*((void (**)(id, id))a8 + 2))(a8, v9);

}

- (void)fetchElevationsWithStartTime:(double)a3 andEndTime:(double)a4 andBatchSize:(id)a5 andElevationArray:(id)a6
{
  void *elevationDb;
  double *v12;
  double *i;
  double v14;
  double v15;
  CLElevationDBEntry *v16;
  NSObject *v17;
  const char *v18;
  uint8_t *v19;
  NSObject *v20;
  const char *v21;
  uint8_t *v22;
  NSObject *v23;
  const char *v24;
  double v25;
  int v26;
  int64_t v27;
  void *__p[4];
  uint8_t buf[4];
  double v30;
  __int16 v31;
  double v32;

  if (+[CLContextManagerElevationProfileBase isQueryValidWithStartTime:andEndTime:](CLContextManagerElevationProfileBase, "isQueryValidWithStartTime:andEndTime:"))
  {
    memset(__p, 0, 24);
    elevationDb = self->_elevationDb;
    if (elevationDb)
    {
      sub_10107CBF8((uint64_t)elevationDb, 0, (int)objc_msgSend(a5, "intValue"), __p, a3, a4);
      v12 = (double *)__p[0];
      for (i = (double *)__p[1]; v12 != i; v12 += 8)
      {
        v14 = v12[4];
        v15 = v12[6];
        v16 = objc_alloc_init(CLElevationDBEntry);
        -[CLElevationDBEntry setTimestamp:](v16, "setTimestamp:", v14);
        -[CLElevationDBEntry setPressure:](v16, "setPressure:", v15);
        objc_msgSend(a6, "addObject:", v16);

      }
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021A8DB0);
      v17 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349056;
        *(_QWORD *)&v30 = ((char *)__p[1] - (char *)__p[0]) >> 6;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "received stored elevations,count,%{public}lu", buf, 0xCu);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_27;
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021A8DB0);
      v26 = 134349056;
      v27 = ((char *)__p[1] - (char *)__p[0]) >> 6;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "received stored elevations,count,%{public}lu", &v26, 12);
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerElevationProfileBase fetchElevationsWithStartTime:andEndTime:andBatchSize:andElevationArray:]", "%s\n", v18);
    }
    else
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021A8DB0);
      v23 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "invalid elevationDb", buf, 2u);
      }
      if (!sub_1001BFF7C(115, 0))
        goto LABEL_27;
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021A8DB0);
      LOWORD(v26) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 16, "invalid elevationDb", &v26, 2);
      v19 = (uint8_t *)v24;
      sub_100512490("Generic", 1, 0, 0, "-[CLContextManagerElevationProfileBase fetchElevationsWithStartTime:andEndTime:andBatchSize:andElevationArray:]", "%s\n", v24);
    }
    if (v19 != buf)
      free(v19);
LABEL_27:
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    return;
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021A8DB0);
  v20 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    v30 = a3;
    v31 = 2048;
    v32 = a4;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "query stored elevations with false startTime,%f,endTime,%f", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021A8DB0);
    LODWORD(__p[0]) = 134218240;
    *(void **)((char *)__p + 4) = *(void **)&a3;
    WORD2(__p[1]) = 2048;
    *(void **)((char *)&__p[1] + 6) = *(void **)&a4;
    LODWORD(v25) = 22;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 16, "query stored elevations with false startTime,%f,endTime,%f", COERCE_DOUBLE(__p), v25);
    v22 = (uint8_t *)v21;
    sub_100512490("Generic", 1, 0, 0, "-[CLContextManagerElevationProfileBase fetchElevationsWithStartTime:andEndTime:andBatchSize:andElevationArray:]", "%s\n", v21);
    if (v22 != buf)
      free(v22);
  }
}

- (BOOL)isLocationUsefulForCalibration:(int)a3
{
  return (a3 < 0xC) & (0xC12u >> a3);
}

+ (BOOL)isQueryValidWithStartTime:(double)a3 andEndTime:(double)a4
{
  double Current;
  BOOL result;
  BOOL v9;

  Current = CFAbsoluteTimeGetCurrent();
  result = 0;
  v9 = a3 >= a4 || a4 == 1.79769313e308 || a3 == 1.79769313e308;
  if (!v9 && a3 > 0.0 && a4 > 0.0 && Current >= a3)
    return Current + 29.72 >= a4;
  return result;
}

- (BOOL)registeredXPCTaskMSLP
{
  return self->_registeredXPCTaskMSLP;
}

- (void)setRegisteredXPCTaskMSLP:(BOOL)a3
{
  self->_registeredXPCTaskMSLP = a3;
}

- (BOOL)registeredXPCTaskElevationProfile
{
  return self->_registeredXPCTaskElevationProfile;
}

- (void)setRegisteredXPCTaskElevationProfile:(BOOL)a3
{
  self->_registeredXPCTaskElevationProfile = a3;
}

- (CLElevationProfileEstimator)elevationProfileEstimator
{
  return self->_elevationProfileEstimator;
}

- (void)setElevationProfileEstimator:(id)a3
{
  self->_elevationProfileEstimator = (CLElevationProfileEstimator *)a3;
}

- (void)elevationDb
{
  return self->_elevationDb;
}

- (void)setElevationDb:(void *)a3
{
  self->_elevationDb = a3;
}

- (BOOL)isElevationDbInMemory
{
  return self->_isElevationDbInMemory;
}

- (void)setIsElevationDbInMemory:(BOOL)a3
{
  self->_isElevationDbInMemory = a3;
}

@end
