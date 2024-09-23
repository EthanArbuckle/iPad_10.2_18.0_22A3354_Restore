@implementation SFSafariCreditCardStore

+ (id)savedCreditCardsWithError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *v8;
  OSStatus v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v15;
  _QWORD v16[7];
  _QWORD v17[8];

  v17[7] = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BDE9140];
  v16[0] = *MEMORY[0x24BDE8F50];
  v16[1] = v4;
  v5 = *MEMORY[0x24BDE9230];
  v6 = *MEMORY[0x24BDE9128];
  v16[2] = *MEMORY[0x24BDE9220];
  v16[3] = v6;
  v17[2] = v5;
  v17[3] = CFSTR("SafariCreditCardEntries");
  v7 = *MEMORY[0x24BDE94D0];
  v16[4] = *MEMORY[0x24BDE93B0];
  v16[5] = v7;
  v17[4] = *MEMORY[0x24BDE93B8];
  v17[5] = MEMORY[0x24BDBD1C0];
  v17[0] = CFSTR("com.apple.safari.credit-cards");
  v17[1] = MEMORY[0x24BDBD1C8];
  v16[6] = *MEMORY[0x24BDE94C8];
  v17[6] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 7);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v9 = SecItemCopyMatching(v8, (CFTypeRef *)&v15);
  v10 = v9;
  if (v9 == -25300)
  {
LABEL_8:
    v12 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_9;
  }
  if (v9)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[SFSafariCreditCardStore savedCreditCardsWithError:].cold.1(v10, v13);
    if (a3)
      *a3 = (id)SecCopyLastError();
    goto LABEL_8;
  }
  v11 = v15;
  objc_msgSend(v15, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v12;
}

id __53__SFSafariCreditCardStore_savedCreditCardsWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a2, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CardNameUIString"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("CardNameUIString"));

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CardNumber"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("CardNumber"));

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ExpirationDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ExpirationDate"));

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CardholderName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("CardholderName"));

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CardSecurityCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("CardSecurityCode"));

    v9 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)showCreditCardSettings
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=SAFARI&path=AUTO_FILL/CreditCardList"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

}

+ (void)savedCreditCardsWithError:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20E365000, a2, OS_LOG_TYPE_ERROR, "SecItemCopyMatching failed with error %d", (uint8_t *)v2, 8u);
}

@end
