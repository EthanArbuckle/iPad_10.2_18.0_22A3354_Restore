@implementation CMActivityAlarmLocal

+ (BOOL)activityAlarmAvailable
{
  return sub_1012A67DC() != 0;
}

+ (id)activityAlarmInfo
{
  id result;

  result = (id)sub_1012A67DC();
  if (result)
    return sub_1012A7364((uint64_t)result);
  return result;
}

- (CMActivityAlarmLocal)initWithTrigger:(unsigned int)a3 duration:(double)a4 onQueue:(id)a5 withHandler:(id)a6
{
  uint64_t v9;
  CMActivityAlarmLocal *v10;
  CMActivityAlarmLocal *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v15;
  uint8_t *v16;
  double v17;
  objc_super v18;
  _DWORD v19[2];
  __int16 v20;
  double v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  double v25;

  v9 = *(_QWORD *)&a3;
  v18.receiver = self;
  v18.super_class = (Class)CMActivityAlarmLocal;
  v10 = -[CMActivityAlarmLocal init](&v18, "init");
  v11 = v10;
  if (v9 < 0x1C)
  {
    v12 = sub_1012A67DC();
    v11->fConcentrator = (void *)v12;
    if (!v12)
      sub_10194A688(qword_10229FCC0 == -1);
    if (qword_10229FCC0 != -1)
      dispatch_once(&qword_10229FCC0, &stru_1021AC520);
    v13 = qword_10229FCC8;
    if (os_log_type_enabled((os_log_t)qword_10229FCC8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v23 = v9;
      v24 = 2048;
      v25 = a4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "trigger,%d,duration,%f", buf, 0x12u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCC0 != -1)
        dispatch_once(&qword_10229FCC0, &stru_1021AC520);
      v19[0] = 67109376;
      v19[1] = v9;
      v20 = 2048;
      v21 = a4;
      LODWORD(v17) = 18;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCC8, 1, "trigger,%d,duration,%f", v19, v17);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 2, "-[CMActivityAlarmLocal initWithTrigger:duration:onQueue:withHandler:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
    v11->fIsValid = 1;
    v11->fRunLoop = 0;
    dispatch_retain((dispatch_object_t)a5);
    v11->fQueue = (OS_dispatch_queue *)a5;
    v11->fHandler = _Block_copy(a6);
    -[CMActivityAlarmLocal setDuration:](v11, "setDuration:", a4);
    -[CMActivityAlarmLocal setTrigger:](v11, "setTrigger:", v9);
    v11->_bundleId = (NSString *)CFSTR("<locationd internal>");
    v11->_executable = (NSString *)CFSTR("<locationd internal>");
    sub_1012A6C38((char *)v11->fConcentrator, v11);
  }
  else
  {

    return 0;
  }
  return v11;
}

- (CMActivityAlarmLocal)initWithTrigger:(unsigned int)a3 duration:(double)a4 onQueue:(id)a5 forClient:(const void *)a6 withHandler:(id)a7
{
  uint64_t v11;
  CMActivityAlarmLocal *v12;
  CMActivityAlarmLocal *v13;
  uint64_t v14;
  id v15;
  char *v16;
  id v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  objc_super v23;

  v11 = *(_QWORD *)&a3;
  v23.receiver = self;
  v23.super_class = (Class)CMActivityAlarmLocal;
  v12 = -[CMActivityAlarmLocal init](&v23, "init");
  v13 = v12;
  if (v11 < 0x1C)
  {
    v14 = sub_1012A67DC();
    v13->fConcentrator = (void *)v14;
    if (!v14)
      sub_10194A7FC();
    v13->fIsValid = 1;
    v13->fRunLoop = 0;
    dispatch_retain((dispatch_object_t)a5);
    v13->fQueue = (OS_dispatch_queue *)a5;
    v13->fHandler = _Block_copy(a7);
    -[CMActivityAlarmLocal setDuration:](v13, "setDuration:", a4);
    -[CMActivityAlarmLocal setTrigger:](v13, "setTrigger:", v11);
    v15 = objc_alloc((Class)NSString);
    sub_1001A8D50((uint64_t)a6);
    if (*((char *)a6 + 127) >= 0)
      v16 = (char *)a6 + 104;
    else
      v16 = (char *)*((_QWORD *)a6 + 13);
    v13->_bundleId = (NSString *)objc_msgSend(v15, "initWithUTF8String:", v16);
    v17 = objc_alloc((Class)NSString);
    v20 = (char *)*((_QWORD *)a6 + 3);
    v19 = (char *)a6 + 24;
    v18 = v20;
    if (v19[23] >= 0)
      v21 = v19;
    else
      v21 = v18;
    v13->_executable = (NSString *)objc_msgSend(v17, "initWithUTF8String:", v21);
    sub_1012A6C38((char *)v13->fConcentrator, v13);
  }
  else
  {

    return 0;
  }
  return v13;
}

