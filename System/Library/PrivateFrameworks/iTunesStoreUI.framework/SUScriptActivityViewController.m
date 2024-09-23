@implementation SUScriptActivityViewController

- (SUScriptActivityViewController)initWithScriptItemProviders:(id)a3 applicationActivities:(id)a4
{
  SUScriptActivityViewController *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUScriptActivityViewController;
  v6 = -[SUScriptObject init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(a4, "copy");
    v6->_applicationActivities = (NSArray *)v7;
    if (v7)
      -[SUScriptObject checkInScriptObjects:](v6, "checkInScriptObjects:", v7);
    v8 = objc_msgSend(a3, "copy");
    v6->_providers = (NSArray *)v8;
    if (v8)
      -[SUScriptObject checkInScriptObjects:](v6, "checkInScriptObjects:", v8);
  }
  return v6;
}

- (void)dealloc
{
  NSArray *applicationActivities;
  NSArray *providers;
  objc_super v5;

  if (self->_applicationActivities)
  {
    -[SUScriptObject checkOutScriptObjects:](self, "checkOutScriptObjects:");
    applicationActivities = self->_applicationActivities;
  }
  else
  {
    applicationActivities = 0;
  }

  if (self->_providers)
  {
    -[SUScriptObject checkOutScriptObjects:](self, "checkOutScriptObjects:");
    providers = self->_providers;
  }
  else
  {
    providers = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)SUScriptActivityViewController;
  -[SUScriptViewController dealloc](&v5, sel_dealloc);
}

- (id)newNativeViewController
{
  id v3;
  id v4;
  NSArray *applicationActivities;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSArray *providers;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  SUActivityViewController *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  applicationActivities = self->_applicationActivities;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](applicationActivities, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(applicationActivities);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "nativeActivity");
        if (v10)
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](applicationActivities, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  providers = self->_providers;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](providers, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(providers);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "nativeActivityItemProvider");
        if (v16)
          objc_msgSend(v4, "addObject:", v16);
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](providers, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v13);
  }
  v17 = -[SUActivityViewController initWithActivityItems:applicationActivities:]([SUActivityViewController alloc], "initWithActivityItems:applicationActivities:", v4, v3);

  return v17;
}

- (void)setTitle:(id)a3 forActivityType:(id)a4
{
  char isKindOfClass;

  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0
     || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
     || (isKindOfClass & 1) != 0
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __59__SUScriptActivityViewController_setTitle_forActivityType___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "setTitle:forActivityType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)_className
{
  return CFSTR("iTunesActivityViewController");
}

- (id)excludedActivityTypes
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  uint64_t v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3052000000;
  v7 = __Block_byref_object_copy__46;
  v8 = __Block_byref_object_dispose__46;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

id __55__SUScriptActivityViewController_excludedActivityTypes__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "excludedActivityTypes");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setExcludedActivityTypes:(id)a3
{
  id v5;
  char isKindOfClass;
  OpaqueJSContext *v7;
  void *v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0 || (objc_opt_class(), v5 = a3, (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_6:
    v7 = -[WebFrame globalContext](-[SUScriptObject webFrame](self, "webFrame"), "globalContext");
    if (v7)
    {
      v8 = (void *)objc_msgSend(v5, "copyArrayOrDictionaryWithContext:", v7);
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
LABEL_12:

          return;
        }
      }
    }
    else
    {
      v8 = 0;
    }
    WebThreadRunOnMainThread();
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

uint64_t __59__SUScriptActivityViewController_setExcludedActivityTypes___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "setExcludedActivityTypes:", *(_QWORD *)(a1 + 40));
}

- (NSString)activityTypeAddToReadingList
{
  return (NSString *)*MEMORY[0x24BDF7468];
}

- (NSString)activityTypeAssignToContact
{
  return (NSString *)*MEMORY[0x24BDF7478];
}

- (NSString)activityTypeCopyToPasteboard
{
  return (NSString *)*MEMORY[0x24BDF7480];
}

- (NSString)activityTypeMail
{
  return (NSString *)*MEMORY[0x24BDF7488];
}

- (NSString)activityTypeMessage
{
  return (NSString *)*MEMORY[0x24BDF7498];
}

- (NSString)activityTypePostToFacebook
{
  return (NSString *)*MEMORY[0x24BDF74A8];
}

- (NSString)activityTypePostToFlickr
{
  return (NSString *)*MEMORY[0x24BDF74B0];
}

- (NSString)activityTypePostToTwitter
{
  return 0;
}

- (NSString)activityTypePostToVimeo
{
  return (NSString *)*MEMORY[0x24BDF74C8];
}

- (NSString)activityTypePostToWeibo
{
  return (NSString *)*MEMORY[0x24BDF74D0];
}

- (NSString)activityTypePrint
{
  return (NSString *)*MEMORY[0x24BDF74D8];
}

- (NSString)activityTypeSaveToCameraRoll
{
  return (NSString *)*MEMORY[0x24BDF74E0];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_61, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptActivityViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_47, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptActivityViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptActivityViewController;
  v2 = -[SUScriptViewController scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_61, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_47 = (uint64_t)sel_setTitle_forActivityType_;
    unk_255186E80 = CFSTR("setActivityTitle");
    __KeyMapping_61 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("excludedActivityTypes"), CFSTR("ACTIVITY_TYPE_ADD_TO_READING_LIST"), CFSTR("activityTypeAddToReadingList"), CFSTR("ACTIVITY_TYPE_ASSIGN_TO_CONTACT"), CFSTR("activityTypeAssignToContact"), CFSTR("ACTIVITY_TYPE_COPY_TO_PASTEBOARD"), CFSTR("activityTypeCopyToPasteboard"), CFSTR("ACTIVITY_TYPE_MAIL"), CFSTR("activityTypeMail"), CFSTR("ACTIVITY_TYPE_MESSAGE"), CFSTR("activityTypeMessage"), CFSTR("ACTIVITY_TYPE_POST_TO_FACEBOOK"), CFSTR("activityTypePostToFacebook"), CFSTR("ACTIVITY_TYPE_POST_TO_FLICKR"), CFSTR("activityTypePostToFlickr"), CFSTR("ACTIVITY_TYPE_POST_TO_TWITTER"), CFSTR("activityTypePostToTwitter"),
                        CFSTR("ACTIVITY_TYPE_POST_TO_VIMEO"),
                        CFSTR("activityTypePostToVimeo"),
                        CFSTR("ACTIVITY_TYPE_POST_TO_WEIBO"),
                        CFSTR("activityTypePostToWeibo"),
                        CFSTR("ACTIVITY_TYPE_PRINT"),
                        CFSTR("activityTypePrint"),
                        CFSTR("ACTIVITY_TYPE_SAVE_TO_CAMERA_ROLL"),
                        CFSTR("activityTypeSaveToCameraRoll"),
                        0);
  }
}

@end
