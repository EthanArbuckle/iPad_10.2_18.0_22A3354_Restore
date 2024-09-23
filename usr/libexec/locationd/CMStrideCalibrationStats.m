@implementation CMStrideCalibrationStats

- (CMStrideCalibrationStats)init
{
  CMStrideCalibrationStats *v2;
  CMStrideCalibrationStats *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CMStrideCalibrationStats;
  v2 = -[CMStrideCalibrationStats init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[CMStrideCalibrationStats startSessionMetricsWithTime:session:](v2, "startSessionMetricsWithTime:session:", 0, 0.0);
    -[CMStrideCalibrationStats loadLastAWDTimestamps](v3, "loadLastAWDTimestamps");
  }
  return v3;
}

- (void)startSessionMetricsWithTime:(double)a3 session:(int)a4
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[6];

  sub_10097A50C((uint64_t)v8, a4, a3);
  v5 = v8[3];
  *(_OWORD *)&self->fSessionMetrics.sumCalibrationDistanceFailOther = v8[2];
  *(_OWORD *)&self->fSessionMetrics.sumCalibrationDistanceFailPedometer = v5;
  v6 = v8[5];
  *(_OWORD *)&self->fSessionMetrics.sumCalibrationDistanceInvalidGain = v8[4];
  *(_OWORD *)&self->fSessionMetrics.sumCalibrationDistanceInvalidLength = v6;
  v7 = v8[1];
  *(_OWORD *)&self->fSessionMetrics.session = v8[0];
  *(_OWORD *)&self->fSessionMetrics.endTime = v7;
}

