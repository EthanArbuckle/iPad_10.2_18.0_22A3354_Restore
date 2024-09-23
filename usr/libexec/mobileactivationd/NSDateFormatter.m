@implementation NSDateFormatter

- (id)dateFromServerString:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  time_t v7;
  id v8;
  id v9;
  NSError *v10;
  NSError *MobileActivationError;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  int *v15;
  NSError *v16;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  tm v22;

  v5 = a3;
  v6 = v5;
  memset(&v22, 0, sizeof(v22));
  if (v5)
  {
    if (strptime_l((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), "%a, %d %b %Y %H:%M:%S %Z", &v22, 0))
    {
      v7 = mktime(&v22);
      if (v7 == -1)
      {
        v14 = *__error();
        v15 = __error();
        v21 = strerror(*v15);
        MobileActivationError = createMobileActivationError((uint64_t)"-[NSDateFormatter(MobileActivation) dateFromServerString:withError:]", 38, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create raw time: %d (%s)"), v14, v21, *(_QWORD *)&v22.tm_sec, *(_QWORD *)&v22.tm_hour, *(_QWORD *)&v22.tm_mon, *(_QWORD *)&v22.tm_wday, *(_QWORD *)&v22.tm_isdst, v22.tm_gmtoff, v22.tm_zone);
      }
      else
      {
        v8 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSince1970:", (double)v7);
        if (v8)
        {
          v9 = v8;
          v10 = 0;
          goto LABEL_13;
        }
        MobileActivationError = createMobileActivationError((uint64_t)"-[NSDateFormatter(MobileActivation) dateFromServerString:withError:]", 44, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create date."), v18, v19, *(_QWORD *)&v22.tm_sec, *(_QWORD *)&v22.tm_hour, *(_QWORD *)&v22.tm_mon, *(_QWORD *)&v22.tm_wday, *(_QWORD *)&v22.tm_isdst, v22.tm_gmtoff, v22.tm_zone);
      }
    }
    else
    {
      v12 = *__error();
      v13 = __error();
      v20 = strerror(*v13);
      MobileActivationError = createMobileActivationError((uint64_t)"-[NSDateFormatter(MobileActivation) dateFromServerString:withError:]", 32, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create time object: %d (%s)"), v12, v20, *(_QWORD *)&v22.tm_sec, *(_QWORD *)&v22.tm_hour, *(_QWORD *)&v22.tm_mon, *(_QWORD *)&v22.tm_wday, *(_QWORD *)&v22.tm_isdst, v22.tm_gmtoff, v22.tm_zone);
    }
  }
  else
  {
    MobileActivationError = createMobileActivationError((uint64_t)"-[NSDateFormatter(MobileActivation) dateFromServerString:withError:]", 27, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid input."), v18, v19, *(_QWORD *)&v22.tm_sec, *(_QWORD *)&v22.tm_hour, *(_QWORD *)&v22.tm_mon, *(_QWORD *)&v22.tm_wday, *(_QWORD *)&v22.tm_isdst, v22.tm_gmtoff, v22.tm_zone);
  }
  v16 = MobileActivationError;
  v10 = v16;
  if (a4)
  {
    v10 = objc_retainAutorelease(v16);
    v9 = 0;
    *a4 = v10;
  }
  else
  {
    v9 = 0;
  }
LABEL_13:

  return v9;
}

@end
