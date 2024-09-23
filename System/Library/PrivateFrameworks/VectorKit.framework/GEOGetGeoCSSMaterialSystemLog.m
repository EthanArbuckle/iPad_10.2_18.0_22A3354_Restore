@implementation GEOGetGeoCSSMaterialSystemLog

os_log_t __GEOGetGeoCSSMaterialSystemLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit.GeoCSS", "MaterialSystem");
  _MergedGlobals = (uint64_t)result;
  return result;
}

@end
