@implementation SUScriptPurchaseManager

- (SUScriptPurchaseManager)init
{
  SUScriptPurchaseManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptPurchaseManager;
  v2 = -[SUScriptObject init](&v4, sel_init);
  if (v2)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__purchaseRequestsChangedNotification_, CFSTR("SSPurchaseRequestsChangedNotification"), 0);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("SSPurchaseRequestsChangedNotification"), 0);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptPurchaseManager;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)isPurchasedItemIdentifier:(id)a3
{
  uint64_t v4;
  _BOOL4 v5;
  id *v6;

  v4 = SSGetUnsignedLongLongFromValue();
  if (v4)
  {
    v5 = -[SUPurchaseManager itemIdentifierIsPurchased:](-[SUClientInterface purchaseManager](-[SUScriptObject clientInterface](self, "clientInterface"), "purchaseManager"), "itemIdentifierIsPurchased:", v4);
    v6 = (id *)MEMORY[0x24BDBD270];
    if (!v5)
      v6 = (id *)MEMORY[0x24BDBD268];
  }
  else
  {
    v6 = (id *)MEMORY[0x24BDBD268];
  }
  return *v6;
}

- (id)isPurchasingItemIdentifier:(id)a3
{
  uint64_t v4;
  _BOOL4 v5;
  id *v6;

  v4 = SSGetUnsignedLongLongFromValue();
  if (v4)
  {
    v5 = -[SUPurchaseManager itemIdentifierIsPurchasing:](-[SUClientInterface purchaseManager](-[SUScriptObject clientInterface](self, "clientInterface"), "purchaseManager"), "itemIdentifierIsPurchasing:", v4);
    v6 = (id *)MEMORY[0x24BDBD270];
    if (!v5)
      v6 = (id *)MEMORY[0x24BDBD268];
  }
  else
  {
    v6 = (id *)MEMORY[0x24BDBD268];
  }
  return *v6;
}

- (id)_className
{
  return CFSTR("iTunesPurchaseManager");
}

- (void)_purchaseRequestsChangedNotification:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](self, "dispatchEvent:forName:", 0, CFSTR("requestchange"));
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_44, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptPurchaseManager;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_44 = (uint64_t)sel_isPurchasedItemIdentifier_;
    *(_QWORD *)algn_255186DD8 = CFSTR("isPurchasedItemIdentifier");
    qword_255186DE0 = (uint64_t)sel_isPurchasingItemIdentifier_;
    unk_255186DE8 = CFSTR("isPurchasingItemIdentifier");
  }
}

@end
