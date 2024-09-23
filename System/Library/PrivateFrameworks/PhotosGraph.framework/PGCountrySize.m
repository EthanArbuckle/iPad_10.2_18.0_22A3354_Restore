@implementation PGCountrySize

+ (BOOL)isLargeCountry:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = isLargeCountry__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isLargeCountry__onceToken, &__block_literal_global_27533);
  v5 = objc_msgSend((id)isLargeCountry__largeCountries, "containsObject:", v4);

  return v5;
}

void __32__PGCountrySize_isLargeCountry___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("US"), CFSTR("CA"), CFSTR("GB"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isLargeCountry__largeCountries;
  isLargeCountry__largeCountries = v0;

}

@end
