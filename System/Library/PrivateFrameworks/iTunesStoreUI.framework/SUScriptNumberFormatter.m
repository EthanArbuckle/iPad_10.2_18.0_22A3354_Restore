@implementation SUScriptNumberFormatter

- (SUScriptNumberFormatter)init
{
  SUScriptNumberFormatter *v2;
  NSNumberFormatter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptNumberFormatter;
  v2 = -[SUScriptObject init](&v5, sel_init);
  if (v2)
  {
    v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x24BDD16F0]);
    v2->_numberFormatter = v3;
    -[NSNumberFormatter setNumberStyle:](v3, "setNumberStyle:", 1);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptNumberFormatter;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)numberFromString:(id)a3
{
  NSNumber *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUScriptObject lock](self, "lock");
    v5 = -[NSNumberFormatter numberFromString:](self->_numberFormatter, "numberFromString:", a3);
    -[SUScriptObject unlock](self, "unlock");
    if (v5)
      return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
}

- (id)stringFromNumber:(id)a3
{
  NSString *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUScriptObject lock](self, "lock");
    v5 = -[NSNumberFormatter stringFromNumber:](self->_numberFormatter, "stringFromNumber:", a3);
    -[SUScriptObject unlock](self, "unlock");
    if (v5)
      return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
}

- (NSString)localeIdentifier
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = -[NSLocale localeIdentifier](-[NSNumberFormatter locale](self->_numberFormatter, "locale"), "localeIdentifier");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (void)setLocaleIdentifier:(id)a3
{
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  id v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", a3);
    if (v5)
    {
      v8 = (id)v5;
      -[SUScriptObject lock](self, "lock");
      -[NSNumberFormatter setLocale:](self->_numberFormatter, "setLocale:", v8);
      -[SUScriptObject unlock](self, "unlock");

      return;
    }
    v6 = (void *)MEMORY[0x24BDFA950];
    v7 = CFSTR("Unknown locale");
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDFA950];
    v7 = CFSTR("Invalid argument");
  }
  objc_msgSend(v6, "throwException:", v7);
}

- (void)setStyle:(id)a3
{
  char isKindOfClass;
  uint64_t v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 1;
  if (a3 && (isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(a3, "isEqualToString:", CFSTR("decimal")) & 1) != 0)
    {
LABEL_6:
      v6 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("none")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("currency")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("percent")) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("scientific")) & 1) != 0)
    {
      v6 = 4;
    }
    else if (objc_msgSend(a3, "isEqualToString:", CFSTR("spell-out")))
    {
      v6 = 5;
    }
    else
    {
      v6 = 1;
    }
  }
LABEL_7:
  -[SUScriptObject lock](self, "lock");
  -[NSNumberFormatter setNumberStyle:](self->_numberFormatter, "setNumberStyle:", v6);
  -[SUScriptObject unlock](self, "unlock");
}

- (NSString)style
{
  NSNumberFormatterStyle v3;

  -[SUScriptObject lock](self, "lock");
  v3 = -[NSNumberFormatter numberStyle](self->_numberFormatter, "numberStyle");
  -[SUScriptObject unlock](self, "unlock");
  if (v3 > NSNumberFormatterSpellOutStyle)
    return (NSString *)CFSTR("decimal");
  else
    return &off_24DE7C790[v3]->isa;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_27, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptNumberFormatter;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_22, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptNumberFormatter;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptNumberFormatter;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_27, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_22 = (uint64_t)sel_numberFromString_;
    *(_QWORD *)algn_255186508 = CFSTR("numberFromString");
    qword_255186510 = (uint64_t)sel_stringFromNumber_;
    unk_255186518 = CFSTR("stringFromNumber");
    __KeyMapping_27 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("localeIdentifier"), CFSTR("style"), CFSTR("style"), 0);
  }
}

@end
