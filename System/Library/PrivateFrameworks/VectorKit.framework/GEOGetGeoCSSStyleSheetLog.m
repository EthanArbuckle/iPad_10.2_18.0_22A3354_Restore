@implementation GEOGetGeoCSSStyleSheetLog

os_log_t __GEOGetGeoCSSStyleSheetLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit.GeoCSS", "StyleSheet");
  GEOGetGeoCSSStyleSheetLog_log = (uint64_t)result;
  return result;
}

@end
