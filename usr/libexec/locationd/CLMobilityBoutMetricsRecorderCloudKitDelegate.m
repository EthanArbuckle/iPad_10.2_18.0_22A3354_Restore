@implementation CLMobilityBoutMetricsRecorderCloudKitDelegate

- (CLMobilityBoutMetricsRecorderCloudKitDelegate)initWithBoutMetricsRecorderDb:(void *)a3
{
  CLMobilityBoutMetricsRecorderCloudKitDelegate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLMobilityBoutMetricsRecorderCloudKitDelegate;
  result = -[CLMobilityBoutMetricsRecorderCloudKitDelegate init](&v5, "init");
  if (result)
    result->fBoutMetricsDb = a3;
  return result;
}

- (id)recordType
{
  return CFSTR("MobilityBout");
}

- (id)zoneName
{
  return CFSTR("MobilityMetricsZone");
}

- (id)dataFieldKey
{
  return CFSTR("boutData");
}

- (id)columns
{
  return CFSTR("startTime, endTime, stepCount, workoutType, terminationReason, numGaitMetrics, invalidGradePercentage, deviceSide, walkingSpeed, doubleSupportPercentage, stepLength, asymmetryPercentage, segmentsRejectedByIsSwingStanceCycle, segmentsRejectedByIsNotRunning, segmentsRejectedByIsFeasibleWalkingSpeed, segmentsRejectedByIsPendular, segmentsRejectedByIsSufficientVerticalTwist, segmentsRejectedByIsCadenceConcordant, walkingSpeedRejectionStatus, doubleSupportPercentageRejectionStatus, stepLengthRejectionStatus, asymmetryPercentageRejectionStatus, userHeight, isHeightSet, userWeight, isWeightSet, boundaryType, cycleTimeMean, stepLengthEntropy, stepLengthPoincareSD1, stepLengthPoincareSD2, cycleTimeEntropy, cycleTimePoincareSD1, cycleTimePoincareSD2, stepIndexOfHarmonicityAP, stepIndexOfHarmonicityML, stepIndexOfHarmonicityVT, swingIndexOfHarmonicityAP, swingIndexOfHarmonicityML, swingIndexOfHarmonicityVT");
}

- (id)convertStatementToDataBlobs:(const void *)a3
{
  void *fBoutMetricsDb;
  NSObject *v4;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  NSArray *v9;
  uint8_t buf[1640];

  v9 = 0;
  fBoutMetricsDb = self->fBoutMetricsDb;
  if (fBoutMetricsDb && !sub_1013D72BC((uint64_t)fBoutMetricsDb, (uint64_t *)a3, &v9))
  {
    if (qword_10229FE90 != -1)
      dispatch_once(&qword_10229FE90, &stru_1021726D0);
    v4 = qword_10229FE98;
    if (os_log_type_enabled((os_log_t)qword_10229FE98, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "convertToDataBlobWithCode failed", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE90 != -1)
        dispatch_once(&qword_10229FE90, &stru_1021726D0);
      v8 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE98, 2, "convertToDataBlobWithCode failed", &v8, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLMobilityBoutMetricsRecorderCloudKitDelegate convertStatementToDataBlobs:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
  return v9;
}

- (BOOL)convertDataBlob:(id)a3 toBoundStatement:(const void *)a4
{
  void *fBoutMetricsDb;
  BOOL v5;
  _BOOL4 v8;
  sqlite3_stmt *v9;
  sqlite3_stmt *v10;
  int v11;
  __int128 v12;
  _BYTE v13[25];
  int v14;
  __int128 v15;
  int64x2_t v16;
  int64x2_t v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  float v25;
  unsigned __int8 v26;
  float v27;
  unsigned __int8 v28;

  fBoutMetricsDb = self->fBoutMetricsDb;
  if (fBoutMetricsDb)
    v5 = *(_QWORD *)a4 == 0;
  else
    v5 = 1;
  if (v5)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    v11 = 0;
    v14 = 0;
    v12 = 0u;
    memset(v13, 0, sizeof(v13));
    v15 = xmmword_101C158B0;
    v16 = vdupq_n_s64(0xFFF0000000000000);
    v17 = v16;
    v18 = -INFINITY;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 1.7;
    v26 = 0;
    v27 = 68.03;
    v28 = 0;
    v8 = sub_1013D75C4((uint64_t)fBoutMetricsDb, (uint64_t)a3, (uint64_t)&v11);
    v9 = (sqlite3_stmt *)sub_100026CC8(*(_QWORD *)a4);
    if (v9)
    {
      if (v8)
      {
        v10 = v9;
        LOBYTE(v8) = 1;
        if (sub_1000890C4(v9, 1, *(double *)&v12)
          && sub_1000890C4(v10, 2, *((double *)&v12 + 1))
          && sub_10023C77C(v10, 3, *(int *)v13)
          && sub_1000CD75C(v10, 4, *(int *)&v13[4])
          && sub_1000CD75C(v10, 5, *(int *)&v13[8])
          && sub_10023C77C(v10, 6, *(int *)&v13[12])
          && sub_1000890C4(v10, 7, *(double *)&v13[16])
          && sub_1000CD75C(v10, 8, v13[24])
          && sub_1000890C4(v10, 9, *(double *)&v19)
          && sub_1000890C4(v10, 10, *((double *)&v19 + 1))
          && sub_1000890C4(v10, 11, *(double *)&v20)
          && sub_1000890C4(v10, 12, *((double *)&v20 + 1))
          && sub_10023C77C(v10, 13, SDWORD2(v22))
          && sub_10023C77C(v10, 14, SHIDWORD(v22))
          && sub_10023C77C(v10, 15, v23)
          && sub_10023C77C(v10, 16, SDWORD1(v23))
          && sub_10023C77C(v10, 17, SDWORD2(v23))
          && sub_10023C77C(v10, 18, SHIDWORD(v23))
          && sub_10023C77C(v10, 19, v24)
          && sub_10023C77C(v10, 20, SDWORD1(v24))
          && sub_10023C77C(v10, 21, SDWORD2(v24))
          && sub_10023C77C(v10, 22, SHIDWORD(v24))
          && sub_1000890C4(v10, 23, v25)
          && sub_1000CD75C(v10, 24, v26)
          && sub_1000890C4(v10, 25, v27)
          && sub_1000CD75C(v10, 26, v28)
          && sub_1000CD75C(v10, 27, v14)
          && sub_1000890C4(v10, 28, *(double *)&v15)
          && sub_1000890C4(v10, 29, *((double *)&v15 + 1))
          && sub_1000890C4(v10, 30, *(double *)v16.i64)
          && sub_1000890C4(v10, 31, *(double *)&v16.i64[1])
          && sub_1000890C4(v10, 32, *(double *)v17.i64)
          && sub_1000890C4(v10, 33, *(double *)&v17.i64[1])
          && sub_1000890C4(v10, 34, v18)
          && sub_1000890C4(v10, 35, *(float *)&v21)
          && sub_1000890C4(v10, 36, *((float *)&v21 + 1))
          && sub_1000890C4(v10, 37, *((float *)&v21 + 2))
          && sub_1000890C4(v10, 38, *((float *)&v21 + 3))
          && sub_1000890C4(v10, 39, *(float *)&v22))
        {
          sub_1000890C4(v10, 40, *((float *)&v22 + 1));
        }
      }
    }
  }
  return v8;
}

@end
