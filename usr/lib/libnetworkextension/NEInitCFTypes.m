@implementation NEInitCFTypes

CFTypeID __NEInitCFTypes_block_invoke()
{
  CFTypeID result;

  CFSTRING_TYPE = CFStringGetTypeID();
  CFNUMBER_TYPE = CFNumberGetTypeID();
  CFBOOLEAN_TYPE = CFBooleanGetTypeID();
  CFARRAY_TYPE = CFArrayGetTypeID();
  CFDICTIONARY_TYPE = CFDictionaryGetTypeID();
  result = CFDataGetTypeID();
  CFDATA_TYPE = result;
  return result;
}

@end
