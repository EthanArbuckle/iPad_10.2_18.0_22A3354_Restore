@implementation NSURLProtectionSpace(SafariCoreExtras)

+ (id)safari_HTMLFormProtectionSpaceForURL:()SafariCoreExtras
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "port");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_stringByRemovingWwwDotPrefix");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "scheme");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v9 = [a1 alloc];
  if (v5)
    v10 = objc_msgSend(v5, "integerValue");
  else
    v10 = 0;
  if (!v8)
    v8 = &stru_1E64A2498;
  if (!v7)
    v7 = &stru_1E64A2498;
  v11 = (void *)objc_msgSend(v9, "initWithHost:port:protocol:realm:authenticationMethod:", v7, v10, v8, 0, *MEMORY[0x1E0C92B40]);

  return v11;
}

+ (id)safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:()SafariCoreExtras
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(CFSTR("https://"), "stringByAppendingString:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "safari_HTMLFormProtectionSpaceForURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)safari_protocolAsSecAttrProtocolValue
{
  void *v1;
  uint64_t *v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "protocol");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C92B90]) & 1) != 0)
  {
    v2 = (uint64_t *)MEMORY[0x1E0CD6AF0];
  }
  else
  {
    if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C92BA0]) & 1) == 0)
    {
      v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v6 = 138543362;
        v7 = v1;
        _os_log_impl(&dword_1B2621000, v3, OS_LOG_TYPE_INFO, "Unsupported protocol %{public}@", (uint8_t *)&v6, 0xCu);
      }
    }
    v2 = (uint64_t *)MEMORY[0x1E0CD6B00];
  }
  v4 = *v2;

  return v4;
}

- (id)safari_protectionSpaceByReplacingHostWithHighlevelDomain
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_highLevelDomainFromHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v3);

  if (v5)
  {
    v6 = a1;
  }
  else
  {
    v7 = objc_alloc((Class)objc_opt_class());
    v8 = objc_msgSend(a1, "port");
    objc_msgSend(a1, "protocol");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "realm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "authenticationMethod");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v7, "initWithHost:port:protocol:realm:authenticationMethod:", v3, v8, v9, v10, v11);

  }
  return v6;
}

- (uint64_t)safari_compareToHighLevelDomainFromProtectionSpaceOrderingDecimalCharactersLast:()SafariCoreExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(a1, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_highLevelDomainFromHost");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_highLevelDomainFromHost");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    v10 = objc_msgSend(v9, "characterIsMember:", objc_msgSend(v6, "characterAtIndex:", 0)) ^ 1;
  else
    v10 = 1;
  if (objc_msgSend(v8, "length"))
    v11 = objc_msgSend(v9, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", 0)) ^ 1;
  else
    v11 = 1;
  if ((v10 | v11 ^ 1) == 1)
  {
    if ((v10 ^ 1 | v11) == 1)
      v12 = objc_msgSend(a1, "safari_compareToHighLevelDomainFromProtectionSpace:", v4);
    else
      v12 = -1;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (uint64_t)safari_compareToHighLevelDomainFromProtectionSpace:()SafariCoreExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a1, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safari_highLevelDomainFromHost");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_highLevelDomainFromHost");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "caseInsensitiveCompare:", v8);
  if (!v9)
  {
    if (objc_msgSend(v5, "caseInsensitiveCompare:", v7))
    {
      if (objc_msgSend(v6, "caseInsensitiveCompare:", v7))
        v9 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
      else
        v9 = 1;
    }
    else
    {
      v9 = -1;
    }
  }

  return v9;
}

- (id)safari_addressString
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;

  if ((objc_msgSend(a1, "isProxy") & 1) != 0)
    objc_msgSend(a1, "proxyType");
  else
    objc_msgSend(a1, "protocol");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "port");
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "host");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@://%@:%ld/"), v2, v5, v3);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@://%@/"), v2, v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)safari_userVisibleSiteForProtectionSpace
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "safari_addressString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 7, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_identityPreferenceDomain
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(a1, "protocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setScheme:", v3);

  objc_msgSend(a1, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHost:", v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "port"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPort:", v5);

  objc_msgSend(v2, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)safari_URL
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(a1, "safari_addressString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithString:", v3);

  return v4;
}

