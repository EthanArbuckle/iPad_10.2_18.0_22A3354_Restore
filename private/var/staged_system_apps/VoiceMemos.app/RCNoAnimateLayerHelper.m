@implementation RCNoAnimateLayerHelper

+ (id)sharedNoAnimationHelper
{
  if (qword_1001ED880 != -1)
    dispatch_once(&qword_1001ED880, &stru_1001ABF48);
  return (id)qword_1001ED878;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", a3, a4));
}

@end
