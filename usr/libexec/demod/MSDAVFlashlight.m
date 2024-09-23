@implementation MSDAVFlashlight

+ (id)sharedInstance
{
  if (qword_1001752D0 != -1)
    dispatch_once(&qword_1001752D0, &stru_10013E6A8);
  return (id)qword_1001752D8;
}

- (MSDAVFlashlight)init
{
  MSDAVFlashlight *v2;
  AVFlashlight *v3;
  AVFlashlight *flashlight;
  dispatch_queue_t v5;
  OS_dispatch_queue *flashQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSDAVFlashlight;
  v2 = -[MSDAVFlashlight init](&v8, "init");
  if (v2)
  {
    v3 = (AVFlashlight *)objc_alloc_init((Class)AVFlashlight);
    flashlight = v2->_flashlight;
    v2->_flashlight = v3;

    v5 = dispatch_queue_create("MSD_DEVICE_FLASH_QUEUE", 0);
    flashQueue = v2->_flashQueue;
    v2->_flashQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

+ (BOOL)hasFlashlight
{
  return +[AVFlashlight hasFlashlight](AVFlashlight, "hasFlashlight");
}

- (BOOL)available
{
  return -[AVFlashlight isAvailable](self->_flashlight, "isAvailable");
}

- (BOOL)flash:(unsigned int)a3
{
  id v5;
  NSObject *v6;
  NSObject *flashQueue;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  unsigned int v13;
  id location;

  if (+[AVFlashlight hasFlashlight](AVFlashlight, "hasFlashlight")
    && -[MSDAVFlashlight available](self, "available"))
  {
    if (!a3)
      a3 = 20;
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_1000BD460(a3, v6);

    objc_initWeak(&location, self);
    flashQueue = self->_flashQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003DB70;
    block[3] = &unk_10013E6D0;
    objc_copyWeak(&v12, &location);
    v13 = a3;
    dispatch_async(flashQueue, block);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    return 1;
  }
  else
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000BD4E4(v10);

    return 0;
  }
}

- (void)_setFlashTimer:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003DC28;
  v3[3] = &unk_10013E6F8;
  v4 = a3;
  v3[4] = self;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)_startFlash
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_1000BD5D0(v4, v5, v6, v7, v8, v9, v10, v11);

  self->_flashDone = 0;
  if (-[MSDAVFlashlight _turnPowerOn](self, "_turnPowerOn"))
  {
    while (!self->_flashDone)
    {
      LODWORD(v12) = 1.0;
      if (!-[MSDAVFlashlight _setFlashlightLevel:](self, "_setFlashlightLevel:", v12)
        || (sleep(1u), LODWORD(v13) = 0, !-[MSDAVFlashlight _setFlashlightLevel:](self, "_setFlashlightLevel:", v13)))
      {
        -[MSDAVFlashlight _stopFlash:](self, "_stopFlash:", 0);
        return;
      }
      sleep(1u);
    }
    v14 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      sub_1000BD560(v15, v16, v17, v18, v19, v20, v21, v22);

  }
}

- (BOOL)_setFlashlightLevel:(float)a3
{
  AVFlashlight *flashlight;
  unsigned __int8 v4;
  id v5;
  id v7;
  NSObject *v8;
  id v9;

  flashlight = self->_flashlight;
  v9 = 0;
  v4 = -[AVFlashlight setFlashlightLevel:withError:](flashlight, "setFlashlightLevel:withError:", &v9);
  v5 = v9;
  if ((v4 & 1) == 0)
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000BD640(v5);

  }
  return v4;
}

- (BOOL)_turnPowerOn
{
  AVFlashlight *flashlight;
  unsigned __int8 v3;
  id v4;
  id v6;
  NSObject *v7;
  id v8;

  flashlight = self->_flashlight;
  v8 = 0;
  v3 = -[AVFlashlight turnPowerOnWithError:](flashlight, "turnPowerOnWithError:", &v8);
  v4 = v8;
  if ((v3 & 1) == 0)
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000BD6DC(v4);

  }
  return v3;
}

- (void)_turnPowerOff
{
  double v2;

  LODWORD(v2) = 0;
  -[MSDAVFlashlight _setFlashlightLevel:](self, "_setFlashlightLevel:", v2);
  -[AVFlashlight turnPowerOff](self->_flashlight, "turnPowerOff");
}

- (void)_stopFlash:(id)a3
{
  if (!self->_flashDone)
  {
    self->_flashDone = 1;
    -[MSDAVFlashlight _turnPowerOff](self, "_turnPowerOff", a3);
  }
}

- (BOOL)flashDone
{
  return self->_flashDone;
}

- (void)setFlashDone:(BOOL)a3
{
  self->_flashDone = a3;
}

- (OS_dispatch_queue)flashQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFlashQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (AVFlashlight)flashlight
{
  return self->_flashlight;
}

- (void)setFlashlight:(id)a3
{
  objc_storeStrong((id *)&self->_flashlight, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flashlight, 0);
  objc_storeStrong((id *)&self->_flashQueue, 0);
}

@end