- (id)safari_creationDateOfCredentialWithUser:()SafariCoreExtras
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  OSStatus v15;
  void *v16;
  CFTypeRef cf;
  _QWORD v19[8];
  _QWORD v20[9];

  v20[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  cf = 0;
  v5 = *MEMORY[0x1E0CD6CB8];
  v6 = *MEMORY[0x1E0CD6910];
  v19[0] = *MEMORY[0x1E0CD6C98];
  v19[1] = v6;
  v7 = *MEMORY[0x1E0CD6920];
  v20[0] = v5;
  v20[1] = v7;
  v8 = *MEMORY[0x1E0CD68F8];
  v20[2] = v4;
  v9 = *MEMORY[0x1E0CD6AD0];
  v19[2] = v8;
  v19[3] = v9;
  v20[3] = objc_msgSend(a1, "safari_protocolAsSecAttrProtocolValue");
  v19[4] = *MEMORY[0x1E0CD6B50];
  objc_msgSend(a1, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CD6B80];
  v12 = *MEMORY[0x1E0CD6B88];
  v20[4] = v10;
  v20[5] = v12;
  v13 = *MEMORY[0x1E0CD7010];
  v19[5] = v11;
  v19[6] = v13;
  v19[7] = *MEMORY[0x1E0CD6F30];
  v14 = *MEMORY[0x1E0CD6F40];
  v20[6] = MEMORY[0x1E0C9AAB0];
  v20[7] = v14;
  v15 = SecItemCopyMatching((CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 8), &cf);

  v16 = 0;
  if (!v15)
  {
    objc_msgSend((id)cf, "objectForKey:", *MEMORY[0x1E0CD6990]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(cf);
  }

  return v16;
}

- (uint64_t)isEqualToProtectionSpaceForPasswordManager:()SafariCoreExtras
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(a1, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6)
    && (v7 = objc_msgSend(a1, "port"), v7 == objc_msgSend(v4, "port")))
  {
    objc_msgSend(a1, "protocol");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "protocol");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = WBSIsEqual(v8, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)safari_allowsCredentialSaving
{
  void *v1;
  void *v2;
  void *v3;
  _BOOL8 v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  objc_msgSend(a1, "safari_URL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSSavedAccountMatchCriteria criteriaForExactFQDNPasswordMatchesOfURL:](WBSSavedAccountMatchCriteria, "criteriaForExactFQDNPasswordMatchesOfURL:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setOptions:", objc_msgSend(v2, "options") | 4);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  +[WBSSavedAccountStore sharedStore](WBSSavedAccountStore, "sharedStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__NSURLProtectionSpace_SafariCoreExtras__safari_allowsCredentialSaving__block_invoke;
  v6[3] = &unk_1E649D3D8;
  v6[4] = &v7;
  objc_msgSend(v3, "getSavedAccountsMatchingCriteria:withSynchronousCompletionHandler:", v2, v6);

  v4 = *((_BYTE *)v8 + 24) == 0;
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (uint64_t)safari_defaultPortForProtocol
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "protocol");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C92BA0]) & 1) != 0)
  {
    v2 = 443;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C92B90]) & 1) != 0)
  {
    v2 = 80;
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C92B80]))
  {
    v2 = 20;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (uint64_t)safari_hasDefaultPortForProtocol
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char v5;
  char v6;
  uint64_t v7;
  unsigned int v8;

  v2 = objc_msgSend(a1, "port");
  if (!v2)
    return 1;
  v3 = v2;
  objc_msgSend(a1, "protocol");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C92BA0]);
  if (v3 == 443 && (v5 & 1) != 0
    || (v6 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C92B90]), v3 == 80) && (v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C92B80]);
    if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 0x14)
      v7 = v8;
    else
      v7 = 0;
  }

  return v7;
}

@end
