@implementation BKSmartCoverHIDEventProcessor

- (BKSmartCoverHIDEventProcessor)initWithSupportedHES:(unint64_t)a3 disengagedHES:(unint64_t)a4 attached:(BOOL)a5 unknownState:(BOOL)a6
{
  BKSmartCoverHIDEventProcessor *v10;
  BKSmartCoverHIDEventProcessor *v11;
  uint8x8_t v12;
  __int128 v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  unint64_t supportedSensors;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint8x8_t v25;
  int64_t state;
  const __CFString *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  _QWORD v33[4];
  id v34;
  objc_super v35;
  id buf;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  const __CFString *v44;

  v35.receiver = self;
  v35.super_class = (Class)BKSmartCoverHIDEventProcessor;
  v10 = -[BKSmartCoverHIDEventProcessor init](&v35, "init");
  v11 = v10;
  if (v10)
  {
    v10->_supportedSensors = a3;
    v10->_disengagedSensors = a4;
    v10->_attached = a5;
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.i32[0] == 1)
    {
      v13 = a3;
    }
    else
    {
      if (!(_DWORD)a3)
      {
        if (a6)
        {
          v28 = 3;
LABEL_21:
          v10->_state = v28;
          goto LABEL_22;
        }
LABEL_20:
        v28 = 1;
        goto LABEL_21;
      }
      v13 = xmmword_1000B3D80;
    }
    *(_OWORD *)&v10->_sensorsRequiredForOpenState = v13;
    if (a6)
    {
      v10->_state = 3;
      if (!(_DWORD)a3)
      {
LABEL_22:
        v29 = sub_100059844();
        v16 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No SmartCover sensors detected", (uint8_t *)&buf, 2u);
        }
LABEL_24:

        goto LABEL_25;
      }
LABEL_13:
      v15 = sub_100059844();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        supportedSensors = v11->_supportedSensors;
        v18 = sub_10007C878(supportedSensors);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v20 = sub_10007C878(v11->_disengagedSensors);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        v22 = sub_10007C878(v11->_sensorsRequiredForOpenState);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        v24 = (void *)v23;
        LODWORD(buf) = 67110146;
        v25 = (uint8x8_t)vcnt_s8((int8x8_t)supportedSensors);
        v25.i16[0] = vaddlv_u8(v25);
        state = v11->_state;
        HIDWORD(buf) = v25.i32[0];
        v37 = 2114;
        v38 = v19;
        if (state == 2)
          v27 = CFSTR("closed");
        else
          v27 = CFSTR("open");
        v39 = 2114;
        v40 = v21;
        v41 = 2114;
        v42 = v23;
        v43 = 2114;
        v44 = v27;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SmartCover sensor count:%d available:%{public}@ disengaged:%{public}@ trigger:%{public}@; effective state:%{public}@",
          (uint8_t *)&buf,
          0x30u);

      }
      goto LABEL_24;
    }
    if ((_DWORD)a3)
    {
      v14 = 1;
      if ((a4 & a3) == 0)
        v14 = 2;
      v10->_state = v14;
      goto LABEL_13;
    }
    goto LABEL_20;
  }
LABEL_25:
  objc_initWeak(&buf, v11);
  v30 = &_dispatch_main_q;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10007C8B0;
  v33[3] = &unk_1000EC208;
  objc_copyWeak(&v34, &buf);
  v31 = (id)BSLogAddStateCaptureBlockWithTitle(&_dispatch_main_q, CFSTR("BKSmartCover"), v33);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&buf);
  return v11;
}

