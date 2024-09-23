@implementation PFGMTTimeZone

void __PFGMTTimeZone_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PFGMTTimeZone_gmtTimeZone;
  PFGMTTimeZone_gmtTimeZone = v0;

}

@end
