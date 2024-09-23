@implementation CameraTS

- (int)numberOfFields
{
  return 1;
}

- (int)torchState
{
  return self->_torchState;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  if (a3)
    return 0;
  else
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), -[CameraTS torchState](self, "torchState"));
}

- (CameraTS)initWithFrontCameraSensorIdx:(int)a3 rearCameraSensorIdx:(int)a4
{
  CameraTS *v6;
  CameraTS *v7;
  NSObject *v8;
  NSObject *cameraQueue;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CameraTS;
  v6 = -[CameraTS init](&v26, "init");
  v7 = v6;
  if (v6)
  {
    v6->_torchState = -1;
    v6->_rearCameraSensorIdx = a4;
    v6->_frontCameraSensorIdx = a3;
    v6->_rearCameraTeleSensorIdx = -1;
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7->_cameraQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ThermalMonitor.cameraQueue", v8);
    if (byte_1000A2DC0)
    {
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 8, CFSTR("zETM"), 8);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 19, CFSTR("zETM"), 19);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 20, CFSTR("zETM"), 20);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 21, CFSTR("zETM"), 21);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 23, CFSTR("zETM"), 23);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 22, CFSTR("zETM"), 22);
    }
    objc_initWeak(&location, v7);
    cameraQueue = v7->_cameraQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000DFE8;
    v23[3] = &unk_10007D0E8;
    objc_copyWeak(&v24, &location);
    sub_1000358D8("com.apple.isp.backcamerapower", &v7->_rearCameraStateToken, cameraQueue, v23);
    v10 = v7->_cameraQueue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000E054;
    v21[3] = &unk_10007D0E8;
    objc_copyWeak(&v22, &location);
    sub_1000358D8("com.apple.isp.backsensortemperature", &v7->_rearCameraTemperatureToken, v10, v21);
    v11 = v7->_cameraQueue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000E08C;
    v19[3] = &unk_10007D0E8;
    objc_copyWeak(&v20, &location);
    sub_1000358D8("com.apple.isp.frontcamerapower", &v7->_frontCameraStateToken, v11, v19);
    v12 = v7->_cameraQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000E0F8;
    v17[3] = &unk_10007D0E8;
    objc_copyWeak(&v18, &location);
    sub_1000358D8("com.apple.isp.frontsensortemperature", &v7->_frontCameraTemperatureToken, v12, v17);
    v13 = v7->_cameraQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000E130;
    v15[3] = &unk_10007D0E8;
    objc_copyWeak(&v16, &location);
    sub_1000358D8("com.apple.isp.cameratorch", &v7->_torchStateToken, v13, v15);
    -[TGraphSampler addtGraphDataSource:](+[TGraphSampler sharedInstance](TGraphSampler, "sharedInstance"), "addtGraphDataSource:", v7);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v7;
}

