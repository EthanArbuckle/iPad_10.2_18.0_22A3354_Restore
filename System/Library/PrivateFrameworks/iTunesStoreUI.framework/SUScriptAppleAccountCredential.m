@implementation SUScriptAppleAccountCredential

- (SUScriptAppleAccountCredential)initWithACAccountCredential:(id)a3
{
  SUScriptAppleAccountCredential *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptAppleAccountCredential;
  v4 = -[SUScriptObject init](&v6, sel_init);
  if (v4)
    v4->_credential = (ACAccountCredential *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptAppleAccountCredential;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)_className
{
  return CFSTR("iTunesAppleAccountCredential");
}

- (NSString)oauthToken
{
  return -[ACAccountCredential oauthToken](self->_credential, "oauthToken");
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_69, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAppleAccountCredential;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptAppleAccountCredential;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_69, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __KeyMapping_69 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("oauthToken"), 0);
}

@end
