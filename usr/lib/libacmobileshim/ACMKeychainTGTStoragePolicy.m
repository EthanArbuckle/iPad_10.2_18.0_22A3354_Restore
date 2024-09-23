@implementation ACMKeychainTGTStoragePolicy

- (ACFKeychainManagerProtocol)keychainManager
{
  return (ACFKeychainManagerProtocol *)objc_msgSend(+[ACFComponents components](ACFComponents, "components"), "keychainManager");
}

- (BOOL)storeToken:(id)a3
{
  return -[ACMKeychainTGTStoragePolicy performStoreToken:withService:](self, "performStoreToken:withService:", a3, -[ACMKeychainTGTStoragePolicy service](self, "service"));
}

- (BOOL)updateToken:(id)a3
{
  return -[ACMKeychainTGTStoragePolicy performStoreToken:withService:](self, "performStoreToken:withService:", a3, -[ACMKeychainTGTStoragePolicy service](self, "service"));
}

- (id)searchTokenWithPrincipal:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = -[ACMKeychainTGTStoragePolicy allTokensWithPrincipal:](self, "allTokensWithPrincipal:", a3);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v12;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
      if (!v6 || objc_msgSend((id)objc_msgSend(v6, "creationDate"), "compare:", objc_msgSend(v9, "creationDate")) == -1)
        v6 = v9;
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  }
  while (v5);
  return v6;
}

- (id)allTokensWithPrincipal:(id)a3
{
  return -[ACMKeychainTGTStoragePolicy allTokensWithPrincipal:service:](self, "allTokensWithPrincipal:service:", a3, -[ACMKeychainTGTStoragePolicy service](self, "service"));
}

- (id)ssoTokenWithKeychainInfo:(id)a3 realm:(id)a4
{
  int v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  ACMSSOToken *v15;
  void *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  objc_msgSend(a3, "account");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(a3, "generic"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_msgSend(a3, "creationDate"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!ACFLog)
      return 0;
LABEL_18:
    if ((ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACMKeychainTGTStoragePolicy ssoTokenWithKeychainInfo:realm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 68, 0, "Keychain item has unexpected data type");
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
      {
        objc_msgSend(a3, "account");
        v18 = objc_opt_class();
        ACFLog(3, (uint64_t)"-[ACMKeychainTGTStoragePolicy ssoTokenWithKeychainInfo:realm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 69, 0, "Account of class %@: %@", v18, objc_msgSend(a3, "account"));
      }
      if (ACFLog)
      {
        if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        {
          objc_msgSend(a3, "creationDate");
          v19 = objc_opt_class();
          ACFLog(3, (uint64_t)"-[ACMKeychainTGTStoragePolicy ssoTokenWithKeychainInfo:realm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 70, 0, "Creation Date of class %@: %@", v19, objc_msgSend(a3, "creationDate"));
        }
        if (ACFLog)
        {
          if ((ACFLogSettingsGetLevelMask() & 8) != 0)
          {
            objc_msgSend(a3, "service");
            v20 = objc_opt_class();
            ACFLog(3, (uint64_t)"-[ACMKeychainTGTStoragePolicy ssoTokenWithKeychainInfo:realm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 71, 0, "Service of class %@: %@", v20, objc_msgSend(a3, "service"));
          }
          if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
          {
            objc_msgSend(a3, "generic");
            v21 = objc_opt_class();
            ACFLog(3, (uint64_t)"-[ACMKeychainTGTStoragePolicy ssoTokenWithKeychainInfo:realm:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 72, 0, "Generic of class %@", v21);
          }
        }
      }
    }
    return 0;
  }
  objc_msgSend(a3, "service");
  objc_opt_class();
  v7 = objc_opt_isKindOfClass() & 1;
  if (v7)
    v8 = a3;
  else
    v8 = 0;
  if (!v7 && ACFLog)
    goto LABEL_18;
  if (!v8
    || a4
    && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "principal"), "realm"), "isEqualToString:", a4))
  {
    return 0;
  }
  v9 = -[ACMKeychainTGTStoragePolicy tokenDictionaryWithData:](self, "tokenDictionaryWithData:", objc_msgSend(v8, "generic"));
  if (!v9)
    return 0;
  v10 = v9;
  v11 = objc_msgSend(v8, "creationDate");
  v12 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("d"));
  if (v12)
  {
    v13 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v12, "doubleValue");
    v11 = objc_msgSend(v13, "dateWithTimeIntervalSince1970:", v14 / 1000.0);
  }
  v15 = +[ACMToken tokenWithPrincipal:creationDate:tokenData:](ACMSSOToken, "tokenWithPrincipal:creationDate:tokenData:", objc_msgSend(v8, "principal"), v11, 0);
  v16 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend((id)objc_msgSend(v10, "objectForKey:", CFSTR("e")), "doubleValue");
  -[ACMToken setExpirationDate:](v15, "setExpirationDate:", objc_msgSend(v16, "dateWithTimeIntervalSince1970:", v17 / 1000.0));
  -[ACMToken setNonce:](v15, "setNonce:", objc_msgSend(v10, "objectForKey:", CFSTR("o")));
  -[ACMSSOToken setSessionToken:](v15, "setSessionToken:", objc_msgSend(v10, "objectForKey:", CFSTR("q")));
  -[ACMSSOToken setRecentAuthenticationDate:](v15, "setRecentAuthenticationDate:", objc_msgSend(v10, "objectForKey:", CFSTR("ACMSSOKeyRecentAuthenticationDate")));
  -[ACMSSOToken setRecentUnlockDate:](v15, "setRecentUnlockDate:", objc_msgSend(v10, "objectForKey:", CFSTR("ACMSSOKeyRecentUnlockDate")));
  -[ACMSSOToken setPersonID:](v15, "setPersonID:", objc_msgSend(v10, "objectForKey:", CFSTR("pid")));
  if (!-[ACMSSOToken recentUnlockDate](v15, "recentUnlockDate"))
    -[ACMSSOToken setRecentUnlockDate:](v15, "setRecentUnlockDate:", -[ACMSSOToken recentAuthenticationDate](v15, "recentAuthenticationDate"));
  return v15;
}

