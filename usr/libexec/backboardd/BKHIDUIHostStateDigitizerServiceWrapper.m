@implementation BKHIDUIHostStateDigitizerServiceWrapper

- (void)applyUIMode:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char *v14;
  void *v15;
  const __CFString *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  NSDictionary *v20;
  NSDictionary *previousHostStateDictionary;
  uint64_t v22;
  NSObject *v23;
  unsigned int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;

  v4 = a3;
  v5 = objc_msgSend(v4, "proximityDetectionMode");
  v24 = objc_msgSend(v4, "pocketTouchesExpected");
  v6 = objc_msgSend(v4, "digitizerEnabled");
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "multitouchHostStateKeys"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, buf, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v12));
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, buf, 16);
    }
    while (v10);
  }

  if (((unint64_t)objc_msgSend(v4, "changeSource") | 2) == 3)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 786480));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("ChangeSourceKeyboardUsagePair"));

  }
  if (v6)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("ScreenOn"));
  v14 = (char *)objc_msgSend(v4, "displayState");
  if ((unint64_t)(v14 - 1) <= 2)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v14));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("DisplayState"));

  }
  if (v5 <= 6 && ((1 << v5) & 0x4C) != 0)
  {
    v16 = CFSTR("FaceTouchesExpected");
LABEL_17:
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v16);
    goto LABEL_18;
  }
  if ((v6 & v24) == 1)
  {
    v16 = CFSTR("PocketTouchesExpected");
    goto LABEL_17;
  }
LABEL_18:

  v17 = -[BKIOHIDService senderID](self->_digitizerService, "senderID");
  if ((BSEqualObjects(self->_previousHostStateDictionary, v7) & 1) != 0)
  {
    v18 = BKLogUISensor();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v30 = v17;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "  ignoring redundant mode change for digitizer service %llX", buf, 0xCu);
    }

  }
  else
  {
    v20 = (NSDictionary *)objc_msgSend(v7, "copy");
    previousHostStateDictionary = self->_previousHostStateDictionary;
    self->_previousHostStateDictionary = v20;

    v22 = BKLogUISensor();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v30 = v7;
      v31 = 2048;
      v32 = v17;
      v33 = 2114;
      v34 = v4;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "  send %{public}@ to digitizer service %llX for mode %{public}@", buf, 0x20u);
    }

    -[BKIOHIDService asyncSetProperty:forKey:](self->_digitizerService, "asyncSetProperty:forKey:", v7, CFSTR("HostStateNotification"));
  }

}

- (BKIOHIDService)service
{
  return self->_digitizerService;
}

- (BKHIDUIHostStateDigitizerServiceWrapper)initWithIOHIDService:(id)a3
{
  id v5;
  BKHIDUIHostStateDigitizerServiceWrapper *v6;
  BKHIDUIHostStateDigitizerServiceWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKHIDUIHostStateDigitizerServiceWrapper;
  v6 = -[BKHIDUIHostStateDigitizerServiceWrapper init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_digitizerService, a3);

  return v7;
}

- (BOOL)supportsProximityLPAEventTransitions
{
  return 0;
}

- (BKIOHIDService)digitizerService
{
  return self->_digitizerService;
}

- (void)setDigitizerService:(id)a3
{
  objc_storeStrong((id *)&self->_digitizerService, a3);
}

- (NSDictionary)previousHostStateDictionary
{
  return self->_previousHostStateDictionary;
}

- (void)setPreviousHostStateDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_previousHostStateDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousHostStateDictionary, 0);
  objc_storeStrong((id *)&self->_digitizerService, 0);
}

@end