- (unint64_t)_currentMaskForUsage:(unsigned int)a3 HIDSystem:(id)a4 mask:(unint64_t *)a5 maskIfEngaged:(unint64_t *)a6
{
  uint64_t v8;
  id v9;
  uint64_t KeyboardEvent;
  const void *v11;
  id v12;
  const void *v13;
  unint64_t v14;

  v8 = *(_QWORD *)&a3;
  v9 = a4;
  KeyboardEvent = IOHIDEventCreateKeyboardEvent(0, 0, 65289, v8, 0, 0);
  if (KeyboardEvent)
  {
    v11 = (const void *)KeyboardEvent;
    v12 = objc_msgSend(v9, "systemEventOfType:matchingEvent:options:", 3, KeyboardEvent, 0);
    if (!v12)
    {
      v14 = 0;
LABEL_23:
      CFRelease(v11);
      goto LABEL_24;
    }
    v13 = v12;
    switch((int)v8)
    {
      case 1:
        v14 = 1;
        if (a5)
          goto LABEL_18;
        goto LABEL_19;
      case 2:
        v14 = 4;
        if (a5)
          goto LABEL_18;
        goto LABEL_19;
      case 3:
        v14 = 8;
        if (a5)
          goto LABEL_18;
        goto LABEL_19;
      case 4:
        v14 = 16;
        if (a5)
          goto LABEL_18;
        goto LABEL_19;
      default:
        if ((_DWORD)v8 == 32)
        {
          v14 = 32;
          if (!a5)
          {
LABEL_19:
            if (a6 && IOHIDEventGetIntegerValue(v12, 196610))
              *a6 |= v14;
            CFRelease(v13);
            goto LABEL_23;
          }
        }
        else
        {
          v14 = 0;
          if (!a5)
            goto LABEL_19;
        }
LABEL_18:
        *a5 |= v14;
        goto LABEL_19;
    }
  }
  v14 = 0;
LABEL_24:

  return v14;
}

- (BKSmartCoverHIDEventProcessor)initWithContext:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  _BOOL8 v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *matcherQueue;
  void *v10;
  BKIOHIDServiceMatcher *v11;
  BKIOHIDServiceMatcher *magicKeyboardExtendedMatcher;
  BKSmartCoverHIDEventProcessor *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "systemInterface"));
  if (+[BKSmartCoverHIDEventProcessor isSmartCoverSupported](BKSmartCoverHIDEventProcessor, "isSmartCoverSupported"))
  {
    v17 = 0;
    v18 = 0;
    -[BKSmartCoverHIDEventProcessor _currentMaskForUsage:HIDSystem:mask:maskIfEngaged:](self, "_currentMaskForUsage:HIDSystem:mask:maskIfEngaged:", 1, v5, &v18, &v17);
    -[BKSmartCoverHIDEventProcessor _currentMaskForUsage:HIDSystem:mask:maskIfEngaged:](self, "_currentMaskForUsage:HIDSystem:mask:maskIfEngaged:", 2, v5, &v18, &v17);
    -[BKSmartCoverHIDEventProcessor _currentMaskForUsage:HIDSystem:mask:maskIfEngaged:](self, "_currentMaskForUsage:HIDSystem:mask:maskIfEngaged:", 3, v5, &v18, &v17);
    -[BKSmartCoverHIDEventProcessor _currentMaskForUsage:HIDSystem:mask:maskIfEngaged:](self, "_currentMaskForUsage:HIDSystem:mask:maskIfEngaged:", 4, v5, &v18, &v17);
    v16 = 0;
    -[BKSmartCoverHIDEventProcessor _currentMaskForUsage:HIDSystem:mask:maskIfEngaged:](self, "_currentMaskForUsage:HIDSystem:mask:maskIfEngaged:", 16, v5, 0, &v16);
    v6 = v16 != 0;
    v15 = 0;
    -[BKSmartCoverHIDEventProcessor _currentMaskForUsage:HIDSystem:mask:maskIfEngaged:](self, "_currentMaskForUsage:HIDSystem:mask:maskIfEngaged:", 32, v5, 0, &v15);
    v7 = v15 != 0;
    v8 = (OS_dispatch_queue *)dispatch_queue_create("BKHIDEventSmartCoverMatcherQueue", 0);
    matcherQueue = self->_matcherQueue;
    self->_matcherQueue = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceMatcherDataProvider"));
    v11 = (BKIOHIDServiceMatcher *)objc_msgSend(objc_alloc((Class)BKIOHIDServiceMatcher), "initWithUsagePage:usage:builtIn:dataProvider:", 65280, 11, 0, v10);
    magicKeyboardExtendedMatcher = self->_magicKeyboardExtendedMatcher;
    self->_magicKeyboardExtendedMatcher = v11;

    -[BKIOHIDServiceMatcher startObserving:queue:](self->_magicKeyboardExtendedMatcher, "startObserving:queue:", self, self->_matcherQueue);
    self = -[BKSmartCoverHIDEventProcessor initWithSupportedHES:disengagedHES:attached:unknownState:](self, "initWithSupportedHES:disengagedHES:attached:unknownState:", v18, v18 & ~v17, v6, v7);

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  id v6;
  NSMutableSet *v7;
  NSMutableSet *magicKeyboardExtendedServices;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v22 = a3;
  v6 = a4;
  if (!self->_magicKeyboardExtendedServices)
  {
    v7 = objc_opt_new(NSMutableSet);
    magicKeyboardExtendedServices = self->_magicKeyboardExtendedServices;
    self->_magicKeyboardExtendedServices = v7;

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "propertyForKey:", CFSTR("MKWakeAnimation")));
        v17 = objc_opt_class(NSString, v16);
        v18 = v15;
        v19 = v18;
        if (v17)
        {
          if ((objc_opt_isKindOfClass(v18, v17) & 1) != 0)
            v20 = v19;
          else
            v20 = 0;
        }
        else
        {
          v20 = 0;
        }
        v21 = v20;

        if (v21
          && objc_msgSend(v21, "isEqualToString:", CFSTR("extended"))
          && (-[NSMutableSet containsObject:](self->_magicKeyboardExtendedServices, "containsObject:", v14) & 1) == 0)
        {
          objc_msgSend(v14, "addDisappearanceObserver:queue:", self, self->_matcherQueue);
          -[NSMutableSet addObject:](self->_magicKeyboardExtendedServices, "addObject:", v14);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

}

