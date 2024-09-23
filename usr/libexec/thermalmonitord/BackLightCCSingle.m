@implementation BackLightCCSingle

- (void)refreshFunctionalTelemetry
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  CFTypeID v5;
  const __CFDictionary *Value;
  const void *v7;
  CFTypeID v8;
  int v9;
  int v10;
  CFTypeID v11;
  io_registry_entry_t v12;
  CFTypeRef v13;
  void *v14;
  CFTypeID v15;
  NSObject *v16;
  NSDate *v17;
  uint64_t Samples;
  __IOReportSubscriptionCF *v19;
  const void *SamplesDelta;
  uint64_t v21;
  _QWORD v22[5];
  int v23;
  uint8_t buf[16];
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)BackLightCCSingle;
  -[BackLightCC refreshFunctionalTelemetry](&v25, "refreshFunctionalTelemetry");
  *(_DWORD *)&self->super.super.allowLIOverride = 0;
  v3 = (const __CFDictionary *)sub_10000497C(CFSTR("IODisplayParameters"), *(_DWORD *)((char *)&self->super._brightnessSystemClient + 6));
  v4 = v3;
  if (v3)
  {
    v5 = CFGetTypeID(v3);
    if (v5 == CFDictionaryGetTypeID())
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(v4, CFSTR("brightness"));
      v7 = CFDictionaryGetValue(v4, CFSTR("BrightnessMilliNits"));
      if (Value && (v8 = CFGetTypeID(Value), v8 == CFDictionaryGetTypeID()))
      {
        v23 = 0;
        *(_DWORD *)buf = 0;
        if (sub_1000048B0(Value, CFSTR("value"), kCFNumberIntType, buf)
          && sub_1000048B0(Value, CFSTR("max"), kCFNumberIntType, &v23))
        {
          v9 = v23;
          if (v23)
          {
            if (v23 >= 0)
              v10 = v23;
            else
              v10 = v23 + 1;
            v9 = (100 * *(_DWORD *)buf + (v10 >> 1)) / v23;
          }
          *(_DWORD *)&self->super.super.allowLIOverride = v9;
          if (!v7)
            goto LABEL_28;
LABEL_21:
          v11 = CFGetTypeID(v7);
          if (v11 == CFDictionaryGetTypeID())
          {
            if (!sub_1000048B0((CFDictionaryRef)v7, CFSTR("value"), kCFNumberIntType, &self->super._solarDetectorPresent + 1)|| (sub_1000048B0((CFDictionaryRef)v7, CFSTR("max"), kCFNumberIntType, &self->super._solarDetectorPresent + 5) & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
                sub_100053CF4();
              *(_DWORD *)(&self->super._solarDetectorPresent + 1) = -1;
              *(_DWORD *)(&self->super._solarDetectorPresent + 5) = -1;
            }
            goto LABEL_30;
          }
LABEL_28:
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
            sub_100053CC8();
          goto LABEL_30;
        }
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        {
          sub_100053D4C();
          if (!v7)
            goto LABEL_28;
          goto LABEL_21;
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      {
        sub_100053D20();
        if (!v7)
          goto LABEL_28;
        goto LABEL_21;
      }
      if (!v7)
        goto LABEL_28;
      goto LABEL_21;
    }
  }
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100053C9C();
LABEL_30:
  if (byte_1000A2DC0)
  {
    v12 = *(_DWORD *)((char *)&self->lastDisplayReading + 6);
    if (v12)
    {
      v13 = sub_10000497C(CFSTR("IOMFBBrightnessLevel"), v12);
      v14 = (void *)v13;
      if (v13)
      {
        v15 = CFGetTypeID(v13);
        if (v15 == CFNumberGetTypeID())
        {
          *(float *)&dword_1000A2AD4 = (float)(int)objc_msgSend(v14, "intValue") * 0.000015259;
LABEL_38:
          CFRelease(v14);
          goto LABEL_39;
        }
      }
      v16 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "<Notice> IOMFB brightness not available or not a number type\n", buf, 2u);
      }
      if (v14)
        goto LABEL_38;
    }
  }
LABEL_39:
  if (!*(_QWORD *)((char *)&self->_brightnessMilliNitsMaximum + 6)
    || !*(_QWORD *)((char *)&self->_brightnessMilliNitsCurrent + 2))
  {
LABEL_44:
    if (v4)
      CFRelease(v4);
    return;
  }
  v17 = +[NSDate date](NSDate, "date");
  Samples = IOReportCreateSamples(*(_QWORD *)((char *)&self->_brightnessMilliNitsCurrent + 2), *(_QWORD *)((char *)&self->_brightnessMilliNitsMaximum + 6), 0);
  if (Samples)
  {
    v19 = (__IOReportSubscriptionCF *)Samples;
    SamplesDelta = (const void *)IOReportCreateSamplesDelta(*(__IOReportSubscriptionCF **)((char *)&self->displaySubscription + 6), Samples, 0);
    CFRelease(*(CFTypeRef *)((char *)&self->displaySubscription + 6));
    *(__IOReportSubscriptionCF **)((char *)&self->displaySubscription + 6) = v19;
    -[NSDate timeIntervalSinceDate:](v17, "timeIntervalSinceDate:", *(__CFDictionary **)((char *)&self->displayChannels + 6));
    *(__CFDictionary **)((char *)&self->displayChannels + 6) = (__CFDictionary *)v17;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000042B0;
    v22[3] = &unk_10007E1D8;
    v22[4] = v21;
    IOReportIterate(SamplesDelta, v22);
    if (SamplesDelta)
      CFRelease(SamplesDelta);
    goto LABEL_44;
  }
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100053C70();
}

