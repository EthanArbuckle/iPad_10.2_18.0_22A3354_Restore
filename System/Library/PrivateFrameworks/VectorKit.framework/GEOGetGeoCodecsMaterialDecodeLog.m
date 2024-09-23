@implementation GEOGetGeoCodecsMaterialDecodeLog

os_log_t __GEOGetGeoCodecsMaterialDecodeLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit.GeoCodecs", "MaterialDecode");
  _MergedGlobals_5 = (uint64_t)result;
  return result;
}

@end
