@implementation CLFallLoggerManager

+ (unsigned)loggerDataTypeFrom:(unsigned __int8)a3
{
  unsigned __int8 v3;

  if (a3 == 4)
    v3 = 3;
  else
    v3 = 0;
  if (a3 == 3)
    return 2;
  else
    return v3;
}

+ (id)loggerDataTypeString:(unsigned __int8)a3
{
  if (a3 > 0xCu)
    return 0;
  else
    return *(&off_1021A4248 + (char)a3);
}

- (id)initInUniverse:(id)a3
{
  CLFallLoggerManager *v4;
  NSObject *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLFallLoggerManager;
  v4 = -[CLFallLoggerManager init](&v7, "init");
  if (v4)
  {
    v4->fLoggers = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->fUniverse = (CLIntersiloUniverse *)a3;
    v5 = objc_msgSend(objc_msgSend(a3, "silo"), "queue");
    v4->fQueue = (OS_dispatch_queue *)v5;
    dispatch_retain(v5);
    v4->fEventTimes = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->fQueue);
  v3.receiver = self;
  v3.super_class = (Class)CLFallLoggerManager;
  -[CLFallLoggerManager dealloc](&v3, "dealloc");
}

- (void)_addLogger:(id)a3 type:(unsigned __int8)a4
{
  id v6;
  id v7;

  v6 = +[CLFallLoggerManager loggerDataTypeString:](CLFallLoggerManager, "loggerDataTypeString:", a4);
  v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->fLoggers, "objectForKeyedSubscript:", v6);
  if (!v7)
  {
    v7 = objc_alloc_init((Class)NSMutableSet);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->fLoggers, "setObject:forKeyedSubscript:", v7, v6);

  }
  objc_msgSend(v7, "addObject:", a3);
}

- (id)addLogger:(unsigned __int8)a3
{
  uint64_t v3;
  CLFallLogger *v5;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  v5 = objc_alloc_init(CLFallLogger);
  -[CLFallLoggerManager _addLogger:type:](self, "_addLogger:type:", v5, v3);

  return v5;
}

- (id)addLogger:(unsigned __int8)a3 toDirectory:(id)a4 prefix:(id)a5 rotation:(int64_t)a6
{
  uint64_t v9;
  id v11;

  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  v11 = -[CLFallLogger initToDirectory:prefix:rotation:]([CLFallLogger alloc], "initToDirectory:prefix:rotation:", a4, a5, a6);
  -[CLFallLoggerManager _addLogger:type:](self, "_addLogger:type:", v11, v9);

  return v11;
}

- (void)_forEachLogger:(id)a3
{
  NSMutableDictionary *fLoggers;
  _QWORD v4[5];

  fLoggers = self->fLoggers;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10117E180;
  v4[3] = &unk_1021A4158;
  v4[4] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](fLoggers, "enumerateKeysAndObjectsUsingBlock:", v4);
}

- (void)stopLogging
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  -[CLFallLoggerManager _forEachLogger:](self, "_forEachLogger:", &stru_1021A4198);
}

- (void)clearAllLogs
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  -[CLFallLoggerManager _forEachLogger:](self, "_forEachLogger:", &stru_1021A41B8);
  -[NSMutableArray removeAllObjects](self->fEventTimes, "removeAllObjects");
}

- (void)flushData:(id)a3 userProfile:(id)a4
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[7];

  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = dispatch_queue_create("com.apple.CoreMotion.CLFallManager.flush", 0);
  v9 = dispatch_group_create();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10117E400;
  v10[3] = &unk_1021A4208;
  v10[4] = v9;
  v10[5] = v8;
  v10[6] = v7;
  -[CLFallLoggerManager _forEachLogger:](self, "_forEachLogger:", v10);
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
    (*((void (**)(id, id, id, id, id))a3 + 2))(a3, -[NSMutableArray firstObject](self->fEventTimes, "firstObject"), -[NSMutableArray lastObject](self->fEventTimes, "lastObject"), v7, a4);
  -[NSMutableArray removeAllObjects](self->fEventTimes, "removeAllObjects");

  dispatch_release(v8);
  dispatch_release(v9);
}

- (void)_forEachLoggerWithType:(unsigned __int8)a3 logData:(id)a4
{
  NSObject *fQueue;
  _QWORD block[6];
  unsigned __int8 v6;

  fQueue = self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10117E528;
  block[3] = &unk_102166D58;
  v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(fQueue, block);
}

