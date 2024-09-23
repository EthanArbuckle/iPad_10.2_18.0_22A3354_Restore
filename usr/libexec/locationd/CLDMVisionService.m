@implementation CLDMVisionService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_102307C68 != -1)
    dispatch_once(&qword_102307C68, &stru_102180870);
  return (id)qword_102307C60;
}

+ (BOOL)isSupported
{
  if (qword_102307C78 != -1)
    dispatch_once(&qword_102307C78, &stru_102180890);
  return byte_102307C70;
}

- (CLDMVisionService)init
{
  CLDMVisionService *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDMVisionService;
  result = -[CLDMVisionService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLDMVisionServiceProtocol, &OBJC_PROTOCOL___CLDMVisionServiceClientProtocol);
  if (result)
    result->fDeclination = 0.0;
  return result;
}

- (void)beginService
{
  -[CLDMVisionService setValid:](self, "setValid:", 1);
  -[CLDMVisionService setVisionNotificationProxy:](self, "setVisionNotificationProxy:", objc_msgSend(objc_msgSend(-[CLDMVisionService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLVisionNotifier")));
  -[CLVisionNotifierServiceProtocol registerDelegate:inSilo:](-[CLDMVisionService visionNotificationProxy](self, "visionNotificationProxy"), "registerDelegate:inSilo:", self, objc_msgSend(-[CLDMVisionService universe](self, "universe"), "silo"));
  -[CLVisionNotifierServiceProtocol registerForVisionNotifications:](-[CLDMVisionService visionNotificationProxy](self, "visionNotificationProxy"), "registerForVisionNotifications:", self);
}

- (void)endService
{
  -[CLVisionNotifierServiceProtocol deregisterForVisionNotifications:](-[CLDMVisionService visionNotificationProxy](self, "visionNotificationProxy"), "deregisterForVisionNotifications:", self);
}

- (void)handleDeviceMotionData:(const Sample *)a3
{
  uint64_t v4;
  float var1;
  int8x16_t v6;
  float32x4_t v7;
  uint64_t v8;
  float v9;

  v4 = (unint64_t)(a3->var0 * 1000000.0);
  var1 = a3[2].var1.var1;
  v8 = *(_QWORD *)((char *)&a3[2].var0 + 4);
  v9 = var1;
  v6 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->var1.var0), *(float64x2_t *)&a3[1].var0);
  v7 = (float32x4_t)vextq_s8(v6, v6, 4uLL);
  sub_10012C97C(&v7, v7);
  sub_100DE97C8((uint64_t)&self->fVisualLocalizationPropagation, (uint64_t)&v8, (__n128 *)&v7, v4);
}

- (void)handleGeomagneticModelData:(id *)a3
{
  NSObject *v5;
  double var5;
  double v7;
  const char *v8;
  uint8_t *v9;
  int v10;
  double v11;
  uint8_t buf[4];
  double v13;

  if (qword_10229FD20 != -1)
    dispatch_once(&qword_10229FD20, &stru_1021808B0);
  v5 = qword_10229FD28;
  if (os_log_type_enabled((os_log_t)qword_10229FD28, OS_LOG_TYPE_DEBUG))
  {
    var5 = a3->var5;
    *(_DWORD *)buf = 134217984;
    v13 = var5;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "visual localization,handleGeomagneticModelData, data.declination,%f", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD20 != -1)
      dispatch_once(&qword_10229FD20, &stru_1021808B0);
    v7 = a3->var5;
    v10 = 134217984;
    v11 = v7;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD28, 2, "visual localization,handleGeomagneticModelData, data.declination,%f", COERCE_DOUBLE(&v10));
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLDMVisionService handleGeomagneticModelData:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  self->fDeclination = a3->var5;
}

- (void)handleARSessionState:(unint64_t)a3 fromClient:(id)a4
{
  NSObject *v6;
  Dispatcher *value;
  NSObject *v8;
  CLDeviceMotionProperties *v9;
  NSObject *v10;
  uint64_t v11;
  Dispatcher *v12;
  unique_ptr<CLGeomagneticModelProvider_Type::Client, std::default_delete<CLGeomagneticModelProvider_Type::Client>> *p_fGeomagneticModelProviderClient;
  Client *v14;
  const char *v15;
  char *v16;
  const char *v17;
  char *v18;
  const char *v19;
  char *v20;
  int v21;
  unint64_t v22;
  uint8_t buf[1640];

  if (qword_10229FD20 != -1)
    dispatch_once(&qword_10229FD20, &stru_1021808B0);
  v6 = qword_10229FD28;
  if (os_log_type_enabled((os_log_t)qword_10229FD28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "visual localization,handleARSessionState, sessionState,%lu", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD20 != -1)
      dispatch_once(&qword_10229FD20, &stru_1021808B0);
    v21 = 134217984;
    v22 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD28, 1, "visual localization,handleARSessionState, sessionState,%lu", &v21);
    v16 = (char *)v15;
    sub_100512490("Generic", 1, 0, 2, "-[CLDMVisionService handleARSessionState:fromClient:]", "%s\n", v15);
    if (v16 != (char *)buf)
      free(v16);
  }
  value = self->fDeviceMotionDispatcher.__ptr_.__value_;
  if (a3 == 1)
  {
    if (!value)
    {
      if (qword_10229FD20 != -1)
        dispatch_once(&qword_10229FD20, &stru_1021808B0);
      v8 = qword_10229FD28;
      if (os_log_type_enabled((os_log_t)qword_10229FD28, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "visual localization,handleARSessionState, initializeVlfPropagation", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FD20 != -1)
          dispatch_once(&qword_10229FD20, &stru_1021808B0);
        LOWORD(v21) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD28, 2, "visual localization,handleARSessionState, initializeVlfPropagation", &v21, 2);
        v20 = (char *)v19;
        sub_100512490("Generic", 1, 0, 2, "-[CLDMVisionService handleARSessionState:fromClient:]", "%s\n", v19);
        if (v20 != (char *)buf)
          free(v20);
      }
      v9 = -[CLDeviceMotionProperties initWithMode:]([CLDeviceMotionProperties alloc], "initWithMode:", 3);
      objc_msgSend(-[CLDMVisionService universe](self, "universe"), "silo");
      operator new();
    }
  }
  else if (value)
  {
    if (qword_10229FD20 != -1)
      dispatch_once(&qword_10229FD20, &stru_1021808B0);
    v10 = qword_10229FD28;
    if (os_log_type_enabled((os_log_t)qword_10229FD28, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "visual localization,handleARSessionState, stopVlfPropagation", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FD20 != -1)
        dispatch_once(&qword_10229FD20, &stru_1021808B0);
      LOWORD(v21) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD28, 2, "visual localization,handleARSessionState, stopVlfPropagation", &v21, 2);
      v18 = (char *)v17;
      sub_100512490("Generic", 1, 0, 2, "-[CLDMVisionService handleARSessionState:fromClient:]", "%s\n", v17);
      if (v18 != (char *)buf)
        free(v18);
    }
    v11 = sub_1002433D4();
    sub_1000A4A6C(v11, 1, (uint64_t)self->fDeviceMotionDispatcher.__ptr_.__value_);
    v12 = self->fDeviceMotionDispatcher.__ptr_.__value_;
    self->fDeviceMotionDispatcher.__ptr_.__value_ = 0;
    if (v12)
      (*(void (**)(Dispatcher *))(*(_QWORD *)v12 + 8))(v12);
    p_fGeomagneticModelProviderClient = &self->fGeomagneticModelProviderClient;
    objc_msgSend(*((id *)p_fGeomagneticModelProviderClient->__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)p_fGeomagneticModelProviderClient->__ptr_.__value_ + 1), 0);
    v14 = p_fGeomagneticModelProviderClient->__ptr_.__value_;
    p_fGeomagneticModelProviderClient->__ptr_.__value_ = 0;
    if (v14)
      (*(void (**)(Client *))(*(_QWORD *)v14 + 8))(v14);
  }
}

