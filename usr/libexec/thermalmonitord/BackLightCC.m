@implementation BackLightCC

- (int)numberOfFields
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BackLightCC;
  return -[ComponentControl numberOfFields](&v3, "numberOfFields") + 3;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3;
  int v6;
  const __CFAllocator *v7;
  uint64_t maxLICeiling;
  objc_super v9;
  objc_super v10;
  objc_super v11;

  v3 = *(_QWORD *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)BackLightCC;
  if (-[ComponentControl numberOfFields](&v11, "numberOfFields") > a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)BackLightCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v10, "copyFieldCurrentValueForIndex:", v3);
  }
  v9.receiver = self;
  v9.super_class = (Class)BackLightCC;
  v6 = v3 - -[ComponentControl numberOfFields](&v9, "numberOfFields");
  if (v6 == 2)
  {
    v7 = kCFAllocatorDefault;
    maxLICeiling = self->_maxLICeiling;
    return (__CFString *)CFStringCreateWithFormat(v7, 0, CFSTR("%d"), maxLICeiling);
  }
  if (v6 == 1)
  {
    v7 = kCFAllocatorDefault;
    maxLICeiling = self->brightnessLevelDown[5];
    return (__CFString *)CFStringCreateWithFormat(v7, 0, CFSTR("%d"), maxLICeiling);
  }
  if (v6)
    return 0;
  else
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), -[ContextAwareThermalManager getContextState:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "getContextState:", 0));
}

- (BOOL)shouldSuppressMitigations
{
  if (*((_BYTE *)&self->super.currentPower + 4))
    return !-[BackLightCC solarBehaviorSuppressed](self, "solarBehaviorSuppressed");
  else
    return 0;
}

- (void)refreshFunctionalTelemetry
{
  if (BYTE5(self->_brightnessSystemClient))
    *((_BYTE *)&self->super.currentPower + 4) = -[ContextAwareThermalManager isContextTriggered:](+[ContextAwareThermalManager sharedInstance](ContextAwareThermalManager, "sharedInstance"), "isContextTriggered:", 0);
}

- (BackLightCC)initWithParams:(__CFDictionary *)a3
{
  BackLightCC *v4;
  BackLightCC *v5;
  id v6;
  id v7;
  NSObject *v8;
  const void *Value;
  const void *v10;
  int releaseRate;
  objc_super v13;
  uint8_t buf[4];
  id v15;

  v13.receiver = self;
  v13.super_class = (Class)BackLightCC;
  v4 = -[ComponentControl initWithCC::](&v13, "initWithCC::", 0, 0);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)&v4->super.currentPower + 5) = 0;
    *((_BYTE *)&v4->super.currentPower + 6) = 0;
    v4->brightnessLevelDown[6] = 100;
    v4->brightnessLevelDown[5] = 100;
    *(_DWORD *)&v4->super.allowLIOverride = -1;
    *(_DWORD *)&v4->brightnessLevelDown[7] = 100;
    v4->_maxLICeiling = 100;
    v4->_maxLICeilingSoft = -1;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("%d BackLight "), 0);
    v5->super.releaseMaxLI = 2;
    sub_1000048B0(a3, CFSTR("MaxReleaseRate"), kCFNumberIntType, &v5->super.releaseMaxLI);
    if (!-[BackLightCC findBacklightServices](v5, "findBacklightServices")
      && os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100053ADC();
    }
    v6 = objc_alloc_init((Class)BrightnessSystemClient);
    *(_QWORD *)&v5->currentPowerLevel = v6;
    if (v6)
    {
      if (byte_1000A2480)
      {
        v7 = v6;
        v8 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v15 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> brightness client %p", buf, 0xCu);
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100053AB0();
    }
    LOBYTE(v5->powerLevelDown[8]) = 0;
    -[ComponentControl updatePowerParameters:](v5, "updatePowerParameters:", a3);
    if (sub_100034168(a3, CFSTR("expectsCPMSSupport"), 0))
    {
      Value = CFDictionaryGetValue(a3, CFSTR("BacklightPower"));
      if (Value)
      {
        -[BackLightCC initPowerTable:](v5, "initPowerTable:", Value);
        -[BackLightCC setCPMSMitigationState:](v5, "setCPMSMitigationState:", 1);
      }
      else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      {
        sub_100053A84();
      }
    }
    v10 = CFDictionaryGetValue(a3, CFSTR("BacklightBrightness"));
    if (v10)
      -[BackLightCC initBrightnessTable:](v5, "initBrightnessTable:", v10);
    LOBYTE(v5->_maxLICeilingSoftPrevious) = 0;
    *(_DWORD *)&v5->powerLevelElem = 0;
    if (LOBYTE(v5->super._minPower))
      releaseRate = v5->super.releaseRate;
    else
      releaseRate = 65000;
    *(_DWORD *)&v5->powerLevelTableDefined = releaseRate;
  }
  return v5;
}

