@implementation ACFKeychainManager

- (NSString)obtainAccessGroup
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  uint64_t v9;
  uint64_t v10;

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACFKeychainManager obtainAccessGroup]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 27, 0, "Obtaining application access group");
  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "pathForResource:ofType:", CFSTR("Entitlements"), CFSTR("plist"));
  if (!v3)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
      ACFLog(6, (uint64_t)"-[ACFKeychainManager obtainAccessGroup]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 71, 0, "Failed to resolve path to Entitlements.plist");
    return -[ACFKeychainManager sharedAccessGroup](self, "sharedAccessGroup");
  }
  v4 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v3);
  v9 = 0;
  v10 = 0;
  v5 = objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v4, 0, &v10, &v9);
  if (v9 && ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    ACFLog(3, (uint64_t)"-[ACFKeychainManager obtainAccessGroup]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 50, 0, "Failed to parse Entitlements.plist file with the following error: %@", v9);
  if (!v5)
    return -[ACFKeychainManager sharedAccessGroup](self, "sharedAccessGroup");
  v6 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v5), "objectForKey:", CFSTR("keychain-access-groups"));
  if (!v6)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
      ACFLog(6, (uint64_t)"-[ACFKeychainManager obtainAccessGroup]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 65, 0, "Entitlements.plist does not contain %@ entry", CFSTR("keychain-access-groups"));
    return -[ACFKeychainManager sharedAccessGroup](self, "sharedAccessGroup");
  }
  v7 = (NSString *)objc_msgSend(v6, "objectAtIndex:", 0);
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACFKeychainManager obtainAccessGroup]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 61, 0, "Access group is %@", v7);
  if (!v7)
    return -[ACFKeychainManager sharedAccessGroup](self, "sharedAccessGroup");
  return v7;
}

- (NSString)sharedAccessGroup
{
  return 0;
}

- (id)universalAccessGroup
{
  return 0;
}

- (int)secAddItemWithAttributes:(id)a3 result:(id *)a4
{
  return SecItemAdd((CFDictionaryRef)a3, (CFTypeRef *)a4);
}

- (int)secItemCopyMatchingWithAttributes:(id)a3 result:(id *)a4
{
  return SecItemCopyMatching((CFDictionaryRef)(id)objc_msgSend(a3, "mutableCopy"), (CFTypeRef *)a4);
}