- (void)endSessionMetrics:(double)a3
{
  int session;
  CLStrideCalibrationSessionMetrics *p_fSessionMetrics;
  double v6;
  double sumCalibrationDistanceFailGps;
  double v8;
  double sumCalibrationDistanceSuccess;
  double sumCalibrationDistanceFailGradient;
  double v11;
  double *v12;
  double *v13;
  uint64_t v14;
  double *v15;
  unint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  NSObject *v24;
  double v25;
  double sumCalibrationDistanceFailOther;
  double v27;
  double sumCalibrationDistanceFailPedometer;
  double v29;
  double sumCalibrationDistanceInvalidGain;
  double sumCalibrationDistanceInvalidSpeed;
  double sumCalibrationDistanceInvalidLength;
  double startTime;
  double endTime;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  const char *v45;
  uint8_t *v46;
  double v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[62];
  __int16 v55;
  double v56;
  __int16 v57;
  double v58;
  __int16 v59;
  double v60;
  __int16 v61;
  double v62;
  uint8_t buf[4];
  double v64;
  __int16 v65;
  double v66;
  __int16 v67;
  double v68;
  __int16 v69;
  double v70;
  __int16 v71;
  double v72;
  __int16 v73;
  double v74;
  __int16 v75;
  double v76;
  __int16 v77;
  double v78;
  __int16 v79;
  double v80;
  __int16 v81;
  double v82;

  p_fSessionMetrics = &self->fSessionMetrics;
  session = self->fSessionMetrics.session;
  self->fSessionMetrics.endTime = a3;
  if (session)
  {
    sub_101480A30(buf, 0);
    memset(v54, 0, 56);
    sub_100087DE0((uint64_t)buf, 0, (uint64_t)v54, self->fSessionMetrics.startTime, self->fSessionMetrics.endTime);
    v6 = *(double *)&v54[8];
    self->fSessionMetrics.totalDistance = *(double *)&v54[8];
    sumCalibrationDistanceFailGps = self->fSessionMetrics.sumCalibrationDistanceFailGps;
    v8 = self->fSessionMetrics.sumCalibrationDistanceFailPedometer
       + self->fSessionMetrics.sumCalibrationDistanceInvalidLength
       + self->fSessionMetrics.sumCalibrationDistanceInvalidSpeed;
    self->fSessionMetrics.sumCalibrationDistanceFailPedometer = v8;
    sumCalibrationDistanceSuccess = self->fSessionMetrics.sumCalibrationDistanceSuccess;
    sumCalibrationDistanceFailGradient = self->fSessionMetrics.sumCalibrationDistanceFailGradient;
    v11 = v6 - sumCalibrationDistanceSuccess - sumCalibrationDistanceFailGps - v8 - sumCalibrationDistanceFailGradient;
    self->fSessionMetrics.sumCalibrationDistanceFailOther = v11;
    v12 = (double *)operator new(0x28uLL);
    v13 = v12;
    *v12 = sumCalibrationDistanceSuccess;
    v12[1] = v11;
    v12[2] = sumCalibrationDistanceFailGps;
    v12[3] = v8;
    v14 = 1;
    v15 = v12;
    v12[4] = sumCalibrationDistanceFailGradient;
    do
    {
      if (sumCalibrationDistanceSuccess < v12[v14])
      {
        sumCalibrationDistanceSuccess = v12[v14];
        v15 = &v12[v14];
      }
      ++v14;
    }
    while (v14 != 5);
    v16 = (char *)v15 - (char *)v12;
    v17 = p_fSessionMetrics->session;
    if (p_fSessionMetrics->session == 15)
      goto LABEL_9;
    if (v17 == 17)
    {
      v19 = sub_10009ED0C();
      sub_10134BC70(v19, v16 >> 3);
      goto LABEL_11;
    }
    if (v17 == 24)
    {
LABEL_9:
      v18 = sub_10009ED0C();
      sub_10134BBF0(v18, v16 >> 3);
    }
LABEL_11:
    v20 = sub_10009ED0C();
    v21 = *(_OWORD *)&p_fSessionMetrics->sumCalibrationDistanceFailPedometer;
    v50 = *(_OWORD *)&p_fSessionMetrics->sumCalibrationDistanceFailOther;
    v51 = v21;
    v22 = *(_OWORD *)&p_fSessionMetrics->sumCalibrationDistanceInvalidLength;
    v52 = *(_OWORD *)&p_fSessionMetrics->sumCalibrationDistanceInvalidGain;
    v53 = v22;
    v23 = *(_OWORD *)&p_fSessionMetrics->endTime;
    v48 = *(_OWORD *)&p_fSessionMetrics->session;
    v49 = v23;
    sub_10134C64C(v20, &v48);
    operator delete(v13);
    sub_101480AF4(buf);
  }
  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_102161068);
  v24 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
  {
    v25 = self->fSessionMetrics.sumCalibrationDistanceSuccess;
    sumCalibrationDistanceFailOther = self->fSessionMetrics.sumCalibrationDistanceFailOther;
    v27 = self->fSessionMetrics.sumCalibrationDistanceFailGps;
    sumCalibrationDistanceFailPedometer = self->fSessionMetrics.sumCalibrationDistanceFailPedometer;
    v29 = self->fSessionMetrics.sumCalibrationDistanceFailGradient;
    sumCalibrationDistanceInvalidGain = self->fSessionMetrics.sumCalibrationDistanceInvalidGain;
    sumCalibrationDistanceInvalidSpeed = self->fSessionMetrics.sumCalibrationDistanceInvalidSpeed;
    sumCalibrationDistanceInvalidLength = self->fSessionMetrics.sumCalibrationDistanceInvalidLength;
    startTime = self->fSessionMetrics.startTime;
    endTime = self->fSessionMetrics.endTime;
    *(_DWORD *)buf = 134220288;
    v64 = v25;
    v65 = 2048;
    v66 = sumCalibrationDistanceFailOther;
    v67 = 2048;
    v68 = v27;
    v69 = 2048;
    v70 = sumCalibrationDistanceFailPedometer;
    v71 = 2048;
    v72 = v29;
    v73 = 2048;
    v74 = sumCalibrationDistanceInvalidGain;
    v75 = 2048;
    v76 = sumCalibrationDistanceInvalidSpeed;
    v77 = 2048;
    v78 = sumCalibrationDistanceInvalidLength;
    v79 = 2048;
    v80 = startTime;
    v81 = 2048;
    v82 = endTime;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "SessionMetrics,End,Summary,DistanceFusionSuccess,%0.6f,DistanceFusionOther,%0.6f,DistanceFusionGPS,%0.6f,DistanceFusionPedometer,%0.6f,DistanceFusionGradient,%0.6f,DistanceFusionGain,%0.6f,DistanceFusionSpeed,%0.6f,DistanceFusionLength,%0.6f,startTime,%0.6f,endTime,%0.6f", buf, 0x66u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_102161068);
    v35 = self->fSessionMetrics.sumCalibrationDistanceSuccess;
    v36 = self->fSessionMetrics.sumCalibrationDistanceFailOther;
    v37 = self->fSessionMetrics.sumCalibrationDistanceFailGps;
    v38 = self->fSessionMetrics.sumCalibrationDistanceFailPedometer;
    v39 = self->fSessionMetrics.sumCalibrationDistanceFailGradient;
    v40 = self->fSessionMetrics.sumCalibrationDistanceInvalidGain;
    v41 = self->fSessionMetrics.sumCalibrationDistanceInvalidSpeed;
    v42 = self->fSessionMetrics.sumCalibrationDistanceInvalidLength;
    v43 = self->fSessionMetrics.startTime;
    v44 = self->fSessionMetrics.endTime;
    *(_DWORD *)v54 = 134220288;
    *(double *)&v54[4] = v35;
    *(_WORD *)&v54[12] = 2048;
    *(double *)&v54[14] = v36;
    *(_WORD *)&v54[22] = 2048;
    *(double *)&v54[24] = v37;
    *(_WORD *)&v54[32] = 2048;
    *(double *)&v54[34] = v38;
    *(_WORD *)&v54[42] = 2048;
    *(double *)&v54[44] = v39;
    *(_WORD *)&v54[52] = 2048;
    *(double *)&v54[54] = v40;
    v55 = 2048;
    v56 = v41;
    v57 = 2048;
    v58 = v42;
    v59 = 2048;
    v60 = v43;
    v61 = 2048;
    v62 = v44;
    LODWORD(v47) = 102;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "SessionMetrics,End,Summary,DistanceFusionSuccess,%0.6f,DistanceFusionOther,%0.6f,DistanceFusionGPS,%0.6f,DistanceFusionPedometer,%0.6f,DistanceFusionGradient,%0.6f,DistanceFusionGain,%0.6f,DistanceFusionSpeed,%0.6f,DistanceFusionLength,%0.6f,startTime,%0.6f,endTime,%0.6f", COERCE_DOUBLE(v54), v47, *(double *)&v48, *((double *)&v48 + 1), *(double *)&v49, *((double *)&v49 + 1), *(double *)&v50, *((double *)&v50 + 1), *(double *)&v51,
      *((double *)&v51 + 1));
    v46 = (uint8_t *)v45;
    sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrationStats endSessionMetrics:]", "%s\n", v45);
    if (v46 != buf)
      free(v46);
  }
}