- (void)serviceDidDisappear:(id)a3
{
  NSMutableSet *magicKeyboardExtendedServices;

  magicKeyboardExtendedServices = self->_magicKeyboardExtendedServices;
  if (magicKeyboardExtendedServices)
    -[NSMutableSet removeObject:](magicKeyboardExtendedServices, "removeObject:", a3);
}

- (int)_wakeAnimationStyle
{
  NSMutableSet *magicKeyboardExtendedServices;

  magicKeyboardExtendedServices = self->_magicKeyboardExtendedServices;
  if (magicKeyboardExtendedServices)
    LODWORD(magicKeyboardExtendedServices) = -[NSMutableSet count](magicKeyboardExtendedServices, "count") != 0;
  return (int)magicKeyboardExtendedServices;
}

- (void)setAttachedCoverRequiresWorkaroundForOpenState:(BOOL)a3
{
  unint64_t v4;
  unint64_t v5;
  id v6;
  NSObject *v7;
  unint64_t sensorsRequiredForOpenState;
  _DWORD v9[2];

  if (self->_attachedCoverRequiresWorkaroundForOpenState != a3)
  {
    self->_attachedCoverRequiresWorkaroundForOpenState = a3;
    if (LODWORD(self->_supportedSensors))
    {
      v4 = 4;
      if (a3)
        v5 = 1;
      else
        v5 = 4;
      if (!a3)
        v4 = 1;
      self->_sensorsRequiredForOpenState = v5;
      self->_sensorsRequiredForAmbiguousState = v4;
      v6 = sub_100059844();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        sensorsRequiredForOpenState = self->_sensorsRequiredForOpenState;
        v9[0] = 67109120;
        v9[1] = sensorsRequiredForOpenState;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "HES required for open state is now:%x", (uint8_t *)v9, 8u);
      }

    }
  }
}

- (int)_smartCoverSensorsDidEngage:(unint64_t)a3
{
  unint64_t disengagedSensors;
  unint64_t supportedSensors;
  unint64_t v5;

  supportedSensors = self->_supportedSensors;
  disengagedSensors = self->_disengagedSensors;
  v5 = disengagedSensors & ~a3;
  self->_disengagedSensors = v5;
  if ((supportedSensors & v5) != 0)
    return 0;
  if (v5 == disengagedSensors && self->_state != 3)
    return 0;
  self->_state = 2;
  return 3;
}

- (int)_smartCoverSensorsDidDisengage:(unint64_t)a3
{
  int64_t state;
  unint64_t disengagedSensors;
  unint64_t sensorsRequiredForOpenState;
  unint64_t v6;
  BOOL v8;
  int64_t v9;
  int v10;
  unint64_t sensorsRequiredForAmbiguousState;

  state = self->_state;
  disengagedSensors = self->_disengagedSensors;
  sensorsRequiredForOpenState = self->_sensorsRequiredForOpenState;
  v6 = disengagedSensors | a3;
  self->_disengagedSensors = disengagedSensors | a3;
  if ((sensorsRequiredForOpenState & ~(disengagedSensors | a3)) != 0)
  {
    sensorsRequiredForAmbiguousState = self->_sensorsRequiredForAmbiguousState;
    if (v6 != disengagedSensors
      && sensorsRequiredForAmbiguousState != 0
      && (sensorsRequiredForAmbiguousState & v6) == sensorsRequiredForAmbiguousState)
    {
      v10 = 2;
      v9 = 3;
LABEL_20:
      self->_state = v9;
      return v10;
    }
  }
  else
  {
    v8 = v6 == disengagedSensors || state != 2;
    v9 = 1;
    v10 = 1;
    if (state == 3 || !v8)
      goto LABEL_20;
  }
  return 0;
}

