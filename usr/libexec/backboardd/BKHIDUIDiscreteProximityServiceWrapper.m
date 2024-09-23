@implementation BKHIDUIDiscreteProximityServiceWrapper

- (BKHIDUIDiscreteProximityServiceWrapper)initWithIOHIDService:(id)a3
{
  id v5;
  BKHIDUIDiscreteProximityServiceWrapper *v6;
  BKHIDUIDiscreteProximityServiceWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKHIDUIDiscreteProximityServiceWrapper;
  v6 = -[BKHIDUIDiscreteProximityServiceWrapper init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_proximityService, a3);

  return v7;
}

- (BKIOHIDService)service
{
  return self->_proximityService;
}

- (void)resetCalibration
{
  -[BKIOHIDService setProperty:forKey:](self->_proximityService, "setProperty:forKey:", &__kCFBooleanTrue, CFSTR("ReceiverProximityReset"));
}

- (void)applyUIMode:(id)a3
{
  id v4;
  const __CFString *v5;
  uint64_t v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  BKSHIDUISensorMode *prevailingMode;
  int v23;
  const __CFString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;

  v4 = a3;
  v5 = (const __CFString *)-[BKIOHIDService senderID](self->_proximityService, "senderID");
  if (!v4)
    goto LABEL_6;
  if ((objc_msgSend(v4, "estimatedProximityMode") & 1) != 0)
  {
    v6 = 3;
    goto LABEL_7;
  }
  v7 = objc_msgSend(v4, "proximityDetectionMode") - 1;
  if (v7 <= 0xC)
    v6 = dword_1000B3D2C[v7];
  else
LABEL_6:
    v6 = 0;
LABEL_7:
  v8 = objc_msgSend(v4, "postEventWithCurrentDetectionMask");
  if ((_DWORD)v8)
  {
    v9 = ((uint64_t (*)(void))BKLogUISensor)();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("pocket");
      v23 = 138543874;
      v24 = CFSTR("pocket");
      v25 = 1024;
      v26 = 3;
      v27 = 2048;
      v28 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "  send mode %{public}@/%d to proximity service %llX", (uint8_t *)&v23, 0x1Cu);

    }
    v8 = -[BKIOHIDService asyncSetProperty:forKey:andDelayForSeconds:](self->_proximityService, "asyncSetProperty:forKey:andDelayForSeconds:", &off_1000F7390, CFSTR("DetectionMode"), 0.06);
  }
  v12 = BKLogUISensor(v8);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (v6 > 5)
      v14 = CFSTR("<unknown>");
    else
      v14 = *(&off_1000ECBA8 + v6);
    v15 = v14;
    v23 = 138543874;
    v24 = v15;
    v25 = 1024;
    v26 = v6;
    v27 = 2048;
    v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "  send mode %{public}@/%d to proximity service %llX", (uint8_t *)&v23, 0x1Cu);

  }
  v16 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6));
  objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("DetectionMode"));

  v18 = objc_msgSend(v4, "pocketTouchesExpected");
  if (-[BKSHIDUISensorMode pocketTouchesExpected](self->_prevailingMode, "pocketTouchesExpected"))
  {
    if ((v18 & 1) == 0)
    {
      v19 = objc_msgSend(v4, "digitizerEnabled");
      if ((_DWORD)v19)
      {
        v20 = BKLogUISensor(v19);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 134217984;
          v24 = v5;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "  send kAppleProxScreenUnlockedKey to service %llX", (uint8_t *)&v23, 0xCu);
        }

        objc_msgSend(v16, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("ScreenUnlocked"));
      }
    }
  }
  -[BKIOHIDService asyncSetProperties:](self->_proximityService, "asyncSetProperties:", v16);
  prevailingMode = self->_prevailingMode;
  self->_prevailingMode = (BKSHIDUISensorMode *)v4;

}

- (void)updateCharacteristics:(id)a3
{
  objc_msgSend(a3, "setHasDiscreteProximitySensor:", 1);
}

- (BOOL)supportsProximityLPAEventTransitions
{
  return 0;
}

- (BKIOHIDService)proximityService
{
  return self->_proximityService;
}

- (void)setProximityService:(id)a3
{
  objc_storeStrong((id *)&self->_proximityService, a3);
}

- (BKSHIDUISensorMode)prevailingMode
{
  return self->_prevailingMode;
}

- (void)setPrevailingMode:(id)a3
{
  objc_storeStrong((id *)&self->_prevailingMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevailingMode, 0);
  objc_storeStrong((id *)&self->_proximityService, 0);
}

@end
