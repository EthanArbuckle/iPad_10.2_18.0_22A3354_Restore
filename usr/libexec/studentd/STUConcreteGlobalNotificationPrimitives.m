@implementation STUConcreteGlobalNotificationPrimitives

- (id)makeNotificationWithOptions:(id)a3 flags:(unint64_t)a4 error:(id *)a5
{
  CFUserNotificationRef v6;
  CFUserNotificationRef v7;
  STUConcreteGlobalNotification *v8;
  void *v10;
  void *v11;
  uint64_t v12;
  SInt32 error;
  const __CFString *v14;
  void *v15;

  error = 0;
  v6 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, a4, &error, (CFDictionaryRef)a3);
  if (v6)
  {
    v7 = v6;
    v8 = -[STUConcreteGlobalNotification initWithNotification:]([STUConcreteGlobalNotification alloc], "initWithNotification:", v6);
    CFRelease(v7);
    return v8;
  }
  else
  {
    if (a5)
    {
      v14 = CFSTR("kCRKCFUserNotificationErrorCodeKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", error));
      v15 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
      v12 = CRKErrorWithCodeAndUserInfo(9, v11);
      *a5 = (id)objc_claimAutoreleasedReturnValue(v12);

      a5 = 0;
    }
    return a5;
  }
}

@end
