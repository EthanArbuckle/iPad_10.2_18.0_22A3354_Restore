@implementation SPDomainManager

- (void)_removeAllDomainsForDisplayIdentifier:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", MEMORY[0x24BDBD1A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = v4 - 1;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("SPDisplayIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", v9);

      if (v8)
        objc_msgSend(v3, "removeObjectAtIndex:", v5);

      --v5;
    }
    while (v5 != -1);
  }

}

- (id)getBundleIdForDomainNumber:(id)a3
{
  return (id)objc_msgSend((id)__SPNativeSearchDomainToBundleIdMapping, "objectForKey:", a3);
}

- (void)registerApplication:(id)a3 withCategories:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  SPDomainManager *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v17 = self;
  -[SPDomainManager _removeAllDomainsForDisplayIdentifier:](self, "_removeAllDomainsForDisplayIdentifier:", v6);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", MEMORY[0x24BDBD1A8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v6, CFSTR("SPDisplayIdentifier"), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13), CFSTR("SPCategory"), 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v11);
  }

  SPLogForSPLogCategoryDefault();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v15, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v9;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_213202000, v15, v16, "Installed application domains %@ for %@", buf, 0x16u);
  }

  -[SPDomainManager notifyIndexer](v17, "notifyIndexer");
}

- (BOOL)siriSuggestionsEnabled
{
  return __siriSuggestionsEnabled;
}

+ (void)initialize
{
  SPDomainManager *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v9[26];
  _QWORD v10[27];

  v10[26] = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() == a1)
  {
    v3 = objc_alloc_init(SPDomainManager);
    v4 = (void *)__defaultManager;
    __defaultManager = (uint64_t)v3;

    v9[0] = &unk_24CF6FEA8;
    v9[1] = &unk_24CF6FF20;
    v10[0] = CFSTR("com.apple.other");
    v10[1] = CFSTR("com.apple.MobileAddressBook");
    v9[2] = &unk_24CF6FEC0;
    v9[3] = &unk_24CF6FED8;
    v10[2] = CFSTR("com.apple.mobilemail");
    v10[3] = CFSTR("com.apple.application");
    v9[4] = &unk_24CF6FF80;
    v9[5] = &unk_24CF6FEF0;
    v10[4] = CFSTR("com.apple.mobilenotes");
    v10[5] = CFSTR("com.apple.Music");
    v9[6] = &unk_24CF6FF38;
    v9[7] = &unk_24CF6FFB0;
    v10[6] = CFSTR("com.apple.podcasts");
    v10[7] = CFSTR("com.apple.videos");
    v9[8] = &unk_24CF6FF08;
    v9[9] = &unk_24CF6FF50;
    v10[8] = CFSTR("com.apple.ibooks");
    v10[9] = CFSTR("com.apple.mobilecal");
    v9[10] = &unk_24CF6FF68;
    v9[11] = &unk_24CF6FFC8;
    v10[10] = CFSTR("com.apple.bookmarks");
    v10[11] = CFSTR("com.apple.VoiceMemos");
    v9[12] = &unk_24CF6FFE0;
    v9[13] = &unk_24CF6FFF8;
    v10[12] = CFSTR("com.apple.reminders");
    v10[13] = CFSTR("com.apple.document");
    v9[14] = &unk_24CF70010;
    v9[15] = &unk_24CF6FE90;
    v10[14] = CFSTR("com.apple.clouddocument");
    v10[15] = CFSTR("com.apple.parsec");
    v9[16] = &unk_24CF6FF98;
    v9[17] = &unk_24CF70028;
    v10[16] = CFSTR("com.apple.websearch");
    v10[17] = CFSTR("com.apple.Preferences");
    v9[18] = &unk_24CF70040;
    v9[19] = &unk_24CF6FE78;
    v10[18] = CFSTR("com.apple.psuedocontact");
    v10[19] = CFSTR("com.apple.corespotlight");
    v9[20] = &unk_24CF70058;
    v9[21] = &unk_24CF70070;
    v10[20] = CFSTR("com.apple.Maps");
    v10[21] = CFSTR("com.apple.calculation");
    v9[22] = &unk_24CF70088;
    v9[23] = &unk_24CF700A0;
    v10[22] = CFSTR("com.apple.conversions");
    v10[23] = CFSTR("com.apple.mobilesafari");
    v9[24] = &unk_24CF700B8;
    v9[25] = &unk_24CF6FE78;
    v10[24] = CFSTR("com.apple.MobileSMS");
    v10[25] = CFSTR("com.apple.zkws");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 26);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)__SPNativeSearchDomainToBundleIdMapping;
    __SPNativeSearchDomainToBundleIdMapping = v5;

    SPGetDisabledDomainSet();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __siriSuggestionsEnabled = objc_msgSend(v7, "containsObject:", CFSTR("DOMAIN_ZKWS")) ^ 1;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_userPrefsChanged, CFSTR("com.apple.spotlightui.prefschanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

+ (id)defaultManager
{
  return (id)__defaultManager;
}

@end
