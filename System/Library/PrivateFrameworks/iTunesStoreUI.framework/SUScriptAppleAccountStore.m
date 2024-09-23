@implementation SUScriptAppleAccountStore

- (SUScriptAppleAccountStore)init
{
  SUScriptAppleAccountStore *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptAppleAccountStore;
  v2 = -[SUScriptObject init](&v4, sel_init);
  if (v2)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__accountStoreChangeNotification_, ISWeakLinkedStringConstantForString(), -[SUScriptAppleAccountStore _accountStore](v2, "_accountStore"));
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, ISWeakLinkedStringConstantForString(), 0);

  v3.receiver = self;
  v3.super_class = (Class)SUScriptAppleAccountStore;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)accountsWithAccountType:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SUScriptAppleAccount *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[SUScriptAppleAccountStore _accountStore](self, "_accountStore");
    v7 = (void *)objc_msgSend(v6, "accountsWithAccountType:", objc_msgSend(a3, "nativeAccountType"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = -[SUScriptAppleAccount initWithACAccount:accountStore:]([SUScriptAppleAccount alloc], "initWithACAccount:accountStore:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), v6);
          objc_msgSend(v5, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }
    -[SUScriptObject checkInScriptObjects:](self, "checkInScriptObjects:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
  return v5;
}

- (id)accountTypeWithIdentifier:(id)a3
{
  SUScriptAppleAccountType *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (SUScriptAppleAccountType *)objc_msgSend(-[SUScriptAppleAccountStore _accountStore](self, "_accountStore"), "accountTypeWithAccountTypeIdentifier:", a3);
    if (v5)
    {
      v5 = -[SUScriptAppleAccountType initWithACAccountType:]([SUScriptAppleAccountType alloc], "initWithACAccountType:", v5);
      -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v5);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    v5 = 0;
  }
  return v5;
}

- (id)makeClientAccessInfoWithAccountType:(id)a3
{
  SUScriptACClientAccessInfo *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_alloc_init(SUScriptACClientAccessInfo);
    -[SUScriptACClientAccessInfo setAccountType:](v5, "setAccountType:", a3);
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    v5 = 0;
  }
  return v5;
}

- (void)renewCredentialsForAccount:(id)a3 completionHandler:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!a4)
    {
LABEL_8:
      objc_msgSend(a4, "setThisObject:", self);
      v7 = -[SUScriptAppleAccountStore _accountStore](self, "_accountStore");
      v8 = objc_msgSend(a3, "nativeAccount");
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __74__SUScriptAppleAccountStore_renewCredentialsForAccount_completionHandler___block_invoke;
      v10[3] = &unk_24DE7DFD0;
      v10[4] = self;
      v10[5] = a4;
      objc_msgSend(v7, "renewCredentialsForAccount:completion:", v8, v10);

      return;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      a4 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", a4);
      goto LABEL_8;
    }
    v9 = (void *)MEMORY[0x24BDFA950];
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDFA950];
  }
  objc_msgSend(v9, "throwException:", CFSTR("Invalid argument"));
}

void __74__SUScriptAppleAccountStore_renewCredentialsForAccount_completionHandler___block_invoke(uint64_t a1, uint64_t a2, SUScriptError *a3)
{
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  SUScriptError *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_DEBUG))
    v8 &= 2u;
  if (v8)
  {
    v14 = 138412802;
    v15 = objc_opt_class();
    v16 = 2048;
    v17 = a2;
    v18 = 2112;
    v19 = a3;
    LODWORD(v13) = 32;
    v12 = &v14;
    v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v14, v13);
      free(v10);
      v12 = (int *)v11;
      SSFileLog();
    }
  }
  if (a3)
    a3 = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", a3);
  objc_msgSend(*(id *)(a1 + 40), "callWithArguments:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2, v12), a3, 0));
  objc_msgSend(*(id *)(a1 + 40), "setThisObject:", 0);

}

- (void)requestAccessWithInfo:(id)a3 completionHandler:(id)a4
{
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[6];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!a4)
    {
LABEL_8:
      objc_msgSend(a4, "setThisObject:", self);
      v7 = (void *)objc_msgSend(a3, "accountType");
      v8 = -[SUScriptAppleAccountStore _accountStore](self, "_accountStore");
      v9 = objc_msgSend(v7, "nativeAccountType");
      v10 = objc_msgSend(a3, "accessInfoDictionary");
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __69__SUScriptAppleAccountStore_requestAccessWithInfo_completionHandler___block_invoke;
      v12[3] = &unk_24DE7CDB8;
      v12[4] = self;
      v12[5] = a4;
      objc_msgSend(v8, "requestAccessToAccountsWithType:options:completion:", v9, v10, v12);

      return;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      a4 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", a4);
      goto LABEL_8;
    }
    v11 = (void *)MEMORY[0x24BDFA950];
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDFA950];
  }
  objc_msgSend(v11, "throwException:", CFSTR("Invalid argument"));
}

void __69__SUScriptAppleAccountStore_requestAccessWithInfo_completionHandler___block_invoke(uint64_t a1, int a2, SUScriptError *a3)
{
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  SUScriptError *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) == 0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v8 &= 2u;
    if (v8)
    {
      v13 = 138412546;
      v14 = objc_opt_class();
      v15 = 2112;
      v16 = a3;
      LODWORD(v12) = 22;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v13, v12);
        free(v10);
        SSFileLog();
      }
    }
  }
  if (a3)
    a3 = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", a3);
  v11 = (_QWORD *)MEMORY[0x24BDBD268];
  if (a2)
    v11 = (_QWORD *)MEMORY[0x24BDBD270];
  objc_msgSend(*(id *)(a1 + 40), "callWithArguments:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", *v11, a3, 0));
  objc_msgSend(*(id *)(a1 + 40), "setThisObject:", 0);

}

