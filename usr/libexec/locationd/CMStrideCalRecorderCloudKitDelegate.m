@implementation CMStrideCalRecorderCloudKitDelegate

- (CMStrideCalRecorderCloudKitDelegate)initWithStrideCalRecorderDb:(void *)a3
{
  CMStrideCalRecorderCloudKitDelegate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CMStrideCalRecorderCloudKitDelegate;
  result = -[CMStrideCalRecorderCloudKitDelegate init](&v5, "init");
  if (result)
    result->fStrideCalRecorderDb = a3;
  return result;
}

- (id)recordType
{
  return CFSTR("StrideCalibrationHistory");
}

- (id)zoneName
{
  return CFSTR("StrideCalibrationHistoryZone");
}

- (id)dataFieldKey
{
  return CFSTR("trackData");
}

- (id)columns
{
  return CFSTR("startTime, pacebin, kvalue, kvalueTrack, score, endTime, distance, steps, session, speed, percentGrade, gpsSource, runningFormStrideLength, runningFormStrideLengthMetrics");
}

- (id)convertStatementToDataBlobs:(const void *)a3
{
  void *fStrideCalRecorderDb;
  NSObject *v4;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  NSArray *v9;
  uint8_t buf[1640];

  v9 = 0;
  fStrideCalRecorderDb = self->fStrideCalRecorderDb;
  if (fStrideCalRecorderDb && !sub_101150EF4((uint64_t)fStrideCalRecorderDb, (uint64_t *)a3, &v9))
  {
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_1021AE948);
    v4 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "convertToDataBlobWithCode failed", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_1021AE948);
      v8 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "convertToDataBlobWithCode failed", &v8, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalRecorderCloudKitDelegate convertStatementToDataBlobs:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
  return v9;
}

- (BOOL)convertDataBlob:(id)a3 toBoundStatement:(const void *)a4
{
  void *fStrideCalRecorderDb;
  BOOL v5;
  _BOOL4 v7;
  sqlite3_stmt *v8;
  BOOL v9;
  sqlite3_stmt *v10;
  _BYTE v12[8];
  double v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  int v21;
  double v22;
  double v23;
  int v24;
  double v25;
  int v26;

  fStrideCalRecorderDb = self->fStrideCalRecorderDb;
  if (fStrideCalRecorderDb)
    v5 = *(_QWORD *)a4 == 0;
  else
    v5 = 1;
  if (v5)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v7 = sub_101151190((uint64_t)fStrideCalRecorderDb, (uint64_t)a3, (uint64_t)v12);
    v8 = (sqlite3_stmt *)sub_100026CC8(*(_QWORD *)a4);
    if (v8)
      v9 = !v7;
    else
      v9 = 1;
    if (!v9)
    {
      v10 = v8;
      LOBYTE(v7) = 1;
      if (sub_1000890C4(v8, 1, v13)
        && sub_10023C77C(v10, 2, v14)
        && sub_1000890C4(v10, 3, v15)
        && sub_1000890C4(v10, 4, v16)
        && sub_1000890C4(v10, 5, v17)
        && sub_1000890C4(v10, 6, v18)
        && sub_1000890C4(v10, 7, v19)
        && sub_1000CD75C(v10, 8, v20)
        && sub_1000CD75C(v10, 9, v21)
        && sub_1000890C4(v10, 10, v22)
        && sub_1000890C4(v10, 11, v23)
        && sub_1000CD75C(v10, 12, v24)
        && sub_1000890C4(v10, 13, v25))
      {
        sub_1000CD75C(v10, 14, v26);
      }
    }
  }
  return v7;
}

@end