+ (id)encodeBinaryLog:(const BinaryData *)a3
{
  uint64_t v4;
  double v5;
  uint64_t v6;
  _BYTE *v7;
  NSObject *v9;
  const char *v10;
  char *v11;
  _BYTE v12[12];
  int v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  _DWORD v17[2];
  __int16 v18;
  int v19;

  v4 = (*((uint64_t (**)(const BinaryData *, SEL))a3->var0 + 5))(a3, a2);
  v5 = __chkstk_darwin(v4);
  v7 = &v12[-v6];
  v13 = 0;
  (*((void (**)(const BinaryData *, _BYTE *, uint64_t, int *, double))a3->var0 + 2))(a3, &v12[-v6], v4, &v13, v5);
  if ((_DWORD)v4 == v13)
    return +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v7, (int)v4);
  if (qword_10229FD90 != -1)
    dispatch_once(&qword_10229FD90, &stru_1021A4228);
  v9 = qword_10229FD98;
  if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_FAULT))
  {
    v17[0] = 67240448;
    v17[1] = v13;
    v18 = 1026;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "bufferLength(%{public}d)!=kSize(%{public}d)", (uint8_t *)v17, 0xEu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(v17, 0x65CuLL);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_1021A4228);
    v14[0] = 67240448;
    v14[1] = v13;
    v15 = 1026;
    v16 = v4;
    _os_log_send_and_compose_impl(2, 0, v17, 1628, &_mh_execute_header, qword_10229FD98, 17, "bufferLength(%{public}d)!=kSize(%{public}d)", v14, 14);
    v11 = (char *)v10;
    sub_100512490("Generic", 1, 0, 0, "+[CLFallLoggerManager encodeBinaryLog:]", "%s\n", v10);
    if (v11 != (char *)v17)
      free(v11);
  }
  return 0;
}

+ (id)encodeFilteredPressure:(const FilteredPressure *)a3
{
  _QWORD v4[4];
  int v5;

  v4[0] = off_102171728;
  v4[1] = *((_QWORD *)a3 + 4);
  v4[3] = *(_QWORD *)((char *)a3 + 12);
  v5 = *((_DWORD *)a3 + 1);
  return +[CLFallLoggerManager encodeBinaryLog:](CLFallLoggerManager, "encodeBinaryLog:", v4);
}

+ (id)encodePressure:(const Pressure *)a3
{
  double v3;
  uint64_t v4;
  _QWORD v6[5];

  v6[0] = off_1021716D0;
  v3 = (double)*(unint64_t *)((char *)a3 + 12);
  v6[1] = *((_QWORD *)a3 + 4);
  v4 = *(_QWORD *)((char *)a3 + 4);
  *(double *)&v6[3] = v3;
  v6[4] = v4;
  return +[CLFallLoggerManager encodeBinaryLog:](CLFallLoggerManager, "encodeBinaryLog:", v6);
}

+ (id)encodeHeartRate:(const CLCatherineData *)a3
{
  _QWORD v5[4];
  __int128 v6;
  BOOL var4;
  __int128 v8;
  double var7;
  _BOOL4 v10;

  v5[0] = off_102172530;
  v5[1] = CFAbsoluteTimeGetCurrent();
  *(_QWORD *)((char *)&v5[2] + 4) = *(_QWORD *)&a3->var0;
  v6 = *(_OWORD *)&a3->var2;
  var4 = a3->var4;
  v8 = *(_OWORD *)&a3->var5;
  var7 = a3->var7;
  v10 = a3->var8 == 5;
  return +[CLFallLoggerManager encodeBinaryLog:](CLFallLoggerManager, "encodeBinaryLog:", v5);
}

- (void)_forEachLoggerWithType:(unsigned __int8)a3 logItem:(const BinaryData *)a4
{
  uint64_t v4;
  id v6;

  v4 = a3;
  v6 = +[CLFallLoggerManager encodeBinaryLog:](CLFallLoggerManager, "encodeBinaryLog:", a4);
  if (v6)
    -[CLFallLoggerManager _forEachLoggerWithType:logData:](self, "_forEachLoggerWithType:logData:", v4, v6);
}

