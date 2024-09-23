@implementation SUScriptFacebookLikeStatus

- (SUScriptFacebookLikeStatus)initWithLikeStatusDictionary:(id)a3
{
  SUScriptFacebookLikeStatus *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptFacebookLikeStatus;
  v4 = -[SUScriptObject init](&v6, sel_init);
  if (v4)
    v4->_dictionary = (NSDictionary *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptFacebookLikeStatus;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)_className
{
  return CFSTR("iTunesFacebookLikeStatus");
}

- (unint64_t)friendLikeCount
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", ISWeakLinkedStringConstantForString()), "unsignedIntegerValue");
}

- (NSArray)friends
{
  NSArray *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  SUScriptFacebookFriend *v10;
  SUScriptFacebookFriend *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", ISWeakLinkedStringConstantForString());
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = -[SUScriptFacebookFriend initWithName:]([SUScriptFacebookFriend alloc], "initWithName:", v9);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v10 = -[SUScriptFacebookFriend initWithFriendDictionary:]([SUScriptFacebookFriend alloc], "initWithFriendDictionary:", v9);
        }
        v11 = v10;
        if (v10)
        {
          -[NSArray addObject:](v3, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  return v3;
}

- (unint64_t)globalLikeCount
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", ISWeakLinkedStringConstantForString()), "unsignedIntegerValue");
}

- (id)isLikedByMe
{
  int v2;
  id *v3;

  v2 = objc_msgSend(-[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", ISWeakLinkedStringConstantForString()), "BOOLValue");
  v3 = (id *)MEMORY[0x24BDBD270];
  if (!v2)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_76, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptFacebookLikeStatus;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptFacebookLikeStatus;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_76, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __KeyMapping_76 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("friendLikeCount"), CFSTR("friends"), CFSTR("friends"), CFSTR("globalLikeCount"), CFSTR("globalLikeCount"), CFSTR("isLikedByMe"), CFSTR("isLikedByMe"), 0);
}

@end
