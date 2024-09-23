@implementation SUScriptPassbookPass

- (SUScriptPassbookPass)initWithPass:(id)a3
{
  SUScriptPassbookPass *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptPassbookPass;
  v4 = -[SUScriptObject init](&v6, sel_init);
  if (v4)
    v4->_pass = (PKPass *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptPassbookPass;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)_className
{
  return CFSTR("iTunesPassbookPass");
}

- (NSString)passTypeIdentifier
{
  return -[PKPass passTypeIdentifier](self->_pass, "passTypeIdentifier");
}

- (NSString)passURL
{
  return -[NSURL absoluteString](-[PKPass passURL](self->_pass, "passURL"), "absoluteString");
}

- (NSString)serialNumber
{
  return -[PKPass serialNumber](self->_pass, "serialNumber");
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_45, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptPassbookPass;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptPassbookPass;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_45, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __KeyMapping_45 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("passTypeIdentifier"), CFSTR("passURL"), CFSTR("passURL"), CFSTR("serialNumber"), CFSTR("serialNumber"), 0);
}

@end
