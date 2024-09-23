@implementation CLStepCountNotifierAdapter

- (id)syncgetDbUUID
{
  return (id)sub_10021816C(*((_QWORD *)-[CLStepCountNotifierAdapter adaptee](self, "adaptee")+ 16));
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

- (BOOL)syncgetEnabled
{
  uint64_t v2;

  -[CLStepCountNotifierAdapter adaptee](self, "adaptee");
  v2 = sub_1001FBB04(0);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 + 32) + 24))(v2 + 32);
}

- (void)adaptee
{
  void *result;

  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result)
  return result;
}

- (CLStepDistance)syncgetQueryStartTime:(SEL)a3 andStopTime:(double *)a4
{
  CLStepDistance *result;

  sub_100219690((uint64_t)-[CLStepCountNotifierAdapter adaptee](self, "adaptee"), a4, a5, (uint64_t)retstr);
  return result;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (id)getSilo
{
  if (qword_10230F618 != -1)
    dispatch_once(&qword_10230F618, &stru_1021B85B8);
  return (id)qword_10230F610;
}

- (CLStepCountNotifierAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLStepCountNotifierAdapter;
  return -[CLStepCountNotifierAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLStepCountNotifierProtocol, &OBJC_PROTOCOL___CLStepCountNotifierClientProtocol);
}

- (void)beginService
{
  uint64_t v3;

  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_10148A0A4((uint64_t)-[CLStepCountNotifierAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    v3 = sub_101956810();
    sub_10148A0A4(v3);
  }
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLStepCountNotifierAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLStepCountNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLStepCountNotifierAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)strideCalibratorSetSession:(int64_t)a3
{
  objc_msgSend(*((id *)-[CLStepCountNotifierAdapter adaptee](self, "adaptee") + 25), "setSession:", a3);
}

- (void)receiveWorkoutDistanceAnalyticsMessage:(id)a3
{
  sub_10148A220((uint64_t)-[CLStepCountNotifierAdapter adaptee](self, "adaptee"), (uint64_t)a3);
}

- (void)setEnabled:(BOOL)a3
{
  sub_10148A3E4((uint64_t)-[CLStepCountNotifierAdapter adaptee](self, "adaptee"), a3);
}

- (void)reset
{
  uint64_t *v2;

  v2 = -[CLStepCountNotifierAdapter adaptee](self, "adaptee");
  sub_101486AE8(v2[16]);
  sub_101139070((_QWORD *)(v2[16] + 72));
}

- (int)syncgetQueryPedometerDataSince:(CLStepCountEntry *)a3 withResponseArray:(void *)a4
{
  return sub_101482924(*((_QWORD *)-[CLStepCountNotifierAdapter adaptee](self, "adaptee") + 16));
}

- (id)syncgetCopyRawSpeedToKValueBins
{
  -[CLStepCountNotifierAdapter adaptee](self, "adaptee");
  return -[CMPedometerTable copyBins](+[CMPedometerTableRawSpeedToKValue sharedInstance](CMPedometerTableRawSpeedToKValue, "sharedInstance"), "copyBins");
}

- (id)syncgetCopyStepCadenceToStrideLengthBins
{
  -[CLStepCountNotifierAdapter adaptee](self, "adaptee");
  return -[CMPedometerTable copyBins](+[CMPedometerTableStepCadenceToStrideLength sharedInstance](CMPedometerTableStepCadenceToStrideLength, "sharedInstance"), "copyBins");
}

- (void)setRawSpeedToKValueBins:(id)a3
{
  -[CLStepCountNotifierAdapter adaptee](self, "adaptee");
  -[CMPedometerTable setBins:](+[CMPedometerTableRawSpeedToKValue sharedInstance](CMPedometerTableRawSpeedToKValue, "sharedInstance"), "setBins:", a3);
}

- (void)setStepCadenceToStrideLengthBins:(id)a3
{
  -[CLStepCountNotifierAdapter adaptee](self, "adaptee");
  -[CMPedometerTable setBins:](+[CMPedometerTableStepCadenceToStrideLength sharedInstance](CMPedometerTableStepCadenceToStrideLength, "sharedInstance"), "setBins:", a3);
}

- (id)syncgetRawSpeedToKValueDefaultBins
{
  -[CLStepCountNotifierAdapter adaptee](self, "adaptee");
  return objc_msgSend(-[CMPedometerTable defaultBins](+[CMPedometerTableRawSpeedToKValue sharedInstance](CMPedometerTableRawSpeedToKValue, "sharedInstance"), "defaultBins"), "copy");
}

- (id)syncgetStepCadenceToStrideLengthDefaultBins
{
  -[CLStepCountNotifierAdapter adaptee](self, "adaptee");
  return objc_msgSend(-[CMPedometerTable defaultBins](+[CMPedometerTableStepCadenceToStrideLength sharedInstance](CMPedometerTableStepCadenceToStrideLength, "sharedInstance"), "defaultBins"), "copy");
}

- (BOOL)syncgetIsStrideCalibrationConvergedMedianForSpeed:(double)a3
{
  return _objc_msgSend(*((id *)-[CLStepCountNotifierAdapter adaptee](self, "adaptee") + 25), "isCalibrationConvergedMedianForSpeed:", a3);
}

- (void)getPedometerCalibrationBins:(int64_t)a3 withReply:(id)a4
{
  __objc2_class *v5;
  id v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  _WORD v10[8];
  uint8_t buf[1640];

  if (a3 == 1)
  {
    -[CLStepCountNotifierAdapter adaptee](self, "adaptee");
    v5 = CMPedometerTableStepCadenceToStrideLength;
    goto LABEL_5;
  }
  if (!a3)
  {
    -[CLStepCountNotifierAdapter adaptee](self, "adaptee");
    v5 = CMPedometerTableRawSpeedToKValue;
LABEL_5:
    v6 = -[__objc2_class copyBins](-[__objc2_class sharedInstance](v5, "sharedInstance"), "copyBins");
    goto LABEL_12;
  }
  if (qword_10229FCD0 != -1)
    dispatch_once(&qword_10229FCD0, &stru_1021B8900);
  v7 = qword_10229FCD8;
  if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Requested calibration type not recognized", buf, 2u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_1021B8900);
    v10[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 16, "Requested calibration type not recognized", v10, 2);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 0, "-[CLStepCountNotifierAdapter getPedometerCalibrationBins:withReply:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  v6 = 0;
LABEL_12:
  (*((void (**)(id, id))a4 + 2))(a4, v6);

}

- (void)getPedometerBinsAndHistoryWithReply:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v5 = objc_msgSend(*((id *)-[CLStepCountNotifierAdapter adaptee](self, "adaptee") + 25), "copyHistory");
  -[CLStepCountNotifierAdapter adaptee](self, "adaptee");
  v6 = -[CMPedometerTable copyBins](+[CMPedometerTableRawSpeedToKValue sharedInstance](CMPedometerTableRawSpeedToKValue, "sharedInstance"), "copyBins");
  -[CLStepCountNotifierAdapter adaptee](self, "adaptee");
  v7 = -[CMPedometerTable copyBins](+[CMPedometerTableStepCadenceToStrideLength sharedInstance](CMPedometerTableStepCadenceToStrideLength, "sharedInstance"), "copyBins");
  v8 = +[CMPedometerTable convertToCMStrideCalibrationData:](CMPedometerTable, "convertToCMStrideCalibrationData:", v6);

  v9 = +[CMPedometerTable convertToCMStrideCalibrationData:](CMPedometerTable, "convertToCMStrideCalibrationData:", v7);
  v10 = objc_msgSend(objc_alloc((Class)CMStrideCalibrationHistory), "initWithCalibrationTracks:rawSpeedToKValueBins:stepCadenceToStrideLengthBins:", v5, v8, v9);

  (*((void (**)(id, id))a3 + 2))(a3, v10);
}

- (void)resumeAfterPendingStepCountNotifications
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10148A940;
  v2[3] = &unk_10212BB58;
  v2[4] = self;
  objc_msgSend(-[CLStepCountNotifierAdapter silo](self, "silo"), "async:", v2);
}

+ (BOOL)isSupported
{
  if (qword_10230F628 != -1)
    dispatch_once(&qword_10230F628, &stru_1021B85D8);
  return byte_10230F620;
}

@end
