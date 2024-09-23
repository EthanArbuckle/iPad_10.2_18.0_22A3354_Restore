@implementation WFWebPageDecorator

+ (id)_plainTextWithSelector:(SEL)a3 object:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  NSString *v11;

  v6 = objc_alloc((Class)objc_opt_class());
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v6, "performSelector:withObject:", a3, a4);
    v8 = (void *)objc_msgSend(v7, "plainText");

    return v8;
  }
  else
  {
    v10 = objc_msgSend((id)objc_opt_class(), "description");
    v11 = NSStringFromSelector(a3);
    NSLog(CFSTR("%@ doesn't asnwer to selector:%@"), v10, v11);
    return &stru_24C583DA8;
  }
}

+ (id)plainTextWithWebPageData:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "_plainTextWithSelector:object:", sel_initWithWebPageData_, a3);
}

+ (id)plainTextWithWebPageString:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "_plainTextWithSelector:object:", sel_initWithWebPageString_, a3);
}

+ (id)webPageWithData:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithWebPageData:", a3);
}

+ (id)webPageWithData:(id)a3 URLString:(id)a4
{
  void *v5;

  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithWebPageData:", a3);
  objc_msgSend(v5, "setURLString:", a4);
  return v5;
}

+ (id)webPageWithString:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithWebPageString:", a3);
}

+ (id)webPageWithString:(id)a3 URLString:(id)a4
{
  void *v5;

  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithWebPageString:", a3);
  objc_msgSend(v5, "setURLString:", a4);
  return v5;
}

- (WFWebPageDecorator)initWithWebPageData:(id)a3
{
  return -[WFWebPageDecorator initWithWebPageStripper:](self, "initWithWebPageStripper:", +[WFTreeHTMLStripper treeStripperWithData:](WFTreeHTMLStripper, "treeStripperWithData:", a3));
}

- (WFWebPageDecorator)initWithWebPageString:(id)a3
{
  return -[WFWebPageDecorator initWithWebPageStripper:](self, "initWithWebPageStripper:", +[WFTreeHTMLStripper treeStripperWithString:](WFTreeHTMLStripper, "treeStripperWithString:", a3));
}

- (WFWebPageDecorator)initWithWebPageStripper:(id)a3
{
  WFWebPageDecorator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFWebPageDecorator;
  v4 = -[WFWebPageDecorator init](&v6, sel_init);
  if (v4)
    v4->webPageStripper = (WFWebPageProtocol *)a3;
  return v4;
}

- (id)pageTitle
{
  return (id)-[WFWebPageProtocol pageTitle](self->webPageStripper, "pageTitle");
}

- (id)metaTagDescription
{
  return (id)-[WFWebPageProtocol metaTagDescription](self->webPageStripper, "metaTagDescription");
}

- (id)metaTagKeywords
{
  return (id)-[WFWebPageProtocol metaTagKeywords](self->webPageStripper, "metaTagKeywords");
}

- (id)metaTagsLabeled
{
  return (id)-[WFWebPageProtocol metaTagsLabeled](self->webPageStripper, "metaTagsLabeled");
}

- (id)metaTagsUnlabeled
{
  return (id)-[WFWebPageProtocol metaTagsUnlabeled](self->webPageStripper, "metaTagsUnlabeled");
}

- (id)scriptBlocks
{
  return (id)-[WFWebPageProtocol scriptBlocks](self->webPageStripper, "scriptBlocks");
}

- (id)images
{
  return (id)-[WFWebPageProtocol images](self->webPageStripper, "images");
}

- (id)pageContent
{
  return (id)-[WFWebPageProtocol pageContent](self->webPageStripper, "pageContent");
}

- (id)links
{
  return (id)-[WFWebPageProtocol links](self->webPageStripper, "links");
}

- (BOOL)hasFrameset
{
  return -[WFWebPageProtocol hasFrameset](self->webPageStripper, "hasFrameset");
}