- (id)_className
{
  return CFSTR("iTunesAppleAccountStore");
}

- (SUScriptAppleAccount)activeStoreAccount
{
  id v3;
  SUScriptAppleAccount *result;
  SUScriptAppleAccount *v5;

  v3 = -[SUScriptAppleAccountStore _accountStore](self, "_accountStore");
  result = (SUScriptAppleAccount *)objc_msgSend(v3, "ams_activeiTunesAccount");
  if (result)
  {
    v5 = -[SUScriptAppleAccount initWithACAccount:accountStore:]([SUScriptAppleAccount alloc], "initWithACAccount:accountStore:", result, v3);
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v5);
    return v5;
  }
  return result;
}

- (SUScriptAppleAccount)primaryAppleAccount
{
  id v2;
  SUScriptAppleAccount *result;

  v2 = -[SUScriptAppleAccountStore _accountStore](self, "_accountStore");
  result = (SUScriptAppleAccount *)objc_msgSend(v2, "aa_primaryAppleAccount");
  if (result)
    return -[SUScriptAppleAccount initWithACAccount:accountStore:]([SUScriptAppleAccount alloc], "initWithACAccount:accountStore:", result, v2);
  return result;
}

- (NSString)effectiveBundleID
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_effectiveBundleID;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (void)setEffectiveBundleID:(id)a3
{
  NSString *v5;
  char isKindOfClass;
  NSString *effectiveBundleID;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = 0;
    if (a3)
    {
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        v5 = (NSString *)a3;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
          return;
        }
      }
    }
  }
  -[SUScriptObject lock](self, "lock");
  effectiveBundleID = self->_effectiveBundleID;
  if (effectiveBundleID != v5 && !-[NSString isEqualToString:](effectiveBundleID, "isEqualToString:", v5))
  {

    self->_effectiveBundleID = (NSString *)-[NSString copy](v5, "copy");
    self->_accountStore = 0;
  }
  -[SUScriptObject unlock](self, "unlock");
}

- (NSString)accessPurposeRead
{
  return (NSString *)CFSTR("read");
}

- (NSString)accessPurposeReadWrite
{
  return (NSString *)CFSTR("read_write");
}

- (NSString)accessPurposeWrite
{
  return (NSString *)CFSTR("write");
}

- (NSString)accountTypeIdentifierTwitter
{
  return 0;
}

- (int64_t)renewResultFailed
{
  return 2;
}

- (int64_t)renewResultRejected
{
  return 1;
}

- (int64_t)renewResultRenewed
{
  return 0;
}

- (void)_accountStoreChangeNotification:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](self, "dispatchEvent:forName:", 0, CFSTR("accountschange"));
}

- (id)_accountStore
{
  ACAccountStore *accountStore;
  NSString *effectiveBundleID;
  objc_class *v5;
  ACAccountStore *v6;

  -[SUScriptObject lock](self, "lock");
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    effectiveBundleID = self->_effectiveBundleID;
    v5 = (objc_class *)ISWeakLinkedClassForString();
    if (effectiveBundleID)
      accountStore = (ACAccountStore *)objc_msgSend([v5 alloc], "initWithEffectiveBundleID:", self->_effectiveBundleID);
    else
      accountStore = (ACAccountStore *)objc_alloc_init(v5);
    self->_accountStore = accountStore;
  }
  v6 = accountStore;
  -[SUScriptObject unlock](self, "unlock");
  return v6;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_66, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAppleAccountStore;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_50, 5);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAppleAccountStore;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptAppleAccountStore;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_66, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_50 = (uint64_t)sel_accountsWithAccountType_;
    *(_QWORD *)algn_255186F18 = CFSTR("getAccountsWithAccountType");
    qword_255186F20 = (uint64_t)sel_accountTypeWithIdentifier_;
    unk_255186F28 = CFSTR("getAccountTypeWithIdentifier");
    qword_255186F30 = (uint64_t)sel_makeClientAccessInfoWithAccountType_;
    unk_255186F38 = CFSTR("createAccessInfo");
    qword_255186F40 = (uint64_t)sel_renewCredentialsForAccount_completionHandler_;
    unk_255186F48 = CFSTR("renewCredentials");
    qword_255186F50 = (uint64_t)sel_requestAccessWithInfo_completionHandler_;
    unk_255186F58 = CFSTR("requestAccess");
    __KeyMapping_66 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("activeStoreAccount"), CFSTR("effectiveBundleID"), CFSTR("effectiveBundleID"), CFSTR("primaryAppleAccount"), CFSTR("primaryAppleAccount"), CFSTR("ACCESS_PURPOSE_READ"), CFSTR("accessPurposeRead"), CFSTR("ACCESS_PURPOSE_READ_WRITE"), CFSTR("accessPurposeReadWrite"), CFSTR("ACCESS_PURPOSE_WRITE"), CFSTR("accessPurposeWrite"), CFSTR("ACCOUNT_TYPE_IDENTIFIER_FACEBOOK"), CFSTR("accountTypeIdentifierFacebook"), CFSTR("ACCOUNT_TYPE_IDENTIFIER_SINA_WEIBO"), CFSTR("accountTypeIdentifierSinaWeibo"), CFSTR("ACCOUNT_TYPE_IDENTIFIER_TWITTER"), CFSTR("accountTypeIdentifierTwitter"),
                        CFSTR("RENEW_RESULT_FAILED"),
                        CFSTR("renewResultFailed"),
                        CFSTR("RENEW_RESULT_REJECTED"),
                        CFSTR("renewResultRejected"),
                        CFSTR("RENEW_RESULT_RENEWED"),
                        CFSTR("renewResultRenewed"),
                        0);
  }
}

@end
