@implementation WBSLocaleForCreditCardExpirationDate

void __WBSLocaleForCreditCardExpirationDate_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WBSLocaleForCreditCardExpirationDate::localeForCreditCardExpirationDate;
  WBSLocaleForCreditCardExpirationDate::localeForCreditCardExpirationDate = v0;

}

@end
