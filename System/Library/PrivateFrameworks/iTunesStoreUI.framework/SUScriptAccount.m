@implementation SUScriptAccount

- (SUScriptAccount)init
{
  SUScriptAccount *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptAccount;
  v2 = -[SUScriptObject init](&v4, sel_init);
  if (v2)
    v2->_account = (SSAccount *)objc_alloc_init(MEMORY[0x24BEB1D80]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_account = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScriptAccount;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (SSAccount)account
{
  SSAccount *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_account;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (void)setAccount:(id)a3
{
  SSAccount *account;

  -[SUScriptObject lock](self, "lock");
  account = self->_account;
  if (account != a3)
  {

    self->_account = (SSAccount *)a3;
  }
  -[SUScriptObject unlock](self, "unlock");
}

- (BOOL)isManagedAppleID
{
  return -[SSAccount isManagedAppleID](self->_account, "isManagedAppleID");
}

- (BOOL)isPrimaryAccount
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore"), "activeAccount"), "uniqueIdentifier"), "isEqual:", -[SUScriptAccount dsID](self, "dsID"));
}

- (BOOL)isSecureTokenValid
{
  return objc_msgSend((id)-[SSAccount secureToken](-[SUScriptAccount account](self, "account"), "secureToken"), "length") != 0;
}

- (void)setSecureToken:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_7:
    -[SSAccount setSecureToken:](-[SUScriptAccount account](self, "account"), "setSecureToken:", v5);
    objc_msgSend(MEMORY[0x24BEB1D88], "resetExpiration");
    -[SUScriptAccount _commitChanges](self, "_commitChanges");
    return;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (!a3)
    goto LABEL_7;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = a3;
    if (objc_msgSend(a3, "length"))
      goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

- (id)_className
{
  return CFSTR("iTunesAccount");
}

- (NSString)credits
{
  return (NSString *)-[SSAccount creditsString](-[SUScriptAccount account](self, "account"), "creditsString");
}

- (NSNumber)dsID
{
  return (NSNumber *)-[SSAccount uniqueIdentifier](-[SUScriptAccount account](self, "account"), "uniqueIdentifier");
}

- (NSString)identifier
{
  return (NSString *)-[SSAccount accountName](-[SUScriptAccount account](self, "account"), "accountName");
}

- (id)isPrimaryLockerAccount
{
  int v2;
  id *v3;

  v2 = -[SSAccount isActiveLockerAccount](-[SUScriptAccount account](self, "account"), "isActiveLockerAccount");
  v3 = (id *)MEMORY[0x24BDBD270];
  if (!v2)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

- (NSString)kind
{
  SSAccount *v2;

  v2 = -[SUScriptAccount account](self, "account");
  if (!-[SSAccount uniqueIdentifier](v2, "uniqueIdentifier"))
    return (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  if (-[SSAccount accountKind](v2, "accountKind") == 1)
    return (NSString *)CFSTR("aol");
  return (NSString *)CFSTR("apple");
}

- (NSString)ITunesPassSerialNumber
{
  return (NSString *)-[SSAccount ITunesPassSerialNumber](-[SUScriptAccount account](self, "account"), "ITunesPassSerialNumber");
}

- (id)lockerEnabled
{
  char v2;
  id *v3;

  v2 = -[SSAccount enabledServiceTypes](-[SUScriptAccount account](self, "account"), "enabledServiceTypes");
  v3 = (id *)MEMORY[0x24BDBD270];
  if ((v2 & 4) == 0)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

- (id)purchaseHistoryEnabled
{
  char v2;
  id *v3;

  v2 = -[SSAccount enabledServiceTypes](-[SUScriptAccount account](self, "account"), "enabledServiceTypes");
  v3 = (id *)MEMORY[0x24BDBD270];
  if ((v2 & 2) == 0)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

- (void)setCredits:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_6:
    -[SSAccount setCreditsString:](-[SUScriptAccount account](self, "account"), "setCreditsString:", v5);
    -[SUScriptAccount _commitChanges](self, "_commitChanges");
    return;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (!a3)
    goto LABEL_6;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_6;
  objc_opt_class();
  v5 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

- (void)setDsID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  SSAccount *v9;
  SSAccount *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  v5 = SSGetUnsignedLongLongFromValue();
  v6 = v5;
  if (a3 && !v5)
  {
    v7 = (void *)MEMORY[0x24BDFA950];
    v8 = CFSTR("Invalid argument");
LABEL_11:
    objc_msgSend(v7, "throwException:", v8);
    return;
  }
  v9 = -[SUScriptAccount account](self, "account");
  v10 = v9;
  if (a3)
  {
    v11 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
    v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore"), "accountWithUniqueIdentifier:", v11);
    if (v12 && (SSAccount *)v12 != v10)
    {
      v7 = (void *)MEMORY[0x24BDFA950];
      v8 = CFSTR("A different account already exists for the DSID");
      goto LABEL_11;
    }
    v9 = v10;
    v13 = v11;
  }
  else
  {
    v13 = 0;
  }
  -[SSAccount setUniqueIdentifier:](v9, "setUniqueIdentifier:", v13);
  -[SUScriptAccount _commitChanges](self, "_commitChanges");
}

- (void)setIdentifier:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_6:
    -[SSAccount setAccountName:](-[SUScriptAccount account](self, "account"), "setAccountName:", v5);
    -[SUScriptAccount _commitChanges](self, "_commitChanges");
    return;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (!a3)
    goto LABEL_6;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_6;
  objc_opt_class();
  v5 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

- (void)setKind:(id)a3
{
  SSAccount *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("aol")))
    {
      v5 = -[SUScriptAccount account](self, "account");
      v6 = 1;
LABEL_7:
      -[SSAccount setAccountKind:](v5, "setAccountKind:", v6);
      -[SUScriptAccount _commitChanges](self, "_commitChanges");
      return;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("apple")))
    {
      v5 = -[SUScriptAccount account](self, "account");
      v6 = 0;
      goto LABEL_7;
    }
    v7 = (void *)MEMORY[0x24BDFA950];
    v8 = CFSTR("Unknown kind");
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDFA950];
    v8 = CFSTR("Invalid argument");
  }
  objc_msgSend(v7, "throwException:", v8);
}