- (void)handleVLLocalizationResult:(id)a3 fromClient:(id)a4
{
  NSObject *v6;
  float fDeclination;
  __int128 v8;
  float v9;
  double v10;
  __int128 v11;
  uint64_t v12;
  NSObject *v13;
  double v14;
  uint64_t v15;
  const char *v16;
  uint8_t *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  const char *v21;
  uint8_t *v22;
  double v23;
  __int128 v24;
  __int128 v25;
  float v26;
  char v27;
  unint64_t v28;
  float v29;
  __int128 v30;
  int v31;
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  uint64_t v42;
  uint8_t buf[4];
  double v44;
  __int16 v45;
  double v46;
  __int16 v47;
  double v48;
  __int16 v49;
  double v50;
  __int16 v51;
  double v52;
  __int16 v53;
  uint64_t v54;

  if (qword_10229FD20 != -1)
    dispatch_once(&qword_10229FD20, &stru_1021808B0);
  v6 = qword_10229FD28;
  if (os_log_type_enabled((os_log_t)qword_10229FD28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v44 = *(double *)&a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "visual localization,handleVLLocalizationResult, localizationResult,%@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD20 != -1)
      dispatch_once(&qword_10229FD20, &stru_1021808B0);
    v31 = 138412290;
    v32 = *(double *)&a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD28, 1, "visual localization,handleVLLocalizationResult, localizationResult,%@", &v31, 12);
    v17 = (uint8_t *)v16;
    sub_100512490("Generic", 1, 0, 2, "-[CLDMVisionService handleVLLocalizationResult:fromClient:]", "%s\n", v16);
    if (v17 != buf)
      free(v17);
  }
  fDeclination = self->fDeclination;
  if (sub_100DE9868((uint64_t)&self->fVisualLocalizationPropagation, a3, fDeclination))
  {
    v9 = self->fVisualLocalizationPropagation.fAttitudePropagated.elements[0];
    v27 = 35;
    *(float *)&v8 = self->fVisualLocalizationPropagation.fAttitudePropagated.elements[1];
    v24 = v8;
    *(float *)&v8 = self->fVisualLocalizationPropagation.fAttitudePropagated.elements[2];
    v25 = v8;
    v26 = self->fVisualLocalizationPropagation.fAttitudePropagated.elements[3];
    objc_msgSend(a3, "timestamp");
    v28 = (unint64_t)(v10 * 1000000.0);
    *(_QWORD *)&v11 = __PAIR64__(v25, v24);
    v29 = v9;
    *((float *)&v11 + 2) = v26;
    HIDWORD(v11) = LODWORD(self->fVisualLocalizationPropagation.fAttitudeUncertainty);
    v30 = v11;
    v12 = sub_1001FBB04(0);
    (*(void (**)(uint64_t, char *))(*(_QWORD *)(v12 + 104) + 16))(v12 + 104, &v27);
    if (qword_10229FD20 != -1)
      dispatch_once(&qword_10229FD20, &stru_1021808B0);
    v13 = qword_10229FD28;
    if (os_log_type_enabled((os_log_t)qword_10229FD28, OS_LOG_TYPE_INFO))
    {
      v14 = self->fDeclination;
      objc_msgSend(a3, "timestamp");
      *(_DWORD *)buf = 134219264;
      v44 = v9;
      v45 = 2048;
      v46 = *(float *)&v24;
      v47 = 2048;
      v48 = *(float *)&v25;
      v49 = 2048;
      v50 = v26;
      v51 = 2048;
      v52 = v14;
      v53 = 2048;
      v54 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "visual localization,handleVLLocalizationResult, sendPropagatedVLLocalizationResultFromClient,qTotal,%f,%f,%f,%f,declination,%f,timestamp,%f", buf, 0x3Eu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FD20 != -1)
        dispatch_once(&qword_10229FD20, &stru_1021808B0);
      v18 = qword_10229FD28;
      v19 = self->fDeclination;
      objc_msgSend(a3, "timestamp");
      v31 = 134219264;
      v32 = v9;
      v33 = 2048;
      v34 = *(float *)&v24;
      v35 = 2048;
      v36 = *(float *)&v25;
      v37 = 2048;
      v38 = v26;
      v39 = 2048;
      v40 = v19;
      v41 = 2048;
      v42 = v20;
      LODWORD(v23) = 62;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v18, 1, "visual localization,handleVLLocalizationResult, sendPropagatedVLLocalizationResultFromClient,qTotal,%f,%f,%f,%f,declination,%f,timestamp,%f", COERCE_DOUBLE(&v31), v23, *(double *)&v24, *((double *)&v24 + 1), *(double *)&v25, *((double *)&v25 + 1));
      v22 = (uint8_t *)v21;
      sub_100512490("Generic", 1, 0, 2, "-[CLDMVisionService handleVLLocalizationResult:fromClient:]", "%s\n", v21);
      if (v22 != buf)
        free(v22);
    }
  }
}

- (BOOL)valid
{
  return self->valid_;
}

- (void)setValid:(BOOL)a3
{
  self->valid_ = a3;
}

- (CLVisionNotifierServiceProtocol)visionNotificationProxy
{
  return self->_visionNotificationProxy;
}

- (void)setVisionNotificationProxy:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8112);
}

- (void).cxx_destruct
{
  Client *value;
  Dispatcher *v4;

  self->fVisualLocalizationPropagation._vptr$CLVisualLocalizationPropagation = (void **)off_1021808E0;
  value = self->fGeomagneticModelProviderClient.__ptr_.__value_;
  self->fGeomagneticModelProviderClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->fDeviceMotionDispatcher.__ptr_.__value_;
  self->fDeviceMotionDispatcher.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Dispatcher *))(*(_QWORD *)v4 + 8))(v4);
}

- (id).cxx_construct
{
  self->fDeviceMotionDispatcher.__ptr_.__value_ = 0;
  self->fGeomagneticModelProviderClient.__ptr_.__value_ = 0;
  sub_100DE9778((uint64_t)&self->fVisualLocalizationPropagation);
  return self;
}

@end
