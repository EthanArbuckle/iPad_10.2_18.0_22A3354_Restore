@implementation SUScriptDateFormatter

- (SUScriptDateFormatter)init
{
  SUScriptDateFormatter *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptDateFormatter;
  v2 = -[SUScriptObject init](&v4, sel_init);
  if (v2)
    v2->_dateFormatter = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptDateFormatter;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (double)dateFromString:(id)a3
{
  double v5;
  double v6;

  -[SUScriptObject lock](self, "lock");
  -[NSDate timeIntervalSinceReferenceDate](-[NSDateFormatter dateFromString:](self->_dateFormatter, "dateFromString:", a3), "timeIntervalSinceReferenceDate");
  v6 = v5;
  -[SUScriptObject unlock](self, "unlock");
  return v6;
}

- (id)stringFromDate:(id)a3
{
  NSDateFormatter *dateFormatter;
  void *v6;
  NSString *v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SUScriptObject lock](self, "lock");
    dateFormatter = self->_dateFormatter;
    v6 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(a3, "doubleValue");
    v7 = -[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:"));
    -[SUScriptObject unlock](self, "unlock");
    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    return 0;
  }
}

- (id)_className
{
  return CFSTR("iTunesDateFormatter");
}

- (NSString)dateFormat
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = -[NSDateFormatter dateFormat](self->_dateFormatter, "dateFormat");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (unint64_t)dateStyle
{
  NSDateFormatterStyle v3;

  -[SUScriptObject lock](self, "lock");
  v3 = -[NSDateFormatter dateStyle](self->_dateFormatter, "dateStyle");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (NSString)localeIdentifier
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = -[NSLocale localeIdentifier](-[NSDateFormatter locale](self->_dateFormatter, "locale"), "localeIdentifier");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (void)setDateFormat:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_6:
    -[SUScriptObject lock](self, "lock");
    -[NSDateFormatter setDateFormat:](self->_dateFormatter, "setDateFormat:", v5);
    -[SUScriptObject unlock](self, "unlock");
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

- (void)setDateStyle:(unint64_t)a3
{
  -[SUScriptObject lock](self, "lock");
  -[NSDateFormatter setDateStyle:](self->_dateFormatter, "setDateStyle:", a3);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setLocaleIdentifier:(id)a3
{
  uint64_t v5;
  id v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", a3)) != 0)
  {
    v6 = (id)v5;
    -[SUScriptObject lock](self, "lock");
    -[NSDateFormatter setLocale:](self->_dateFormatter, "setLocale:", v6);
    -[SUScriptObject unlock](self, "unlock");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

- (void)setTimeStyle:(unint64_t)a3
{
  -[SUScriptObject lock](self, "lock");
  -[NSDateFormatter setTimeStyle:](self->_dateFormatter, "setTimeStyle:", a3);
  -[SUScriptObject unlock](self, "unlock");
}

- (unint64_t)timeStyle
{
  NSDateFormatterStyle v3;

  -[SUScriptObject lock](self, "lock");
  v3 = -[NSDateFormatter timeStyle](self->_dateFormatter, "timeStyle");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (unint64_t)dateFormatterFullStyle
{
  return 4;
}

- (unint64_t)dateFormatterLongStyle
{
  return 3;
}

- (unint64_t)dateFormatterMediumStyle
{
  return 2;
}

- (unint64_t)dateFormatterNoStyle
{
  return 0;
}

- (unint64_t)dateFormatterShortStyle
{
  return 1;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_58, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDateFormatter;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_43, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDateFormatter;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptDateFormatter;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_58, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_43 = (uint64_t)sel_dateFromString_;
    *(_QWORD *)algn_255186D48 = CFSTR("dateFromString");
    qword_255186D50 = (uint64_t)sel_stringFromDate_;
    unk_255186D58 = CFSTR("stringFromDate");
    __KeyMapping_58 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("dateFormat"), CFSTR("dateStyle"), CFSTR("dateStyle"), CFSTR("localeIdentifier"), CFSTR("localeIdentifier"), CFSTR("timeStyle"), CFSTR("timeStyle"), CFSTR("DATE_FORMATTER_STYLE_FULL"), CFSTR("dateFormatterFullStyle"), CFSTR("DATE_FORMATTER_STYLE_LONG"), CFSTR("dateFormatterLongStyle"), CFSTR("DATE_FORMATTER_STYLE_MEDIUM"), CFSTR("dateFormatterMediumStyle"), CFSTR("DATE_FORMATTER_STYLE_NONE"), CFSTR("dateFormatterNoStyle"), CFSTR("DATE_FORMATTER_STYLE_SHORT"), CFSTR("dateFormatterShortStyle"),
                        0);
  }
}

@end
