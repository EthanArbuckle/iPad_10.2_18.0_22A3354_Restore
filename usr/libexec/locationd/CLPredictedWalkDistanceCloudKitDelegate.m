@implementation CLPredictedWalkDistanceCloudKitDelegate

- (CLPredictedWalkDistanceCloudKitDelegate)initWithPredictedWalkDistanceBoutRecorderDb:(void *)a3
{
  CLPredictedWalkDistanceCloudKitDelegate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLPredictedWalkDistanceCloudKitDelegate;
  result = -[CLPredictedWalkDistanceCloudKitDelegate init](&v5, "init");
  if (result)
    result->fPredictedWalkDistanceBoutDb = a3;
  return result;
}

- (id)recordType
{
  return CFSTR("PredictedWalkingDistanceBout");
}

- (id)zoneName
{
  return CFSTR("PredictedWalkingDistanceZone");
}

- (id)dataFieldKey
{
  return CFSTR("boutData");
}

- (id)columns
{
  return CFSTR("startTime, endTime, stepCount, distance, activeTime, elevationAscended, elevationDescended, stepCountGPS, distanceGPS, boutType");
}

- (id)convertStatementToDataBlobs:(const void *)a3
{
  void *fPredictedWalkDistanceBoutDb;
  NSObject *v4;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  NSArray *v9;
  uint8_t buf[1640];

  v9 = 0;
  fPredictedWalkDistanceBoutDb = self->fPredictedWalkDistanceBoutDb;
  if (fPredictedWalkDistanceBoutDb && !sub_1010D7B00((uint64_t)fPredictedWalkDistanceBoutDb, (uint64_t *)a3, &v9))
  {
    if (qword_10229FEA0 != -1)
      dispatch_once(&qword_10229FEA0, &stru_102138968);
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
        dispatch_once(&qword_10229FEA0, &stru_102138968);
      v8 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEA8, 2, "convertToDataBlobWithCode failed", &v8, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceCloudKitDelegate convertStatementToDataBlobs:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
  return v9;
}

- (BOOL)convertDataBlob:(id)a3 toBoundStatement:(const void *)a4
{
  void *fPredictedWalkDistanceBoutDb;
  BOOL v5;
  _BOOL4 v7;
  sqlite3_stmt *v8;
  sqlite3_stmt *v9;
  int v11;
  double v12;
  double v13;
  int v14;
  double v15;
  double v16;
  uint64_t v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  fPredictedWalkDistanceBoutDb = self->fPredictedWalkDistanceBoutDb;
  if (fPredictedWalkDistanceBoutDb)
    v5 = *(_QWORD *)a4 == 0;
  else
    v5 = 1;
  if (v5)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v11 = 0;
    v12 = 0.0;
    v13 = 0.0;
    v14 = 0;
    v16 = 0.0;
    v17 = 0;
    v15 = 0.0;
    v18 = 0;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0;
    v7 = sub_1010D7DC8((uint64_t)fPredictedWalkDistanceBoutDb, (uint64_t)a3, (uint64_t)&v11);
    v8 = (sqlite3_stmt *)sub_100026CC8(*(_QWORD *)a4);
    if (v8)
    {
      if (v7)
      {
        v9 = v8;
        LOBYTE(v7) = 1;
        if (sub_1000890C4(v8, 1, v12)
          && sub_1000890C4(v9, 2, v13)
          && sub_10023C77C(v9, 3, v14)
          && sub_1000890C4(v9, 4, v15)
          && sub_1000890C4(v9, 5, v16)
          && sub_10023C77C(v9, 6, v17)
          && sub_10023C77C(v9, 7, SHIDWORD(v17))
          && sub_10023C77C(v9, 8, v18)
          && sub_1000890C4(v9, 9, *(double *)&v19))
        {
          sub_1000CD75C(v9, 10, SDWORD2(v19));
        }
      }
    }
  }
  return v7;
}

@end
