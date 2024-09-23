@implementation SUScriptAppleAccount

- (SUScriptAppleAccount)initWithACAccount:(id)a3 accountStore:(id)a4
{
  SUScriptAppleAccount *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUScriptAppleAccount;
  v6 = -[SUScriptObject init](&v8, sel_init);
  if (v6)
  {
    v6->_account = (ACAccount *)a3;
    v6->_accountStore = (ACAccountStore *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptAppleAccount;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (ACAccount)nativeAccount
{
  return self->_account;
}

- (ACAccountStore)nativeAccountStore
{
  return self->_accountStore;
}

- (void)reload
{
  -[ACAccount reload](self->_account, "reload");
}

- (void)setAgeVerificationExpirationDate:(id)a3 completionHandler:(id)a4
{
  void *v7;
  double v8;
  ACAccount *account;
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
      v7 = (void *)objc_msgSend(a3, "copyDate");
      objc_msgSend(v7, "timeIntervalSince1970");
      account = self->_account;
      v10 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", (uint64_t)v8);
      -[ACAccount ams_setAccountFlagValue:forAccountFlag:](account, "ams_setAccountFlagValue:forAccountFlag:", v10, *MEMORY[0x24BE07C80]);
      v11 = (void *)-[ACAccountStore ams_saveAccount:verifyCredentials:](self->_accountStore, "ams_saveAccount:verifyCredentials:", self->_account, 0);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __75__SUScriptAppleAccount_setAgeVerificationExpirationDate_completionHandler___block_invoke;
      v12[3] = &unk_24DE7CDB8;
      v12[4] = self;
      v12[5] = a4;
      objc_msgSend(v11, "addFinishBlock:", v12);

      return;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      a4 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", a4);
      goto LABEL_8;
    }
  }
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

void __75__SUScriptAppleAccount_setAgeVerificationExpirationDate_completionHandler___block_invoke(uint64_t a1, uint64_t a2, SUScriptError *a3)
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
  SUScriptError *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
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
      v14 = 138412546;
      v15 = objc_opt_class();
      v16 = 2112;
      v17 = a3;
      LODWORD(v13) = 22;
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
  }
  if (a3)
    a3 = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", a3);
  objc_msgSend(*(id *)(a1 + 40), "callWithArguments:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2, v12), a3, 0));
  objc_msgSend(*(id *)(a1 + 40), "setThisObject:", 0);

}

- (NSString)accountDescription
{
  return -[ACAccount accountDescription](self->_account, "accountDescription");
}

- (SUScriptAppleAccountType)accountType
{
  ACAccountType *v3;

  v3 = -[ACAccount accountType](self->_account, "accountType");
  if (v3)
  {
    v3 = -[SUScriptAppleAccountType initWithACAccountType:]([SUScriptAppleAccountType alloc], "initWithACAccountType:", v3);
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  }
  return (SUScriptAppleAccountType *)v3;
}

- (id)_className
{
  return CFSTR("iTunesAppleAccount");
}

- (SUScriptAppleAccountCredential)credential
{
  ACAccountCredential *v3;

  v3 = -[ACAccount credential](self->_account, "credential");
  if (v3)
  {
    v3 = -[SUScriptAppleAccountCredential initWithACAccountCredential:]([SUScriptAppleAccountCredential alloc], "initWithACAccountCredential:", v3);
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v3);
  }
  return (SUScriptAppleAccountCredential *)v3;
}

- (NSString)dsID
{
  return (NSString *)-[ACAccount aa_personID](self->_account, "aa_personID");
}

- (NSString)identifier
{
  return -[ACAccount identifier](self->_account, "identifier");
}

- (NSString)username
{
  return -[ACAccount username](self->_account, "username");
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_68, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAppleAccount;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_51, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAppleAccount;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptAppleAccount;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_68, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_51 = (uint64_t)sel_reload;
    *(_QWORD *)algn_255186F78 = CFSTR("reload");
    qword_255186F80 = (uint64_t)sel_setAgeVerificationExpirationDate_completionHandler_;
    unk_255186F88 = CFSTR("setAgeVerificationExpirationDate");
    __KeyMapping_68 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("accountDescription"), CFSTR("accountType"), CFSTR("accountType"), CFSTR("credential"), CFSTR("credential"), CFSTR("dsID"), CFSTR("dsID"), CFSTR("identifier"), CFSTR("identifier"), CFSTR("username"), CFSTR("username"), 0);
  }
}

@end
