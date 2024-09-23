@implementation TimerFactory

+ (id)timerWithIdentifier:(id)a3 delay:(double)a4 gracePeriod:(double)a5 waking:(BOOL)a6 handlerBlock:(id)a7
{
  __objc2_class **v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;

  v10 = &off_100018170;
  if (!a6)
    v10 = &off_1000180C8;
  v11 = (objc_class *)*v10;
  v12 = a7;
  v13 = a3;
  v14 = objc_msgSend([v11 alloc], "initWithIdentifier:delay:gracePeriod:handlerBlock:", v13, v12, a4, a5);

  return v14;
}

@end