- (void)setReadyForSubmission
{
  uint64_t v2;

  v2 = sub_10009ED0C();
  sub_10134BE9C(v2);
}

- (void)awdLogDistance:(double)a3 status:(int)a4 description:(id)a5
{
  uint64_t v8;
  __CFString *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint8_t *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  double v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  double v31;

  if (a4 > 7)
  {
    v9 = CFSTR("Other");
    v8 = 40;
  }
  else
  {
    v8 = 8 * a4 + 32;
    v9 = *(&off_1021610A8 + a4);
  }
  *(double *)((char *)&self->super.isa + v8) = *(double *)((char *)&self->super.isa + v8) + a3;
  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_102161068);
  v10 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
  {
    if (a4)
      v11 = "Fail";
    else
      v11 = "Success";
    *(_DWORD *)buf = 136315906;
    v25 = v11;
    v26 = 2080;
    v27 = -[__CFString UTF8String](v9, "UTF8String");
    v28 = 2080;
    v29 = objc_msgSend(a5, "UTF8String");
    v30 = 2048;
    v31 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "SessionMetrics,%s,%s,%s,DistanceFusion,%0.4f", buf, 0x2Au);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_102161068);
    v12 = qword_10229FCD8;
    if (a4)
      v13 = "Fail";
    else
      v13 = "Success";
    v16 = 136315906;
    v17 = v13;
    v18 = 2080;
    v19 = -[__CFString UTF8String](v9, "UTF8String");
    v20 = 2080;
    v21 = objc_msgSend(a5, "UTF8String");
    v22 = 2048;
    v23 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v12, 2, "SessionMetrics,%s,%s,%s,DistanceFusion,%0.4f", (const char *)&v16, 42);
    v15 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrationStats awdLogDistance:status:description:]", "%s\n", v14);
    if (v15 != buf)
      free(v15);
  }
}

