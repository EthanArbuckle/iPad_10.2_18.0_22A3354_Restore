@implementation NSDate(WatchListKit)

+ (id)wlk_dateWithMillisecondsSince1970:()WatchListKit
{
  id v4;
  void *v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = (void *)objc_msgSend([a1 alloc], "initWithTimeIntervalSince1970:", (double)objc_msgSend(v4, "longLongValue") / 1000.0);
  else
    v5 = 0;

  return v5;
}

@end
