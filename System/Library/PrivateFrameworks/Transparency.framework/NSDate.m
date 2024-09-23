@implementation NSDate

void __40__NSDate_TransparencyDate__kt_fuzzyDate__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA28]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)kt_fuzzyDate_zulu;
  kt_fuzzyDate_zulu = v0;

  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)kt_fuzzyDate_zulu, "setTimeZone:", v2);

}

@end
