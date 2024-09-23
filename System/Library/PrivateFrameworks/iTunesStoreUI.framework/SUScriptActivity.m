@implementation SUScriptActivity

- (void)dealloc
{
  objc_super v3;

  -[SUScriptFunction setThisObject:](self->_actionFunction, "setThisObject:", 0);

  v3.receiver = self;
  v3.super_class = (Class)SUScriptActivity;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (WebScriptObject)actionFunction
{
  WebScriptObject *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = -[SUScriptFunction scriptObject](self->_actionFunction, "scriptObject");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (NSString)activityTitle
{
  NSString *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  uint64_t v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3052000000;
  v7 = __Block_byref_object_copy__47;
  v8 = __Block_byref_object_dispose__47;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (NSString *)(id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

id __33__SUScriptActivity_activityTitle__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeActivity"), "activityTitle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)activityType
{
  NSString *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  uint64_t v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3052000000;
  v7 = __Block_byref_object_copy__47;
  v8 = __Block_byref_object_dispose__47;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (NSString *)(id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

id __32__SUScriptActivity_activityType__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeActivity"), "activityType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_className
{
  return CFSTR("iTunesActivity");
}

- (void)setActionFunction:(id)a3
{
  id v5;
  int v6;
  char isKindOfClass;
  SUScriptFunction *v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = 0;
    v6 = 1;
    if (a3 && (isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
        return;
      }
      v6 = 0;
      v5 = a3;
    }
  }
  -[SUScriptObject lock](self, "lock");
  -[SUScriptFunction setThisObject:](self->_actionFunction, "setThisObject:", 0);

  if (v6)
  {
    self->_actionFunction = 0;
  }
  else
  {
    v8 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", v5);
    self->_actionFunction = v8;
    -[SUScriptFunction setThisObject:](v8, "setThisObject:", self);
  }
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setActivityTitle:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __37__SUScriptActivity_setActivityTitle___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeActivity"), "setActivityTitle:", *(_QWORD *)(a1 + 40));
}

- (void)setActivityType:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __36__SUScriptActivity_setActivityType___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeActivity"), "setActivityType:", *(_QWORD *)(a1 + 40));
}

- (void)setActivityImageWithName:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __45__SUScriptActivity_setActivityImageWithName___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_nativeActivity");
  if (*(_QWORD *)(a1 + 40))
    v3 = objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()));
  else
    v3 = 0;
  return objc_msgSend(v2, "setActivityImage:", v3);
}

- (void)setActivityImageWithURL:(id)a3 scale:(id)a4
{
  float v7;
  double v8;
  id v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = 0;
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || a4 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
  else
  {
    if (a3 && (a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a3)) != 0)
    {
      if (a4)
      {
        objc_msgSend(a4, "floatValue");
        v8 = v7;
      }
      else
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
      }
      v9 = -[SUScriptObject newImageWithURL:scale:](self, "newImageWithURL:scale:", a3, v8);
    }
    else
    {
      v9 = 0;
    }
    WebThreadRunOnMainThread();

  }
}

uint64_t __50__SUScriptActivity_setActivityImageWithURL_scale___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeActivity"), "setActivityImage:", *(_QWORD *)(a1 + 40));
}

- (NSString)activityImageNameGiftAppStore
{
  return (NSString *)CFSTR("ShareSheetGift");
}

- (NSString)activityImageNameGiftMusicStore
{
  return (NSString *)CFSTR("ShareSheetGift");
}

- (NSString)activityImageNamePingAppStore
{
  return 0;
}

- (NSString)activityImageNamePingMusicStore
{
  return 0;
}

- (NSString)activityImageNameWishlistAppStore
{
  return (NSString *)CFSTR("ShareSheetWishList");
}

- (NSString)activityImageNameWishlistMusicStore
{
  return (NSString *)CFSTR("ShareSheetWishList");
}

- (id)_nativeActivity
{
  SUActivity *v3;
  SUActivity *v4;

  v3 = -[SUScriptNativeObject object](-[SUScriptObject nativeObject](self, "nativeObject"), "object");
  if (!v3)
  {
    v3 = objc_alloc_init(SUActivity);
    -[SUScriptObject setNativeObject:](self, "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptActivityNativeObject, "objectWithNativeObject:", v3));
    v4 = v3;
  }
  return v3;
}

- (void)_performActionFunctionWithItems:(id)a3
{
  SUScriptFunction *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id ImageURL;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[SUScriptObject lock](self, "lock");
  v5 = self->_actionFunction;
  -[SUScriptObject unlock](self, "unlock");
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (!v7)
      goto LABEL_18;
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (1)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(a3);
        ImageURL = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_13;
            goto LABEL_11;
          }
          ImageURL = SUScriptObjectGetImageURL(ImageURL);
        }
        ImageURL = (id)objc_msgSend(ImageURL, "absoluteString");
LABEL_11:
        if (ImageURL)
          objc_msgSend(v6, "addObject:", ImageURL);
LABEL_13:
        ++v10;
      }
      while (v8 != v10);
      v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 = v12;
      if (!v12)
      {
LABEL_18:
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v6, 0);
        -[SUScriptFunction callWithArguments:](v5, "callWithArguments:", v13);

        return;
      }
    }
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_65, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptActivity;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_49, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptActivity;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptActivity;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_65, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_49 = (uint64_t)sel_setActivityImageWithName_;
    unk_255186EF0 = CFSTR("setNamedActivityImage");
    qword_255186EF8 = (uint64_t)sel_setActivityImageWithURL_scale_;
    unk_255186F00 = CFSTR("setActivityImage");
    __KeyMapping_65 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("actionFunction"), CFSTR("activityTitle"), CFSTR("activityTitle"), CFSTR("activityType"), CFSTR("activityType"), CFSTR("IMAGE_NAME_GIFT_APP_STORE"), CFSTR("activityImageNameGiftAppStore"), CFSTR("IMAGE_NAME_GIFT_MUSIC_STORE"), CFSTR("activityImageNameGiftMusicStore"), CFSTR("IMAGE_NAME_PING_APP_STORE"), CFSTR("activityImageNamePingAppStore"), CFSTR("IMAGE_NAME_PING_MUSIC_STORE"), CFSTR("activityImageNamePingMusicStore"), CFSTR("IMAGE_NAME_WISHLIST_APP_STORE"), CFSTR("activityImageNameWishlistAppStore"), CFSTR("IMAGE_NAME_WISHLIST_MUSIC_STORE"), CFSTR("activityImageNameWishlistMusicStore"),
                        0);
  }
}

@end