- (void)setBrightnessKey:(id)a3 value:(int)a4
{
  uint64_t v4;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  int v14;

  v4 = *(_QWORD *)&a4;
  if (byte_1000A2480)
  {
    v7 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = a3;
      v13 = 1024;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> BL set %@ to %d", (uint8_t *)&v11, 0x12u);
    }
  }
  v8 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", v4);
  if (v8)
  {
    v9 = v8;
    if ((objc_msgSend(*(id *)&self->currentPowerLevel, "setProperty:forKey:", v8, a3) & 1) == 0)
    {
      v10 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100053B08((uint64_t)a3, v10);
    }

  }
}

- (void)defaultAction
{
  unsigned int previousValue;
  uint64_t v4;
  char v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  uint64_t maxLICeiling;
  NSObject *v10;
  int v11;
  int v12;

  previousValue = self->super.previousValue;
  v4 = *((unsigned __int8 *)&self->super.currentPower + 6);
  if (previousValue > *((unsigned __int8 *)&self->super.currentPower + v4 + 7))
  {
    if (!*((_BYTE *)&self->super.currentPower + 6))
      goto LABEL_8;
    v5 = -1;
    goto LABEL_7;
  }
  if (previousValue < self->brightnessLevels[v4 + 5]
    && *((unsigned __int8 *)&self->super.currentPower + 5) - 1 > (int)v4)
  {
    v5 = 1;
LABEL_7:
    *((_BYTE *)&self->super.currentPower + 6) = v4 + v5;
  }
LABEL_8:
  self->brightnessLevelDown[6] = self->brightnessLevelDown[5];
  v6 = self->brightnessLevelUp[*((unsigned __int8 *)&self->super.currentPower + 6) + 5];
  self->brightnessLevelDown[5] = v6;
  v7 = *(_DWORD *)&self->brightnessLevelDown[7];
  if (v7 < (int)v6)
  {
    v6 = *(_DWORD *)&self->brightnessLevelDown[7];
    self->brightnessLevelDown[5] = v7;
  }
  if (!LOBYTE(self->powerLevelDown[8]))
  {
    if ((_DWORD)v6 != self->brightnessLevelDown[6])
    {
      v8 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 67109120;
        v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> set Backlight: %d", (uint8_t *)&v11, 8u);
        v6 = self->brightnessLevelDown[5];
      }
      -[BackLightCC setBrightnessKey:value:](self, "setBrightnessKey:value:", CFSTR("MaxBrightness"), v6);
    }
    maxLICeiling = self->_maxLICeiling;
    if ((_DWORD)maxLICeiling != self->_maxLICeilingSoft)
    {
      v10 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 67109120;
        v12 = maxLICeiling;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> BL soft: %d", (uint8_t *)&v11, 8u);
        maxLICeiling = self->_maxLICeiling;
      }
      -[BackLightCC setBrightnessKey:value:](self, "setBrightnessKey:value:", CFSTR("BrightnessWeakCap"), maxLICeiling);
      self->_maxLICeilingSoft = self->_maxLICeiling;
    }
  }
}

