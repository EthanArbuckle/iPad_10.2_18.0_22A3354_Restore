@implementation CMPedometerTableStepCadenceToStrideLength

- (BOOL)isCalibrationAvailableForStepCadence:(double)a3
{
  if (-[CMPedometerTable isValueInRun:](self, "isValueInRun:", a3))
    return -[CMPedometerTable isRunNativeValueOutAvailable](self, "isRunNativeValueOutAvailable");
  else
    return -[CMPedometerTable isWalkNativeValueOutAvailable](self, "isWalkNativeValueOutAvailable");
}

+ (id)sharedInstance
{
  if (qword_10230E2A0 != -1)
    dispatch_once(&qword_10230E2A0, &stru_1021AE7E0);
  return (id)qword_10230E298;
}

- (BOOL)isBinaryLogging
{
  unsigned __int8 v2;
  unsigned __int8 v4;

  v2 = atomic_load((unsigned __int8 *)&qword_10230E290);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_10230E290))
  {
    v4 = 0;
    sub_1018BF25C((unsigned __int8 *)&unk_10230E288, "LogBinaryPedometerCalibrationTables", &v4, 0);
    __cxa_guard_release(&qword_10230E290);
  }
  return byte_10230E289;
}

- (CMPedometerTableStepCadenceToStrideLength)initWithTestMode:(BOOL)a3
{
  _BOOL8 v3;
  CMPedometerTableStepCadenceToStrideLength *v5;
  objc_super v7;
  void *__p;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  sub_10025EA00(&v11, (const void *)qword_10230E258, qword_10230E260, (qword_10230E260 - qword_10230E258) >> 3);
  __p = 0;
  v9 = 0;
  v10 = 0;
  sub_10025EA00(&__p, (const void *)qword_10230E270, qword_10230E278, (qword_10230E278 - qword_10230E270) >> 3);
  v7.receiver = self;
  v7.super_class = (Class)CMPedometerTableStepCadenceToStrideLength;
  v5 = -[CMPedometerTable initWithTableName:valueInName:valueOutName:defaultValue:binBoundariesWalk:binBoundariesRun:testMode:](&v7, "initWithTableName:valueInName:valueOutName:defaultValue:binBoundariesWalk:binBoundariesRun:testMode:", CFSTR("StepCadenceToStrideLengthTable"), CFSTR("StepCadence"), CFSTR("StrideLength"), &v11, &__p, v3, 0.705500007);
  if (__p)
  {
    v9 = __p;
    operator delete(__p);
  }
  if (v11)
  {
    v12 = v11;
    operator delete(v11);
  }
  if (v5)
  {
    self->_userHeight = 1.7;
    -[CMPedometerTableStepCadenceToStrideLength updateStrideLengthRun](self, "updateStrideLengthRun");
    -[CMPedometerTableStepCadenceToStrideLength updateStrideLengthStepCadenceWalk](self, "updateStrideLengthStepCadenceWalk");
  }
  return self;
}

