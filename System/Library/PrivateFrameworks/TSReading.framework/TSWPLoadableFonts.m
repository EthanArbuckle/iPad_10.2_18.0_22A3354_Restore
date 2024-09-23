@implementation TSWPLoadableFonts

- (void)loadFontWithName:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  _QWORD v11[6];

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLoadableFonts loadFontWithName:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLoadableFonts.mm"), 198, CFSTR("invalid nil value for '%s'"), "fontName");
  }
  if (-[NSMutableDictionary count](self->_loadableFonts, "count"))
  {
    v7 = objc_msgSend(a3, "lowercaseString");
    objc_sync_enter(self);
    v8 = -[NSOperationQueue isSuspended](self->_fontQueue, "isSuspended");
    -[NSOperationQueue setSuspended:](self->_fontQueue, "setSuspended:", 1);
    objc_opt_class();
    -[NSMutableDictionary objectForKey:](self->_loadableFonts, "objectForKey:", v7);
    v9 = (void *)TSUDynamicCast();
    if (v9
      || (objc_opt_class(),
          -[NSMutableDictionary objectForKey:](self->_loadableFontFamilies, "objectForKey:", v7),
          (v9 = (void *)objc_msgSend((id)TSUDynamicCast(), "anyObject")) != 0))
    {
      -[TSWPLoadableFonts p_loadFontWithInfo:](self, "p_loadFontWithInfo:", v9);
    }
    if (objc_msgSend(v9, "fontFamily"))
    {
      objc_opt_class();
      -[NSMutableDictionary objectForKey:](self->_loadableFontFamilies, "objectForKey:", objc_msgSend(v9, "fontFamily"));
      v10 = (void *)TSUDynamicCast();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __38__TSWPLoadableFonts_loadFontWithName___block_invoke;
      v11[3] = &unk_24D82C908;
      v11[4] = v9;
      v11[5] = self;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);
    }
    -[NSOperationQueue setSuspended:](self->_fontQueue, "setSuspended:", v8);
    objc_sync_exit(self);
  }
}

+ (id)sharedInstance
{
  id result;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  result = (id)+[TSWPLoadableFonts sharedInstance]::sSingletonInstance;
  if (!+[TSWPLoadableFonts sharedInstance]::sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!+[TSWPLoadableFonts sharedInstance]::sSingletonInstance)
    {
      v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      +[TSWPLoadableFonts sharedInstance]::sSingletonInstance = v4;
      if (!v4)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPLoadableFonts sharedInstance]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLoadableFonts.mm"), 138, CFSTR("Couldn't create singleton instance of %@"), a1);
      }
    }
    objc_sync_exit(a1);
    return (id)+[TSWPLoadableFonts sharedInstance]::sSingletonInstance;
  }
  return result;
}

- (TSWPLoadableFonts)init
{
  TSWPLoadableFonts *v2;
  NSOperationQueue *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPLoadableFonts;
  v2 = -[TSWPLoadableFonts init](&v5, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    v2->_fontQueue = v3;
    -[NSOperationQueue setName:](v3, "setName:", CFSTR("com.apple.thunderfish.loadablefonts"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_fontQueue, "setMaxConcurrentOperationCount:", -1);
  }
  return v2;
}

+ (id)_singletonAlloc
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSWPLoadableFonts;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPLoadableFonts allocWithZone:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLoadableFonts.mm"), 138, CFSTR("Don't alloc a singleton"));
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPLoadableFonts;
  -[TSWPLoadableFonts dealloc](&v3, sel_dealloc);
}

- (void)pauseBackgroundLoading
{
  objc_sync_enter(self);
  -[NSOperationQueue setSuspended:](self->_fontQueue, "setSuspended:", 1);
  objc_sync_exit(self);
}

- (void)resumeBackgroundLoading
{
  objc_sync_enter(self);
  -[NSOperationQueue setSuspended:](self->_fontQueue, "setSuspended:", 0);
  objc_sync_exit(self);
}

- (void)loadAll
{
  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_fontQueue, "waitUntilAllOperationsAreFinished");
}

uint64_t __38__TSWPLoadableFonts_loadFontWithName___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(result + 32) != a2)
    return objc_msgSend(*(id *)(result + 40), "p_loadFontWithInfo:", a2);
  return result;
}

- (void)loadFontsForGroup:(id)a3
{
  void *v5;
  _QWORD v6[6];

  objc_sync_enter(self);
  v5 = (void *)-[NSMutableDictionary allValues](self->_loadableFonts, "allValues");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__TSWPLoadableFonts_loadFontsForGroup___block_invoke;
  v6[3] = &unk_24D82EE60;
  v6[4] = a3;
  v6[5] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);
  objc_sync_exit(self);
}

uint64_t __39__TSWPLoadableFonts_loadFontsForGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a2, "groupUID"), "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "p_loadFontWithInfo:", a2);
  return result;
}

