@implementation SUScriptRedeemViewController

- (id)newNativeViewController
{
  uint64_t v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;

  v3 = ISUIMobileStoreUIFramework();
  v4 = (objc_class *)ISUIWeakLinkedClassForString(CFSTR("SUUIRedeemViewController"), v3);
  -[SUScriptObject lock](self, "lock");
  v5 = (void *)objc_msgSend([v4 alloc], "initWithRedeemCategory:", self->_category);
  objc_msgSend(v5, "setInitialCode:", self->_initialCode);
  -[SUScriptObject unlock](self, "unlock");
  v6 = ISUIMobileStoreUIFramework();
  objc_msgSend(v5, "setClientContext:", objc_msgSend(ISUIWeakLinkedClassForString(CFSTR("SUUIClientContext"), v6), "defaultContext"));
  return v5;
}

- (void)setRedeemStyle:(int64_t)a3
{
  -[SUScriptObject lock](self, "lock");
  self->_category = a3;
  -[SUScriptObject unlock](self, "unlock");
}

- (id)_className
{
  return CFSTR("iTunesRedeemViewController");
}

- (void)setInitialCode:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUScriptObject lock](self, "lock");
    self->_initialCode = (NSString *)objc_msgSend(a3, "copy");
    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

- (NSString)initialCode
{
  return self->_initialCode;
}

- (int64_t)redeemCategoryApps
{
  return 0;
}

- (int64_t)redeemCategoryBooks
{
  return 2;
}

- (int64_t)redeemCategoryMedia
{
  return 1;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_82, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptRedeemViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_62, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptRedeemViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptRedeemViewController;
  v2 = -[SUScriptViewController scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_82, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_62 = (uint64_t)sel_setRedeemStyle_;
    *(_QWORD *)algn_255187238 = CFSTR("setRedeemStyle");
    __KeyMapping_82 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("initialCode"), CFSTR("REDEEM_STYLE_APPS"), CFSTR("redeemCategoryApps"), CFSTR("REDEEM_STYLE_BOOKS"), CFSTR("redeemCategoryBooks"), CFSTR("REDEEM_STYLE_MEDIA"), CFSTR("redeemCategoryMedia"), 0);
  }
}

@end
