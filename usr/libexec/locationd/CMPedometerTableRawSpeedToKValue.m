@implementation CMPedometerTableRawSpeedToKValue

- (BOOL)isBinaryLogging
{
  unsigned __int8 v2;
  unsigned __int8 v4;

  v2 = atomic_load((unsigned __int8 *)&qword_10230B958);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_10230B958))
  {
    v4 = 0;
    sub_1018BF25C((unsigned __int8 *)&unk_10230B950, "LogBinaryPedometerCalibrationTables", &v4, 0);
    __cxa_guard_release(&qword_10230B958);
  }
  return byte_10230B951;
}

+ (id)sharedInstance
{
  if (qword_10230B968 != -1)
    dispatch_once(&qword_10230B968, &stru_102198440);
  return (id)qword_10230B960;
}

- (CMPedometerTableRawSpeedToKValue)initWithTestMode:(BOOL)a3
{
  _BOOL8 v3;
  CMPedometerTableRawSpeedToKValue *v5;
  uint64_t v6;
  uint64_t v7;
  CFTypeRef v8;
  uint64_t v9;
  uint64_t v10;
  CFTypeRef v12;
  objc_super v13;
  void *__p;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v3 = a3;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  sub_10025EA00(&v17, (const void *)qword_10230B920, qword_10230B928, (qword_10230B928 - qword_10230B920) >> 3);
  __p = 0;
  v15 = 0;
  v16 = 0;
  sub_10025EA00(&__p, (const void *)qword_10230B938, qword_10230B940, (qword_10230B940 - qword_10230B938) >> 3);
  v13.receiver = self;
  v13.super_class = (Class)CMPedometerTableRawSpeedToKValue;
  v5 = -[CMPedometerTable initWithTableName:valueInName:valueOutName:defaultValue:binBoundariesWalk:binBoundariesRun:testMode:](&v13, "initWithTableName:valueInName:valueOutName:defaultValue:binBoundariesWalk:binBoundariesRun:testMode:", CFSTR("RawSpeedToKValueTable"), CFSTR("RawSpeed"), CFSTR("KValue"), &v17, &__p, v3, 1.0);
  if (__p)
  {
    v15 = __p;
    operator delete(__p);
  }
  if (v17)
  {
    v18 = v17;
    operator delete(v17);
  }
  if (v5)
  {
    v6 = sub_1001FD94C();
    v12 = 0;
    if (sub_100219F40(v6, (uint64_t)CFSTR("StrideCalibrationDataBins"), &v12))
    {
      v8 = v12;
      v9 = objc_opt_class(CMStrideCalibrationData, v7);
      -[CMPedometerTable setBins:](v5, "setBins:", +[CMPedometerTable convertToCMPedometerBins:](CMPedometerTableRawSpeedToKValue, "convertToCMPedometerBins:", +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(NSArray, v10), 0), v8, 0)));
      sub_1005254E4(v6);
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 944))(v6);
    }
  }
  return v5;
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
    v5[2] = sub_100FE6F94;
    v5[3] = &unk_102198468;
    v5[4] = v3;
    v5[5] = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);
  }

}

- (void)binsDidChange
{
  if (!-[CMPedometerTable testMode](self, "testMode"))
    objc_msgSend(objc_msgSend(objc_msgSend((id)sub_100128CC8(), "vendor"), "proxyForService:", CFSTR("CLMotionSyncStore")), "doAsync:", &stru_102198488);
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
  objc_msgSend(a3, "distanceRawPed");
  v8 = v6 / v7;
  objc_msgSend(a3, "distanceRawPed");
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
    dispatch_once(&qword_10229FCD0, &stru_1021984A8);
  v18 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316674;
    v37 = objc_msgSend(CFSTR("RawSpeedToKValueTable"), "UTF8String");
    v38 = 2080;
    v39 = objc_msgSend(CFSTR("RawSpeed"), "UTF8String");
    v40 = 2048;
    v41 = v14;
    v42 = 2080;
    v43 = objc_msgSend(CFSTR("KValue"), "UTF8String");
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
      dispatch_once(&qword_10229FCD0, &stru_1021984A8);
    v19 = qword_10229FCD8;
    v22 = 136316674;
    v23 = objc_msgSend(CFSTR("RawSpeedToKValueTable"), "UTF8String");
    v24 = 2080;
    v25 = objc_msgSend(CFSTR("RawSpeed"), "UTF8String");
    v26 = 2048;
    v27 = v14;
    v28 = 2080;
    v29 = objc_msgSend(CFSTR("KValue"), "UTF8String");
    v30 = 2048;
    v31 = v8;
    v32 = 2048;
    v33 = v17;
    v34 = 2080;
    v35 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 1, "%s,Updated,With,%s,%0.4f,%s,%0.4f,Alpha,%0.4f,%s", (const char *)&v22, 72);
    v21 = (uint8_t *)v20;
    sub_100512490("Generic", 1, 0, 2, "-[CMPedometerTableRawSpeedToKValue updateBinsWithTrack:]", "%s\n", v20);
    if (v21 != buf)
      free(v21);
  }
}

- (BOOL)isWalkCalibrationAvailable
{
  return -[CMPedometerTable isWalkNativeValueOutAvailable](self, "isWalkNativeValueOutAvailable");
}

- (BOOL)isRunCalibrationAvailable
{
  return -[CMPedometerTable isRunNativeValueOutAvailable](self, "isRunNativeValueOutAvailable");
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)binIntervalForRawSpeed:(double)a3
{
  double v3;
  double v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[CMPedometerTable binIntervalForValueIn:](self, "binIntervalForValueIn:", a3);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (BOOL)isRawSpeedValid:(double)a3
{
  return -[CMPedometerTable isValueInValid:](self, "isValueInValid:", a3);
}

@end
