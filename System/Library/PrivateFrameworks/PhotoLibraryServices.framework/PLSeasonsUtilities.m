@implementation PLSeasonsUtilities

+ (unint64_t)_seasonForMonthNumber:(unint64_t)a3 locale:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  unint64_t v13;

  v6 = a4;
  v7 = v6;
  if (a3 - 13 < 0xFFFFFFFFFFFFFFF4)
    goto LABEL_7;
  objc_msgSend(v6, "countryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "isCountryCodePartOfNorthernHemisphere:", v8);

  if (!v9)
  {
    objc_msgSend(v7, "countryCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(a1, "isCountryCodePartOfSouthernHemisphere:", v11);

    if (v12)
    {
      v10 = objc_msgSend(a1, "_southernMeteorologicalSeasonForMonthNumber:", a3);
      goto LABEL_6;
    }
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v10 = objc_msgSend(a1, "_northernMeteorologicalSeasonForMonthNumber:", a3);
LABEL_6:
  v13 = v10;
LABEL_8:

  return v13;
}

+ (unint64_t)_northernMeteorologicalSeasonForMonthNumber:(unint64_t)a3
{
  void *v6;

  if (a3 - 1 < 0xC)
    return qword_199B9B980[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSeasonsUtilities.m"), 60, CFSTR("Month number needs to be in the range 1...12"));

  return 0;
}

+ (unint64_t)_southernMeteorologicalSeasonForMonthNumber:(unint64_t)a3
{
  void *v6;

  if (a3 - 1 < 0xC)
    return qword_199B9B9E0[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSeasonsUtilities.m"), 86, CFSTR("Month number needs to be in the range 1...12"));

  return 0;
}

+ (id)_seasonCountryCodesDictionary
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PLSeasonsUtilities__seasonCountryCodesDictionary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_seasonCountryCodesDictionary_onceToken != -1)
    dispatch_once(&_seasonCountryCodesDictionary_onceToken, block);
  return (id)_seasonCountryCodesDictionary_seasonCountryCodesDictionary;
}

+ (BOOL)isCountryCodePartOfNorthernHemisphere:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_msgSend(a1, "_seasonCountryCodesDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("northernHemisphereCountryCodes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

+ (BOOL)isCountryCodePartOfSouthernHemisphere:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_msgSend(a1, "_seasonCountryCodesDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("southernHemisphereCountryCodes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

void __51__PLSeasonsUtilities__seasonCountryCodesDictionary__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("seasonsCountryCodes"), CFSTR("plist"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_seasonCountryCodesDictionary_seasonCountryCodesDictionary;
  _seasonCountryCodesDictionary_seasonCountryCodesDictionary = v1;

}

@end
