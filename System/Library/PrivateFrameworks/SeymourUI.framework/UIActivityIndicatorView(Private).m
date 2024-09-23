@implementation UIActivityIndicatorView(Private)

+ (id)smu_activityIndicatorViewForStyleWithLoadingMessage
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 22);
}

@end
