@implementation VTUIEnrollmentPageEligibilityProvider

- (BOOL)shouldShowLanguageDisambiguationForBestFittingSiriLanguages:(id)a3
{
  id v3;
  char v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "languageCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v4 = objc_msgSend(v3, "containsObject:", v6);
    else
      v4 = 1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
