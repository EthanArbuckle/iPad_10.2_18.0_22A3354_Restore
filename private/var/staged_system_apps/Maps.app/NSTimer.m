@implementation NSTimer

+ (id)_maps_scheduledTimerWithFireDate:(id)a3 block:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:", 0, a4, 1.79769313e308));
  objc_msgSend(v7, "setFireDate:", v6);

  return v7;
}

@end