- (BOOL)isSmartCoverClosed
{
  return self->_supportedSensors && self->_state == 2;
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8;
  id v9;
  __IOHIDEvent *v10;
  int IntegerValue;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  int64_t v15;
  id v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t TimeStamp;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  char v33;
  id v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  __CFString *v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  void *i;
  id v48;
  NSObject *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  _BOOL4 v60;
  __int16 v61;
  _BOOL4 v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  __CFString *v72;

  v8 = a4;
  v9 = a5;
  v10 = *a3;
  if (IOHIDEventGetIntegerValue(v10, 196608) == 65289)
  {
    if (-[BKSmartCoverHIDEventProcessor sensorsRequiredForOpenState](self, "sensorsRequiredForOpenState"))
    {
      IntegerValue = IOHIDEventGetIntegerValue(v10, 196609);
      v12 = IOHIDEventGetIntegerValue(v10, 196610);
      v13 = IntegerValue | 0xFF090000;
      if ((IntegerValue | 0xFF090000) + 16187391 < 4)
      {
        switch(IntegerValue)
        {
          case 1:
            v14 = 1;
            break;
          case 2:
            v14 = 4;
            break;
          case 3:
            v14 = 8;
            break;
          case 4:
            v14 = 16;
            break;
          default:
            if (IntegerValue == 32)
              v14 = 32;
            else
              v14 = 0;
            break;
        }
        if ((-[BKSmartCoverHIDEventProcessor supportedSensors](self, "supportedSensors") & v14) != 0)
        {
          if (v12)
            v32 = -[BKSmartCoverHIDEventProcessor _smartCoverSensorsDidEngage:](self, "_smartCoverSensorsDidEngage:", v14);
          else
            v32 = -[BKSmartCoverHIDEventProcessor _smartCoverSensorsDidDisengage:](self, "_smartCoverSensorsDidDisengage:", v14);
          v25 = v32;
          if ((_DWORD)v32)
          {
            BKSHIDEventSetSmartCoverInfo(v10, v32, -[BKSmartCoverHIDEventProcessor _wakeAnimationStyle](self, "_wakeAnimationStyle"));
            v33 = 0;
            goto LABEL_37;
          }
        }
        else
        {
          v25 = 0;
        }
        v33 = 1;
LABEL_37:
        v34 = sub_100059844();
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v50 = v12 != 0;
          v36 = sub_10007C878(self->_disengagedSensors);
          v51 = (void *)objc_claimAutoreleasedReturnValue(v36);
          v37 = sub_10007C878(self->_supportedSensors);
          v53 = (void *)objc_claimAutoreleasedReturnValue(v37);
          v38 = sub_10007C878(self->_sensorsRequiredForOpenState);
          v52 = (void *)objc_claimAutoreleasedReturnValue(v38);
          v39 = sub_10007C878(self->_sensorsRequiredForAmbiguousState);
          v40 = (id)objc_claimAutoreleasedReturnValue(v39);
          if ((v33 & 1) != 0)
          {
            v41 = CFSTR("<none>");
          }
          else
          {
            v42 = NSStringFromBKSHIDEventSmartCoverState(v25);
            v41 = (__CFString *)objc_claimAutoreleasedReturnValue(v42);
          }
          *(_DWORD *)buf = 67110658;
          v60 = IntegerValue;
          v61 = 1024;
          v62 = v50;
          v63 = 2114;
          v64 = v51;
          v65 = 2114;
          v66 = v53;
          v67 = 2114;
          v68 = v52;
          v69 = 2114;
          v70 = v40;
          v71 = 2114;
          v72 = v41;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "SmartCover event usage:%X engage:%{BOOL}u -> disengaged:%{public}@ all:%{public}@ trig:%{public}@ maybe:%{public}@ -> change:%{public}@", buf, 0x40u);
          if ((v33 & 1) == 0)

        }
        if (v10)
        {
LABEL_45:
          TimeStamp = IOHIDEventGetTimeStamp(v10);
          v28 = IOHIDEventGetIntegerValue(v10, 196608);
          v26 = IOHIDEventGetIntegerValue(v10, 196609);
          v29 = IOHIDEventGetIntegerValue(v10, 196610);
          goto LABEL_46;
        }
LABEL_18:
        v26 = 0;
        TimeStamp = 0;
        v28 = 0;
        v29 = 0;
LABEL_46:
        kdebug_trace(730465058, TimeStamp, v28, v26, v29);
        objc_msgSend(v9, "postEvent:fromSender:", v10, v8);
        if (!(_DWORD)v25)
        {
LABEL_55:
          v15 = 1;
          goto LABEL_56;
        }
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v17 = objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion context](self->_observerAssertion, "context"));
        v43 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v55;
          do
          {
            for (i = 0; i != v44; i = (char *)i + 1)
            {
              if (*(_QWORD *)v55 != v45)
                objc_enumerationMutation(v17);
              objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i), "smartCoverStateDidChange:", v25);
            }
            v44 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
          }
          while (v44);
        }
