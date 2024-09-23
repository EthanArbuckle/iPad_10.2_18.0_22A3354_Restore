@implementation CLWalkingSpeedCalCloudKitDelegate

- (CLWalkingSpeedCalCloudKitDelegate)initWithWalkingSpeedCalRecorderDb:(void *)a3
{
  CLWalkingSpeedCalCloudKitDelegate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLWalkingSpeedCalCloudKitDelegate;
  result = -[CLWalkingSpeedCalCloudKitDelegate init](&v5, "init");
  if (result)
    result->fWalkingSpeedCalDb = a3;
  return result;
}

- (id)recordType
{
  return CFSTR("WalkingSpeedStrideCalibration");
}

- (id)zoneName
{
  return CFSTR("WalkingSpeedStrideCalZone");
}

- (id)dataFieldKey
{
  return CFSTR("gaitData");
}

- (id)columns
{
  return CFSTR("startTime, endTime, cadenceWatch, cadenceGaitCycle, meanWalkingSpeed, gaitCycleYield");
}

- (id)convertStatementToDataBlobs:(const void *)a3
{
  void *fWalkingSpeedCalDb;
  NSObject *v4;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  NSArray *v9;
  uint8_t buf[1640];

  v9 = 0;
  fWalkingSpeedCalDb = self->fWalkingSpeedCalDb;
  if (fWalkingSpeedCalDb && !sub_1009CC500((uint64_t)fWalkingSpeedCalDb, (uint64_t *)a3, &v9))
  {
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102151AC8);
    v4 = qword_10229FEA8;
    if (os_log_type_enabled((os_log_t)qword_10229FEA8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "convertToDataBlobWithCode failed", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEA0 != -1)
        dispatch_once(&qword_10229FEA0, &stru_102151AC8);
      v8 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEA8, 2, "convertToDataBlobWithCode failed", &v8, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLWalkingSpeedCalCloudKitDelegate convertStatementToDataBlobs:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
  return v9;
}

- (BOOL)convertDataBlob:(id)a3 toBoundStatement:(const void *)a4
{
  void *fWalkingSpeedCalDb;
  BOOL v5;
  _BOOL4 v7;
  sqlite3_stmt *v8;
  BOOL v9;
  sqlite3_stmt *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  fWalkingSpeedCalDb = self->fWalkingSpeedCalDb;
  if (fWalkingSpeedCalDb)
    v5 = *(_QWORD *)a4 == 0;
  else
    v5 = 1;
  if (v5)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
    v7 = sub_1009CC7A0((uint64_t)fWalkingSpeedCalDb, (uint64_t)a3, (uint64_t)&v12);
    v8 = (sqlite3_stmt *)sub_100026CC8(*(_QWORD *)a4);
    if (v8)
      v9 = !v7;
    else
      v9 = 1;
    if (!v9)
    {
      v10 = v8;
      LOBYTE(v7) = 1;
      if (sub_1000890C4(v8, 1, *(double *)&v12)
        && sub_1000890C4(v10, 2, *((double *)&v12 + 1))
        && sub_1000890C4(v10, 3, *(double *)&v13)
        && sub_1000890C4(v10, 4, *((double *)&v13 + 1))
        && sub_1000890C4(v10, 5, *(double *)&v14))
      {
        sub_1000890C4(v10, 6, *((double *)&v14 + 1));
      }
    }
  }
  return v7;
}

@end
