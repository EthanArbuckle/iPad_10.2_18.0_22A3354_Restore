@implementation SUScriptMenuItem

- (SUScriptMenuItem)init
{
  SUScriptMenuItem *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptMenuItem;
  result = -[SUScriptObject init](&v3, sel_init);
  if (result)
    result->_enabled = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptMenuItem;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)_className
{
  return CFSTR("iTunesMenuItem");
}

- (BOOL)enabled
{
  BOOL enabled;

  -[SUScriptObject lock](self, "lock");
  enabled = self->_enabled;
  -[SUScriptObject unlock](self, "unlock");
  return enabled;
}

- (void)setEnabled:(BOOL)a3
{
  -[SUScriptObject lock](self, "lock");
  self->_enabled = a3;
  -[SUScriptObject unlock](self, "unlock");
  -[SUScriptMenuItem _sendDidChange](self, "_sendDidChange");
}

- (void)setTitle:(id)a3
{
  NSString *v5;
  char isKindOfClass;
  NSString *title;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = 0;
    if (a3)
    {
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        v5 = (NSString *)a3;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid title"));
          return;
        }
      }
    }
  }
  -[SUScriptObject lock](self, "lock");
  title = self->_title;
  if (title != v5)
  {

    self->_title = v5;
  }
  -[SUScriptObject unlock](self, "unlock");
  -[SUScriptMenuItem _sendDidChange](self, "_sendDidChange");
}

- (void)setUserInfo:(id)a3
{
  id userInfo;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  -[SUScriptObject lock](self, "lock");
  userInfo = self->_userInfo;
  if (userInfo != a3)
  {

    self->_userInfo = a3;
  }
  -[SUScriptObject unlock](self, "unlock");
}

- (NSString)title
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_title;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (id)userInfo
{
  id v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_userInfo;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (void)_sendDidChange
{
  id v2;

  v2 = -[SUScriptObject parentViewController](self, "parentViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "reload");
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_9, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMenuItem;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptMenuItem;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_9, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __KeyMapping_9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("enabled"), CFSTR("title"), CFSTR("title"), CFSTR("userInfo"), CFSTR("userInfo"), 0);
}

@end
