@implementation _UIOverlayServiceInterfaceSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.UIKit.OverlayUI.OverlayService");
}

+ (BSServiceInterface)interface
{
  if (qword_1ECD7F100 != -1)
    dispatch_once(&qword_1ECD7F100, &__block_literal_global_367);
  return (BSServiceInterface *)(id)_MergedGlobals_1144;
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D23040], "userInitiated");
}

@end
