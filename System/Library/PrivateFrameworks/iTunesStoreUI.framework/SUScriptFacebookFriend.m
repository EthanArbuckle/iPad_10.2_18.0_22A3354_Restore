@implementation SUScriptFacebookFriend

- (SUScriptFacebookFriend)initWithFriendDictionary:(id)a3
{
  SUScriptFacebookFriend *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptFacebookFriend;
  v4 = -[SUScriptObject init](&v6, sel_init);
  if (v4)
    v4->_dictionary = (NSDictionary *)objc_msgSend(a3, "copy");
  return v4;
}

- (SUScriptFacebookFriend)initWithName:(id)a3
{
  void *v4;
  SUScriptFacebookFriend *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", a3, CFSTR("name"), 0);
  v5 = -[SUScriptFacebookFriend initWithFriendDictionary:](self, "initWithFriendDictionary:", v4);

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptFacebookFriend;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)_className
{
  return CFSTR("iTunesFacebookFriend");
}

- (NSString)identifier
{
  return (NSString *)-[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("id"));
}

- (NSString)name
{
  return (NSString *)-[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("name"));
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_77, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptFacebookFriend;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptFacebookFriend;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_77, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __KeyMapping_77 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("identifier"), CFSTR("name"), CFSTR("name"), 0);
}

@end