- (int)numberOfFields
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BackLightCCSingle;
  return -[BackLightCC numberOfFields](&v3, "numberOfFields") + 2;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3;
  int v6;
  const __CFAllocator *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  objc_super v11;
  objc_super v12;

  v3 = *(_QWORD *)&a3;
  v12.receiver = self;
  v12.super_class = (Class)BackLightCCSingle;
  if (-[BackLightCC numberOfFields](&v12, "numberOfFields") > a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)BackLightCCSingle;
    return -[BackLightCC copyFieldCurrentValueForIndex:](&v11, "copyFieldCurrentValueForIndex:", v3);
  }
  v10.receiver = self;
  v10.super_class = (Class)BackLightCCSingle;
  v6 = v3 - -[BackLightCC numberOfFields](&v10, "numberOfFields");
  if (v6 == 1)
  {
    v7 = kCFAllocatorDefault;
    v8 = 326;
    goto LABEL_7;
  }
  if (!v6)
  {
    v7 = kCFAllocatorDefault;
    v8 = 322;
LABEL_7:
    v9 = 274877907 * (*(_DWORD *)((char *)&self->super.super.super.super.isa + v8) + 500);
    return (__CFString *)CFStringCreateWithFormat(v7, 0, CFSTR("%d"), (v9 >> 38) + ((unint64_t)v9 >> 63));
  }
  return 0;
}

- (void)updateSensorExchangeTelemetry
{
  uint64_t v2;

  v2 = 274877907 * (*(_DWORD *)(&self->super._solarDetectorPresent + 5) + 500);
  *(float *)&dword_1000A2AD0 = (float)(int)((v2 >> 38) + ((unint64_t)v2 >> 63));
  *(float *)&dword_1000A2AE4 = (float)*(unsigned int *)&self->super.super.allowLIOverride;
}

- (BackLightCCSingle)initWithParams:(__CFDictionary *)a3
{
  char *v3;
  char *v4;
  int MainDisplay;
  NSObject *v6;
  uint64_t v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BackLightCCSingle;
  v3 = -[BackLightCC initWithParams:](&v12, "initWithParams:", a3);
  v4 = v3;
  if (v3)
  {
    *((_DWORD *)v3 + 18) = 100;
    *(_DWORD *)(v3 + 322) = -1;
    *(_DWORD *)(v3 + 326) = -1;
    objc_msgSend(v3, "setSolarBehaviorSuppressed:", 0);
    if (byte_1000A2DC0)
    {
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 5, CFSTR("zETM"), 5);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 4, CFSTR("zETM"), 4);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 9, CFSTR("zETM"), 9);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:](+[SensorExchangeHelper sharedInstance](SensorExchangeHelper, "sharedInstance"), "registerCLTMSensorIndex:forSMCKey:atSMCIndex:", 16, CFSTR("zETM"), 16);
      MainDisplay = IOMobileFramebufferGetMainDisplay(&qword_1000A2E30);
      if (MainDisplay || !qword_1000A2E30)
      {
        v6 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_100053C00(MainDisplay, v6);
        qword_1000A2E30 = 0;
      }
      else
      {
        *(_DWORD *)(v4 + 366) = IOMobileFramebufferGetServiceObject();
      }
    }
    v7 = IOReportCopyChannelsInGroup(CFSTR("DCP"), CFSTR("display stats"), 0, 0);
    if (v7)
    {
      v8 = (const void *)v7;
      *(_QWORD *)(v4 + 334) = IOReportCreateSubscription(0, v7, v4 + 342, 0, 0);
      CFRelease(v8);
      v9 = *(_QWORD *)(v4 + 342);
      if (v9)
      {
        v10 = *(_QWORD *)(v4 + 334);
        if (v10)
        {
          *(_QWORD *)(v4 + 350) = IOReportCreateSamples(v10, v9, 0);
          *(_QWORD *)(v4 + 358) = +[NSDate date](NSDate, "date");
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100053BD4();
    }
  }
  return (BackLightCCSingle *)v4;
}

- (BOOL)findBacklightServices
{
  unsigned int v3;

  v3 = sub_1000340B8("AppleARMBacklight", CFSTR("backlight-control"), kCFBooleanTrue);
  *(_DWORD *)((char *)&self->super._brightnessSystemClient + 6) = v3;
  if (!v3 && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100053ADC();
  return v3 != 0;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3;
  unsigned int v6;
  __CFString *v7;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v3 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)BackLightCCSingle;
  if (-[BackLightCC numberOfFields](&v10, "numberOfFields") <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)BackLightCCSingle;
    v6 = -[BackLightCC numberOfFields](&v8, "numberOfFields");
    if ((_DWORD)v3 - v6 == 1)
      v7 = CFSTR("Backlight - nits maximum");
    else
      v7 = 0;
    if ((_DWORD)v3 == v6)
      return CFSTR("Backlight - nits current");
    else
      return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BackLightCCSingle;
    return -[BackLightCC copyHeaderForIndex:](&v9, "copyHeaderForIndex:", v3);
  }
}

@end
