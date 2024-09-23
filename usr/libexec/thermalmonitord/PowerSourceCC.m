@implementation PowerSourceCC

- (PowerSourceCC)initWithParams:(__CFDictionary *)a3
{
  PowerSourceCC *v4;
  PowerSourceCC *v5;
  unsigned int v6;
  const __CFDictionary *Value;
  const __CFDictionary *v8;
  id v9;
  NSObject *v10;
  uint8_t buf[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PowerSourceCC;
  v4 = -[ComponentControl initWithCC::](&v13, "initWithCC::", 1, a3);
  v5 = v4;
  if (v4)
  {
    *(&v4->super.currentPower + 1) = 0;
    v4->chargeLevel = -1;
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    v4->super.maxLoadingIndex = 0;
    v4->previousChargeLevel = 1199570944;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("%d PwrSrc "), 1);
    v6 = sub_1000340B8("IOPMPowerSource", CFSTR("BatteryInstalled"), kCFBooleanTrue);
    LODWORD(v5->smcThermalChargeRate) = v6;
    if (!v6 && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_1000554D8();
      if (!a3)
        goto LABEL_11;
    }
    else if (!a3)
    {
      goto LABEL_11;
    }
    if (CFDictionaryContainsKey(a3, CFSTR("ChargeLimitTable")))
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(a3, CFSTR("ChargeLimitTable"));
      if (Value)
      {
        v8 = Value;
        *(_QWORD *)&v5->familyCode = (id)CFDictionaryGetValue(Value, CFSTR("maxLIs"));
        *(NSArray **)((char *)&v5->maxLITable + 4) = (NSArray *)(id)CFDictionaryGetValue(v8, CFSTR("chargeLimit"));
        v9 = objc_msgSend(*(id *)&v5->familyCode, "count");
        if (v9 != objc_msgSend(*(id *)((char *)&v5->maxLITable + 4), "count")
          && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        {
          sub_1000554AC();
        }
      }
LABEL_15:
      -[PowerSourceCC getAdaptorPMUValue](v5, "getAdaptorPMUValue");
      return v5;
    }
LABEL_11:
    if (byte_1000A2480)
    {
      v10 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> No chargeLimit table defined in the plist, using the default one", buf, 2u);
      }
    }
    *(_QWORD *)&v5->familyCode = &off_1000858B8;
    *(NSArray **)((char *)&v5->maxLITable + 4) = (NSArray *)&off_1000858D0;
    goto LABEL_15;
  }
  return v5;
}

- (void)dealloc
{
  float smcThermalChargeRate;
  objc_super v4;

  smcThermalChargeRate = self->smcThermalChargeRate;
  if (smcThermalChargeRate != 0.0)
    IOObjectRelease(LODWORD(smcThermalChargeRate));

  *(_QWORD *)&self->familyCode = 0;
  *(NSArray **)((char *)&self->maxLITable + 4) = 0;
  v4.receiver = self;
  v4.super_class = (Class)PowerSourceCC;
  -[PidComponent dealloc](&v4, "dealloc");
}

- (void)defaultAction
{
  char *v3;
  char *v4;
  char *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int previousValue;
  _BOOL4 v10;
  unsigned int *v11;
  int v12;
  NSObject *v14;
  CFNumberRef v15;
  CFNumberRef v16;
  kern_return_t v17;
  NSObject *v18;
  _DWORD v19[2];

  if (LODWORD(self->smcThermalChargeRate))
  {
    if (self->super.previousValue != self->super.maxLoadingIndex)
    {
      v3 = (char *)objc_msgSend(*(id *)&self->familyCode, "count");
      if (v3)
      {
        v4 = 0;
        v5 = v3 - 1;
        do
        {
          v6 = objc_msgSend(objc_msgSend(*(id *)((char *)&self->maxLITable + 4), "objectAtIndex:", v4), "intValue");
          v7 = objc_msgSend(objc_msgSend(*(id *)&self->familyCode, "objectAtIndex:", v4), "intValue");
          previousValue = self->super.previousValue;
          if (previousValue > v7)
            break;
          *(&self->super.currentPower + 1) = v6;
        }
        while (previousValue != v7 && v5 != v4++);
      }
    }
    self->super.maxLoadingIndex = self->super.previousValue;
    v10 = sub_100003320(LODWORD(self->smcThermalChargeRate), CFSTR("IsCharging"));
    v11 = &self->super.currentPower + 1;
    v12 = *(&self->super.currentPower + 1);
    if (v12 != self->chargeLevel && v10)
    {
      if (byte_1000A2480)
      {
        v14 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          v19[0] = 67109120;
          v19[1] = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<Notice> Setting chargeLimit to %d", (uint8_t *)v19, 8u);
        }
      }
      v15 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, v11);
      if (v15)
      {
        v16 = v15;
        v17 = IORegistryEntrySetCFProperty(LODWORD(self->smcThermalChargeRate), CFSTR("AppleChargeRateLimitIndex"), v15);
        CFRelease(v16);
        if (v17)
        {
          if (((++dword_1000A2404 & 0x1F) == 0 || byte_1000A2480)
            && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          {
            sub_1000555A4();
          }
        }
        else
        {
          self->chargeLevel = *v11;
        }
      }
      else
      {
        v18 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_100055530((int *)v11, v18);
      }
    }
  }
  else if ((byte_1000A2400 & 1) == 0)
  {
    byte_1000A2400 = 1;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100055504();
  }
}

