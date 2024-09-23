@implementation SUScriptPassbookLibrary

- (SUScriptPassbookLibrary)initWithPassLibrary:(id)a3
{
  SUScriptPassbookLibrary *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptPassbookLibrary;
  v4 = -[SUScriptObject init](&v6, sel_init);
  if (v4)
    v4->_passLibrary = (PKPassLibrary *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptPassbookLibrary;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)passWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  PKPass *v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a4 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore"), "accountWithUniqueIdentifier:", a4), "ITunesPassSerialNumber");
  v7 = -[PKPassLibrary passWithPassTypeIdentifier:serialNumber:](self->_passLibrary, "passWithPassTypeIdentifier:serialNumber:", a3, a4);
  if (v7)
  {
    v7 = -[SUScriptPassbookPass initWithPass:]([SUScriptPassbookPass alloc], "initWithPass:", v7);
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7);
  }
  return v7;
}

- (id)_className
{
  return CFSTR("iTunesPassbookLibrary");
}

- (NSArray)passes
{
  NSArray *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SUScriptPassbookPass *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = -[PKPassLibrary passes](self->_passLibrary, "passes");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = -[SUScriptPassbookPass initWithPass:]([SUScriptPassbookPass alloc], "initWithPass:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        -[NSArray addObject:](v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  -[SUScriptObject checkInScriptObjects:](self, "checkInScriptObjects:", v3);
  return v3;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_43, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptPassbookLibrary;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_34, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptPassbookLibrary;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptPassbookLibrary;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_43, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_34 = (uint64_t)sel_passWithPassTypeIdentifier_serialNumber_;
    *(_QWORD *)algn_2551869E8 = CFSTR("getPass");
    __KeyMapping_43 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("passes"), 0);
  }
}

@end
