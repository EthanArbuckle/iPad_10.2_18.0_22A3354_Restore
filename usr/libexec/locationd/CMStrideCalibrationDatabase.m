@implementation CMStrideCalibrationDatabase

- (CMStrideCalibrationDatabase)initWithSilo:(id)a3
{
  NSObject *v3;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  objc_super v8;
  uint8_t buf[1640];

  v8.receiver = self;
  v8.super_class = (Class)CMStrideCalibrationDatabase;
  if (-[CMStrideCalibrationDatabase init](&v8, "init"))
  {
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10217F4D0);
    v3 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "StrideCalDb init", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10217F4D0);
      v7[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "StrideCalDb init", v7, 2);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrationDatabase initWithSilo:]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
    operator new();
  }
  return 0;
}

- (void)addEntry:(CLStrideCalEntry *)a3
{
  NSObject *v5;
  double startTime;
  double v7;
  const char *v8;
  uint8_t *v9;
  int v10;
  double v11;
  uint8_t buf[4];
  double v13;

  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_10217F4D0);
  v5 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
  {
    startTime = a3->startTime;
    *(_DWORD *)buf = 134217984;
    v13 = startTime;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "insertion startTime %f", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10217F4D0);
    v7 = a3->startTime;
    v10 = 134217984;
    v11 = v7;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "insertion startTime %f", COERCE_DOUBLE(&v10));
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrationDatabase addEntry:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  sub_100CF4238((uint64_t)self->fStrideCalDb.__ptr_.__value_, (uint64_t)a3);
}

- (BOOL)isCalibrationConvergedStdForBinWithSpeed:(double)a3
{
  NSArray *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  double v12;
  const char *v14;
  uint8_t *v15;
  double v16;
  _BYTE v17[24];
  double v18;
  int v19;
  double v20;
  __int16 v21;
  double v22;
  uint8_t buf[4];
  double v24;
  __int16 v25;
  double v26;

  v4 = sub_101152884((uint64_t)self->fStrideCalDb.__ptr_.__value_, a3);
  if (-[NSArray count](v4, "count") < 0xA)
    return 0;
  v5 = 0;
  v6 = 0.0;
  do
  {
    objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", v5), "getBytes:length:", v17, 120);
    v6 = v6 + v18;
    ++v5;
  }
  while (v5 != 10);
  v7 = 0;
  v8 = 0.0;
  v9 = v6 / 10.0;
  do
  {
    objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", v7), "getBytes:length:", v17, 120);
    v8 = v8 + (v18 - v9) * (v18 - v9);
    ++v7;
  }
  while (v7 != 10);
  v10 = v8 / 10.0;
  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_10217F4D0);
  v11 = qword_10229FCD8;
  v12 = sqrt(v10);
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v24 = a3;
    v25 = 2048;
    v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Speed,%f,KFactorStd,%0.4f", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10217F4D0);
    v19 = 134218240;
    v20 = a3;
    v21 = 2048;
    v22 = v12;
    LODWORD(v16) = 22;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "Speed,%f,KFactorStd,%0.4f", COERCE_DOUBLE(&v19), v16);
    v15 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrationDatabase isCalibrationConvergedStdForBinWithSpeed:]", "%s\n", v14);
    if (v15 != buf)
      free(v15);
  }
  return v12 < 0.025;
}

