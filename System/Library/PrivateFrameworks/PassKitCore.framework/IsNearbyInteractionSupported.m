@implementation IsNearbyInteractionSupported

uint64_t __IsNearbyInteractionSupported_block_invoke()
{
  Class v0;
  NSObject *v1;
  uint64_t result;
  uint8_t v3[16];

  v0 = (Class)getNISessionClass[0]();
  if (!v0)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_18FC92000, v1, OS_LOG_TYPE_DEFAULT, "Cannot find NISession class", v3, 2u);
    }

  }
  result = -[objc_class isSupported](v0, "isSupported");
  _MergedGlobals_192 = result;
  return result;
}

@end