- (void)logImpactEvent:(const ImpactEvent *)a3
{
  _BYTE v5[232];

  -[NSMutableArray addObject:](self->fEventTimes, "addObject:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)&a3->fImpact.fOperatingMode));
  sub_100A37FC8((uint64_t)v5, (uint64_t)a3);
  -[CLFallLoggerManager _forEachLoggerWithType:logItem:](self, "_forEachLoggerWithType:logItem:", 1, v5);
}

- (void)logImpactEventState:(const ImpactEvent *)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  char v6;
  uint64_t v7;
  uint64_t v8;
  char fNow_high;
  char v10;
  __int16 v11;
  uint64_t v12;
  char v13;
  unsigned __int8 fState;

  v5[0] = off_102171E20;
  v6 = 3;
  v3 = *(_QWORD *)((char *)&a3->fAbsoluteTimestamp + 6);
  v5[1] = *(_QWORD *)&a3->fImpact.fOperatingMode;
  v5[3] = v3;
  v4 = *(_QWORD *)&a3->fImpact.fIsFall;
  v7 = *(_QWORD *)(&a3->fImpact.fCrown + 1);
  v8 = v4;
  fNow_high = HIBYTE(a3->fImpact.fNow);
  v10 = BYTE5(a3->fImpact.fNow);
  v11 = *(_WORD *)&a3->fImpact.fHasMotionBeforeImpact;
  v12 = *(_QWORD *)((char *)&a3->fAbsoluteImpactTimestamp + 6);
  v13 = BYTE6(a3->fTimestamp);
  fState = a3->fImpact.fState;
  -[CLFallLoggerManager _forEachLoggerWithType:logItem:](self, "_forEachLoggerWithType:logItem:", 6, v5);
}

