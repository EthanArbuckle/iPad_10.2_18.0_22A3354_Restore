@implementation SFDomainAssociationUtilities

+ (id)domainByStrippingSubdomainWildcardPrefixIfNecessary:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("*.")) & 1) != 0)
  {
    objc_msgSend(v3, "substringFromIndex:", 2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

+ (BOOL)domainIsProhibitedForSavingCredentials:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (domainIsProhibitedForSavingCredentials__onceToken != -1)
    dispatch_once(&domainIsProhibitedForSavingCredentials__onceToken, &__block_literal_global_5);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)domainIsProhibitedForSavingCredentials__blocklist;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
LABEL_5:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
      v10 = 1;
      if ((objc_msgSend(v3, "safari_hasCaseInsensitiveSuffix:", v9, (_QWORD)v14) & 1) != 0)
        break;
      objc_msgSend(v9, "substringFromIndex:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", v11);

      if ((v12 & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v10 = 0;
        if (v6)
          goto LABEL_5;
        break;
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __71__SFDomainAssociationUtilities_domainIsProhibitedForSavingCredentials___block_invoke()
{
  void *v0;

  v0 = (void *)domainIsProhibitedForSavingCredentials__blocklist;
  domainIsProhibitedForSavingCredentials__blocklist = (uint64_t)&unk_24C93C9F8;

}

+ (BOOL)highLevelDomainHasSuiteOfAssociatedApps:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (highLevelDomainHasSuiteOfAssociatedApps__onceToken != -1)
    dispatch_once(&highLevelDomainHasSuiteOfAssociatedApps__onceToken, &__block_literal_global_48);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (id)highLevelDomainHasSuiteOfAssociatedApps__highLevelDomainsWithSuiteOfAssociatedApps;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), (_QWORD)v9) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_13:

  return v5;
}

void __72__SFDomainAssociationUtilities_highLevelDomainHasSuiteOfAssociatedApps___block_invoke()
{
  void *v0;

  v0 = (void *)highLevelDomainHasSuiteOfAssociatedApps__highLevelDomainsWithSuiteOfAssociatedApps;
  highLevelDomainHasSuiteOfAssociatedApps__highLevelDomainsWithSuiteOfAssociatedApps = (uint64_t)&unk_24C93CA10;

}

@end
