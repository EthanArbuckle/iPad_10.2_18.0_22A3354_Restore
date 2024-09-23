@implementation CLBatchedDeviceMotionService

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
  if (qword_10230D998 != -1)
    dispatch_once(&qword_10230D998, &stru_1021AA470);
  return (id)qword_10230D990;
}

+ (BOOL)isSupported
{
  return +[CLBatchedSensorService isSupported](CLBatchedSensorService, "isSupported");
}

- (CLBatchedDeviceMotionService)init
{
  CLBatchedDeviceMotionService *v2;
  CLBatchedDeviceMotionService *v3;
  int64_t var0;
  objc_super v6;
  void *__p[2];
  uint64_t v8;
  int v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLBatchedDeviceMotionService;
  v2 = -[CLBatchedSensorService initWithClientProtocol:](&v10, "initWithClientProtocol:", &OBJC_PROTOCOL___CLBatchedDeviceMotionServiceClientProtocol);
  v3 = v2;
  if (v2)
  {
    var0 = v2->super._info.name.var0;
    v3->super._info.name.var0 = 0;
    if (var0)
      (*(void (**)(int64_t))(*(_QWORD *)var0 + 8))(var0);
    if (byte_10230D987 < 0)
    {
      sub_100115CE4(__p, (void *)xmmword_10230D970, *((unint64_t *)&xmmword_10230D970 + 1));
    }
    else
    {
      *(_OWORD *)__p = xmmword_10230D970;
      v8 = unk_10230D980;
    }
    v9 = dword_10230D988;
    v6.receiver = v3;
    v6.super_class = (Class)CLBatchedDeviceMotionService;
    -[CLBatchedSensorService setInfo:](&v6, "setInfo:", __p);
    if (SHIBYTE(v8) < 0)
      operator delete(__p[0]);
  }
  return v3;
}

- (void)dealloc
{
  int64_t var0;
  int64_t v4;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLBatchedDeviceMotionService;
  -[CLBatchedSensorService disableProvider](&v6, "disableProvider");
  var0 = self->super._info.name.var0;
  if (var0)
  {
    sub_100B91820(var0);
    v4 = self->super._info.name.var0;
    self->super._info.name.var0 = 0;
    if (v4)
      (*(void (**)(int64_t))(*(_QWORD *)v4 + 8))(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)CLBatchedDeviceMotionService;
  -[CLBatchedSensorService dealloc](&v5, "dealloc");
}

- (void)registerForData:(id)a3
{
  NSObject *v4;
  void **v5;
  uint64_t v6;
  _BYTE *v7;
  char *v8;
  char *v9;
  objc_super v10;
  objc_super v11;
  objc_super v12;
  objc_super v13;
  int v14;
  _BYTE *v15;
  void *__p[2];
  char v17;
  _BYTE buf[12];
  char v19;

  if (!self->super._info.name.var0)
  {
    v13.receiver = self;
    v13.super_class = (Class)CLBatchedDeviceMotionService;
    -[CLBatchedSensorService enableProvider](&v13, "enableProvider");
    if (qword_10229FFB0 != -1)
      dispatch_once(&qword_10229FFB0, &stru_1021AA490);
    v4 = qword_10229FFB8;
    if (os_log_type_enabled((os_log_t)qword_10229FFB8, OS_LOG_TYPE_DEFAULT))
    {
      v12.receiver = self;
      v12.super_class = (Class)CLBatchedDeviceMotionService;
      -[CLBatchedSensorService info](&v12, "info");
      v5 = v17 >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[service-%{public}s] first client, creating fast path interface", buf, 0xCu);
      if (v17 < 0)
        operator delete(__p[0]);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_10229FFB0 != -1)
        dispatch_once(&qword_10229FFB0, &stru_1021AA490);
      v6 = qword_10229FFB8;
      v11.receiver = self;
      v11.super_class = (Class)CLBatchedDeviceMotionService;
      -[CLBatchedSensorService info](&v11, "info");
      if (v19 >= 0)
        v7 = buf;
      else
        v7 = *(_BYTE **)buf;
      v14 = 136446210;
      v15 = v7;
      _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, v6, 0, "[service-%{public}s] first client, creating fast path interface", &v14, 12);
      v9 = v8;
      if (v19 < 0)
        operator delete(*(void **)buf);
      sub_100512490("Generic", 1, 0, 2, "-[CLBatchedDeviceMotionService registerForData:]", "%s\n", v9);
      if (v9 != (char *)__p)
        free(v9);
    }
    objc_msgSend(-[CLBatchedDeviceMotionService universe](self, "universe"), "silo");
    operator new();
  }
  v10.receiver = self;
  v10.super_class = (Class)CLBatchedDeviceMotionService;
  -[CLBatchedSensorService registerForData:](&v10, "registerForData:", a3);
  sub_100B91A1C(self->super._info.name.var0, 0.5);
}