- (void)logBins
{
  id v3;
  id v4;
  _QWORD v5[6];

  v3 = objc_msgSend(-[CMPedometerTable description](self, "description"), "componentsSeparatedByCharactersInSet:", +[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet"));
  v4 = -[CMPedometerTable copyBins](self, "copyBins");
  if (objc_msgSend(v4, "count"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10130CD38;
    v5[3] = &unk_102198468;
    v5[4] = v3;
    v5[5] = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);
  }

}

- (void)binsDidChange
{
  uint64_t v3;

  if (!-[CMPedometerTable testMode](self, "testMode"))
  {
    objc_msgSend(objc_msgSend(objc_msgSend((id)sub_100128CC8(), "vendor"), "proxyForService:", CFSTR("CLMotionSyncStore")), "doAsync:", &stru_1021AE800);
    v3 = sub_1001FBB04(0);
    (*(void (**)(uint64_t, CLStrideLengthStepCadencePair *))(*(_QWORD *)(v3 + 56) + 40))(v3 + 56, &self->_strideLengthStepCadencePairWalk);
  }
}

- (void)updateBinsWithTrack:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  uint64_t v19;
  const char *v20;
  uint8_t *v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  double v27;
  __int16 v28;
  id v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  double v41;
  __int16 v42;
  id v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  __int16 v48;
  id v49;

  objc_msgSend(a3, "distanceGps");
  v6 = v5;
  objc_msgSend(a3, "steps");
  v8 = v6 / v7;
  objc_msgSend(a3, "steps");
  v10 = v9;
  objc_msgSend(objc_msgSend(a3, "stop"), "timeIntervalSinceReferenceDate");
  v12 = v11;
  objc_msgSend(objc_msgSend(a3, "start"), "timeIntervalSinceReferenceDate");
  v14 = v10 / (v12 - v13);
  objc_msgSend(a3, "distanceGps");
  v16 = v15 / 400.0;
  if (v16 <= 1.0)
    v17 = v16 * 0.4;
  else
    v17 = 0.4;
  -[CMPedometerTable updateBinsWithValueOut:valueIn:alpha:](self, "updateBinsWithValueOut:valueIn:alpha:", v8, v14, v17);
  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_1021AE820);
  v18 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316674;
    v37 = objc_msgSend(CFSTR("StepCadenceToStrideLengthTable"), "UTF8String");
    v38 = 2080;
    v39 = objc_msgSend(CFSTR("StepCadence"), "UTF8String");
    v40 = 2048;
    v41 = v14;
    v42 = 2080;
    v43 = objc_msgSend(CFSTR("StrideLength"), "UTF8String");
    v44 = 2048;
    v45 = v8;
    v46 = 2048;
    v47 = v17;
    v48 = 2080;
    v49 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s,Updated,With,%s,%0.4f,%s,%0.4f,Alpha,%0.4f,%s", buf, 0x48u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_1021AE820);
    v19 = qword_10229FCD8;
    v22 = 136316674;
    v23 = objc_msgSend(CFSTR("StepCadenceToStrideLengthTable"), "UTF8String");
    v24 = 2080;
    v25 = objc_msgSend(CFSTR("StepCadence"), "UTF8String");
    v26 = 2048;
    v27 = v14;
    v28 = 2080;
    v29 = objc_msgSend(CFSTR("StrideLength"), "UTF8String");
    v30 = 2048;
    v31 = v8;
    v32 = 2048;
    v33 = v17;
    v34 = 2080;
    v35 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 1, "%s,Updated,With,%s,%0.4f,%s,%0.4f,Alpha,%0.4f,%s", (const char *)&v22, 72);
    v21 = (uint8_t *)v20;
    sub_100512490("Generic", 1, 0, 2, "-[CMPedometerTableStepCadenceToStrideLength updateBinsWithTrack:]", "%s\n", v20);
    if (v21 != buf)
      free(v21);
  }
  if (-[CMPedometerTable isValueInRun:](self, "isValueInRun:", v14))
    -[CMPedometerTableStepCadenceToStrideLength updateStrideLengthRun](self, "updateStrideLengthRun");
  else
    -[CMPedometerTableStepCadenceToStrideLength updateStrideLengthStepCadenceWalk](self, "updateStrideLengthStepCadenceWalk");
}

- (BOOL)isWalkCalibrationAvailable
{
  return -[CMPedometerTable isWalkNativeValueOutAvailable](self, "isWalkNativeValueOutAvailable");
}