LABEL_54:

        goto LABEL_55;
      }
      if (v13 != -16187376)
      {
        if (v13 != -16187360)
        {
          v31 = sub_100059844();
          v17 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            v60 = IntegerValue;
            v61 = 1024;
            v62 = v12 != 0;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "SmertCover unknown usage: %X down:%{BOOL}u", buf, 0xEu);
          }
          goto LABEL_54;
        }
        v21 = sub_100059844();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v60 = v12 != 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "SmartCover StateUnknown:%{BOOL}u", buf, 8u);
        }

        if (v12)
        {
          self->_state = 3;
          BKSHIDEventSetSmartCoverInfo(v10, 2, -[BKSmartCoverHIDEventProcessor _wakeAnimationStyle](self, "_wakeAnimationStyle"));
          v23 = sub_100059844();
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Sending BKSHIDEventSmartCoverAmbiguousOpen", buf, 2u);
          }

          v25 = 2;
          if (v10)
            goto LABEL_45;
        }
        else
        {
          if (self->_state == 3 && (self->_sensorsRequiredForOpenState & self->_disengagedSensors) == 0)
          {
            v48 = sub_100059844();
            v49 = objc_claimAutoreleasedReturnValue(v48);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Recovering from unknown smart cover state; Sending BKSHIDEventSmartCoverClosed",
                buf,
                2u);
            }

            -[BKSmartCoverHIDEventProcessor _smartCoverSensorsDidEngage:](self, "_smartCoverSensorsDidEngage:", self->_sensorsRequiredForOpenState);
            BKSHIDEventSetSmartCoverInfo(v10, 3, -[BKSmartCoverHIDEventProcessor _wakeAnimationStyle](self, "_wakeAnimationStyle"));
          }
          v25 = 0;
          if (v10)
            goto LABEL_45;
        }
        goto LABEL_18;
      }
      v30 = sub_100059844();
      v17 = objc_claimAutoreleasedReturnValue(v30);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        goto LABEL_54;
      *(_DWORD *)buf = 67109120;
      v60 = v12 != 0;
      v18 = "SmartCover attach:%{BOOL}u";
      v19 = v17;
      v20 = 8;
    }
    else
    {
      v16 = sub_100059844();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        goto LABEL_54;
      *(_WORD *)buf = 0;
      v18 = "dropping smart cover event because we don't have any HES sensors";
      v19 = v17;
      v20 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    goto LABEL_54;
  }
  v15 = 0;
LABEL_56:

  return v15;
}

