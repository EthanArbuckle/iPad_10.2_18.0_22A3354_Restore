@implementation NSDateComponentsFormatter

+ (id)hoursMinutesSecondsStringWithInterval:(double)a3 forAccessibility:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = objc_alloc_init((Class)NSDateComponentsFormatter);
  objc_msgSend(v6, "setAllowedUnits:", 224);
  if (v4)
  {
    objc_msgSend(v6, "setZeroFormattingBehavior:", 14);
    objc_msgSend(v6, "setUnitsStyle:", 3);
  }
  else
  {
    objc_msgSend(v6, "setZeroFormattingBehavior:", 0);
    objc_msgSend(v6, "setZeroFormattingBehavior:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringFromTimeInterval:", a3));

  return v7;
}

@end