- (void)registerFontName:(id)a3 forPath:(id)a4 forGroup:(id)a5 isObfuscated:(BOOL)a6 backgroundLoad:(BOOL)a7
{
  _BOOL8 v8;
  TSWPLoadableFontInfo *v13;
  void *v14;
  NSMutableDictionary *loadableFonts;
  NSOperationQueue *fontQueue;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[6];

  v8 = a6;
  objc_sync_enter(self);
  v13 = objc_alloc_init(TSWPLoadableFontInfo);
  v14 = (void *)objc_msgSend(a3, "lowercaseString");
  -[TSWPLoadableFontInfo setFontName:](v13, "setFontName:", v14);
  -[TSWPLoadableFontInfo setGroupUID:](v13, "setGroupUID:", a5);
  -[TSWPLoadableFontInfo setFontPath:](v13, "setFontPath:", a4);
  -[TSWPLoadableFontInfo setObfuscated:](v13, "setObfuscated:", v8);
  loadableFonts = self->_loadableFonts;
  if (!loadableFonts)
  {
    loadableFonts = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    self->_loadableFonts = loadableFonts;
  }
  if (!-[NSMutableDictionary objectForKey:](loadableFonts, "objectForKey:", v14))
  {
    -[NSMutableDictionary setObject:forKey:](self->_loadableFonts, "setObject:forKey:", v13, v14);
    if (a7)
    {
      fontQueue = self->_fontQueue;
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __83__TSWPLoadableFonts_registerFontName_forPath_forGroup_isObfuscated_backgroundLoad___block_invoke;
      v22[3] = &unk_24D82A5C8;
      v22[4] = self;
      v22[5] = v13;
      -[NSOperationQueue addOperationWithBlock:](fontQueue, "addOperationWithBlock:", v22);
    }
    else
    {
      if (!self->_loadableFontFamilies)
        self->_loadableFontFamilies = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v17 = objc_msgSend(v14, "rangeOfString:", CFSTR("-"));
      if (v18)
        v14 = (void *)objc_msgSend(v14, "substringToIndex:", v17);
      -[TSWPLoadableFontInfo setFontFamily:](v13, "setFontFamily:", v14);
      objc_opt_class();
      -[NSMutableDictionary objectForKey:](self->_loadableFontFamilies, "objectForKey:", v14);
      v19 = (id)TSUDynamicCast();
      if (!v19)
      {
        v19 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        -[NSMutableDictionary setObject:forKey:](self->_loadableFontFamilies, "setObject:forKey:", v19, v14);
      }
      if (objc_msgSend(v19, "containsObject:", v13))
      {
        v20 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLoadableFonts registerFontName:forPath:forGroup:isObfuscated:backgroundLoad:]");
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLoadableFonts.mm"), 316, CFSTR("Already added this font to this family."));
      }
      objc_msgSend(v19, "addObject:", v13);
    }
  }

  objc_sync_exit(self);
}

uint64_t __83__TSWPLoadableFonts_registerFontName_forPath_forGroup_isObfuscated_backgroundLoad___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_loadFontWithInfo:", *(_QWORD *)(a1 + 40));
}

- (void)unregisterFontsForGroup:(id)a3
{
  id v5;
  void *v6;
  _QWORD v7[6];

  objc_sync_enter(self);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = (void *)-[NSMutableDictionary allValues](self->_loadableFonts, "allValues");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__TSWPLoadableFonts_unregisterFontsForGroup___block_invoke;
  v7[3] = &unk_24D82EE60;
  v7[4] = a3;
  v7[5] = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);
  -[NSMutableDictionary removeObjectsForKeys:](self->_loadableFonts, "removeObjectsForKeys:", v5);

  objc_sync_exit(self);
}

uint64_t __45__TSWPLoadableFonts_unregisterFontsForGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a2, "groupUID"), "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(a2, "fontName"));
  return result;
}

- (void)p_loadFontWithInfo:(id)a3
{
  unsigned __int8 *v4;
  unsigned __int8 v5;
  CGDataProvider *Sequential;
  CGDataProvider *v7;
  CGFont *v8;
  CGFont *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFErrorRef error;

  v4 = (unsigned __int8 *)a3 + 48;
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 | 1, v4));
  if ((v5 & 1) == 0)
  {
    error = 0;
    if (objc_msgSend(a3, "groupUID") && objc_msgSend(a3, "obfuscated"))
      Sequential = CGDataProviderCreateSequential(-[TSWPObfuscatedFontDataProvider initWithPath:groupUID:]([TSWPObfuscatedFontDataProvider alloc], "initWithPath:groupUID:", objc_msgSend(a3, "fontPath"), objc_msgSend(a3, "groupUID")), &-[TSWPLoadableFonts p_loadFontWithInfo:]::unobfuscate);
    else
      Sequential = CGDataProviderCreateWithURL((CFURLRef)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", objc_msgSend(a3, "fontPath")));
    v7 = Sequential;
    if (!Sequential)
      goto LABEL_15;
    v8 = CGFontCreateWithDataProvider(Sequential);
    if (!v8)
    {
      CGDataProviderRelease(v7);
LABEL_15:
      v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLoadableFonts p_loadFontWithInfo:]");
      v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLoadableFonts.mm");
      v17 = objc_msgSend(a3, "fontName");
      v18 = objc_msgSend(a3, "fontPath");
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, v16, 478, CFSTR("failed to load and register font %@ at %@ with error %@"), v17, v18, error);
      return;
    }
    v9 = v8;
    v10 = CTFontManagerRegisterGraphicsFont(v8, &error);
    if (v10)
    {
      objc_msgSend(a3, "setCgFont:", v9);
    }
    else
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLoadableFonts p_loadFontWithInfo:]");
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLoadableFonts.mm");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 418, CFSTR("CTFontManagerRegisterGraphicsFont couldn't register font - %@"), error);
    }
    CGFontRelease(v9);
    CGDataProviderRelease(v7);
    if (!v10)
      goto LABEL_15;
  }
}

@end