- (void)defaultCPMSAction
{
  unsigned int previousValue;
  uint64_t v4;
  int v5;
  unsigned int releaseRate;
  unsigned int v7;
  NSObject *v8;
  int v9;
  __CFString *v10;
  __int16 v11;
  unsigned int v12;

  previousValue = self->super.previousValue;
  v4 = *(unsigned int *)&self->powerLevelElem;
  if (previousValue <= *(&self->powerLevelPointer + v4))
  {
    if (previousValue >= self->powerLevels[v4 + 8]
      || v4 >= LOBYTE(self->_maxLICeilingSoftPrevious) - 1)
    {
      goto LABEL_8;
    }
    v5 = 1;
  }
  else
  {
    if (!(_DWORD)v4)
      goto LABEL_8;
    v5 = -1;
  }
  LODWORD(v4) = v4 + v5;
  *(_DWORD *)&self->powerLevelElem = v4;
LABEL_8:
  if (self->super.previousValue == 101)
    releaseRate = self->super.releaseRate;
  else
    releaseRate = self->powerLevelUp[v4 + 8];
  *(_DWORD *)&self->powerLevelTableDefined = releaseRate;
  v7 = self->super.releaseRate;
  if (releaseRate > v7)
  {
    *(_DWORD *)&self->powerLevelTableDefined = v7;
    releaseRate = v7;
  }
  if (releaseRate != -[ComponentControl powerTarget](self, "powerTarget"))
  {
    -[ComponentControl setPowerTarget:](self, "setPowerTarget:", *(unsigned int *)&self->powerLevelTableDefined);
    if (byte_1000A2480)
    {
      v8 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138412546;
        v10 = -[PidComponent nameofComponent](self, "nameofComponent");
        v11 = 1024;
        v12 = -[ComponentControl powerTarget](self, "powerTarget");
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> DefaultCPMSAction for %@, set powerTarget:%u", (uint8_t *)&v9, 0x12u);
      }
    }
    -[CPMSHelper addToCPMSMitigationArray:forComponent:](+[CPMSHelper sharedInstance](CPMSHelper, "sharedInstance"), "addToCPMSMitigationArray:forComponent:", -[ComponentControl powerTarget](self, "powerTarget"), self->super.super.mitigationType);
  }
}

- (void)setMaxLICeiling:(int)a3
{
  *(_DWORD *)&self->brightnessLevelDown[7] = a3;
}

- (void)setMaxLICeilingSoft:(int)a3
{
  self->_maxLICeiling = a3;
}

- (void)initBrightnessTable:(__CFArray *)a3
{
  CFTypeID v5;
  char Count;
  unint64_t v7;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v9;
  CFTypeID v10;
  const __CFNumber *Value;
  const __CFNumber *v12;
  const __CFNumber *v13;
  NSObject *v14;
  uint64_t i;
  int valuePtr;
  uint64_t v17;
  uint8_t buf[4];
  int v19;

  if (a3 && (v5 = CFGetTypeID(a3), v5 == CFArrayGetTypeID()))
  {
    v17 = 0;
    valuePtr = 0;
    Count = CFArrayGetCount(a3);
    *((_BYTE *)&self->super.currentPower + 5) = Count;
    if (Count)
    {
      v7 = 0;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v7);
        if (ValueAtIndex && (v9 = ValueAtIndex, v10 = CFGetTypeID(ValueAtIndex), v10 == CFDictionaryGetTypeID()))
        {
          Value = (const __CFNumber *)CFDictionaryGetValue(v9, CFSTR("up"));
          if (Value)
          {
            CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
            *((_BYTE *)&self->super.currentPower + v7 + 7) = valuePtr;
          }
          v12 = (const __CFNumber *)CFDictionaryGetValue(v9, CFSTR("down"));
          if (v12)
          {
            CFNumberGetValue(v12, kCFNumberSInt32Type, &v17);
            self->brightnessLevels[v7 + 5] = v17;
          }
          v13 = (const __CFNumber *)CFDictionaryGetValue(v9, CFSTR("level"));
          if (v13)
          {
            CFNumberGetValue(v13, kCFNumberSInt32Type, (char *)&v17 + 4);
            self->brightnessLevelUp[v7 + 5] = BYTE4(v17);
          }
        }
        else
        {
          v14 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v19 = v7;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "<Error> Missing Brightness Dictionary %d", buf, 8u);
          }
        }
        ++v7;
      }
      while (v7 < *((unsigned __int8 *)&self->super.currentPower + 5));
    }
  }
  else
  {
    for (i = 0; i != 9; ++i)
    {
      self->brightnessLevelUp[i + 5] = 100;
      self->brightnessLevels[i + 5] = 100;
      *((_BYTE *)&self->super.currentPower + i + 7) = 100;
    }
    *((_BYTE *)&self->super.currentPower + 5) = 5;
  }
}