- (id)searchItemWithInfo:(id)a3
{
  return (id)-[ACFKeychainManagerProtocol searchItemWithInfo:](-[ACMKeychainTGTStoragePolicy keychainManager](self, "keychainManager"), "searchItemWithInfo:", a3);
}

- (id)allTokensWithPrincipal:(id)a3 service:(id)a4
{
  ACMKeychainTokenInfo *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = +[ACMKeychainTokenInfo keychainTokenInfoWithPrincipal:indicator:](ACMKeychainTokenInfo, "keychainTokenInfoWithPrincipal:indicator:", a3, a4);
  -[ACFKeychainItemInfo setReturnLimit:](v6, "setReturnLimit:", -1);
  v7 = -[ACMKeychainTGTStoragePolicy searchItemWithInfo:](self, "searchItemWithInfo:", v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
LABEL_5:
    v9 = v8;
    goto LABEL_6;
  }
  if (v7)
  {
    v8 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v7);
    goto LABEL_5;
  }
  v9 = 0;
LABEL_6:
  v10 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v9);
        v15 = -[ACMKeychainTGTStoragePolicy ssoTokenWithKeychainInfo:realm:](self, "ssoTokenWithKeychainInfo:realm:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14), objc_msgSend(a3, "realm"));
        if (v15)
        {
          v16 = v15;
          if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
            ACFLog(7, (uint64_t)"-[ACMKeychainTGTStoragePolicy allTokensWithPrincipal:service:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 134, 0, "Created SSO Token - %@", v16);
          objc_msgSend(v10, "addObject:", v16);
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }
  if (!objc_msgSend(v10, "count"))
    return (id)objc_msgSend(MEMORY[0x24BDBCE30], "array");
  return v10;
}

- (BOOL)removeTokenWithPrincipal:(id)a3
{
  return -[ACMKeychainTGTStoragePolicy performRemoveTokenWithPrincipal:service:](self, "performRemoveTokenWithPrincipal:service:", a3, -[ACMKeychainTGTStoragePolicy service](self, "service"));
}

- (BOOL)performRemoveTokenWithPrincipal:(id)a3 service:(id)a4
{
  ACMKeychainTokenInfo *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  ACMKeychainTGTStoragePolicy *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = +[ACMKeychainTokenInfo keychainTokenInfoWithPrincipal:indicator:](ACMKeychainTokenInfo, "keychainTokenInfoWithPrincipal:indicator:", a3, a4);
  -[ACFKeychainItemInfo setReturnLimit:](v6, "setReturnLimit:", -1);
  v18 = self;
  v7 = -[ACFKeychainManagerProtocol searchItemWithInfo:](-[ACMKeychainTGTStoragePolicy keychainManager](self, "keychainManager"), "searchItemWithInfo:", v6);
  if (v7)
  {
    v8 = (void *)v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v8 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v8);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (!v9)
    {
      v11 = 0;
      goto LABEL_36;
    }
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v20;
    while (1)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
        v15 = +[ACFKeychainItemInfo keychainItemInfo](ACFKeychainItemInfo, "keychainItemInfo");
        if (objc_msgSend((id)objc_msgSend(a3, "principalString"), "isEqualToString:", objc_msgSend(v14, "account")))
        {
          objc_msgSend(v15, "setAccount:", objc_msgSend(v14, "account"));
LABEL_11:
          if (v15)
          {
            objc_msgSend(v15, "setService:", objc_msgSend(v14, "service"));
            objc_msgSend(v15, "setClassCode:", +[ACMKeychainTokenInfo classCode](ACMKeychainTokenInfo, "classCode"));
            v11 = v11 & 1 | -[ACFKeychainManagerProtocol removeItemWithInfo:](-[ACMKeychainTGTStoragePolicy keychainManager](v18, "keychainManager"), "removeItemWithInfo:", v15);
          }
          goto LABEL_13;
        }
        if (objc_msgSend((id)objc_msgSend(a3, "realm"), "length")
          && objc_msgSend((id)objc_msgSend(v14, "account"), "hasSuffix:", objc_msgSend(a3, "realm")))
        {
          objc_msgSend(v15, "setAccount:", objc_msgSend(v14, "account"));
          if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
            ACFLog(7, (uint64_t)"-[ACMKeychainTGTStoragePolicy performRemoveTokenWithPrincipal:service:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 171, 0, "Found item by realm");
          goto LABEL_11;
        }
        if (objc_msgSend((id)objc_msgSend(a3, "userName"), "length")
          && objc_msgSend((id)objc_msgSend(v14, "account"), "hasPrefix:", objc_msgSend(a3, "userName")))
        {
          objc_msgSend(v15, "setAccount:", objc_msgSend(v14, "account"));
          if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
            ACFLog(7, (uint64_t)"-[ACMKeychainTGTStoragePolicy performRemoveTokenWithPrincipal:service:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 176, 0, "Found item by userName");
          goto LABEL_11;
        }
        if (!objc_msgSend((id)objc_msgSend(a3, "userName"), "length")
          && !objc_msgSend((id)objc_msgSend(a3, "realm"), "length"))
        {
          objc_msgSend(v15, "setAccount:", objc_msgSend(v14, "account"));
          if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
            ACFLog(7, (uint64_t)"-[ACMKeychainTGTStoragePolicy performRemoveTokenWithPrincipal:service:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 181, 0, "Found item");
          goto LABEL_11;
        }
        if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
          ACFLog(7, (uint64_t)"-[ACMKeychainTGTStoragePolicy performRemoveTokenWithPrincipal:service:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 185, 0, "Did not found item");
LABEL_13:
        ++v13;
      }
      while (v10 != v13);
      v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v10 = v16;
      if (!v16)
      {
LABEL_36:
        LOBYTE(v7) = v11 & 1;
        return v7;
      }
    }
  }
  return v7;
}

- (id)dictionaryWithSSOToken:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  double v9;

  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend((id)objc_msgSend(a3, "expirationDate"), "timeIntervalSince1970");
  v7 = objc_msgSend(v5, "numberWithLongLong:", (uint64_t)(v6 * 1000.0));
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend((id)objc_msgSend(a3, "creationDate"), "timeIntervalSince1970");
  return (id)objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v7, CFSTR("e"), objc_msgSend(v8, "numberWithLongLong:", (uint64_t)(v9 * 1000.0)), CFSTR("d"), objc_msgSend(a3, "nonce"), CFSTR("o"), objc_msgSend(a3, "sessionToken"), CFSTR("q"), objc_msgSend(a3, "recentAuthenticationDate"), CFSTR("ACMSSOKeyRecentAuthenticationDate"), objc_msgSend(a3, "recentUnlockDate"), CFSTR("ACMSSOKeyRecentUnlockDate"), objc_msgSend(a3, "personID"), CFSTR("pid"), 0);
}

