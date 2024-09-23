@implementation BackLightCCSiriPlusButtonLED

- (BackLightCCSiriPlusButtonLED)initWithParams:(__CFDictionary *)a3
{
  char *v3;
  BackLightCCSiriPlusButtonLED *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BackLightCCSiriPlusButtonLED;
  v3 = -[BackLightCC initWithParams:](&v6, "initWithParams:", a3);
  v4 = (BackLightCCSiriPlusButtonLED *)v3;
  if (v3)
  {
    *(_DWORD *)(v3 + 330) = -1;
    *(_DWORD *)(v3 + 338) = -1;
    *(_DWORD *)(v3 + 346) = 100;
    *(_DWORD *)(v3 + 334) = -1;
    *(_DWORD *)(v3 + 342) = -1;
    *(_DWORD *)(v3 + 350) = 100;
    objc_msgSend(v3, "setSolarBehaviorSuppressed:", 0);
  }
  return v4;
}

- (BOOL)findBacklightServices
{
  CFDictionaryRef v3;
  const __CFDictionary *v4;
  kern_return_t MatchingServices;
  BOOL v6;
  io_object_t v7;
  NSObject *v8;
  int v9;
  unsigned int v10;
  io_object_t v11;
  io_iterator_t existing;
  uint8_t buf[4];
  int v15;
  void *v16;
  void *v17;
  void *values;
  void *keys;

  keys = CFSTR("backlight-control");
  values = kCFBooleanTrue;
  *(&self->super._solarDetectorPresent + 5) = 0;
  v3 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v16 = v3;
  v17 = CFSTR("IOPropertyMatch");
  v4 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&v17, (const void **)&v16, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFRelease(v3);
  existing = 0;
  MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v4, &existing);
  v6 = 0;
  if (!MatchingServices)
  {
    if (*((unsigned __int8 *)&self->super._solarDetectorPresent + 5) > 1u)
    {
      v6 = 0;
    }
    else
    {
      v7 = IOIteratorNext(existing);
      *(_DWORD *)((char *)&self->super._brightnessSystemClient
                + 4 * *((unsigned __int8 *)&self->super._solarDetectorPresent + 5)
                + 6) = v7;
      v6 = v7 != 0;
      if (v7)
      {
        do
        {
          if (byte_1000A2480)
          {
            v8 = qword_1000A28A0;
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
            {
              v9 = *((unsigned __int8 *)&self->super._solarDetectorPresent + 5);
              *(_DWORD *)buf = 67109120;
              v15 = v9;
              _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> Found display no:%d", buf, 8u);
            }
          }
          v10 = ++*(&self->super._solarDetectorPresent + 5);
          if (v10 >= 2)
            break;
          v11 = IOIteratorNext(existing);
          *(_DWORD *)((char *)&self->super._brightnessSystemClient
                    + 4 * *((unsigned __int8 *)&self->super._solarDetectorPresent + 5)
                    + 6) = v11;
        }
        while (v11);
      }
    }
    IOObjectRelease(existing);
  }
  return v6;
}