- (void)getAdaptorPMUValue
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  const __CFNumber *Value;
  const __CFNumber *v6;
  CFTypeID v7;
  const __CFNumber *v8;
  const __CFNumber *v9;
  CFTypeID v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  CFTypeID v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  CFTypeID v16;
  const __CFNumber *v17;
  const __CFNumber *v18;
  CFTypeID v19;

  v3 = IOPSCopyExternalPowerAdapterDetails();
  if (v3)
  {
    v4 = v3;
    if (CFDictionaryContainsKey(v3, CFSTR("AdapterID")))
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(v4, CFSTR("AdapterID"));
      if (Value)
      {
        v6 = Value;
        v7 = CFGetTypeID(Value);
        if (v7 == CFNumberGetTypeID())
          CFNumberGetValue(v6, kCFNumberShortType, (char *)&self->pmuPowerService + 2);
      }
    }
    if (CFDictionaryContainsKey(v4, CFSTR("Watts")))
    {
      v8 = (const __CFNumber *)CFDictionaryGetValue(v4, CFSTR("Watts"));
      if (v8)
      {
        v9 = v8;
        v10 = CFGetTypeID(v8);
        if (v10 == CFNumberGetTypeID())
          CFNumberGetValue(v9, kCFNumberIntType, &self->inputCurrent);
      }
    }
    if (CFDictionaryContainsKey(v4, CFSTR("FamilyCode")))
    {
      v11 = (const __CFNumber *)CFDictionaryGetValue(v4, CFSTR("FamilyCode"));
      if (v11)
      {
        v12 = v11;
        v13 = CFGetTypeID(v11);
        if (v13 == CFNumberGetTypeID())
          CFNumberGetValue(v12, kCFNumberIntType, &self->watts);
      }
    }
    if (CFDictionaryContainsKey(v4, CFSTR("Current")))
    {
      v14 = (const __CFNumber *)CFDictionaryGetValue(v4, CFSTR("Current"));
      if (v14)
      {
        v15 = v14;
        v16 = CFGetTypeID(v14);
        if (v16 == CFNumberGetTypeID())
          CFNumberGetValue(v15, kCFNumberShortType, &self->pmuPowerService);
      }
    }
    if (CFDictionaryContainsKey(v4, CFSTR("PMUConfiguration")))
    {
      v17 = (const __CFNumber *)CFDictionaryGetValue(v4, CFSTR("PMUConfiguration"));
      if (v17)
      {
        v18 = v17;
        v19 = CFGetTypeID(v17);
        if (v19 == CFNumberGetTypeID())
          CFNumberGetValue(v18, kCFNumberShortType, &self->availableCurrent);
      }
    }
    CFRelease(v4);
  }
}

- (void)refreshTGraphTelemetry
{
  float smcThermalChargeRate;
  unsigned int previousValue;

  smcThermalChargeRate = self->smcThermalChargeRate;
  if (smcThermalChargeRate != 0.0)
  {
    if (sub_100003320(LODWORD(smcThermalChargeRate), CFSTR("IsCharging")))
      previousValue = self->super.previousValue;
    else
      previousValue = sub_100003320(LODWORD(self->smcThermalChargeRate), CFSTR("ExternalConnected"));
    *(_DWORD *)&self->super.allowLIOverride = previousValue;
    self->previousChargeLevel = -[SensorDispatcherHelper getValueFromSMCForKey:](+[SensorDispatcherHelper sharedInstance](SensorDispatcherHelper, "sharedInstance"), "getValueFromSMCForKey:", CFSTR("B1TI"));
  }
}

- (int)numberOfFields
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PowerSourceCC;
  return -[ComponentControl numberOfFields](&v3, "numberOfFields") + 2;
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
  v10.super_class = (Class)PowerSourceCC;
  if (-[ComponentControl numberOfFields](&v10, "numberOfFields") <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)PowerSourceCC;
    v6 = -[ComponentControl numberOfFields](&v8, "numberOfFields");
    if ((_DWORD)v3 - v6 == 1)
      v7 = CFSTR("B1TI - Charge rate thermal");
    else
      v7 = 0;
    if ((_DWORD)v3 == v6)
      return CFSTR("PwrSrc - Charge limit index");
    else
      return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PowerSourceCC;
    return -[ComponentControl copyHeaderForIndex:](&v9, "copyHeaderForIndex:", v3);
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3;
  int v6;
  objc_super v7;
  objc_super v8;
  objc_super v9;

  v3 = *(_QWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)PowerSourceCC;
  if (-[ComponentControl numberOfFields](&v9, "numberOfFields") <= a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)PowerSourceCC;
    v6 = v3 - -[ComponentControl numberOfFields](&v7, "numberOfFields");
    if (v6 == 1)
    {
      return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%f"), *(float *)&self->previousChargeLevel);
    }
    else if (v6)
    {
      return 0;
    }
    else
    {
      return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), *(&self->super.currentPower + 1));
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PowerSourceCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v8, "copyFieldCurrentValueForIndex:", v3);
  }
}

@end
