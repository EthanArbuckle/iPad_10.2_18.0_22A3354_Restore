@implementation BKHIDUITouchDetectionModeDigitizerServiceWrapper

- (BKHIDUITouchDetectionModeDigitizerServiceWrapper)initWithIOHIDService:(id)a3
{
  id v5;
  BKHIDUITouchDetectionModeDigitizerServiceWrapper *v6;
  BKHIDUITouchDetectionModeDigitizerServiceWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKHIDUITouchDetectionModeDigitizerServiceWrapper;
  v6 = -[BKHIDUITouchDetectionModeDigitizerServiceWrapper init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_digitizerService, a3);

  return v7;
}

- (void)applyUIMode:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  BKIOHIDService *digitizerService;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;

  v4 = a3;
  v5 = objc_msgSend(v4, "digitizerEnabled");
  v6 = objc_msgSend(v4, "proximityDetectionMode");
  if (v6 > 6 || ((1 << v6) & 0x4C) == 0)
  {
    if (v5)
    {
      LODWORD(v8) = objc_msgSend(v4, "pocketTouchesExpected");
    }
    else if (objc_msgSend(v4, "tapToWakeEnabled"))
    {
      LODWORD(v8) = 254;
    }
    else
    {
      LODWORD(v8) = 255;
    }
  }
  else
  {
    LODWORD(v8) = 2;
  }

  v9 = (unint64_t)objc_msgSend(v4, "changeSource") & 0xFFFFFFFFFFFFFFFDLL;
  if (v9 == 1)
    v8 = v8 | 0x100;
  else
    v8 = v8;
  v10 = -[BKIOHIDService senderID](self->_digitizerService, "senderID");
  v11 = BKLogUISensor();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if ((v8 + 2) >= 5u)
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<unknown:0x%X>"), v8));
    else
      v13 = *(&off_1000ECC80 + (v8 + 2));
    if (v9 == 1)
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingString:", CFSTR(" | fromHardwareButton")));

      v13 = (void *)v14;
    }
    *(_DWORD *)buf = 138543874;
    v18 = v13;
    v19 = 1024;
    v20 = v8;
    v21 = 2048;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "  send mode (%{public}@/0x%X) to digitizer service %llX", buf, 0x1Cu);

  }
  digitizerService = self->_digitizerService;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v8));
  -[BKIOHIDService asyncSetProperty:forKey:](digitizerService, "asyncSetProperty:forKey:", v16, CFSTR("TouchDetectionMode"));

}

- (BKIOHIDService)service
{
  return self->_digitizerService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digitizerService, 0);
  objc_storeStrong((id *)&self->_digitizerServices, 0);
}

- (BOOL)supportsProximityLPAEventTransitions
{
  return 0;
}

- (NSArray)digitizerServices
{
  return self->_digitizerServices;
}

- (BKIOHIDService)digitizerService
{
  return self->_digitizerService;
}

- (void)setDigitizerService:(id)a3
{
  objc_storeStrong((id *)&self->_digitizerService, a3);
}

@end