- (BOOL)isRunCalibrationAvailable
{
  return -[CMPedometerTable isRunNativeValueOutAvailable](self, "isRunNativeValueOutAvailable");
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)binIntervalForStepCadence:(double)a3
{
  double v3;
  double v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[CMPedometerTable binIntervalForValueIn:](self, "binIntervalForValueIn:", a3);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (double)strideLengthForStepCadence:(double)a3
{
  double result;

  if (-[CMPedometerTable isValueInRun:](self, "isValueInRun:"))
    return self->_strideLengthRun;
  -[CMPedometerTable valueOutForValueIn:](self, "valueOutForValueIn:", a3);
  return result;
}

- (BOOL)isStepCadenceValid:(double)a3
{
  return -[CMPedometerTable isValueInValid:](self, "isValueInValid:", a3);
}

- (void)setUserHeight:(float)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  id v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;

  if (self->_userHeight != a3)
  {
    self->_userHeight = a3;
    v15 = -[CMPedometerTable copyBins](self, "copyBins");
    v4 = objc_msgSend(v15, "count");
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = v15;
      do
      {
        v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
        if (!objc_msgSend(v8, "state"))
        {
          v9 = (float)(self->_userHeight * flt_101C4A810[v6 < -[CMPedometerTable walkBinCount](self, "walkBinCount")]);
          v10 = objc_alloc((Class)CMPedometerBin);
          objc_msgSend(v8, "begin");
          v12 = v11;
          objc_msgSend(v8, "end");
          v14 = objc_msgSend(v10, "initWithValueOut:begin:end:state:", objc_msgSend(v8, "state"), v9, v12, v13);
        }
        ++v6;
        v7 = v15;
      }
      while (v5 != (id)v6);
      -[CMPedometerTable setBins:](self, "setBins:", v15);
      -[CMPedometerTableStepCadenceToStrideLength updateStrideLengthRun](self, "updateStrideLengthRun");
      -[CMPedometerTableStepCadenceToStrideLength updateStrideLengthStepCadenceWalk](self, "updateStrideLengthStepCadenceWalk");
    }

  }
}

- (void)updateStrideLengthRun
{
  id v3;
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  double v9;
  id v10;
  double v11;
  double v12;
  NSObject *v13;
  id v14;
  id v15;
  double strideLengthRun;
  uint64_t v17;
  id v18;
  id v19;
  double v20;
  const char *v21;
  uint8_t *v22;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  double v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  double v34;

  v3 = -[CMPedometerTable copyBins](self, "copyBins");
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = v4;
    v6 = -[CMPedometerTable walkBinCount](self, "walkBinCount");
    if (v6 >= (unint64_t)v5)
      goto LABEL_9;
    v7 = v6;
    v8 = 0;
    v9 = 0.0;
    do
    {
      v10 = objc_msgSend(v3, "objectAtIndexedSubscript:", v7);
      if ((uint64_t)objc_msgSend(v10, "state") >= 11)
      {
        objc_msgSend(v10, "valueOut");
        v9 = v9 + v11;
        ++v8;
      }
      ++v7;
    }
    while (v5 != (id)v7);
    if (v8 <= 0)
LABEL_9:
      v12 = (float)(self->_userHeight * 0.585);
    else
      v12 = v9 / (double)v8;
    self->_strideLengthRun = v12;
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_1021AE820);
    v13 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      v14 = objc_msgSend(CFSTR("StepCadenceToStrideLengthTable"), "UTF8String");
      v15 = objc_msgSend(CFSTR("StrideLength"), "UTF8String");
      strideLengthRun = self->_strideLengthRun;
      *(_DWORD *)buf = 136315650;
      v30 = v14;
      v31 = 2080;
      v32 = v15;
      v33 = 2048;
      v34 = strideLengthRun;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s,%sRun,%0.4f", buf, 0x20u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_1021AE820);
      v17 = qword_10229FCD8;
      v18 = objc_msgSend(CFSTR("StepCadenceToStrideLengthTable"), "UTF8String");
      v19 = objc_msgSend(CFSTR("StrideLength"), "UTF8String");
      v20 = self->_strideLengthRun;
      v23 = 136315650;
      v24 = v18;
      v25 = 2080;
      v26 = v19;
      v27 = 2048;
      v28 = v20;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v17, 2, "%s,%sRun,%0.4f", (const char *)&v23, 32);
      v22 = (uint8_t *)v21;
      sub_100512490("Generic", 1, 0, 2, "-[CMPedometerTableStepCadenceToStrideLength updateStrideLengthRun]", "%s\n", v21);
      if (v22 != buf)
        free(v22);
    }
  }

}