- (void)initPowerTable:(__CFArray *)a3
{
  CFTypeID v5;
  char Count;
  unint64_t v7;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v9;
  CFTypeID v10;
  const __CFNumber *Value;
  const __CFNumber *v12;
  const __CFNumber *v13;
  NSObject *v14;
  uint64_t i;
  unsigned int valuePtr;
  uint64_t v17;
  uint8_t buf[4];
  int v19;

  if (a3 && (v5 = CFGetTypeID(a3), v5 == CFArrayGetTypeID()))
  {
    v17 = 0;
    valuePtr = 0;
    Count = CFArrayGetCount(a3);
    LOBYTE(self->_maxLICeilingSoftPrevious) = Count;
    if (Count)
    {
      v7 = 0;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v7);
        if (ValueAtIndex && (v9 = ValueAtIndex, v10 = CFGetTypeID(ValueAtIndex), v10 == CFDictionaryGetTypeID()))
        {
          Value = (const __CFNumber *)CFDictionaryGetValue(v9, CFSTR("up"));
          if (Value)
          {
            CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
            *(&self->powerLevelPointer + v7) = valuePtr;
          }
          v12 = (const __CFNumber *)CFDictionaryGetValue(v9, CFSTR("down"));
          if (v12)
          {
            CFNumberGetValue(v12, kCFNumberSInt32Type, &v17);
            self->powerLevels[v7 + 8] = v17;
          }
          v13 = (const __CFNumber *)CFDictionaryGetValue(v9, CFSTR("level"));
          if (v13)
          {
            CFNumberGetValue(v13, kCFNumberSInt32Type, (char *)&v17 + 4);
            self->powerLevelUp[v7 + 8] = HIDWORD(v17);
          }
        }
        else
        {
          v14 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v19 = v7;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "<Error> Missing Display Power Dictionary %d", buf, 8u);
          }
        }
        ++v7;
      }
      while (v7 < LOBYTE(self->_maxLICeilingSoftPrevious));
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100053B7C();
    for (i = 0; i != 9; ++i)
    {
      self->powerLevelUp[i + 8] = 65000;
      self->powerLevels[i + 8] = 100;
      *(unsigned int *)((char *)&self->powerLevelPointer + i * 4) = 100;
    }
    LOBYTE(self->_maxLICeilingSoftPrevious) = 5;
  }
  LOBYTE(self->powerLevelDown[8]) = 1;
}

- (void)setCPMSMitigationState:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 v5;
  objc_super v6;
  uint8_t buf[16];

  if (a3)
  {
    if (LOBYTE(self->powerLevelDown[8]))
    {
      *(_QWORD *)&a3 = 1;
    }
    else
    {
      v4 = qword_1000A28A0;
      v5 = os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT);
      *(_QWORD *)&a3 = 0;
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> No powerLevelTable defined, cannot enable CPMS Mitigations for backlightCC", buf, 2u);
        *(_QWORD *)&a3 = 0;
      }
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)BackLightCC;
  -[ComponentControl setCPMSMitigationState:](&v6, "setCPMSMitigationState:", a3);
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
  v9.super_class = (Class)BackLightCC;
  if (-[ComponentControl numberOfFields](&v9, "numberOfFields") <= a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)BackLightCC;
    v6 = v3 - -[ComponentControl numberOfFields](&v7, "numberOfFields");
    if (v6 > 2)
      return 0;
    else
      return off_10007E1C0[v6];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BackLightCC;
    return -[ComponentControl copyHeaderForIndex:](&v8, "copyHeaderForIndex:", v3);
  }
}

- (BOOL)findBacklightServices
{
  if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    sub_100053BA8();
  return 0;
}

- (BOOL)solarBehaviorSuppressed
{
  return BYTE4(self->_brightnessSystemClient);
}

- (void)setSolarBehaviorSuppressed:(BOOL)a3
{
  BYTE4(self->_brightnessSystemClient) = a3;
}

- (BOOL)solarDetectorPresent
{
  return BYTE5(self->_brightnessSystemClient);
}

- (void)setSolarDetectorPresent:(BOOL)a3
{
  BYTE5(self->_brightnessSystemClient) = a3;
}

@end
