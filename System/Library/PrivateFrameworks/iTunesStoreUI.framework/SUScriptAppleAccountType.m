@implementation SUScriptAppleAccountType

- (SUScriptAppleAccountType)initWithACAccountType:(id)a3
{
  SUScriptAppleAccountType *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptAppleAccountType;
  v4 = -[SUScriptObject init](&v6, sel_init);
  if (v4)
    v4->_accountType = (ACAccountType *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptAppleAccountType;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)accessGranted
{
  _BOOL4 v2;
  id *v3;

  v2 = -[ACAccountType accessGranted](self->_accountType, "accessGranted");
  v3 = (id *)MEMORY[0x24BDBD270];
  if (!v2)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

- (NSString)accountTypeDescription
{
  return -[ACAccountType accountTypeDescription](self->_accountType, "accountTypeDescription");
}

- (id)_className
{
  return CFSTR("iTunesAppleAccountType");
}

- (NSString)identifier
{
  return -[ACAccountType identifier](self->_accountType, "identifier");
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_67, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAppleAccountType;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptAppleAccountType;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_67, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __KeyMapping_67 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("accessGranted"), CFSTR("accountTypeDescription"), CFSTR("accountTypeDescription"), CFSTR("identifier"), CFSTR("identifier"), 0);
}

- (ACAccountType)nativeAccountType
{
  return self->_accountType;
}

@end
