@implementation NSURL(ICSWriter)

- (void)_ICSStringWithOptions:()ICSWriter appendingToString:
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a1, "absoluteString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  iCalendarAppendStringToStringWithOptions(v7, v6, a3);

}

@end
