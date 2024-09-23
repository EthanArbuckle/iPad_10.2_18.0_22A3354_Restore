@implementation RefreshRateCC

- (RefreshRateCC)initWithParams:(__CFDictionary *)a3
{
  RefreshRateCC *v4;
  RefreshRateCC *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RefreshRateCC;
  v4 = -[ComponentControl initWithCC::](&v7, "initWithCC::", 7, 0);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)&v4->super.currentPower + 4) = 0;
    *((_BYTE *)&v4->super.currentPower + 5) = 0;
    v4->refreshRateLevelDown[1] = 100;
    v4->refreshRateLevelDown[0] = 100;
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("%d RefreshRate "), 7);
    v5->super.previousValue = v5->super.currentLoadingIndex;
    v5->super.releaseMaxLI = 2;
    sub_1000048B0(a3, CFSTR("MaxReleaseRate"), kCFNumberIntType, &v5->super.releaseMaxLI);
  }
  return v5;
}

- (void)defaultAction
{
  unsigned int previousValue;
  uint64_t v4;
  char v5;
  uint64_t v6;
  int v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint8_t buf[4];
  int v14;

  previousValue = self->super.previousValue;
  v4 = *((unsigned __int8 *)&self->super.currentPower + 5);
  if (previousValue > *((unsigned __int8 *)&self->super.currentPower + v4 + 6))
  {
    if (!*((_BYTE *)&self->super.currentPower + 5))
      goto LABEL_8;
    v5 = -1;
    goto LABEL_7;
  }
  if (previousValue < self->refreshRateLevels[v4] && *((unsigned __int8 *)&self->super.currentPower + 4) - 1 > (int)v4)
  {
    v5 = 1;
LABEL_7:
    *((_BYTE *)&self->super.currentPower + 5) = v4 + v5;
  }
LABEL_8:
  self->refreshRateLevelDown[1] = self->refreshRateLevelDown[0];
  v6 = self->refreshRateLevelUp[*((unsigned __int8 *)&self->super.currentPower + 5)];
  self->refreshRateLevelDown[0] = v6;
  if ((_DWORD)v6 != self->refreshRateLevelDown[1])
  {
    v12 = v6;
    v7 = IOMobileFramebufferSetParameter(qword_1000A2E30, 4, 1, &v12);
    if (v7)
    {
      v8 = v7;
      v9 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_10004FD24(v8, v9);
    }
    else if (byte_1000A2480)
    {
      v10 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->refreshRateLevelDown[0];
        *(_DWORD *)buf = 67109120;
        v14 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> set refresh rate: %d", buf, 8u);
      }
    }
  }
}

- (void)initRefreshRateTable:(__CFArray *)a3
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
    *((_BYTE *)&self->super.currentPower + 4) = Count;
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
            *((_BYTE *)&self->super.currentPower + v7 + 6) = valuePtr;
          }
          v12 = (const __CFNumber *)CFDictionaryGetValue(v9, CFSTR("down"));
          if (v12)
          {
            CFNumberGetValue(v12, kCFNumberSInt32Type, &v17);
            self->refreshRateLevels[v7] = v17;
          }
          v13 = (const __CFNumber *)CFDictionaryGetValue(v9, CFSTR("level"));
          if (v13)
          {
            CFNumberGetValue(v13, kCFNumberSInt32Type, (char *)&v17 + 4);
            self->refreshRateLevelUp[v7] = BYTE4(v17);
          }
        }
        else
        {
          v14 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v19 = v7;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "<Error> Missing Refresh Rate Dictionary %d", buf, 8u);
          }
        }
        ++v7;
      }
      while (v7 < *((unsigned __int8 *)&self->super.currentPower + 4));
    }
  }
  else
  {
    for (i = 0; i != 4; ++i)
    {
      self->refreshRateLevelUp[i] = 100;
      self->refreshRateLevels[i] = 100;
      *((_BYTE *)&self->super.currentPower + i + 6) = 100;
    }
    *((_BYTE *)&self->super.currentPower + 4) = 4;
  }
}

- (int)numberOfFields
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RefreshRateCC;
  return -[ComponentControl numberOfFields](&v3, "numberOfFields");
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v3 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)RefreshRateCC;
  if (-[ComponentControl numberOfFields](&v8, "numberOfFields") <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)RefreshRateCC;
    if (-[ComponentControl numberOfFields](&v6, "numberOfFields") == (_DWORD)v3)
      return CFSTR("RefreshRate - fps");
    else
      return 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)RefreshRateCC;
    return -[ComponentControl copyHeaderForIndex:](&v7, "copyHeaderForIndex:", v3);
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v3 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)RefreshRateCC;
  if (-[ComponentControl numberOfFields](&v8, "numberOfFields") <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)RefreshRateCC;
    if (-[ComponentControl numberOfFields](&v6, "numberOfFields") == (_DWORD)v3)
      return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), self->refreshRateLevelDown[2]);
    else
      return 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)RefreshRateCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v7, "copyFieldCurrentValueForIndex:", v3);
  }
}

@end