- (void)activityLoggerLogStrideCalEntry:(const CLStrideCalEntry *)a3
{
  void *v4;
  ALActivityLog *v5;
  float kvalue;
  ALCLStrideCalEntry *v7;
  double v8;
  float kvalueTrack;
  ALCLStrideCalEntry *v10;
  double v11;
  float score;
  ALCLStrideCalEntry *v13;
  double v14;
  float distance;
  ALCLStrideCalEntry *v16;
  double v17;
  float speed;
  ALCLStrideCalEntry *v19;
  double v20;

  v4 = objc_autoreleasePoolPush();
  v5 = objc_alloc_init(ALActivityLog);
  -[ALActivityLog setTimestamp:](v5, "setTimestamp:", a3->startTime);
  -[ALActivityLog setStrideCalData:](v5, "setStrideCalData:", objc_alloc_init(ALCLStrideCalEntry));
  -[ALCLStrideCalEntry setRecordId:](-[ALActivityLog strideCalData](v5, "strideCalData"), "setRecordId:", a3->recordId);
  -[ALCLStrideCalEntry setStartTime:](-[ALActivityLog strideCalData](v5, "strideCalData"), "setStartTime:", a3->startTime);
  -[ALCLStrideCalEntry setPacebin:](-[ALActivityLog strideCalData](v5, "strideCalData"), "setPacebin:", a3->pacebin);
  kvalue = a3->kvalue;
  v7 = -[ALActivityLog strideCalData](v5, "strideCalData");
  *(float *)&v8 = kvalue;
  -[ALCLStrideCalEntry setKvalue:](v7, "setKvalue:", v8);
  kvalueTrack = a3->kvalueTrack;
  v10 = -[ALActivityLog strideCalData](v5, "strideCalData");
  *(float *)&v11 = kvalueTrack;
  -[ALCLStrideCalEntry setKvalueTrack:](v10, "setKvalueTrack:", v11);
  score = a3->score;
  v13 = -[ALActivityLog strideCalData](v5, "strideCalData");
  *(float *)&v14 = score;
  -[ALCLStrideCalEntry setScore:](v13, "setScore:", v14);
  -[ALCLStrideCalEntry setEndTime:](-[ALActivityLog strideCalData](v5, "strideCalData"), "setEndTime:", a3->endTime);
  distance = a3->distance;
  v16 = -[ALActivityLog strideCalData](v5, "strideCalData");
  *(float *)&v17 = distance;
  -[ALCLStrideCalEntry setDistance:](v16, "setDistance:", v17);
  -[ALCLStrideCalEntry setSteps:](-[ALActivityLog strideCalData](v5, "strideCalData"), "setSteps:", a3->steps);
  -[ALCLStrideCalEntry setSession:](-[ALActivityLog strideCalData](v5, "strideCalData"), "setSession:", a3->session);
  speed = a3->speed;
  v19 = -[ALActivityLog strideCalData](v5, "strideCalData");
  *(float *)&v20 = speed;
  -[ALCLStrideCalEntry setSpeed:](v19, "setSpeed:", v20);
  -[ALCLStrideCalEntry setRegularEntry:](-[ALActivityLog strideCalData](v5, "strideCalData"), "setRegularEntry:", 1);
  objc_msgSend(-[CLServiceVendor proxyForService:](+[CLServiceVendor sharedInstance](CLServiceVendor, "sharedInstance"), "proxyForService:", CFSTR("CLActivityLogger")), "logData:", v5);
  objc_autoreleasePoolPop(v4);
}

