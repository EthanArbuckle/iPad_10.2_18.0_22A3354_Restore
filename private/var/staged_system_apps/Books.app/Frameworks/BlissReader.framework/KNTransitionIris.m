@implementation KNTransitionIris

+ (BOOL)isTransition
{
  return 1;
}

+ (id)supportedTypes
{
  return &off_4699D0;
}

+ (id)defaultAttributes
{
  const __CFString *v3;
  _UNKNOWN **v4;

  v3 = CFSTR("KNTransitionAttributesDuration");
  v4 = &off_468FA8;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
}

- (void)renderFrameWithContext:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KNTransitionIris;
  -[KNIrisBase renderFrameWithContext:](&v3, "renderFrameWithContext:", a3);
}

@end