- (void)logImpactSensorData:(const ImpactData *)a3
{
  int var2;
  double v6;
  uint64_t v7;
  CLFallLoggerManager *v8;
  uint64_t v9;
  double var1;
  double v11;
  uint64_t v12;
  uint64_t (**v13)();
  double var0;
  double v15;
  uint64_t v16;
  __int128 v17;

  -[NSMutableArray addObject:](self->fEventTimes, "addObject:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3->var0));
  var2 = a3->var2;
  if (var2 == 2)
  {
    var1 = a3->var1;
    var0 = a3->var0;
    v15 = var1;
    v17 = *(_OWORD *)(&a3->var2 + 1);
    v13 = off_102171F40;
    v16 = *(_QWORD *)((char *)&a3->var3.var0[2] + 1);
    v8 = self;
    v9 = 9;
  }
  else if (var2 == 1)
  {
    v11 = a3->var1;
    var0 = a3->var0;
    v15 = v11;
    v12 = *(_QWORD *)(&a3->var2 + 1);
    DWORD2(v17) = *(_DWORD *)((char *)a3->var3.var0 + 1);
    v13 = off_102171EE8;
    v16 = *(_QWORD *)((char *)&a3->var3.var0[2] + 1);
    *(_QWORD *)&v17 = v12;
    v8 = self;
    v9 = 8;
  }
  else
  {
    if (a3->var2)
      return;
    v6 = a3->var1;
    var0 = a3->var0;
    v15 = v6;
    v7 = *(_QWORD *)(&a3->var2 + 1);
    DWORD2(v17) = *(_DWORD *)((char *)a3->var3.var0 + 1);
    v13 = off_102171E78;
    v16 = *(_QWORD *)((char *)&a3->var3.var0[2] + 1);
    *(_QWORD *)&v17 = v7;
    v8 = self;
    v9 = 7;
  }
  -[CLFallLoggerManager _forEachLoggerWithType:logItem:](v8, "_forEachLoggerWithType:logItem:", v9, &v13);
}

- (void)logFalsePositiveSuppressionFeatures:(const FalsePositiveSuppressionFeatures *)a3
{
  uint64_t v3;
  _QWORD v4[5];
  __int128 v5;
  __int16 v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  char v11;
  char v12;
  __int128 v13;

  v4[0] = off_102171FB0;
  v11 = 3;
  v3 = *(_QWORD *)((char *)a3 + 76);
  v4[1] = *(_QWORD *)((char *)a3 + 68);
  v4[3] = v3;
  v4[4] = *((_QWORD *)a3 + 2);
  v5 = *(_OWORD *)a3;
  v6 = *((_WORD *)a3 + 12);
  v7 = *(_QWORD *)((char *)a3 + 26);
  v8 = *(_DWORD *)((char *)a3 + 34);
  v9 = *(_DWORD *)((char *)a3 + 38);
  v10 = *(_DWORD *)((char *)a3 + 42);
  v12 = *(_DWORD *)((char *)a3 + 46);
  v13 = *(_OWORD *)((char *)a3 + 50);
  -[CLFallLoggerManager _forEachLoggerWithType:logItem:](self, "_forEachLoggerWithType:logItem:", 10, v4);
}

- (void)logSensorType:(unsigned __int8)a3 data:(id)a4 startTime:(double)a5 timestamp:(unint64_t)a6
{
  uint64_t v10;
  char *v11;
  NSMutableData *v12;
  id v13;

  v10 = +[CLFallLoggerManager loggerDataTypeFrom:](CLFallLoggerManager, "loggerDataTypeFrom:", a3);
  v11 = (char *)objc_msgSend(a4, "length");
  v12 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", v11 + 20);
  v13 = objc_msgSend(objc_alloc((Class)CLSensorRecorderSensorMeta), "initWithDataType:", v10);
  objc_msgSend(v13, "setDataSize:", v11);
  objc_msgSend(v13, "setTimestamp:", a6);
  objc_msgSend(v13, "setStartTime:", a5);
  +[CLSensorRecorderSensorMetaSerializer serializeMeta:toData:](CLSensorRecorderSensorMetaSerializer, "serializeMeta:toData:", v13, v12);

  -[NSMutableData appendData:](v12, "appendData:", a4);
  -[CLFallLoggerManager _forEachLoggerWithType:logData:](self, "_forEachLoggerWithType:logData:", v10, v12);
}

- (void)logFilteredPressure:(const FilteredPressure *)a3
{
  -[CLFallLoggerManager _forEachLoggerWithType:logData:](self, "_forEachLoggerWithType:logData:", 4, +[CLFallLoggerManager encodeFilteredPressure:](CLFallLoggerManager, "encodeFilteredPressure:", a3));
}

- (void)logPressure:(const Pressure *)a3
{
  -[CLFallLoggerManager _forEachLoggerWithType:logData:](self, "_forEachLoggerWithType:logData:", 4, +[CLFallLoggerManager encodePressure:](CLFallLoggerManager, "encodePressure:", a3));
}

- (void)logHeartRate:(const CLCatherineData *)a3
{
  -[CLFallLoggerManager _forEachLoggerWithType:logData:](self, "_forEachLoggerWithType:logData:", 5, +[CLFallLoggerManager encodeHeartRate:](CLFallLoggerManager, "encodeHeartRate:", a3));
}

- (void)logOdometer:(const OdometerEntry *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _QWORD v8[3];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  double timestampGps;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v8[1] = CFAbsoluteTimeGetCurrent();
  v5 = *(_OWORD *)&a3->var2.accuracy;
  v9 = *(_OWORD *)&a3->var2.startTime;
  v10 = v5;
  v6 = *(_OWORD *)&a3->var2.odometer;
  v11 = *(_OWORD *)&a3->var2.speed;
  v12 = v6;
  *(int32x2_t *)&v6 = vrev64_s32(*(int32x2_t *)&a3->var2.quality);
  timestampGps = a3->var2.timestampGps;
  v14 = v6;
  v7 = *(_OWORD *)&a3->var2.smoothedGPSAltitude;
  v15 = *(_OWORD *)&a3->var2.groundAltitude;
  v16 = v7;
  v8[0] = off_1021722C8;
  v17 = *(_OWORD *)&a3->var2.gpsCourseRadians;
  -[CLFallLoggerManager _forEachLoggerWithType:logItem:](self, "_forEachLoggerWithType:logItem:", 11, v8);
}

- (BOOL)isLoggingEnabled
{
  return self->fLoggingEnabled;
}

- (void)setLoggingEnabled:(BOOL)a3
{
  self->fLoggingEnabled = a3;
}

- (CLGizmoOrientation)orientation
{
  return self->fOrientation;
}

- (void)setOrientation:(CLGizmoOrientation)a3
{
  self->fOrientation = a3;
}

@end