- (void)awdMotionFitnessStrideCalibration:(const CLStrideCalEntry *)a3
{
  uint32_t v5;
  uint32_t v6;
  NSObject *v7;
  double startTime;
  double Current;
  NSObject *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t fHead;
  uint64_t fSize;
  unint64_t fCapacity;
  uint64_t v17;
  unint64_t v18;
  __int16 v19;
  double v20;
  const char *v21;
  uint8_t *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint8_t *v28;
  double v29;
  int v30;
  double v31;
  __int16 v32;
  _BYTE v33[10];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint8_t buf[4];
  double v38;
  __int16 v39;
  _BYTE v40[10];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;

  v5 = arc4random_uniform(0xAu);
  v6 = arc4random_uniform(0xAu);
  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_102161068);
  v7 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
  {
    startTime = a3->startTime;
    *(_DWORD *)buf = 134218752;
    v38 = startTime;
    v39 = 1024;
    *(_DWORD *)v40 = v5;
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)&v40[6] = v6;
    LOWORD(v41) = 1024;
    *(_DWORD *)((char *)&v41 + 2) = v5 == v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Trying to send track with startTime %f. a %u b %u a == b %d", buf, 0x1Eu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_102161068);
    v20 = a3->startTime;
    v30 = 134218752;
    v31 = v20;
    v32 = 1024;
    *(_DWORD *)v33 = v5;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = v6;
    LOWORD(v34) = 1024;
    *(_DWORD *)((char *)&v34 + 2) = v5 == v6;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 2, "Trying to send track with startTime %f. a %u b %u a == b %d", COERCE_DOUBLE(&v30), 30);
    v22 = (uint8_t *)v21;
    sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrationStats awdMotionFitnessStrideCalibration:]", "%s\n", v21);
    if (v22 != buf)
      free(v22);
  }
  if (v5 == v6)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_102161068);
    v10 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      v11 = a3->startTime;
      v12 = *(_QWORD *)sub_1000E2B78(&self->fLastAWDTimestamps.fHeadAndSize.fHead, 1uLL);
      v13 = *(_QWORD *)sub_1000E2B78(&self->fLastAWDTimestamps.fHeadAndSize.fHead, 0);
      *(_DWORD *)buf = 134218752;
      v38 = v11;
      v39 = 2048;
      *(double *)v40 = Current;
      *(_WORD *)&v40[8] = 2048;
      v41 = v12;
      v42 = 2048;
      v43 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Trying to send track with startTime %f. now %f 2 %f 1 %f", buf, 0x2Au);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_102161068);
      v23 = qword_10229FCD8;
      v24 = a3->startTime;
      v25 = *(_QWORD *)sub_1000E2B78(&self->fLastAWDTimestamps.fHeadAndSize.fHead, 1uLL);
      v26 = *(_QWORD *)sub_1000E2B78(&self->fLastAWDTimestamps.fHeadAndSize.fHead, 0);
      v30 = 134218752;
      v31 = v24;
      v32 = 2048;
      *(double *)v33 = Current;
      *(_WORD *)&v33[8] = 2048;
      v34 = v25;
      v35 = 2048;
      v36 = v26;
      LODWORD(v29) = 42;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v23, 2, "Trying to send track with startTime %f. now %f 2 %f 1 %f", COERCE_DOUBLE(&v30), v29);
      v28 = (uint8_t *)v27;
      sub_100512490("Generic", 1, 0, 2, "-[CMStrideCalibrationStats awdMotionFitnessStrideCalibration:]", "%s\n", v27);
      if (v28 != buf)
        free(v28);
    }
    fHead = self->fLastAWDTimestamps.fHeadAndSize.fHead;
    if (Current - *(double *)&self->fLastAWDTimestamps.fBuffer[8 * fHead] > 86400.0)
    {
      fSize = self->fLastAWDTimestamps.fHeadAndSize.fSize;
      fCapacity = self->fLastAWDTimestamps.fCapacity;
      if (fSize + fHead >= fCapacity)
        v17 = self->fLastAWDTimestamps.fCapacity;
      else
        v17 = 0;
      *(double *)&self->fLastAWDTimestamps.fBuffer[8 * (fSize + fHead - v17)] = Current;
      if (fCapacity <= fSize)
      {
        v18 = fHead + 1;
        if (v18 >= fCapacity)
          v19 = fCapacity;
        else
          v19 = 0;
        self->fLastAWDTimestamps.fHeadAndSize.fHead = v18 - v19;
      }
      else
      {
        self->fLastAWDTimestamps.fHeadAndSize.fSize = fSize + 1;
      }
      -[CMStrideCalibrationStats storeLastAWDTimestamps](self, "storeLastAWDTimestamps");
    }
  }
}