- (void)enableRearCameraTeleNotifications:(int)a3
{
  OS_dispatch_queue *cameraQueue;
  OS_dispatch_queue *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[CameraTS setRearCameraTeleSensorIdx:](self, "setRearCameraTeleSensorIdx:", *(_QWORD *)&a3);
  objc_initWeak(&location, self);
  cameraQueue = self->_cameraQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000E2F0;
  v8[3] = &unk_10007D0E8;
  objc_copyWeak(&v9, &location);
  sub_1000358D8("com.apple.isp.backtelecamerapower", &self->_rearCameraTeleStateToken, cameraQueue, v8);
  v5 = self->_cameraQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000E35C;
  v6[3] = &unk_10007D0E8;
  objc_copyWeak(&v7, &location);
  sub_1000358D8("com.apple.isp.backtelesensortemperature", &self->_rearCameraTeleTemperatureToken, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)enableRearCameraSuperWideNotifications:(int)a3
{
  OS_dispatch_queue *cameraQueue;
  OS_dispatch_queue *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[CameraTS setRearCameraSuperWideSensorIdx:](self, "setRearCameraSuperWideSensorIdx:", *(_QWORD *)&a3);
  objc_initWeak(&location, self);
  cameraQueue = self->_cameraQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000E4CC;
  v8[3] = &unk_10007D0E8;
  objc_copyWeak(&v9, &location);
  sub_1000358D8("com.apple.isp.backsuperwidecamerapower", &self->_rearCameraSuperWideStateToken, cameraQueue, v8);
  v5 = self->_cameraQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000E538;
  v6[3] = &unk_10007D0E8;
  objc_copyWeak(&v7, &location);
  sub_1000358D8("com.apple.isp.backsuperwidetemperature", &self->_rearCameraSuperWideTemperatureToken, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)enableRearCameraJasperNotifications:(int)a3
{
  OS_dispatch_queue *cameraQueue;
  OS_dispatch_queue *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[CameraTS setRearCameraJasperSensorIdx:](self, "setRearCameraJasperSensorIdx:", *(_QWORD *)&a3);
  objc_initWeak(&location, self);
  cameraQueue = self->_cameraQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000E6A8;
  v8[3] = &unk_10007D0E8;
  objc_copyWeak(&v9, &location);
  sub_1000358D8("com.apple.isp.backtofsensorpower", &self->_rearCameraJasperStateToken, cameraQueue, v8);
  v5 = self->_cameraQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000E714;
  v6[3] = &unk_10007D0E8;
  objc_copyWeak(&v7, &location);
  sub_1000358D8("com.apple.isp.backtofsensortemperature", &self->_rearCameraJasperTemperatureToken, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)enableFrontIRCameraNotifications:(int)a3
{
  OS_dispatch_queue *cameraQueue;
  OS_dispatch_queue *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[CameraTS setFrontIRCameraSensorIdx:](self, "setFrontIRCameraSensorIdx:", *(_QWORD *)&a3);
  objc_initWeak(&location, self);
  cameraQueue = self->_cameraQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000E884;
  v8[3] = &unk_10007D0E8;
  objc_copyWeak(&v9, &location);
  sub_1000358D8("com.apple.isp.frontirsensortemperature", &self->_frontIRCameraSensorTemperatureToken, cameraQueue, v8);
  v5 = self->_cameraQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000E8BC;
  v6[3] = &unk_10007D0E8;
  objc_copyWeak(&v7, &location);
  sub_1000358D8("com.apple.isp.frontirsensorpower", &self->_frontCameraStateToken, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)enableFrontRomeoNTCNotifications:(int)a3
{
  OS_dispatch_queue *cameraQueue;
  OS_dispatch_queue *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[CameraTS setFrontRomeoNTCSensorIdx:](self, "setFrontRomeoNTCSensorIdx:", *(_QWORD *)&a3);
  objc_initWeak(&location, self);
  cameraQueue = self->_cameraQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000EA2C;
  v8[3] = &unk_10007D0E8;
  objc_copyWeak(&v9, &location);
  sub_1000358D8("com.apple.isp.frontirprojector.ntctempactive", &self->_frontRomeoNTCTemperatureActiveToken, cameraQueue, v8);
  v5 = self->_cameraQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000EA64;
  v6[3] = &unk_10007D0E8;
  objc_copyWeak(&v7, &location);
  sub_1000358D8("com.apple.isp.frontirsensorpower", &self->_frontCameraStateToken, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)enableFrontRigelDieNotifications:(int)a3
{
  OS_dispatch_queue *cameraQueue;
  OS_dispatch_queue *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[CameraTS setFrontRigelDieSensorIdx:](self, "setFrontRigelDieSensorIdx:", *(_QWORD *)&a3);
  objc_initWeak(&location, self);
  cameraQueue = self->_cameraQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000EBD4;
  v8[3] = &unk_10007D0E8;
  objc_copyWeak(&v9, &location);
  sub_1000358D8("com.apple.isp.frontirprojector.dietempactive", &self->_frontRigelDieTemperatureActiveToken, cameraQueue, v8);
  v5 = self->_cameraQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000EC0C;
  v6[3] = &unk_10007D0E8;
  objc_copyWeak(&v7, &location);
  sub_1000358D8("com.apple.isp.frontcamerapower", &self->_frontCameraStateToken, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_rearCameraTeleStateToken);
  notify_cancel(self->_rearCameraTeleTemperatureToken);
  notify_cancel(self->_torchStateToken);
  notify_cancel(self->_frontCameraTemperatureToken);
  notify_cancel(self->_frontCameraStateToken);
  notify_cancel(self->_rearCameraTemperatureToken);
  notify_cancel(self->_rearCameraStateToken);
  v3.receiver = self;
  v3.super_class = (Class)CameraTS;
  -[CameraTS dealloc](&v3, "dealloc");
}

- (void)updateSensor:(int)a3 temperature:(unint64_t)a4
{
  uint64_t v5;
  NSObject *v6;

  if (a3 < 0)
  {
    v6 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10004E788(a3, v6);
  }
  else
  {
    if (100 * (int)a4 <= -12800)
      v5 = 4294954496;
    else
      v5 = (100 * a4);
    sub_10002E350(*(uint64_t *)&a3, v5);
  }
}

- (void)handleStateChangeNotification:(int)a3 temperatureSensorIndex:(int)a4
{
  uint64_t v4;
  uint64_t state64;

  v4 = *(_QWORD *)&a4;
  state64 = 0;
  if (!notify_get_state(a3, &state64) && !state64)
    -[CameraTS updateSensor:temperature:](self, "updateSensor:temperature:", v4, 0);
}

- (void)handleTemperatureChangeNotification:(int)a3 temperatureSensorIndex:(int)a4
{
  uint64_t v4;
  uint64_t state64;

  v4 = *(_QWORD *)&a4;
  state64 = 0;
  if (!notify_get_state(a3, &state64))
    -[CameraTS updateSensor:temperature:](self, "updateSensor:temperature:", v4, (int)state64);
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3)
    return 0;
  else
    return CFSTR("Torch state");
}

- (void)setTorchState:(int)a3
{
  self->_torchState = a3;
}

- (int)rearCameraSensorIdx
{
  return self->_rearCameraSensorIdx;
}

- (void)setRearCameraSensorIdx:(int)a3
{
  self->_rearCameraSensorIdx = a3;
}

- (int)frontCameraSensorIdx
{
  return self->_frontCameraSensorIdx;
}

- (void)setFrontCameraSensorIdx:(int)a3
{
  self->_frontCameraSensorIdx = a3;
}

- (int)rearCameraTeleSensorIdx
{
  return self->_rearCameraTeleSensorIdx;
}

- (void)setRearCameraTeleSensorIdx:(int)a3
{
  self->_rearCameraTeleSensorIdx = a3;
}

- (int)rearCameraSuperWideSensorIdx
{
  return self->_rearCameraSuperWideSensorIdx;
}

- (void)setRearCameraSuperWideSensorIdx:(int)a3
{
  self->_rearCameraSuperWideSensorIdx = a3;
}

- (int)rearCameraJasperSensorIdx
{
  return self->_rearCameraJasperSensorIdx;
}

- (void)setRearCameraJasperSensorIdx:(int)a3
{
  self->_rearCameraJasperSensorIdx = a3;
}

- (int)frontIRCameraSensorIdx
{
  return self->_frontIRCameraSensorIdx;
}

- (void)setFrontIRCameraSensorIdx:(int)a3
{
  self->_frontIRCameraSensorIdx = a3;
}

- (int)frontRomeoNTCSensorIdx
{
  return self->_frontRomeoNTCSensorIdx;
}

- (void)setFrontRomeoNTCSensorIdx:(int)a3
{
  self->_frontRomeoNTCSensorIdx = a3;
}

- (int)frontRigelDieSensorIdx
{
  return self->_frontRigelDieSensorIdx;
}

- (void)setFrontRigelDieSensorIdx:(int)a3
{
  self->_frontRigelDieSensorIdx = a3;
}

- (int)torchStateToken
{
  return self->_torchStateToken;
}

- (void)setTorchStateToken:(int)a3
{
  self->_torchStateToken = a3;
}

- (int)rearCameraStateToken
{
  return self->_rearCameraStateToken;
}

- (void)setRearCameraStateToken:(int)a3
{
  self->_rearCameraStateToken = a3;
}

- (int)rearCameraTemperatureToken
{
  return self->_rearCameraTemperatureToken;
}

- (void)setRearCameraTemperatureToken:(int)a3
{
  self->_rearCameraTemperatureToken = a3;
}

- (int)frontCameraStateToken
{
  return self->_frontCameraStateToken;
}

- (void)setFrontCameraStateToken:(int)a3
{
  self->_frontCameraStateToken = a3;
}

- (int)frontCameraTemperatureToken
{
  return self->_frontCameraTemperatureToken;
}

- (void)setFrontCameraTemperatureToken:(int)a3
{
  self->_frontCameraTemperatureToken = a3;
}

- (int)rearCameraTeleStateToken
{
  return self->_rearCameraTeleStateToken;
}

- (void)setRearCameraTeleStateToken:(int)a3
{
  self->_rearCameraTeleStateToken = a3;
}

- (int)rearCameraTeleTemperatureToken
{
  return self->_rearCameraTeleTemperatureToken;
}

- (void)setRearCameraTeleTemperatureToken:(int)a3
{
  self->_rearCameraTeleTemperatureToken = a3;
}

- (int)rearCameraSuperWideStateToken
{
  return self->_rearCameraSuperWideStateToken;
}

- (void)setRearCameraSuperWideStateToken:(int)a3
{
  self->_rearCameraSuperWideStateToken = a3;
}

- (int)rearCameraSuperWideTemperatureToken
{
  return self->_rearCameraSuperWideTemperatureToken;
}

- (void)setRearCameraSuperWideTemperatureToken:(int)a3
{
  self->_rearCameraSuperWideTemperatureToken = a3;
}

- (int)rearCameraJasperStateToken
{
  return self->_rearCameraJasperStateToken;
}

- (void)setRearCameraJasperStateToken:(int)a3
{
  self->_rearCameraJasperStateToken = a3;
}

- (int)rearCameraJasperTemperatureToken
{
  return self->_rearCameraJasperTemperatureToken;
}

- (void)setRearCameraJasperTemperatureToken:(int)a3
{
  self->_rearCameraJasperTemperatureToken = a3;
}

- (int)frontIRCameraSensorTemperatureToken
{
  return self->_frontIRCameraSensorTemperatureToken;
}

- (void)setFrontIRCameraSensorTemperatureToken:(int)a3
{
  self->_frontIRCameraSensorTemperatureToken = a3;
}

- (int)frontRomeoNTCTemperatureActiveToken
{
  return self->_frontRomeoNTCTemperatureActiveToken;
}

- (void)setFrontRomeoNTCTemperatureActiveToken:(int)a3
{
  self->_frontRomeoNTCTemperatureActiveToken = a3;
}

- (int)frontRigelDieTemperatureActiveToken
{
  return self->_frontRigelDieTemperatureActiveToken;
}

- (void)setFrontRigelDieTemperatureActiveToken:(int)a3
{
  self->_frontRigelDieTemperatureActiveToken = a3;
}

- (OS_dispatch_queue)cameraQueue
{
  return self->_cameraQueue;
}

- (void)setCameraQueue:(id)a3
{
  self->_cameraQueue = (OS_dispatch_queue *)a3;
}

@end
