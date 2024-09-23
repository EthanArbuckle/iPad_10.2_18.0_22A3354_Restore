@implementation UISpringTimingParameters

+ (id)bc_swiftUIDefault
{
  return objc_msgSend(objc_allocWithZone((Class)UISpringTimingParameters), "initWithDuration:bounce:", 0.5, 0.0);
}

@end
