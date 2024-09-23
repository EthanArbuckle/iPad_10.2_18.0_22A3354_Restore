@implementation SUScriptPreviewOverlay

- (id)_className
{
  return CFSTR("iTunesPreviewOverlay");
}

- (id)height
{
  double v2;

  LODWORD(v2) = 0;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
}

- (id)isVisible
{
  return (id)*MEMORY[0x24BDBD268];
}

- (id)right
{
  double v2;

  LODWORD(v2) = 0;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
}

- (id)top
{
  double v2;

  LODWORD(v2) = 0;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
}

- (NSString)userInfo
{
  return 0;
}

- (id)width
{
  double v2;

  LODWORD(v2) = 0;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_73, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptPreviewOverlay;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_56, 3);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptPreviewOverlay;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptPreviewOverlay;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_73, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_56 = (uint64_t)sel_hide_;
    unk_2551870F0 = CFSTR("hide");
    qword_2551870F8 = (uint64_t)sel_loadURLRequest_;
    unk_255187100 = CFSTR("loadURLRequest");
    qword_255187108 = (uint64_t)sel_show_;
    unk_255187110 = CFSTR("show");
    __KeyMapping_73 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("height"), CFSTR("isVisible"), CFSTR("isVisible"), CFSTR("right"), CFSTR("right"), CFSTR("top"), CFSTR("top"), CFSTR("userInfo"), CFSTR("userInfo"), CFSTR("width"), CFSTR("width"), 0);
  }
}

@end
