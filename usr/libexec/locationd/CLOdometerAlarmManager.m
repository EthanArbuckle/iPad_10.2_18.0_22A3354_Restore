@implementation CLOdometerAlarmManager

+ (id)getSilo
{
  if (qword_10230BC40 != -1)
    dispatch_once(&qword_10230BC40, &stru_10219B720);
  return (id)qword_10230BC38;
}

- (CLOdometerAlarmManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLOdometerAlarmManager;
  return -[CLOdometerAlarmManager initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLOdometerAlarmManagerProtocol, &OBJC_PROTOCOL___CLOdometerAlarmManagerClientProtocol);
}

- (void)beginService
{
  self->fAlarms = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  -[CLOdometerAlarmManager universe](self, "universe");
  sub_1006AA544();
}

- (void)endService
{
  Client *value;
  Client *v4;
  objc_super v5;

  value = self->fLocationClient.__ptr_.__value_;
  self->fLocationClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  v4 = self->fGpsClient.__ptr_.__value_;
  self->fGpsClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  v5.receiver = self;
  v5.super_class = (Class)CLOdometerAlarmManager;
  -[CLOdometerAlarmManager dealloc](&v5, "dealloc");
}

- (void)addAlarm:(id)a3
{
  objc_sync_enter(self);
  -[NSMutableArray addObject:](self->fAlarms, "addObject:", a3);
  -[NSMutableArray sortUsingComparator:](self->fAlarms, "sortUsingComparator:", &stru_10219B740);
  -[CLOdometerAlarmManager reschedule](self, "reschedule");
  objc_sync_exit(self);
}

- (void)removeAlarm:(id)a3
{
  objc_sync_enter(self);
  -[NSMutableArray removeObject:](self->fAlarms, "removeObject:", a3);
  -[CLOdometerAlarmManager reschedule](self, "reschedule");
  objc_sync_exit(self);
}

- (void)reschedule
{
  CLOdometerAlarm *v3;

  v3 = -[CLOdometerAlarmManager firstAlarm](self, "firstAlarm");
  if (v3 != -[CLOdometerAlarmManager currentlyScheduled](self, "currentlyScheduled"))
  {
    if (v3)
    {
      __asm { FMOV            V0.2D, #-1.0 }
      sub_1001B3AF0();
    }
    objc_msgSend(*((id *)self->fGpsClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->fGpsClient.__ptr_.__value_ + 1), 16);
    -[CLOdometerAlarmManager setCurrentlyScheduled:](self, "setCurrentlyScheduled:", 0);
  }
}

- (void)handleLocationData:(const void *)a3
{
  double v5;
  uint64_t v6;
  double v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint8_t *v13;
  NSObject *v14;
  double v15;
  NSObject *v16;
  double v17;
  const char *v18;
  uint8_t *v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint8_t *v23;
  double v24;
  int v25;
  double v26;
  __int16 v27;
  double v28;
  uint8_t buf[4];
  double v30;
  __int16 v31;
  double v32;

  objc_sync_enter(self);
  v5 = *((double *)a3 + 20);
  v6 = *((_QWORD *)a3 + 100);
  v7 = v5;
  if (v6)
    v7 = *(double *)sub_1003471BC(v6);
  if (v7 >= 0.0)
  {
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_10219B760);
    v14 = qword_1022A02D8;
    if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v30 = v7;
      v31 = 2048;
      v32 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "BATCH: received locations w/ odometer: %f, %f", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_10219B760);
      v25 = 134218240;
      v26 = v7;
      v27 = 2048;
      v28 = v5;
      LODWORD(v24) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 2, "BATCH: received locations w/ odometer: %f, %f", COERCE_DOUBLE(&v25), v24);
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 2, "-[CLOdometerAlarmManager handleLocationData:]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
    -[CLOdometerAlarmManager lastOdometer](self, "lastOdometer");
    if (v7 >= v15)
    {
      -[CLOdometerAlarmManager handleOdometer:](self, "handleOdometer:", v5);
    }
    else
    {
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_10219B760);
      v16 = qword_1022A02D8;
      if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEFAULT))
      {
        -[CLOdometerAlarmManager lastOdometer](self, "lastOdometer");
        *(_DWORD *)buf = 134218240;
        v30 = v17;
        v31 = 2048;
        v32 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#Warning BATCH: odometer ran from %f to %f", buf, 0x16u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A02D0 != -1)
          dispatch_once(&qword_1022A02D0, &stru_10219B760);
        v20 = qword_1022A02D8;
        -[CLOdometerAlarmManager lastOdometer](self, "lastOdometer");
        v25 = 134218240;
        v26 = v21;
        v27 = 2048;
        v28 = v7;
        LODWORD(v24) = 22;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v20, 0, "#Warning BATCH: odometer ran from %f to %f", COERCE_DOUBLE(&v25), v24);
        v23 = (uint8_t *)v22;
        sub_100512490("Generic", 1, 0, 2, "-[CLOdometerAlarmManager handleLocationData:]", "%s\n", v22);
        if (v23 != buf)
          free(v23);
      }
      -[CLOdometerAlarmManager reset](self, "reset");
    }
  }
  else if (-[NSMutableArray count](self->fAlarms, "count"))
  {
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_10219B760);
    v8 = qword_1022A02D8;
    if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEFAULT))
    {
      *(double *)&v9 = COERCE_DOUBLE(sub_10014D1E0(*((_DWORD *)a3 + 24)));
      *(_DWORD *)buf = 136315138;
      v30 = *(double *)&v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#Warning BATCH: Received a location (%s) without an odometer while odometer alarm was set", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_10219B760);
      v10 = qword_1022A02D8;
      *(double *)&v11 = COERCE_DOUBLE(sub_10014D1E0(*((_DWORD *)a3 + 24)));
      v25 = 136315138;
      v26 = *(double *)&v11;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v10, 0, "#Warning BATCH: Received a location (%s) without an odometer while odometer alarm was set", (const char *)&v25);
      v13 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 2, "-[CLOdometerAlarmManager handleLocationData:]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
  }
  objc_sync_exit(self);
}

