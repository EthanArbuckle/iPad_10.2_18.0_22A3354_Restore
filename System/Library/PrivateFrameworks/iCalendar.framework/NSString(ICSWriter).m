@implementation NSString(ICSWriter)

- (void)_ICSStringWithOptions:()ICSWriter appendingToString:
{
  iCalendarAppendStringToStringWithOptions(a1, a4, a3);
}

- (id)_ICSStringForProperyValue
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "_ICSStripControlChracters");
  objc_msgSend(v1, "_ICSEscapePropertyValue");
  return v1;
}

- (id)_ICSStringForParameterValue
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "_ICSStripControlChracters");
  objc_msgSend(v1, "_ICSEscapeParameterValue");
  return v1;
}

- (id)_ICSStringForParameterQuotedValue
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "_ICSStripControlChracters");
  objc_msgSend(v1, "_ICSEscapeParameterQuotedValue");
  return v1;
}

@end