- (void)refreshFunctionalTelemetry
{
  uint64_t v3;
  BackLightCCSiriPlusButtonLED *i;
  CFTypeRef v5;
  const void *v6;
  CFTypeID v7;
  const __CFDictionary *Value;
  const void *v9;
  CFTypeID v10;
  int v11;
  int v12;
  CFTypeID v13;
  char v14;
  _BYTE v15[15];
  char v16;
  _BYTE v17[15];
  char v18;
  _BYTE v19[15];
  char v20;
  _BYTE v21[15];
  char v22;
  _BYTE v23[7];
  uint64_t v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)BackLightCCSiriPlusButtonLED;
  -[BackLightCC refreshFunctionalTelemetry](&v25, "refreshFunctionalTelemetry");
  if (*(&self->super._solarDetectorPresent + 5))
  {
    v3 = 0;
    for (i = self; ; i = (BackLightCCSiriPlusButtonLED *)((char *)i + 4))
    {
      *(int *)((char *)&i->_brightnessMilliNitsCurrent[1] + 2) = 0;
      v5 = sub_10000497C(CFSTR("IODisplayParameters"), *(_DWORD *)((char *)&i->super._brightnessSystemClient + 6));
      v6 = v5;
      if (v5)
      {
        v7 = CFGetTypeID(v5);
        if (v7 == CFDictionaryGetTypeID())
          break;
      }
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      {
        sub_10004EF50(&v14, v15);
        if (!v6)
          goto LABEL_36;
      }
      else if (!v6)
      {
        goto LABEL_36;
      }
LABEL_35:
      CFRelease(v6);
LABEL_36:
      if (++v3 >= (unint64_t)*((unsigned __int8 *)&self->super._solarDetectorPresent + 5))
        return;
    }
    Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v6, CFSTR("brightness"));
    v9 = CFDictionaryGetValue((CFDictionaryRef)v6, CFSTR("BrightnessMilliNits"));
    if (Value && (v10 = CFGetTypeID(Value), v10 == CFDictionaryGetTypeID()))
    {
      v24 = 0;
      if (sub_1000048B0(Value, CFSTR("value"), kCFNumberIntType, (char *)&v24 + 4)
        && sub_1000048B0(Value, CFSTR("max"), kCFNumberIntType, &v24))
      {
        v11 = v24;
        if ((_DWORD)v24)
        {
          if ((int)v24 >= 0)
            v12 = v24;
          else
            v12 = v24 + 1;
          v11 = (100 * HIDWORD(v24) + (v12 >> 1)) / (int)v24;
        }
        *(int *)((char *)&i->_brightnessMilliNitsCurrent[1] + 2) = v11;
        if (!v9)
          goto LABEL_33;
LABEL_24:
        v13 = CFGetTypeID(v9);
        if (v13 == CFDictionaryGetTypeID())
        {
          if (!sub_1000048B0((CFDictionaryRef)v9, CFSTR("value"), kCFNumberIntType, (char *)i->gPowerServiceBL + 2)|| (sub_1000048B0((CFDictionaryRef)v9, CFSTR("max"), kCFNumberIntType, &i->displayCount + 2) & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
              sub_10004EFA0(&v18, v19);
            *(unsigned int *)((char *)i->gPowerServiceBL + 2) = -1;
            *(_DWORD *)(&i->displayCount + 2) = -1;
          }
          goto LABEL_35;
        }
        goto LABEL_33;
      }
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      {
        sub_10004EFF0(&v22, v23);
        if (v9)
          goto LABEL_24;
LABEL_33:
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_10004EF78(&v16, v17);
        goto LABEL_35;
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_10004EFC8(&v20, v21);
      if (v9)
        goto LABEL_24;
      goto LABEL_33;
    }
    if (v9)
      goto LABEL_24;
    goto LABEL_33;
  }
}

- (void)setBrightnessKey:(id)a3 value:(int)a4
{
  uint64_t v4;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  id v29;
  __int16 v30;
  int v31;

  v4 = *(_QWORD *)&a4;
  if (byte_1000A2480)
  {
    v7 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412546;
      v29 = a3;
      v30 = 1024;
      v31 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> BL set %@ to %d", (uint8_t *)&v28, 0x12u);
    }
  }
  v8 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", v4);
  v9 = objc_alloc((Class)NSNumber);
  if ((int)v4 <= 15)
    v10 = 15;
  else
    v10 = v4;
  v11 = objc_msgSend(v9, "initWithInt:", v10);
  v12 = v11;
  if (v8)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13)
  {
    if (objc_msgSend(*(id *)&self->super.currentPowerLevel, "setProperty:forKey:", CFSTR("DisplayTypeSiri"), CFSTR("DisplaySelect")))
    {
      if ((objc_msgSend(*(id *)&self->super.currentPowerLevel, "setProperty:forKey:", v12, a3) & 1) == 0)
      {
        v14 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_10004F080((uint64_t)a3, v14, v15, v16, v17, v18, v19, v20);
      }
    }
    if (objc_msgSend(*(id *)&self->super.currentPowerLevel, "setProperty:forKey:", CFSTR("DisplayTypeIcon"), CFSTR("DisplaySelect")))
    {
      if ((objc_msgSend(*(id *)&self->super.currentPowerLevel, "setProperty:forKey:", v8, a3) & 1) == 0)
      {
        v21 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_10004F018((uint64_t)a3, v21, v22, v23, v24, v25, v26, v27);
      }
    }
  }

}