- (CMActivityAlarmLocal)initWithTrigger:(unsigned int)a3 duration:(double)a4 onRunLoop:(__CFRunLoop *)a5 withHandler:(id)a6
{
  uint64_t v9;
  id v10;
  uint64_t v11;
  objc_super v13;

  v9 = *(_QWORD *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)CMActivityAlarmLocal;
  v10 = -[CMActivityAlarmLocal init](&v13, "init");
  v11 = sub_1012A67DC();
  *((_QWORD *)v10 + 1) = v11;
  if (!v11)
    sub_10194A978();
  *((_BYTE *)v10 + 16) = 1;
  *((_QWORD *)v10 + 3) = a5;
  *((_QWORD *)v10 + 4) = 0;
  *((_QWORD *)v10 + 5) = _Block_copy(a6);
  objc_msgSend(v10, "setDuration:", a4);
  objc_msgSend(v10, "setTrigger:", v9);
  *((_QWORD *)v10 + 6) = CFSTR("<locationd internal>");
  *((_QWORD *)v10 + 7) = CFSTR("<locationd internal>");
  sub_1012A6C38(*((char **)v10 + 1), v10);
  return (CMActivityAlarmLocal *)v10;
}

- (void)dealloc
{
  objc_super v3;

  -[CMActivityAlarmLocal invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CMActivityAlarmLocal;
  -[CMActivityAlarmLocal dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  NSObject *fQueue;
  _QWORD block[5];

  objc_sync_enter(self);
  if (self->fIsValid)
  {
    self->fIsValid = 0;
    _Block_release(self->fHandler);
    self->fHandler = 0;
    fQueue = self->fQueue;
    if (fQueue)
    {
      self->fQueue = 0;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1012AB41C;
      block[3] = &unk_10212BB58;
      block[4] = fQueue;
      dispatch_async(fQueue, block);
    }
    self->fRunLoop = 0;
    objc_sync_exit(self);
    sub_1012A6FF4((uint64_t)self->fConcentrator, self);
  }
  else
  {
    objc_sync_exit(self);
  }
}

- (BOOL)isValid
{
  BOOL fIsValid;

  objc_sync_enter(self);
  fIsValid = self->fIsValid;
  objc_sync_exit(self);
  return fIsValid;
}

- (void)fire
{
  void *v3;
  __CFRunLoop *fRunLoop;
  void *v5;
  NSObject *fQueue;
  _QWORD v7[6];
  _QWORD block[6];

  objc_sync_enter(self);
  if (self->fIsValid)
  {
    self->fIsValid = 0;
    if (self->fRunLoop)
    {
      v3 = _Block_copy(self->fHandler);
      fRunLoop = self->fRunLoop;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1012AB5A0;
      block[3] = &unk_1021629E0;
      block[4] = self;
      block[5] = v3;
      CFRunLoopPerformBlock(fRunLoop, kCFRunLoopDefaultMode, block);
      CFRunLoopWakeUp(self->fRunLoop);
      self->fRunLoop = 0;
    }
    if (self->fQueue)
    {
      v5 = _Block_copy(self->fHandler);
      fQueue = self->fQueue;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1012AB5D4;
      v7[3] = &unk_1021629E0;
      v7[4] = self;
      v7[5] = v5;
      dispatch_async(fQueue, v7);
      dispatch_release((dispatch_object_t)self->fQueue);
      self->fQueue = 0;
    }
    _Block_release(self->fHandler);
    self->fHandler = 0;
  }
  objc_sync_exit(self);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)executable
{
  return self->_executable;
}

- (void)setExecutable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

@end