- (void)updateStrideLengthStepCadenceWalk
{
  id v3;
  unint64_t v4;
  id v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  CLStrideLengthStepCadencePair *p_strideLengthStepCadencePairWalk;
  float v15;
  NSObject *v16;
  id v17;
  id v18;
  double strideLength;
  id v20;
  double stepCadence;
  uint64_t v22;
  id v23;
  id v24;
  double v25;
  id v26;
  double v27;
  const char *v28;
  uint8_t *v29;
  int v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  double v35;
  __int16 v36;
  id v37;
  __int16 v38;
  double v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  double v45;
  __int16 v46;
  id v47;
  __int16 v48;
  double v49;

  v3 = -[CMPedometerTable copyBins](self, "copyBins");
  if (objc_msgSend(v3, "count"))
  {
    if (!-[CMPedometerTable walkBinCount](self, "walkBinCount"))
      goto LABEL_11;
    v4 = 0;
    v5 = 0;
    v6 = 0.0;
    v7 = 0.0;
    do
    {
      v8 = objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      if ((uint64_t)objc_msgSend(v8, "state") >= 11)
      {
        objc_msgSend(v8, "begin");
        if (v9 >= 1.16666663)
        {
          objc_msgSend(v8, "end");
          if (v10 <= 2.16666675 && (uint64_t)objc_msgSend(v8, "state") >= (uint64_t)v5)
          {
            objc_msgSend(v8, "valueOut");
            v6 = v11;
            objc_msgSend(v8, "center");
            v7 = v12;
            v5 = objc_msgSend(v8, "state");
          }
        }
      }
      ++v4;
    }
    while (v4 < -[CMPedometerTable walkBinCount](self, "walkBinCount"));
    if (!v5)
    {
LABEL_11:
      v6 = (float)(self->_userHeight * 0.415);
      v7 = 1.83333337;
    }
    v13 = v6;
    p_strideLengthStepCadencePairWalk = &self->_strideLengthStepCadencePairWalk;
    v15 = v7;
    self->_strideLengthStepCadencePairWalk.strideLength = v13;
    self->_strideLengthStepCadencePairWalk.stepCadence = v15;
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_1021AE820);
    v16 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_DEBUG))
    {
      v17 = objc_msgSend(CFSTR("StepCadenceToStrideLengthTable"), "UTF8String");
      v18 = objc_msgSend(CFSTR("StrideLength"), "UTF8String");
      strideLength = p_strideLengthStepCadencePairWalk->strideLength;
      v20 = objc_msgSend(CFSTR("StepCadence"), "UTF8String");
      stepCadence = p_strideLengthStepCadencePairWalk->stepCadence;
      *(_DWORD *)buf = 136316162;
      v41 = v17;
      v42 = 2080;
      v43 = v18;
      v44 = 2048;
      v45 = strideLength;
      v46 = 2080;
      v47 = v20;
      v48 = 2048;
      v49 = stepCadence;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s,%sWalk,%0.4f,%sWalk,%0.4f", buf, 0x34u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_1021AE820);
      v22 = qword_10229FCD8;
      v23 = objc_msgSend(CFSTR("StepCadenceToStrideLengthTable"), "UTF8String");
      v24 = objc_msgSend(CFSTR("StrideLength"), "UTF8String");
      v25 = p_strideLengthStepCadencePairWalk->strideLength;
      v26 = objc_msgSend(CFSTR("StepCadence"), "UTF8String");
      v27 = p_strideLengthStepCadencePairWalk->stepCadence;
      v30 = 136316162;
      v31 = v23;
      v32 = 2080;
      v33 = v24;
      v34 = 2048;
      v35 = v25;
      v36 = 2080;
      v37 = v26;
      v38 = 2048;
      v39 = v27;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v22, 2, "%s,%sWalk,%0.4f,%sWalk,%0.4f", (const char *)&v30, 52);
      v29 = (uint8_t *)v28;
      sub_100512490("Generic", 1, 0, 2, "-[CMPedometerTableStepCadenceToStrideLength updateStrideLengthStepCadenceWalk]", "%s\n", v28);
      if (v29 != buf)
        free(v29);
    }
  }

}

@end