- (void)handleOdometerData:(const void *)a3
{
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint8_t *v11;
  uint64_t v12;
  const char *v13;
  uint8_t *v14;
  int v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;

  objc_sync_enter(self);
  if (*((double *)a3 + 104) <= 0.0)
  {
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_10219B760);
    v7 = qword_1022A02D8;
    if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *((_QWORD *)a3 + 104);
      *(_DWORD *)buf = 134217984;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#Warning BATCH: odometer reset: %.2f", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_10219B760);
      v12 = *((_QWORD *)a3 + 104);
      v15 = 134217984;
      v16 = v12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 0, "#Warning BATCH: odometer reset: %.2f", COERCE_DOUBLE(&v15));
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLOdometerAlarmManager handleOdometerData:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
    -[CLOdometerAlarmManager reset](self, "reset");
  }
  else
  {
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_10219B760);
    v5 = qword_1022A02D8;
    if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEBUG))
    {
      v6 = *((_QWORD *)a3 + 104);
      *(_DWORD *)buf = 134217984;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "BATCH: received odometer: %f", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_10219B760);
      v9 = *((_QWORD *)a3 + 104);
      v15 = 134217984;
      v16 = v9;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 2, "BATCH: received odometer: %f", COERCE_DOUBLE(&v15));
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLOdometerAlarmManager handleOdometerData:]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
    -[CLOdometerAlarmManager handleOdometer:](self, "handleOdometer:", *((double *)a3 + 104));
  }
  objc_sync_exit(self);
}

- (void)handleOdometer:(double)a3
{
  double v5;
  NSObject *global_queue;
  _QWORD v7[6];

  while (-[CLOdometerAlarmManager firstAlarm](self, "firstAlarm"))
  {
    -[CLOdometerAlarm odometerTarget](-[CLOdometerAlarmManager firstAlarm](self, "firstAlarm"), "odometerTarget");
    if (v5 >= a3)
      break;
    global_queue = dispatch_get_global_queue(0, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10103C320;
    v7[3] = &unk_102131360;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    dispatch_async(global_queue, v7);
    -[NSMutableArray removeObjectAtIndex:](self->fAlarms, "removeObjectAtIndex:", 0);
  }
  -[CLOdometerAlarmManager setLastOdometer:](self, "setLastOdometer:", a3);
  -[CLOdometerAlarmManager reschedule](self, "reschedule");
}

- (void)reset
{
  NSMutableArray *fAlarms;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  NSObject *global_queue;
  _QWORD block[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  fAlarms = self->fAlarms;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](fAlarms, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(fAlarms);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        global_queue = dispatch_get_global_queue(0, 0);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10103C4A4;
        block[3] = &unk_10212BB58;
        block[4] = v8;
        dispatch_async(global_queue, block);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](fAlarms, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  -[NSMutableArray removeAllObjects](self->fAlarms, "removeAllObjects");
  -[CLOdometerAlarmManager setLastOdometer:](self, "setLastOdometer:", 0.0);
}

- (CLOdometerAlarm)firstAlarm
{
  CLOdometerAlarm *result;

  result = (CLOdometerAlarm *)-[NSMutableArray count](self->fAlarms, "count");
  if (result)
    return (CLOdometerAlarm *)-[NSMutableArray objectAtIndex:](self->fAlarms, "objectAtIndex:", 0);
  return result;
}

- (CLOdometerAlarm)currentlyScheduled
{
  return self->currentlyScheduled;
}

- (void)setCurrentlyScheduled:(id)a3
{
  self->currentlyScheduled = (CLOdometerAlarm *)a3;
}

- (double)lastOdometer
{
  return self->lastOdometer;
}

- (void)setLastOdometer:(double)a3
{
  self->lastOdometer = a3;
}

- (void).cxx_destruct
{
  Client *value;
  Client *v4;

  value = self->fGpsClient.__ptr_.__value_;
  self->fGpsClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->fLocationClient.__ptr_.__value_;
  self->fLocationClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
