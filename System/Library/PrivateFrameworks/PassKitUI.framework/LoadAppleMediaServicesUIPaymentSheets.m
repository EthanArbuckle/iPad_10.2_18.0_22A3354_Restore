@implementation LoadAppleMediaServicesUIPaymentSheets

void *__LoadAppleMediaServicesUIPaymentSheets_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppleMediaServicesUIPaymentSheets.framework/AppleMediaServicesUIPaymentSheets", 2);
  LoadAppleMediaServicesUIPaymentSheets_frameworkLibrary = (uint64_t)result;
  return result;
}

@end