- (int)storeItemWithInfo:(id)a3
{
  return -[ACFKeychainManagerProtocol storeItemWithInfo:share:result:](-[ACMKeychainTGTStoragePolicy keychainManager](self, "keychainManager"), "storeItemWithInfo:share:result:", a3, -[ACMKeychainTGTStoragePolicy useSharedStorage](self, "useSharedStorage"), 0);
}

- (id)tokenDataWithDictionary:(id)a3
{
  if (a3)
    return (id)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 200, 0, 0);
  else
    return 0;
}

- (id)tokenDictionaryWithData:(id)a3
{
  id result;

  result = (id)objc_msgSend(a3, "length");
  if (result)
    return (id)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  return result;
}

- (BOOL)performStoreToken:(id)a3 withService:(id)a4
{
  ACMKeychainTokenInfo *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void (*v11)(int, uint64_t, char *, uint64_t, const char *, char *, ...);
  uint64_t v13;

  v7 = +[ACMKeychainTokenInfo keychainTokenInfoWithPrincipal:indicator:](ACMKeychainTokenInfo, "keychainTokenInfoWithPrincipal:indicator:", objc_msgSend(a3, "principal"), a4);
  -[ACMKeychainTGTStoragePolicy performRemoveTokenWithPrincipal:service:](self, "performRemoveTokenWithPrincipal:service:", +[ACFPrincipal principalWithUserName:realm:](ACFPrincipal, "principalWithUserName:realm:", 0, objc_msgSend((id)objc_msgSend(a3, "principal"), "realm")), a4);
  -[ACMKeychainTokenInfo setTokenData:](v7, "setTokenData:", -[ACMKeychainTGTStoragePolicy tokenDataWithDictionary:](self, "tokenDataWithDictionary:", -[ACMKeychainTGTStoragePolicy dictionaryWithSSOToken:](self, "dictionaryWithSSOToken:", a3)));
  if (-[NSData length](-[ACMKeychainTokenInfo tokenData](v7, "tokenData"), "length"))
  {
    -[ACFKeychainItemInfo setCreationDate:](v7, "setCreationDate:", objc_msgSend(a3, "creationDate"));
    -[ACFKeychainItemInfo setSynchronizable:](v7, "setSynchronizable:", 0);
    if (ACFLogNS && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
      ACFLogNS(7, (uint64_t)"-[ACMKeychainTGTStoragePolicy performStoreToken:withService:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 243, 0, (uint64_t)CFSTR("Token keychain item attributes:"), v8, v9, v13);
    -[ACFKeychainItemInfo dump](v7, "dump");
    v10 = -[ACMKeychainTGTStoragePolicy storeItemWithInfo:](self, "storeItemWithInfo:", v7);
    if (v10)
      v11 = 0;
    else
      v11 = (void (*)(int, uint64_t, char *, uint64_t, const char *, char *, ...))v7;
    if (v10 && ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x10) != 0)
        ACFLog(4, (uint64_t)"-[ACMKeychainTGTStoragePolicy performStoreToken:withService:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 252, 0, "Error %d has occurred while trying to store SSO token");
LABEL_15:
      v11 = 0;
    }
  }
  else
  {
    v11 = ACFLog;
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACMKeychainTGTStoragePolicy performStoreToken:withService:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMKeychainTGTStoragePolicy.m", 259, 0, "Failed to store token");
      goto LABEL_15;
    }
  }
  return v11 != 0;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)useSharedStorage
{
  return self->_useSharedStorage;
}

- (void)setUseSharedStorage:(BOOL)a3
{
  self->_useSharedStorage = a3;
}

@end