- (void)setLockerEnabled:(id)a3
{
  -[SUScriptAccount _setServiceType:enabled:](self, "_setServiceType:enabled:", 4, a3);
}

- (void)setPurchaseHistoryEnabled:(id)a3
{
  -[SUScriptAccount _setServiceType:enabled:](self, "_setServiceType:enabled:", 4, a3);
}

- (void)setSocialEnabled:(id)a3
{
  -[SUScriptAccount _setServiceType:enabled:](self, "_setServiceType:enabled:", 1, a3);
}

- (id)socialEnabled
{
  char v2;
  id *v3;

  v2 = -[SSAccount enabledServiceTypes](-[SUScriptAccount account](self, "account"), "enabledServiceTypes");
  v3 = (id *)MEMORY[0x24BDBD270];
  if ((v2 & 1) == 0)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

- (void)_commitChanges
{
  SSAccount *v2;

  v2 = -[SUScriptAccount account](self, "account");
  if (-[SSAccount uniqueIdentifier](v2, "uniqueIdentifier"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore"), "addAccount:", v2);
}

- (void)_setServiceType:(int64_t)a3 enabled:(id)a4
{
  int v7;
  SSAccount *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = objc_msgSend(a4, "BOOLValue");
    v8 = -[SUScriptAccount account](self, "account");
    if (v7)
      -[SSAccount addEnabledServiceTypes:](v8, "addEnabledServiceTypes:", a3);
    else
      -[SSAccount removeEnabledServiceTypes:](v8, "removeEnabledServiceTypes:", a3);
    -[SUScriptAccount _commitChanges](self, "_commitChanges");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_14, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAccount;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_11, 4);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAccount;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptAccount;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_14, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_11 = (uint64_t)sel_isManagedAppleID;
    unk_255186230 = CFSTR("isManagedAppleID");
    qword_255186238 = (uint64_t)sel_isPrimaryAccount;
    unk_255186240 = CFSTR("isPrimaryAccount");
    qword_255186248 = (uint64_t)sel_isSecureTokenValid;
    unk_255186250 = CFSTR("isSecureTokenValid");
    qword_255186258 = (uint64_t)sel_setSecureToken_;
    unk_255186260 = CFSTR("setSecureToken");
    __KeyMapping_14 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("credits"), CFSTR("dsID"), CFSTR("dsID"), CFSTR("identifier"), CFSTR("identifier"), CFSTR("isPrimaryLockerAccount"), CFSTR("isPrimaryLockerAccount"), CFSTR("ITunesPassSerialNumber"), CFSTR("ITunesPassSerialNumber"), CFSTR("kind"), CFSTR("kind"), CFSTR("lockerEnabled"), CFSTR("lockerEnabled"), CFSTR("purchaseHistoryEnabled"), CFSTR("purchaseHistoryEnabled"), CFSTR("socialEnabled"), CFSTR("socialEnabled"),
                        0);
  }
}

@end
