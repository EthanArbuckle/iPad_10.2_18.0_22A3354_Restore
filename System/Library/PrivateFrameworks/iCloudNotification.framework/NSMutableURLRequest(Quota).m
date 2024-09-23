@implementation NSMutableURLRequest(Quota)

- (void)ind_addQuotaHeadersForAccount:()Quota
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x24BE04958], "currentInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "udid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v6, CFSTR("X-Client-UDID"));

  objc_msgSend(a1, "ind_addUserAgentString");
  objc_msgSend(a1, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(a1, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v4, 0);

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_numberingSystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v8, CFSTR("X-Apple-Locale-Numbering-System"));

  get_ICQHelperFunctionsClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(get_ICQHelperFunctionsClass(), "standardDateFormat:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v9, CFSTR("X-Apple-Locale-Date-Format-Long"));

    objc_msgSend(get_ICQHelperFunctionsClass(), "standardDateFormat:", 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v10, CFSTR("X-Apple-Locale-Date-Format-Short"));

  }
}

- (void)ind_addUserAgentString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CFBundleName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CFBundleVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE04958], "currentInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "osName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE04958], "currentInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "osVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@ %@/%@"), v4, v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "addValue:forHTTPHeaderField:", v10, CFSTR("User-agent"));
}

@end
