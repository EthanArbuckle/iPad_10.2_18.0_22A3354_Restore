@implementation PNRUtils

+ (void)_localizedCountryNameForISOCountryCode:(id)a3 result:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *, void *);

  v10 = (void (**)(id, void *, void *))a4;
  v5 = (void *)MEMORY[0x24BDBCEA0];
  v6 = a3;
  objc_msgSend(v5, "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayNameForKey:value:", *MEMORY[0x24BDBCAE8], v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "_PNRNotFoundErrorWithUserInfo:", &unk_24F4D3EA8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[2](v10, v8, v9);

}

+ (id)_stringByStrippingFormattingAndNotVisiblyAllowable:(id)a3
{
  const void *v3;

  v3 = (const void *)_PNCreateStringByStrippingFormattingAndNotVisiblyAllowable();
  return (id)CFAutorelease(v3);
}

+ (BOOL)_isValidPhoneNumber:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("SELF MATCHES %@"), CFSTR("\\+?[0-9]+"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "evaluateWithObject:", v4);

  return v6;
}

+ (void)_countryCodeFromInternationalCode:(id)a3 result:(id)a4
{
  void (**v4)(_QWORD);
  const void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = (void (**)(_QWORD))a4;
  v5 = (const void *)_PNCopyCountryCodeForInternationalCode();
  if (v5)
  {
    CFAutorelease(v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "_PNRNotFoundErrorWithUserInfo:", &unk_24F4D3ED0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
  }
  v8 = (id)v6;
  v4[2](v4);

}

+ (id)_currentCountry
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v2 = (void *)getGEOCountryConfigurationClass_softClass;
  v11 = getGEOCountryConfigurationClass_softClass;
  if (!getGEOCountryConfigurationClass_softClass)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __getGEOCountryConfigurationClass_block_invoke;
    v7[3] = &unk_24F4D26F0;
    v7[4] = &v8;
    __getGEOCountryConfigurationClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v3, "sharedConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_preferredLanguages
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
  {

    v2 = &unk_24F4D3DA0;
  }
  return v2;
}

+ (id)_currentLocale
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
}

@end
