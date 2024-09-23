@implementation SSLookupPropertiesLoadCoreLocation

void *__SSLookupPropertiesLoadCoreLocation_block_invoke()
{
  return dlopen("/System/Library/Frameworks/CoreLocation.framework/CoreLocation", 1);
}

@end
