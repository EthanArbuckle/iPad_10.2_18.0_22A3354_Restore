@implementation BKHIDUIHostStateProximityServiceWrapper

- (BKHIDUIHostStateProximityServiceWrapper)initWithIOHIDService:(id)a3
{
  id v5;
  BKHIDUIHostStateProximityServiceWrapper *v6;
  BKHIDUIHostStateProximityServiceWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKHIDUIHostStateProximityServiceWrapper;
  v6 = -[BKHIDUIHostStateProximityServiceWrapper init](&v9, "init");
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
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSDictionary *v11;
  NSDictionary *previousHostStateDictionary;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  unsigned int v20;
  unsigned __int8 v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  BKSHIDUISensorMode *prevailingMode;
  int v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;

  v4 = a3;
  v5 = sub_1000869DC(v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[BKIOHIDService senderID](self->_proximityService, "senderID");
  v8 = BSEqualObjects(self->_previousHostStateDictionary, v6);
  if ((v8 & 1) != 0)
  {
    v9 = BKLogUISensor(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 134217984;
      v27 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "  ignoring redundant mode change for proximity service %llX", (uint8_t *)&v26, 0xCu);
    }

  }
  else
  {
    v11 = (NSDictionary *)objc_msgSend(v6, "copy");
    previousHostStateDictionary = self->_previousHostStateDictionary;
    self->_previousHostStateDictionary = v11;

    v13 = objc_msgSend(v4, "postEventWithCurrentDetectionMask");
    if ((_DWORD)v13)
    {
      v14 = sub_1000869DC(v4, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = BKLogUISensor(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v26 = 138543874;
        v27 = v15;
        v28 = 2048;
        v29 = v7;
        v30 = 2114;
        v31 = v4;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "  send %{public}@ to proximity service %llX for mode %{public}@", (uint8_t *)&v26, 0x20u);
      }

      -[BKIOHIDService asyncSetProperty:forKey:andDelayForSeconds:](self->_proximityService, "asyncSetProperty:forKey:andDelayForSeconds:", v15, CFSTR("HostStateNotification"), 0.06);
    }
    v18 = BKLogUISensor(v13);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138543874;
      v27 = v6;
      v28 = 2048;
      v29 = v7;
      v30 = 2114;
      v31 = v4;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "  send %{public}@ to proximity service %llX for mode %{public}@", (uint8_t *)&v26, 0x20u);
    }

    -[BKIOHIDService asyncSetProperty:forKey:](self->_proximityService, "asyncSetProperty:forKey:", v6, CFSTR("HostStateNotification"));
  }
  v20 = objc_msgSend(v4, "digitizerEnabled");
  v21 = objc_msgSend(v4, "pocketTouchesExpected");
  v22 = -[BKSHIDUISensorMode pocketTouchesExpected](self->_prevailingMode, "pocketTouchesExpected");
  if (v20 && (_DWORD)v22 && (v21 & 1) == 0)
  {
    v23 = BKLogUISensor(v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 134217984;
      v27 = v7;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "  send ScreenUnlocked to proximity service %llX", (uint8_t *)&v26, 0xCu);
    }

    -[BKIOHIDService asyncSetProperty:forKey:](self->_proximityService, "asyncSetProperty:forKey:", &__kCFBooleanTrue, CFSTR("ScreenUnlocked"));
  }
  prevailingMode = self->_prevailingMode;
  self->_prevailingMode = (BKSHIDUISensorMode *)v4;

}

- (void)updateCharacteristics:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setHasDiscreteProximitySensor:", 1);
  v5 = -[BKIOHIDService propertyOfClass:forKey:](self->_proximityService, "propertyOfClass:forKey:", objc_opt_class(NSNumber, v4), CFSTR("SuggestedLPAScreenOffHysteresisMs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6)
    objc_msgSend(v8, "setSuggestedSystemApertureGracePeriodForScreenOff:", objc_msgSend(v6, "integerValue"));

}

- (BOOL)supportsProximityLPAEventTransitions
{
  id v2;
  void *v3;
  unsigned __int8 v4;

  v2 = -[BKIOHIDService propertyOfClass:forKey:](self->_proximityService, "propertyOfClass:forKey:", objc_opt_class(NSNumber, a2), CFSTR("ProximitySupportsLPAEventTransitions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BKIOHIDService)proximityService
{
  return self->_proximityService;
}

- (void)setProximityService:(id)a3
{
  objc_storeStrong((id *)&self->_proximityService, a3);
}

- (NSDictionary)previousHostStateDictionary
{
  return self->_previousHostStateDictionary;
}

- (void)setPreviousHostStateDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_previousHostStateDictionary, a3);
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
  objc_storeStrong((id *)&self->_previousHostStateDictionary, 0);
  objc_storeStrong((id *)&self->_proximityService, 0);
}

@end