- (BOOL)hasShortRefresh
{
  return -[WFWebPageProtocol hasShortRefresh](self->webPageStripper, "hasShortRefresh");
}

- (void)_cacheImgProperties
{
  if (!self->pageImagesPropertyCache)
    self->pageImagesPropertyCache = -[WFImgArrayCache initWithArray:]([WFImgArrayCache alloc], "initWithArray:", -[WFWebPageDecorator images](self, "images"));
}

- (int64_t)numberOfImages
{
  return objc_msgSend(-[WFWebPageDecorator images](self, "images"), "count");
}

- (id)imageAltsText
{
  -[WFWebPageDecorator _cacheImgProperties](self, "_cacheImgProperties");
  return -[WFImgArrayCache imageAlternativeDescriptions](self->pageImagesPropertyCache, "imageAlternativeDescriptions");
}

- (int64_t)numberOfUnknownSizedImages
{
  -[WFWebPageDecorator _cacheImgProperties](self, "_cacheImgProperties");
  return -[WFImgArrayCache numberOfUnknownSizedImages](self->pageImagesPropertyCache, "numberOfUnknownSizedImages");
}

- (int64_t)numberOfKnownImagePixels
{
  -[WFWebPageDecorator _cacheImgProperties](self, "_cacheImgProperties");
  return -[WFImgArrayCache numberOfKnownImagePixels](self->pageImagesPropertyCache, "numberOfKnownImagePixels");
}

- (id)linkTitlesText
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[WFWebPageDecorator links](self, "links");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "title");
        if (v9)
          objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

- (int64_t)wordCount
{
  return 0;
}

- (id)tags
{
  return +[WFTagFactory tagsForWebpage:](WFTagFactory, "tagsForWebpage:", self);
}

- (id)plainTextAttributeWithSelector:(SEL)a3 title:(id)a4
{
  return -[WFWebPageDecorator plainTextAttributeWithSelector:title:weight:](self, "plainTextAttributeWithSelector:title:weight:", a3, a4, 1);
}

- (id)plainTextAttributeWithSelector:(SEL)a3 title:(id)a4 weight:(int)a5
{
  void *v9;
  uint64_t v10;
  const __CFString *v11;

  v9 = (void *)objc_opt_new();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (v10 = -[WFWebPageDecorator performSelector:](self, "performSelector:", a3)) != 0)
  {
    v11 = (const __CFString *)v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "WF_stringFromArray:", v11);
  }
  else
  {
    v11 = &stru_24C583DA8;
  }
  objc_msgSend(v9, "appendString:", a4);
  objc_msgSend(v9, "appendString:", CFSTR("\n"));
  if (a5 >= 1)
  {
    do
    {
      objc_msgSend(v9, "appendString:", v11);
      objc_msgSend(v9, "appendString:", CFSTR("\n"));
      --a5;
    }
    while (a5);
  }
  return v9;
}

- (id)rawPlainText
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendString:", CFSTR("[WFWebPageDecorator rawPlainText]"));
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_pageTitle, CFSTR("======= pageTitle =======")));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_tags, CFSTR("======= tags =======")));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_metaTagDescription, CFSTR("======= metaTagDescription =======\n")));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_metaTagKeywords, CFSTR("======= metaTagKeywords =======\n")));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_scriptBlocks, CFSTR("======= scriptBlocks (array) =======\n")));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_imageAltsText, CFSTR("======= imageAltsText (array) =======\n")));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_pageContent, CFSTR("======= pageContent =======\n")));
  return v3;
}

- (id)plainText
{
  return +[WFPostprocessor postprocessPlainTextWebPage:](WFPostprocessor, "postprocessPlainTextWebPage:", -[WFWebPageDecorator rawPlainText](self, "rawPlainText"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFWebPageDecorator;
  -[WFWebPageDecorator dealloc](&v3, sel_dealloc);
}

- (NSString)URLString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setURLString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

@end
