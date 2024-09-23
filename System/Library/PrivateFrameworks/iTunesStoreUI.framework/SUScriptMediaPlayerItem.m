@implementation SUScriptMediaPlayerItem

- (SUScriptMediaPlayerItem)initWithDictionary:(id)a3
{
  SUScriptMediaPlayerItem *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  SUMediaPlayerItem *mediaItem;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SUScriptMediaPlayerItem;
  v4 = -[SUScriptObject init](&v15, sel_init);
  if (v4)
  {
    v4->_mediaItem = objc_alloc_init(SUMediaPlayerItem);
    v5 = objc_msgSend(a3, "objectForKey:", CFSTR("backgroundImageURL"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUMediaPlayerItem setBackgroundImageURL:](v4->_mediaItem, "setBackgroundImageURL:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5));
    v6 = objc_msgSend(a3, "objectForKey:", CFSTR("bookmarkIdentifier"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUMediaPlayerItem setBookmarkIdentifier:](v4->_mediaItem, "setBookmarkIdentifier:", v6);
    v7 = objc_msgSend(a3, "objectForKey:", CFSTR("itemType"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUMediaPlayerItem setItemType:](v4->_mediaItem, "setItemType:", objc_msgSend(+[SUItemDataSource sharedDataSource](SUItemDataSource, "sharedDataSource"), "itemTypeForTypeString:", v7));
    v8 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("playableDuration"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      mediaItem = v4->_mediaItem;
      objc_msgSend(v8, "doubleValue");
      -[SUMediaPlayerItem setPlayableDuration:](mediaItem, "setPlayableDuration:", v10 / 1000.0);
    }
    v11 = objc_msgSend(a3, "objectForKey:", CFSTR("subtitle"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUMediaPlayerItem setSubtitle:](v4->_mediaItem, "setSubtitle:", v11);
    v12 = objc_msgSend(a3, "objectForKey:", CFSTR("title"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUMediaPlayerItem setTitle:](v4->_mediaItem, "setTitle:", v12);
    v13 = objc_msgSend(a3, "objectForKey:", CFSTR("URL"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUMediaPlayerItem setURL:](v4->_mediaItem, "setURL:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v13));
    objc_msgSend(a3, "objectForKey:", CFSTR("itemIdentifier"));
    -[SUMediaPlayerItem setItemIdentifier:](v4->_mediaItem, "setItemIdentifier:", SSGetUnsignedLongLongFromValue());
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptMediaPlayerItem;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)copyNativeMediaPlayerItem
{
  void *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = (void *)-[SUMediaPlayerItem copy](self->_mediaItem, "copy");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (NSString)backgroundImageURL
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = -[NSURL absoluteString](-[SUMediaPlayerItem backgroundImageURL](self->_mediaItem, "backgroundImageURL"), "absoluteString");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (NSString)bookmarkIdentifier
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = -[SUMediaPlayerItem bookmarkIdentifier](self->_mediaItem, "bookmarkIdentifier");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (id)_className
{
  return CFSTR("iTunesMediaPlayerItem");
}

- (NSString)initialOrientation
{
  __CFString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = SUOrientationStringForDeviceOrientation(-[SUMediaPlayerItem initialOrientation](self->_mediaItem, "initialOrientation"));
  -[SUScriptObject unlock](self, "unlock");
  return &v3->isa;
}

- (NSNumber)itemIdentifier
{
  NSNumber *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithItemIdentifier:", -[SUMediaPlayerItem itemIdentifier](self->_mediaItem, "itemIdentifier"));
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (NSString)itemType
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = (NSString *)objc_msgSend(+[SUItemDataSource sharedDataSource](SUItemDataSource, "sharedDataSource"), "typeStringForItemType:", -[SUMediaPlayerItem itemType](self->_mediaItem, "itemType"));
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (NSNumber)playableDuration
{
  void *v3;
  double v4;
  NSNumber *v5;

  -[SUScriptObject lock](self, "lock");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[SUMediaPlayerItem playableDuration](self->_mediaItem, "playableDuration");
  v5 = (NSNumber *)objc_msgSend(v3, "numberWithDouble:", v4 * 1000.0);
  -[SUScriptObject unlock](self, "unlock");
  return v5;
}

- (void)setBackgroundImageURL:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_6:
    -[SUScriptObject lock](self, "lock");
    -[SUMediaPlayerItem setBackgroundImageURL:](self->_mediaItem, "setBackgroundImageURL:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5));
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

- (void)setBookmarkIdentifier:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_6:
    -[SUScriptObject lock](self, "lock");
    -[SUMediaPlayerItem setBookmarkIdentifier:](self->_mediaItem, "setBookmarkIdentifier:", v5);
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

- (void)setInitialOrientation:(id)a3
{
  id v5;
  char isKindOfClass;

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
        v5 = a3;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
          return;
        }
      }
    }
  }
  if (SUOrientationStringIsValid(v5))
  {
    -[SUScriptObject lock](self, "lock");
    -[SUMediaPlayerItem setInitialOrientation:](self->_mediaItem, "setInitialOrientation:", SUInterfaceOrientationForString(v5));
    -[SUScriptObject unlock](self, "unlock");
  }
}

- (void)setItemIdentifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = SSGetUnsignedLongLongFromValue();
  if (a3)
  {
    v6 = v5;
    -[SUScriptObject lock](self, "lock");
    -[SUMediaPlayerItem setItemIdentifier:](self->_mediaItem, "setItemIdentifier:", v6);
    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

- (void)setItemType:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_6:
    -[SUScriptObject lock](self, "lock");
    -[SUMediaPlayerItem setItemType:](self->_mediaItem, "setItemType:", objc_msgSend(+[SUItemDataSource sharedDataSource](SUItemDataSource, "sharedDataSource"), "itemTypeForTypeString:", v5));
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

- (void)setPlayableDuration:(id)a3
{
  SUMediaPlayerItem *mediaItem;
  double v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SUScriptObject lock](self, "lock");
    mediaItem = self->_mediaItem;
    objc_msgSend(a3, "doubleValue");
    -[SUMediaPlayerItem setPlayableDuration:](mediaItem, "setPlayableDuration:", v6 / 1000.0);
    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

- (void)setSubtitle:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_6:
    -[SUScriptObject lock](self, "lock");
    -[SUMediaPlayerItem setSubtitle:](self->_mediaItem, "setSubtitle:", v5);
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

- (void)setTitle:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_6:
    -[SUScriptObject lock](self, "lock");
    -[SUMediaPlayerItem setTitle:](self->_mediaItem, "setTitle:", v5);
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

- (void)setURL:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_6:
    -[SUScriptObject lock](self, "lock");
    -[SUMediaPlayerItem setURL:](self->_mediaItem, "setURL:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5));
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

- (NSString)subtitle
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = -[SUMediaPlayerItem subtitle](self->_mediaItem, "subtitle");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (NSString)title
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = -[SUMediaPlayerItem title](self->_mediaItem, "title");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (NSString)URL
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = -[NSURL absoluteString](-[SUMediaPlayerItem URL](self->_mediaItem, "URL"), "absoluteString");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

+ (id)webScriptNameForKey:(const char *)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForKey((char *)a3, (uint64_t)&__KeyMapping_0, 9);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaPlayerItem;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKey_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptMediaPlayerItem;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  SUWebScriptAddPropertyKeysToArray((uint64_t)v2, (uint64_t)&__KeyMapping_0, 9);
  return v2;
}

@end
