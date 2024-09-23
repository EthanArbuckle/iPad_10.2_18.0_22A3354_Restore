@implementation NSDate

- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate fm_epochObject](self, "fm_epochObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate objectType](NSDate, "objectType"));
  objc_msgSend(v5, "encodeNumber:forKey:", v6, v7);

  return 1;
}

- (NSDate)initWithFMDCoder:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSErrorUserInfoKey v11;
  const __CFString *v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate objectType](NSDate, "objectType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "decodeNumberForKey:", v7));

  if (!v8)
  {
    if (!a4)
      goto LABEL_7;
    v11 = NSLocalizedFailureReasonErrorKey;
    v12 = CFSTR("Key \"FM.date\" not found.");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMDateErrorDomain"), 0, v9));

LABEL_6:
    a4 = 0;
    goto LABEL_7;
  }
  self = -[NSDate initWithTimeIntervalSince1970:](self, "initWithTimeIntervalSince1970:", (double)(uint64_t)objc_msgSend(v8, "longLongValue"));
  if (!self)
    goto LABEL_6;
  a4 = (id *)objc_claimAutoreleasedReturnValue(+[NSDate fm_dateFromEpoch:](NSDate, "fm_dateFromEpoch:", objc_msgSend(v8, "longLongValue")));
LABEL_7:

  return (NSDate *)a4;
}

+ (id)objectType
{
  return CFSTR("FM.date");
}

+ (id)objectTypeKey
{
  return CFSTR("dateType");
}

- (id)stringValueForServer
{
  __CFDateFormatter *v3;
  CFTimeZoneRef v4;
  __CFString *StringWithDate;

  v3 = CFDateFormatterCreate(kCFAllocatorDefault, 0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  v4 = CFTimeZoneCreateWithTimeIntervalFromGMT(kCFAllocatorDefault, 0.0);
  CFDateFormatterSetProperty(v3, kCFDateFormatterTimeZone, v4);
  CFDateFormatterSetFormat(v3, CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"));
  if (v4)
    CFRelease(v4);
  StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(kCFAllocatorDefault, v3, (CFDateRef)self);
  if (v3)
    CFRelease(v3);
  return StringWithDate;
}

@end
