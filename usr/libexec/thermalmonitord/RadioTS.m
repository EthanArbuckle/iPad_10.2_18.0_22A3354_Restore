@implementation RadioTS

+ (id)sharedInstance
{
  if (qword_1000A1DA8 != -1)
    dispatch_once(&qword_1000A1DA8, &stru_10007DE18);
  return (id)qword_1000A1DB0;
}

- (RadioTS)init
{
  RadioTS *v2;
  RadioTS *v3;
  NSObject *v4;
  _QWORD v6[5];
  uint8_t buf[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RadioTS;
  v2 = -[RadioTS init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v2->_hasBaseBandTempSensors = 0;
    v2->_sensorIndexTB0R = -[HidSensors getSensorIndexFrom4CC:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "getSensorIndexFrom4CC:", CFSTR("TB0R"));
    v3->_sensorIndexTB1R = -[HidSensors getSensorIndexFrom4CC:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "getSensorIndexFrom4CC:", CFSTR("TB1R"));
    v3->_sensorIndexTB2R = -[HidSensors getSensorIndexFrom4CC:](+[HidSensors sharedInstance](HidSensors, "sharedInstance"), "getSensorIndexFrom4CC:", CFSTR("TB2R"));
    if (v3->_sensorIndexTB0R < 0 && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100051298();
    if (v3->_sensorIndexTB1R < 0 && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10005126C();
    if (v3->_sensorIndexTB2R < 0)
    {
      v4 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> Sensor TB2R index not set!", buf, 2u);
      }
    }
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002C1D8;
    v6[3] = &unk_10007DE40;
    v6[4] = v3;
    sub_10002A6B0((uint64_t)&v3->_radioTSInternal, (uint64_t)v6);
    -[RadioTS registerForThermalReport](v3, "registerForThermalReport");
  }
  return v3;
}

- (void)queryThermalSensorInfo
{
  uint64_t *p_radioTSInternal;
  _QWORD v4[5];

  p_radioTSInternal = (uint64_t *)&self->_radioTSInternal;
  if (sub_10002B498((uint64_t)&self->_radioTSInternal))
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10002C354;
    v4[3] = &unk_10007DE90;
    v4[4] = self;
    sub_10002AD40(p_radioTSInternal, (uint64_t)v4);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
  {
    sub_1000512C4();
  }
}

- (void)registerForThermalReport
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002C520;
  v2[3] = &unk_10007DEE0;
  v2[4] = self;
  sub_10002B0D0((uint64_t *)&self->_radioTSInternal, (uint64_t)v2);
}

- (BOOL)hasBaseBandTempSensors
{
  return self->_hasBaseBandTempSensors;
}

- (RadioTSInternal)radioTSInternal
{
  Manager *ptr;
  unint64_t *v4;
  unint64_t v5;

  ptr = self[1].abmManager.__ptr_;
  retstr->abmManager.__ptr_ = (Manager *)self->radioSensorQueue;
  retstr->abmManager.__cntrl_ = (__shared_weak_count *)ptr;
  if (ptr)
  {
    v4 = (unint64_t *)((char *)ptr + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  *(_OWORD *)&retstr->bbIsready = *(_OWORD *)&self[1].abmManager.__cntrl_;
  return self;
}

- (void)setRadioTSInternal:(RadioTSInternal *)a3
{
  sub_10002C77C(&self->_radioTSInternal.abmManager.__ptr_, (uint64_t *)a3);
  *(_OWORD *)&self->_radioTSInternal.bbIsready = *(_OWORD *)&a3->bbIsready;
}

- (void).cxx_destruct
{
  sub_10002A688((uint64_t)&self->_radioTSInternal);
}

- (id).cxx_construct
{
  sub_10002A67C((uint64_t)&self->_radioTSInternal);
  return self;
}

@end
