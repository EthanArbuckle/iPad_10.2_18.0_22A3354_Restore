@implementation LTDSELFLoggingManager

id __80___LTDSELFLoggingManager_selfLoggingLanguageIdentificationCompletedWithLIDData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = convertFromNSLocale(a2);
  v3 = objc_alloc_init(MEMORY[0x24BE95260]);
  objc_msgSend(v3, "setLocale:", v2);
  return v3;
}

@end