- (void)loadLastAWDTimestamps
{
  uint64_t v3;
  uint64_t v4;
  uint64_t fSize;
  unint64_t fCapacity;
  char *fBuffer;
  uint64_t fHead;
  uint64_t v9;
  __int16 v10;
  unsigned int v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v16 = 0;
  v17 = 0;
  v3 = sub_1001FD94C();
  sub_1001FD98C(v3, "StrideCalAWD0", &v17);
  v4 = sub_1001FD94C();
  sub_1001FD98C(v4, "StrideCalAWD1", &v16);
  fSize = self->fLastAWDTimestamps.fHeadAndSize.fSize;
  fCapacity = self->fLastAWDTimestamps.fCapacity;
  fBuffer = self->fLastAWDTimestamps.fBuffer;
  fHead = self->fLastAWDTimestamps.fHeadAndSize.fHead;
  if (fHead + fSize >= fCapacity)
    v9 = self->fLastAWDTimestamps.fCapacity;
  else
    v9 = 0;
  *(_QWORD *)&fBuffer[8 * (fHead + fSize - v9)] = v17;
  if (fCapacity <= fSize)
  {
    v12 = fHead + 1;
    if (v12 >= fCapacity)
      v13 = fCapacity;
    else
      v13 = 0;
    LOWORD(fHead) = v12 - v13;
    self->fLastAWDTimestamps.fHeadAndSize.fHead = fHead;
    fHead = (unsigned __int16)fHead;
    v11 = fSize;
    v10 = fSize;
  }
  else
  {
    v10 = fSize + 1;
    self->fLastAWDTimestamps.fHeadAndSize.fSize = fSize + 1;
    v11 = (unsigned __int16)(fSize + 1);
    fSize = (unsigned __int16)(fSize + 1);
  }
  v14 = fHead + fSize;
  if (v14 >= fCapacity)
    v15 = fCapacity;
  else
    v15 = 0;
  *(_QWORD *)&fBuffer[8 * (v14 - v15)] = v16;
  if (fCapacity <= v11)
  {
    if (fHead + 1 < fCapacity)
      LOWORD(fCapacity) = 0;
    self->fLastAWDTimestamps.fHeadAndSize.fHead = fHead + 1 - fCapacity;
  }
  else
  {
    self->fLastAWDTimestamps.fHeadAndSize.fSize = v10 + 1;
  }
}

- (void)storeLastAWDTimestamps
{
  uint64_t v3;
  const void *v4;
  uint64_t v5;
  const void *v6;

  v3 = sub_1001FD94C();
  self = (CMStrideCalibrationStats *)((char *)self + 112);
  v4 = (const void *)sub_1000E2B78((unsigned __int16 *)self, 0);
  sub_10018A4CC(v3, "StrideCalAWD0", v4);
  v5 = sub_1001FD94C();
  v6 = (const void *)sub_1000E2B78((unsigned __int16 *)self, 1uLL);
  sub_10018A4CC(v5, "StrideCalAWD1", v6);
}

- (void)updateUserHeight:(int64_t)a3
{
  self->fHeightCM = a3;
}

- (id).cxx_construct
{
  sub_10097A50C((uint64_t)&self->fSessionMetrics, 0, 0.0);
  *(_QWORD *)&self->fLastAWDTimestamps.fHeadAndSize.fHead = 0x200000000;
  return self;
}

@end
