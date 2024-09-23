@implementation GradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class(CAGradientLayer, a2);
}

@end