- (int)storeItemWithInfo:(id)a3 share:(BOOL)a4 result:(id *)a5
{
  _BOOL4 v6;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  NSString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;

  v6 = a4;
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
  {
    v9 = CFSTR("NO");
    if (v6)
      v9 = CFSTR("YES");
    ACFLog(7, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 110, 0, "Storing info to keychain for sharing: %@...", v9);
  }
  if (v6)
    objc_msgSend(a3, "setAccessGroup:", -[ACFKeychainManager universalAccessGroup](self, "universalAccessGroup"));
  if (!objc_msgSend(a3, "accessibleType"))
    objc_msgSend(a3, "setAccessibleType:", *MEMORY[0x24BDE8F70]);
  if (objc_msgSend(a3, "accessGroup") && ACFLogNS && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
  {
    v10 = objc_msgSend(a3, "accessGroup");
    ACFLogNS(7, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 129, 0, (uint64_t)CFSTR("Trying to store item to access group = %@"), v11, v12, v10);
  }
  v13 = -[ACFKeychainManager secAddItemWithAttributes:result:](self, "secAddItemWithAttributes:result:", objc_msgSend(a3, "attributes"), a5);
  v14 = v13;
  switch(v13)
  {
    case -34018:
      goto LABEL_17;
    case 0:
      if (!ACFLog || (ACFLogSettingsGetLevelMask() & 0x40) == 0)
        goto LABEL_62;
      v28 = 175;
      goto LABEL_48;
    case -25243:
LABEL_17:
      if (v6)
      {
        if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
          ACFLog(6, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 135, 0, "Failed to add info to %@ access group", objc_msgSend(a3, "accessGroup"));
        v15 = -[ACFKeychainManager obtainAccessGroup](self, "obtainAccessGroup");
        if (!v15 && ACFLog && (ACFLogSettingsGetLevelMask() & 0x10) != 0)
          ACFLog(4, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 139, 0, "Failed to resolve access application group. SSO between applications not available.");
        objc_msgSend(a3, "setAccessGroup:", v15);
        if (ACFLogNS && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
        {
          v16 = objc_msgSend(a3, "accessGroup");
          ACFLogNS(7, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 143, 0, (uint64_t)CFSTR("Trying to store item to access group = %@"), v17, v18, v16);
        }
        v19 = -[ACFKeychainManager secAddItemWithAttributes:result:](self, "secAddItemWithAttributes:result:", objc_msgSend(a3, "attributes"), a5);
        v14 = v19;
        v21 = v19 == -25243 || v19 == -34018;
        if (v15 && v21)
        {
          if (ACFLogNS)
          {
            if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
            {
              v22 = objc_msgSend(a3, "accessGroup");
              ACFLogNS(7, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 150, 0, (uint64_t)CFSTR("Failed to add info to %@ access group"), v23, v24, v22);
            }
            objc_msgSend(a3, "setAccessGroup:", 0);
            if (ACFLogNS && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
            {
              v25 = objc_msgSend(a3, "accessGroup");
              ACFLogNS(7, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 152, 0, (uint64_t)CFSTR("Trying to store item to access group = %@ (without access group)"), v26, v27, v25);
            }
          }
          else
          {
            objc_msgSend(a3, "setAccessGroup:", 0);
          }
          v29 = -[ACFKeychainManager secAddItemWithAttributes:result:](self, "secAddItemWithAttributes:result:", objc_msgSend(a3, "attributes"), a5);
          v14 = v29;
          if (v29 && ACFLog)
          {
            if ((ACFLogSettingsGetLevelMask() & 8) != 0)
              ACFLog(3, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 157, 0, "Failed to add info to keychain on 3rd attempt with %d error");
            return v14;
          }
          if (v29)
            return v14;
LABEL_62:
          -[ACFKeychainManager setUsedAccessGroup:](self, "setUsedAccessGroup:", objc_msgSend(a3, "accessGroup"));
          return 0;
        }
        if (v19)
        {
          if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
            ACFLog(3, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 162, 0, "Failed to add info to keychain on 2nd attempt with %d error");
          return v14;
        }
        if (!ACFLog || (ACFLogSettingsGetLevelMask() & 0x40) == 0)
          goto LABEL_62;
        v28 = 166;
LABEL_48:
        ACFLog(6, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", v28, 0, "Successfully stored info to access group %@", objc_msgSend(a3, "accessGroup"));
        goto LABEL_62;
      }
      break;
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    ACFLog(3, (uint64_t)"-[ACFKeychainManager storeItemWithInfo:share:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 171, 0, "Failed to add info to keychain with %d error with universal access group");
  return v14;
}

- (void)dumpResults:(id)a3 printAttributes:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = a4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
        ACFLog(7, (uint64_t)"-[ACFKeychainManager dumpResults:printAttributes:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 201, 0, "FOUND %d ITEMS:", objc_msgSend(a3, "count"));
      if (v4)
      {
        v12 = 0u;
        v13 = 0u;
        v10 = 0u;
        v11 = 0u;
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v11;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v11 != v8)
                objc_enumerationMutation(a3);
              objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "dump");
            }
            v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          }
          while (v7);
        }
      }
    }
    else
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
        ACFLog(7, (uint64_t)"-[ACFKeychainManager dumpResults:printAttributes:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 196, 0, "FOUND ITEM:");
      objc_msgSend(a3, "dump");
    }
  }
  else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
  {
    ACFLog(7, (uint64_t)"-[ACFKeychainManager dumpResults:printAttributes:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 190, 0, "NO ITEMS FOUND");
  }
}

- (void)dumpResults:(id)a3
{
  -[ACFKeychainManager dumpResults:printAttributes:](self, "dumpResults:printAttributes:", a3, 0);
}

