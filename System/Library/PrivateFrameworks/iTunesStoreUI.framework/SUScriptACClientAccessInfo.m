@implementation SUScriptACClientAccessInfo

- (SUScriptACClientAccessInfo)init
{
  SUScriptACClientAccessInfo *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptACClientAccessInfo;
  v2 = -[SUScriptObject init](&v4, sel_init);
  if (v2)
    v2->_dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptACClientAccessInfo;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (NSDictionary)accessInfoDictionary
{
  NSDictionary *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = (NSDictionary *)(id)-[NSMutableDictionary copy](self->_dictionary, "copy");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (SUScriptAppleAccountType)accountType
{
  SUScriptAppleAccountType *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_accountType;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (void)setAccountType:(id)a3
{
  SUScriptAppleAccountType *accountType;

  -[SUScriptObject lock](self, "lock");
  accountType = self->_accountType;
  if (accountType != a3)
  {

    self->_accountType = (SUScriptAppleAccountType *)a3;
  }
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setValue:(id)a3 forAccessKey:(id)a4
{
  OpaqueJSContext *v7;
  id v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = a3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[WebFrame globalContext](-[SUScriptObject webFrame](self, "webFrame"), "globalContext");

      v8 = (id)objc_msgSend(a3, "copyArrayOrDictionaryWithContext:", v7);
    }
    -[SUScriptObject lock](self, "lock");
    -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", v8, a4);
    -[SUScriptObject unlock](self, "unlock");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

- (id)valueForAccessKey:(id)a3
{
  id v5;

  -[SUScriptObject lock](self, "lock");
  v5 = (id)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
  -[SUScriptObject unlock](self, "unlock");
  return v5;
}

- (id)_className
{
  return CFSTR("iTunesAppleAccountClientAccessInfo");
}

- (NSString)accessKeyFacebookAppID
{
  return (NSString *)ISWeakLinkedStringConstantForString();
}

- (NSString)accessKeyFacebookPermissions
{
  return (NSString *)ISWeakLinkedStringConstantForString();
}

- (NSString)accessKeyPurposeStatement
{
  return (NSString *)CFSTR("ACPurposeStatementKey");
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_70, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptACClientAccessInfo;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_52, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptACClientAccessInfo;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptACClientAccessInfo;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_70, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_52 = (uint64_t)sel_valueForAccessKey_;
    *(_QWORD *)algn_255186FA8 = CFSTR("getAccessValue");
    qword_255186FB0 = (uint64_t)sel_setValue_forAccessKey_;
    unk_255186FB8 = CFSTR("setAccessValue");
    __KeyMapping_70 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("ACCESS_KEY_FACEBOOK_APP_ID"), CFSTR("accessKeyFacebookAppID"), CFSTR("ACCESS_KEY_FACEBOOK_PERMISSIONS"), CFSTR("accessKeyFacebookPermissions"), CFSTR("ACCESS_KEY_PURPOSE_STATEMENT"), CFSTR("accessKeyPurposeStatement"), 0);
  }
}

@end
