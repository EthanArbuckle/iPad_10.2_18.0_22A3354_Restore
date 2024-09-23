@implementation CLWaterSubmersionClientLocal

- (CLWaterSubmersionClientLocal)initWithWaterSubmersionClient:(CLWaterSubmersionClient *)a3
{
  CLWaterSubmersionClientLocal *v4;
  CLWaterSubmersionClientLocal *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLWaterSubmersionClientLocal;
  v4 = -[CLWaterSubmersionClientLocal init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_waterSubmersionClient = a3;
    v4->_submersionStateMachine = -[CLSubmersionStateMachine initWithType:]([CLSubmersionStateMachine alloc], "initWithType:", 0);
    v5->_valid = 1;
  }
  else
  {
    MEMORY[0x18] = 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->_submersionStateMachine = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWaterSubmersionClientLocal;
  -[CLWaterSubmersionClientLocal dealloc](&v3, "dealloc");
}

- (void)setDeepEnabled:(BOOL)a3
{
  -[CLSubmersionStateMachine setType:](self->_submersionStateMachine, "setType:", a3);
}

- (void)onSubmersionStateUpdate:(id)a3
{
  id v5;
  id v6;
  id v7;

  v5 = objc_alloc((Class)CMWaterSubmersionEvent);
  v6 = objc_msgSend(a3, "state");
  objc_msgSend(a3, "startAt");
  v7 = objc_msgSend(v5, "initWithEvent:andDate:", v6, +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  (*((void (**)(CLWaterSubmersionClient *, id))self->_waterSubmersionClient->var0 + 5))(self->_waterSubmersionClient, v7);

}

- (void)onSubmersionMeasurementUpdate:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  const char *v21;
  uint8_t *v22;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  int64_t v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  int64_t v34;

  v5 = objc_msgSend(a3, "copy");
  v6 = -[CLSubmersionStateMachine stateFromDepth:forceSubmersion:](self->_submersionStateMachine, "stateFromDepth:forceSubmersion:", a3, 0);
  if (v6 != objc_msgSend(a3, "state"))
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021648A0);
    v7 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
    {
      v8 = objc_msgSend(a3, "state");
      v9 = -[CLSubmersionStateMachine type](self->_submersionStateMachine, "type");
      *(_DWORD *)buf = 134218496;
      v30 = v8;
      v31 = 2048;
      v32 = v6;
      v33 = 2048;
      v34 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Override client submersion state,fromState,%ld,toState,%ld,clientType,%ld", buf, 0x20u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021648A0);
      v18 = qword_10229FE88;
      v19 = objc_msgSend(a3, "state");
      v20 = -[CLSubmersionStateMachine type](self->_submersionStateMachine, "type");
      v23 = 134218496;
      v24 = v19;
      v25 = 2048;
      v26 = v6;
      v27 = 2048;
      v28 = v20;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v18, 2, "Override client submersion state,fromState,%ld,toState,%ld,clientType,%ld", &v23, 32);
      v22 = (uint8_t *)v21;
      sub_100512490("Generic", 1, 0, 2, "-[CLWaterSubmersionClientLocal onSubmersionMeasurementUpdate:]", "%s\n", v21);
      if (v22 != buf)
        free(v22);
    }
    objc_msgSend(v5, "setState:", v6);
  }
  if (objc_msgSend(v5, "state") != (id)100 && objc_msgSend(v5, "state") && objc_msgSend(v5, "state") != (id)600)
    -[CLWaterSubmersionClientLocal onSubmersionTemperatureUpdate:](self, "onSubmersionTemperatureUpdate:", v5);
  objc_msgSend(v5, "startAt");
  v11 = v10;
  objc_msgSend(v5, "depth");
  v13 = v12;
  objc_msgSend(v5, "pressure");
  v15 = v14;
  objc_msgSend(v5, "surfacePressure");
  v17 = sub_1009F02B8((uint64_t)objc_msgSend(v5, "state"), v11, v13, v15, v16);
  (*((void (**)(CLWaterSubmersionClient *, id))self->_waterSubmersionClient->var0 + 6))(self->_waterSubmersionClient, v17);

}

- (void)onSubmersionTemperatureUpdate:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  objc_msgSend(a3, "startAt");
  v6 = v5;
  objc_msgSend(a3, "temperature");
  v8 = v7;
  objc_msgSend(a3, "temperatureUncertainty");
  v10 = sub_1009F0480(v6, v8, v9);
  (*((void (**)(CLWaterSubmersionClient *, id))self->_waterSubmersionClient->var0 + 7))(self->_waterSubmersionClient, v10);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
