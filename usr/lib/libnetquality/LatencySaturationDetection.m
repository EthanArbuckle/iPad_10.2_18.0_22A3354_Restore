@implementation LatencySaturationDetection

- (LatencySaturationDetection)initWithConfig:(id)a3
{
  double v3;
  LatencySaturationDetection *v4;
  NSString *name;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LatencySaturationDetection;
  LODWORD(v3) = 1.0;
  v4 = -[SaturationDetection initWithConfig:withScalingFactor:](&v7, sel_initWithConfig_withScalingFactor_, a3, v3);
  name = v4->super.name;
  v4->super.name = (NSString *)CFSTR("Latency");

  return v4;
}

@end
