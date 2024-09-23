@implementation NSDateComponents(Construction)

+ (id)dateWithYear:()Construction month:day:
{
  void *v8;

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setYear:", a3);
  objc_msgSend(v8, "setMonth:", a4);
  objc_msgSend(v8, "setDay:", a5);
  objc_msgSend(v8, "setHour:", 0);
  objc_msgSend(v8, "setMinute:", 0);
  objc_msgSend(v8, "setSecond:", 0);
  return v8;
}

+ (id)dateWithYear:()Construction month:day:hour:minute:second:
{
  void *v14;

  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setYear:", a3);
  objc_msgSend(v14, "setMonth:", a4);
  objc_msgSend(v14, "setDay:", a5);
  objc_msgSend(v14, "setHour:", a6);
  objc_msgSend(v14, "setMinute:", a7);
  objc_msgSend(v14, "setSecond:", a8);
  return v14;
}

@end