- (id)addSmartCoverObserver:(id)a3
{
  uint64_t v4;
  id v5;
  BSCompoundAssertion *observerAssertion;
  BSCompoundAssertion *v7;
  BSCompoundAssertion *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a3;
  observerAssertion = self->_observerAssertion;
  if (!observerAssertion)
  {
    v7 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue(+[BSCompoundAssertion assertionWithIdentifier:](BSCompoundAssertion, "assertionWithIdentifier:", CFSTR("backboardd.smart-cover-observer")));
    v8 = self->_observerAssertion;
    self->_observerAssertion = v7;

    observerAssertion = self->_observerAssertion;
  }
  v9 = objc_msgSend((id)objc_opt_class(v5, v4), "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion acquireForReason:withContext:](observerAssertion, "acquireForReason:withContext:", v10, v5));

  return v11;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;
  unint64_t state;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007C714;
  v12[3] = &unk_1000ECB10;
  v12[4] = self;
  v4 = a3;
  objc_msgSend(v4, "appendCustomFormatWithName:block:", CFSTR("disengagedSensors"), v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007C728;
  v11[3] = &unk_1000ECB10;
  v11[4] = self;
  objc_msgSend(v4, "appendCustomFormatWithName:block:", CFSTR("supportedSensors"), v11);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007C73C;
  v10[3] = &unk_1000ECB10;
  v10[4] = self;
  objc_msgSend(v4, "appendCustomFormatWithName:block:", CFSTR("sensorsRequiredForOpenState"), v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007C750;
  v9[3] = &unk_1000ECB10;
  v9[4] = self;
  objc_msgSend(v4, "appendCustomFormatWithName:block:", CFSTR("sensorsRequiredForAmbiguousState"), v9);
  v5 = objc_msgSend(v4, "appendBool:withName:", self->_attached, CFSTR("a"));
  v6 = objc_msgSend(v4, "appendBool:withName:", self->_unknownState, CFSTR("u"));
  state = self->_state;
  if (state >= 4)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<invalid:%d>"), self->_state));
  else
    v8 = *(&off_1000EC228 + state);
  objc_msgSend(v4, "appendString:withName:", v8, CFSTR("state"));

}

- (BOOL)attachedCoverRequiresWorkaroundForOpenState
{
  return self->_attachedCoverRequiresWorkaroundForOpenState;
}

- (BKIOHIDServiceMatcher)magicKeyboardExtendedMatcher
{
  return self->_magicKeyboardExtendedMatcher;
}

- (void)setMagicKeyboardExtendedMatcher:(id)a3
{
  objc_storeStrong((id *)&self->_magicKeyboardExtendedMatcher, a3);
}

- (NSMutableSet)magicKeyboardExtendedServices
{
  return self->_magicKeyboardExtendedServices;
}

- (void)setMagicKeyboardExtendedServices:(id)a3
{
  objc_storeStrong((id *)&self->_magicKeyboardExtendedServices, a3);
}

- (OS_dispatch_queue)matcherQueue
{
  return self->_matcherQueue;
}

- (void)setMatcherQueue:(id)a3
{
  objc_storeStrong((id *)&self->_matcherQueue, a3);
}

- (unint64_t)supportedSensors
{
  return self->_supportedSensors;
}

- (void)setSupportedSensors:(unint64_t)a3
{
  self->_supportedSensors = a3;
}

- (unint64_t)disengagedSensors
{
  return self->_disengagedSensors;
}

- (void)setDisengagedSensors:(unint64_t)a3
{
  self->_disengagedSensors = a3;
}

- (unint64_t)sensorsRequiredForOpenState
{
  return self->_sensorsRequiredForOpenState;
}

- (void)setSensorsRequiredForOpenState:(unint64_t)a3
{
  self->_sensorsRequiredForOpenState = a3;
}

- (unint64_t)sensorsRequiredForAmbiguousState
{
  return self->_sensorsRequiredForAmbiguousState;
}

- (void)setSensorsRequiredForAmbiguousState:(unint64_t)a3
{
  self->_sensorsRequiredForAmbiguousState = a3;
}

- (BOOL)isAttached
{
  return self->_attached;
}

- (void)setAttached:(BOOL)a3
{
  self->_attached = a3;
}

- (BOOL)isUnknownState
{
  return self->_unknownState;
}

- (void)setUnknownState:(BOOL)a3
{
  self->_unknownState = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcherQueue, 0);
  objc_storeStrong((id *)&self->_magicKeyboardExtendedServices, 0);
  objc_storeStrong((id *)&self->_magicKeyboardExtendedMatcher, 0);
  objc_storeStrong((id *)&self->_observerAssertion, 0);
}

+ (BOOL)isSmartCoverSupported
{
  if (qword_100117560 != -1)
    dispatch_once(&qword_100117560, &stru_1000EC1E0);
  return byte_100117558;
}

@end
