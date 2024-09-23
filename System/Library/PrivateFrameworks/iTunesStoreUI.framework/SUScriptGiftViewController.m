@implementation SUScriptGiftViewController

- (id)newNativeViewController
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v3 = ISUIMobileStoreUIFramework();
  v4 = objc_alloc((Class)ISUIWeakLinkedClassForString(CFSTR("SUUIGift"), v3));
  -[SUScriptObject lock](self, "lock");
  if (self->_item)
    v5 = objc_msgSend(v4, "initWithItem:");
  else
    v5 = objc_msgSend(v4, "initWithGiftCategory:", self->_giftCategory);
  v6 = (void *)v5;
  -[SUScriptObject unlock](self, "unlock");
  v7 = ISUIMobileStoreUIFramework();
  v8 = (void *)objc_msgSend(objc_alloc((Class)ISUIWeakLinkedClassForString(CFSTR("SUUIGiftViewController"), v7)), "initWithGift:", v6);
  v9 = ISUIMobileStoreUIFramework();
  objc_msgSend(v8, "setClientContext:", objc_msgSend(ISUIWeakLinkedClassForString(CFSTR("SUUIClientContext"), v9), "defaultContext"));

  return v8;
}

- (void)setCreditGiftStyle:(int64_t)a3
{
  -[SUScriptObject lock](self, "lock");
  self->_giftCategory = a3;
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setProductGiftItem:(id)a3
{
  char isKindOfClass;
  uint64_t v6;
  SUUIItem *v7;
  id v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0)
  {
    -[SUScriptObject lock](self, "lock");

    self->_item = 0;
    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (id)objc_msgSend(a3, "copyArrayOrDictionaryWithContext:", -[SUScriptObject copyJavaScriptContext](self, "copyJavaScriptContext"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = ISUIMobileStoreUIFramework();
        v7 = (SUUIItem *)objc_msgSend(objc_alloc((Class)ISUIWeakLinkedClassForString(CFSTR("SUUIItem"), v6)), "initWithLookupDictionary:", v8);
        -[SUScriptObject lock](self, "lock");

        self->_item = v7;
        -[SUScriptObject unlock](self, "unlock");
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    }
  }
}

- (id)_className
{
  return CFSTR("iTunesGiftViewController");
}

- (int64_t)giftCategoryApps
{
  return 0;
}

- (int64_t)giftCategoryBooks
{
  return 2;
}

- (int64_t)giftCategoryMedia
{
  return 1;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_80, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptGiftViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_60, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptGiftViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptGiftViewController;
  v2 = -[SUScriptViewController scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_80, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_60 = (uint64_t)sel_setCreditGiftStyle_;
    *(_QWORD *)algn_2551871E8 = CFSTR("setCreditGiftStyle");
    qword_2551871F0 = (uint64_t)sel_setProductGiftItem_;
    unk_2551871F8 = CFSTR("setProductGiftItem");
    __KeyMapping_80 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("GIFT_STYLE_APPS"), CFSTR("giftCategoryApps"), CFSTR("GIFT_STYLE_BOOKS"), CFSTR("giftCategoryBooks"), CFSTR("GIFT_STYLE_MEDIA"), CFSTR("giftCategoryMedia"), 0);
  }
}

@end