- (void)unregisterForData:(id)a3
{
  int64_t var0;
  int64_t v5;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLBatchedDeviceMotionService;
  -[CLBatchedSensorService unregisterForData:](&v8, "unregisterForData:", a3);
  v7.receiver = self;
  v7.super_class = (Class)CLBatchedDeviceMotionService;
  if (!-[NSMutableSet count](-[CLBatchedSensorService clients](&v7, "clients"), "count"))
  {
    v6.receiver = self;
    v6.super_class = (Class)CLBatchedDeviceMotionService;
    -[CLBatchedSensorService disableProvider](&v6, "disableProvider");
    var0 = self->super._info.name.var0;
    if (var0)
    {
      sub_100B91820(var0);
      v5 = self->super._info.name.var0;
      self->super._info.name.var0 = 0;
      if (v5)
        (*(void (**)(int64_t))(*(_QWORD *)v5 + 8))(v5);
    }
  }
}

- (void)onBatchedData:(void *)a3 N:(int)a4
{
  NSObject *v7;
  void **v8;
  CLBatchedDeviceMotionBufferWrapper *v9;
  NSMutableSet *v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  _BYTE *v15;
  char *v16;
  char *v17;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  objc_super v24;
  _BYTE v25[128];
  _BYTE buf[12];
  __int16 v27;
  int v28;
  char v29;
  int v30;
  _BYTE *v31;
  __int16 v32;
  int v33;
  void *__p[2];
  char v35;

  if (qword_10229FFB0 != -1)
    dispatch_once(&qword_10229FFB0, &stru_1021AA490);
  v7 = qword_10229FFB8;
  if (os_log_type_enabled((os_log_t)qword_10229FFB8, OS_LOG_TYPE_INFO))
  {
    v24.receiver = self;
    v24.super_class = (Class)CLBatchedDeviceMotionService;
    -[CLBatchedSensorService info](&v24, "info");
    v8 = v35 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v8;
    v27 = 1026;
    v28 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[service-%{public}s] notifying %{public}d samples", buf, 0x12u);
    if (v35 < 0)
      operator delete(__p[0]);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_10229FFB0 != -1)
      dispatch_once(&qword_10229FFB0, &stru_1021AA490);
    v14 = qword_10229FFB8;
    v23.receiver = self;
    v23.super_class = (Class)CLBatchedDeviceMotionService;
    -[CLBatchedSensorService info](&v23, "info");
    if (v29 >= 0)
      v15 = buf;
    else
      v15 = *(_BYTE **)buf;
    v30 = 136446466;
    v31 = v15;
    v32 = 1026;
    v33 = a4;
    _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, v14, 1, "[service-%{public}s] notifying %{public}d samples", &v30, 18);
    v17 = v16;
    if (v29 < 0)
      operator delete(*(void **)buf);
    sub_100512490("Generic", 1, 0, 2, "-[CLBatchedDeviceMotionService onBatchedData:N:]", "%s\n", v17);
    if (v17 != (char *)__p)
      free(v17);
  }
  v9 = -[CLBatchedDeviceMotionBufferWrapper initWithMovedBuffer:]([CLBatchedDeviceMotionBufferWrapper alloc], "initWithMovedBuffer:", a3);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18.receiver = self;
  v18.super_class = (Class)CLBatchedDeviceMotionService;
  v10 = -[CLBatchedSensorService clients](&v18, "clients");
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "onBatchedDeviceMotionData:", v9);
      }
      v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v11);
  }

}

- (void).cxx_destruct
{
  int64_t var0;

  var0 = self->super._info.name.var0;
  self->super._info.name.var0 = 0;
  if (var0)
    (*(void (**)(int64_t))(*(_QWORD *)var0 + 8))(var0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
