@implementation CLPPressure

- (id)initWithPressure:(double)a3 stdDeviation:(double)a4 timestamp:(double)a5
{
  id result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLPPressure;
  result = -[CLPPressure init](&v9, "init");
  if (result)
  {
    *(double *)((char *)result + OBJC_IVAR___CLPPressure__value) = a3;
    *(double *)((char *)result + OBJC_IVAR___CLPPressure__std) = a4;
    *(double *)((char *)result + OBJC_IVAR___CLPPressure__timestamp) = a5;
  }
  return result;
}

@end