- (int)numberOfFields
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BackLightCCSiriPlusButtonLED;
  return -[BackLightCC numberOfFields](&v3, "numberOfFields") + 6;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3;
  unsigned int v6;
  objc_super v7;
  objc_super v8;
  objc_super v9;

  v3 = *(_QWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)BackLightCCSiriPlusButtonLED;
  if (-[BackLightCC numberOfFields](&v9, "numberOfFields") <= a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)BackLightCCSiriPlusButtonLED;
    v6 = v3 - -[BackLightCC numberOfFields](&v7, "numberOfFields");
    if (v6 > 5)
      return 0;
    else
      return off_10007D268[v6];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BackLightCCSiriPlusButtonLED;
    return -[BackLightCC copyHeaderForIndex:](&v8, "copyHeaderForIndex:", v3);
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3;
  __CFString *result;
  const __CFAllocator *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;
  objc_super v12;
  objc_super v13;

  v3 = *(_QWORD *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)BackLightCCSiriPlusButtonLED;
  if (-[BackLightCC numberOfFields](&v13, "numberOfFields") <= a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)BackLightCCSiriPlusButtonLED;
    switch((_DWORD)v3 - -[BackLightCC numberOfFields](&v11, "numberOfFields"))
    {
      case 0:
        v6 = kCFAllocatorDefault;
        v7 = 330;
        goto LABEL_7;
      case 1:
        v6 = kCFAllocatorDefault;
        v7 = 338;
LABEL_7:
        v8 = *(_DWORD *)((char *)&self->super.super.super.super.isa + v7);
        goto LABEL_12;
      case 2:
        v6 = kCFAllocatorDefault;
        v9 = *(unsigned int *)((char *)&self->_brightnessMilliNitsCurrent[1] + 2);
        goto LABEL_14;
      case 3:
        v6 = kCFAllocatorDefault;
        v10 = 330;
        goto LABEL_11;
      case 4:
        v6 = kCFAllocatorDefault;
        v10 = 338;
LABEL_11:
        v8 = *(_DWORD *)((char *)&self->super.super.super.super.isa + v10 + 4);
LABEL_12:
        v9 = ((v8 + 500) / 1000);
        goto LABEL_14;
      case 5:
        v6 = kCFAllocatorDefault;
        v9 = *(unsigned int *)((char *)self->_brightnessMilliNitsMaximum + 2);
LABEL_14:
        result = (__CFString *)CFStringCreateWithFormat(v6, 0, CFSTR("%d"), v9);
        break;
      default:
        result = 0;
        break;
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)BackLightCCSiriPlusButtonLED;
    return -[BackLightCC copyFieldCurrentValueForIndex:](&v12, "copyFieldCurrentValueForIndex:", v3);
  }
  return result;
}

- (BOOL)solarBehaviorSuppressed
{
  return BYTE2(self->_brightnessMilliNitsMaximum[1]);
}

- (void)setSolarBehaviorSuppressed:(BOOL)a3
{
  BYTE2(self->_brightnessMilliNitsMaximum[1]) = a3;
}

- (BOOL)solarDetectorPresent
{
  return HIBYTE(self->_brightnessMilliNitsMaximum[1]);
}

- (void)setSolarDetectorPresent:(BOOL)a3
{
  HIBYTE(self->_brightnessMilliNitsMaximum[1]) = a3;
}

@end