- (BOOL)removeItemWithInfo:(id)a3
{
  id v5;
  id v6;
  OSStatus v7;
  OSStatus v8;

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACFKeychainManager removeItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 220, 0, "Deleting items with attributes: %@", objc_msgSend(a3, "attributes"));
  if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
  {
    v5 = (id)objc_msgSend(a3, "copy");
    v6 = (id)objc_msgSend(a3, "copy");
    objc_msgSend(v6, "setReturnLimit:", -1);
    -[ACFKeychainManager dumpResults:](self, "dumpResults:", -[ACFKeychainManager searchItemWithInfo:](self, "searchItemWithInfo:", v6));
  }
  else
  {
    v5 = 0;
  }
  v7 = SecItemDelete((CFDictionaryRef)objc_msgSend(a3, "attributes"));
  v8 = v7;
  if (v7 != -25300 && v7)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACFKeychainManager removeItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 236, 0, "Error %d did occur while deliting token", v8);
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
      ACFLog(6, (uint64_t)"-[ACFKeychainManager removeItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 240, 0, "Successfully deleted. Checking presence of item in keychain.");
    if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
      -[ACFKeychainManager dumpResults:](self, "dumpResults:", -[ACFKeychainManager searchItemWithInfo:](self, "searchItemWithInfo:", v5));
  }
  return !v8 || v8 == -25300;
}

- (id)searchItemWithInfo:(id)a3
{
  int v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (ACFProfileStart && (ACFLogSettingsGetLevelMask() & 0x100) != 0)
    ACFProfileStart((uint64_t)"-[ACFKeychainManager searchItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 252, 0, (uint64_t)"OVERALL");
  objc_msgSend(a3, "setReturnAttributes:", 1);
  v18 = 0;
  if (ACFProfileStart && (ACFLogSettingsGetLevelMask() & 0x100) != 0)
    ACFProfileStart((uint64_t)"-[ACFKeychainManager searchItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 258, 0, (uint64_t)"SEARCH");
  v5 = -[ACFKeychainManager secItemCopyMatchingWithAttributes:result:](self, "secItemCopyMatchingWithAttributes:result:", objc_msgSend(a3, "attributes"), &v18);
  if (ACFProfileEnd && (ACFLogSettingsGetLevelMask() & 0x100) != 0)
    ACFProfileEnd((uint64_t)"-[ACFKeychainManager searchItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 261, 0, (uint64_t)"SEARCH");
  v6 = v18;
  if (v5 == -25300)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
      ACFLog(7, (uint64_t)"-[ACFKeychainManager searchItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 273, 0, "Item not found in the keychain");
    goto LABEL_39;
  }
  if (v5)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACFKeychainManager searchItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 269, 0, "Search in keychain failed with error: %@", objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v5, 0));
    goto LABEL_39;
  }
  if (!v18)
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACFKeychainManager searchItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 282, 0, "Item is not found but API returned errSecSuccess");
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACFKeychainManager searchItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 283, 0, "Search in keychain failed with error: %@", objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -25300, 0));
    }
    goto LABEL_39;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend((id)objc_opt_class(), "keychainItemInfoWithAttributes:", v18);
    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACFKeychainManager searchItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 302, 0, "Error while trying to fetch Keychain information");
LABEL_39:
    v7 = 0;
    goto LABEL_40;
  }
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v18;
  v9 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "addObject:", objc_msgSend((id)objc_opt_class(), "keychainItemInfoWithAttributes:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i)));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v10);
  }
LABEL_40:
  if (ACFProfileEnd && (ACFLogSettingsGetLevelMask() & 0x100) != 0)
    ACFProfileEnd((uint64_t)"-[ACFKeychainManager searchItemWithInfo:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainManager.m", 307, 0, (uint64_t)"OVERALL");
  return v7;
}

- (NSString)usedAccessGroup
{
  return self->_usedAccessGroup;
}

- (void)setUsedAccessGroup:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