- (BOOL)isCalibrationConvergedMedianForSpeed:(double)a3
{
  NSArray *v4;
  uint64_t i;
  NSObject *v6;
  double v7;
  BOOL v8;
  const char *v10;
  uint8_t *v11;
  double v12;
  double v13;
  uint64_t (**v14)();
  int v15;
  _OWORD v16[3];
  _QWORD **v17;
  _QWORD *v18[2];
  _OWORD v19[7];
  uint64_t v20;
  int v21;
  double v22;
  __int16 v23;
  double v24;
  uint8_t buf[4];
  double v26;
  __int16 v27;
  double v28;

  v20 = 0;
  memset(v19, 0, sizeof(v19));
  v4 = sub_101152884((uint64_t)self->fStrideCalDb.__ptr_.__value_, a3);
  v14 = off_10213D2B0;
  v15 = 5;
  memset(v16, 0, sizeof(v16));
  v18[0] = 0;
  v18[1] = 0;
  v17 = v18;
  sub_10047F1D4(&v14);
  if (-[NSArray count](v4, "count") < 5)
    goto LABEL_11;
  for (i = 0; i != 5; ++i)
  {
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", i), "getBytes:length:", v19, 120);
    sub_10009E858((uint64_t)&v14, (double *)&v19[1] + 1);
  }
  v13 = 0.0;
  if (sub_10009E784(&v14, 2, &v13))
  {
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10217F4D0);
    v6 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v26 = a3;
      v27 = 2048;
      v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Median kValue pacebin with rawSpeed %f: %f", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10217F4D0);
      v21 = 134218240;
      v22 = a3;
      v23 = 2048;
      v24 = v13;
      LODWORD(v12) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "Median kValue pacebin with rawSpeed %f: %f", COERCE_DOUBLE(&v21), v12);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrationDatabase isCalibrationConvergedMedianForSpeed:]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
    -[CMPedometerTableRawSpeedToKValue kValueForRawSpeed:](+[CMPedometerTableRawSpeedToKValue sharedInstance](CMPedometerTableRawSpeedToKValue, "sharedInstance"), "kValueForRawSpeed:", a3);
    v8 = fabs((v7 - v13) / v13) < 0.05;
  }
  else
  {
LABEL_11:
    v8 = 0;
  }
  v14 = off_10213D2B0;
  sub_100008848((uint64_t)&v17, v18[0]);
  sub_10047F25C(v16);
  return v8;
}

- (id)copyHistory
{
  NSMutableArray *v2;
  _OWORD *v3;
  _OWORD *v4;
  id v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  id v12;
  id v13;
  _OWORD v15[7];
  uint64_t v16;
  _BYTE *v17;
  _BYTE *v18;
  uint64_t v19;

  v17 = 0;
  v18 = 0;
  v19 = 0;
  (*(void (**)(CMStrideCalRecorderDb *, _BYTE **))(*(_QWORD *)self->fStrideCalDb.__ptr_.__value_ + 40))(self->fStrideCalDb.__ptr_.__value_, &v17);
  v2 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0xEEEEEEEEEEEEEEEFLL * ((v18 - v17) >> 3));
  v3 = v17;
  v4 = v18;
  if (v17 != v18)
  {
    do
    {
      v5 = objc_alloc((Class)CMStrideCalibrationEntryInternal);
      v6 = *v3;
      v7 = v3[1];
      v8 = v3[3];
      v15[2] = v3[2];
      v15[3] = v8;
      v15[0] = v6;
      v15[1] = v7;
      v9 = v3[4];
      v10 = v3[5];
      v11 = v3[6];
      v16 = *((_QWORD *)v3 + 14);
      v15[5] = v10;
      v15[6] = v11;
      v15[4] = v9;
      v12 = objc_msgSend(v5, "initWithCLStrideCalEntry:", v15);
      -[NSMutableArray addObject:](v2, "addObject:", v12);

      v3 = (_OWORD *)((char *)v3 + 120);
    }
    while (v3 != v4);
  }
  v13 = objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v2);
  if (v17)
  {
    v18 = v17;
    operator delete(v17);
  }
  return v13;
}

- (BOOL)queryStrideLengthTracks:(void *)a3
{
  return sub_101152C54((uint64_t)self->fStrideCalDb.__ptr_.__value_);
}

- (void)registerStrideCalDbForColdStorage:(id)a3
{
  CMStrideCalRecorderDb *value;
  id v5;

  if (a3)
  {
    value = self->fStrideCalDb.__ptr_.__value_;
    if (value)
    {
      v5 = +[CLActivityRecorderUtils getDbDetails:](CLActivityRecorderUtils, "getDbDetails:", (char *)value + 72);
      objc_msgSend(a3, "registerDatabaseAtURL:tableName:isClassB:sourceDevice:cloudKitDelegate:", objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url")), objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name")), 0, 0, 0);
    }
  }
}

- (CMStrideCalibrationDatabaseDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CMStrideCalibrationDatabaseDelegate *)a3;
}

- (void).cxx_destruct
{
  CMStrideCalRecorderDb *value;

  value = self->fStrideCalDb.__ptr_.__value_;
  self->fStrideCalDb.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(CMStrideCalRecorderDb *))(*(_QWORD *)value + 24))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
