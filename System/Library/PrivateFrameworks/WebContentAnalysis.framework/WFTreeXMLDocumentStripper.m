@implementation WFTreeXMLDocumentStripper

+ (id)treeStripperWithXMLDocument:(_xmlDoc *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithXMLDocument:", a3);
}

- (WFTreeXMLDocumentStripper)initWithXMLDocument:(_xmlDoc *)a3
{
  WFTreeXMLDocumentStripper *v4;
  WFTreeXMLDocumentStripper *v5;
  objc_super v7;

  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)WFTreeXMLDocumentStripper;
    v4 = -[WFTreeXMLDocumentStripper init](&v7, sel_init);
    v5 = v4;
    if (v4)
    {
      -[WFTreeXMLDocumentStripper setXMLDocument:](v4, "setXMLDocument:", a3);
      -[WFTreeXMLDocumentStripper strip](v5, "strip");
    }
  }
  else
  {
    NSLog(CFSTR("**** %s error, passing a nil NSXMLDocument"), a2, "-[WFTreeXMLDocumentStripper initWithXMLDocument:]");
    return 0;
  }
  return v5;
}

- (void)setXMLDocument:(_xmlDoc *)a3
{
  self->xmlDocument = a3;
}

- (void)setPageTitle:(id)a3
{
  id v5;

  v5 = a3;

  self->pageTitle = (NSString *)a3;
}

- (id)URLString
{
  return 0;
}

- (id)pageTitle
{
  return self->pageTitle;
}

- (id)metaTagDescription
{
  return (id)-[NSMutableDictionary objectForKey:](self->metaTagsLabeled, "objectForKey:", CFSTR("description"));
}

- (id)metaTagKeywords
{
  return (id)-[NSMutableDictionary objectForKey:](self->metaTagsLabeled, "objectForKey:", CFSTR("keywords"));
}

- (id)metaTagRating
{
  return (id)-[NSMutableDictionary objectForKey:](self->metaTagsLabeled, "objectForKey:", CFSTR("rating"));
}

- (id)metaTagsLabeled
{
  return self->metaTagsLabeled;
}

- (id)metaTagsUnlabeled
{
  return self->metaTagsUnlabeled;
}

- (id)scriptBlocks
{
  return self->scriptBlocks;
}

- (id)images
{
  return self->images;
}

- (id)pageContent
{
  return self->pageContent;
}

- (id)links
{
  return self->links;
}

- (BOOL)hasFrameset
{
  return self->hasFrameset;
}

- (BOOL)hasShortRefresh
{
  return self->hasShortRefresh;
}

- (void)strip
{
  -[WFTreeXMLDocumentStripper processXMLDocument:](self, "processXMLDocument:", self->xmlDocument);
}

- (void)processXMLDocument:(_xmlDoc *)a3
{
  NSString *v5;
  NSString *v6;
  id v7;

  v7 = (id)objc_opt_new();
  self->scriptBlocks = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  self->images = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  self->metaTagsLabeled = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  self->metaTagsUnlabeled = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  self->links = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  *(_WORD *)&self->hasFrameset = 0;
  v5 = -[WFTreeXMLDocumentStripper processXMLDocument:blockComments:](self, "processXMLDocument:blockComments:", a3, 1);
  self->pageContent = v5;
  v6 = v5;

}

- (id)processXMLDocument:(_xmlDoc *)a3 blockComments:(BOOL)a4
{
  void *v6;
  void *v7;
  _xmlNode *i;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  WFImg *v13;
  NSMutableArray *scriptBlocks;
  id v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t j;
  void *v30;
  void *v31;
  id v32;

  v6 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR(" "), a4);
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  for (i = a3->last; i; i = i->prev)
    objc_msgSend(v7, "WF_push:", i);
  if (objc_msgSend(v7, "count"))
  {
    v9 = 0x24BDD1000uLL;
    while (1)
    {
      v10 = objc_msgSend(v7, "WF_pop");
      v11 = *(_QWORD *)(v10 + 16);
      if (!v11)
        goto LABEL_39;
      v12 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v9 + 1992), "stringWithFormat:", CFSTR("%s"), v11), "lowercaseString");
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("a")) & 1) != 0)
        break;
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("style")) & 1) != 0)
        goto LABEL_43;
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("script")) & 1) != 0)
      {
        v13 = +[WFJavascriptStripper stripJavascript:](WFJavascriptStripper, "stripJavascript:", +[XMLNode getJavascriptFromNode:](XMLNode, "getJavascriptFromNode:", v10));
        scriptBlocks = self->scriptBlocks;
        goto LABEL_8;
      }
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("meta")) & 1) != 0)
      {
        v15 = +[XMLNode stringValueForAttribute:inNode:](XMLNode, "stringValueForAttribute:inNode:", CFSTR("name"), v10);
        v16 = +[XMLNode stringValueForAttribute:inNode:](XMLNode, "stringValueForAttribute:inNode:", CFSTR("content"), v10);
        v17 = +[XMLNode stringValueForAttribute:inNode:](XMLNode, "stringValueForAttribute:inNode:", CFSTR("http-equiv"), v10);
        v18 = v16;
        if (v17)
          v19 = v15 == 0;
        else
          v19 = 0;
        if (!v19)
          v17 = v15;
        if (!v16 || v17)
        {
          v9 = 0x24BDD1000;
          if (v17)
          {
            if (v18)
            {
              v20 = v18;
              v21 = (void *)objc_msgSend(v17, "lowercaseString");
              if (!-[NSMutableDictionary objectForKey:](self->metaTagsLabeled, "objectForKey:", v21))
              {
                if (objc_msgSend(v21, "isEqualToString:", CFSTR("refresh")))
                {
                  v30 = (void *)objc_msgSend(v20, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet"));
                  if ((objc_msgSend(v30, "WF_containsString:", CFSTR("url=http://images.google.")) & 1) == 0)
                  {
                    v31 = (void *)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v30);
                    v32 = 0;
                    if (objc_msgSend(v31, "scanCharactersFromSet:intoString:", objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet"), &v32))
                    {
                      v22 = objc_msgSend(v32, "intValue");
                      if (kWFIgnoreRefreshCutoff > v22)
                        self->hasShortRefresh = 1;
                    }
                  }
                }
                -[NSMutableDictionary setObject:forKey:](self->metaTagsLabeled, "setObject:forKey:", v20, v21);
              }
            }
          }
        }
        else
        {
          -[NSMutableArray addObject:](self->metaTagsUnlabeled, "addObject:", v16);
          v9 = 0x24BDD1000;
        }
        goto LABEL_43;
      }
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("img")) & 1) != 0)
      {
        v13 = +[WFImg imgWithNode:](WFImg, "imgWithNode:", v10);
        scriptBlocks = self->images;
        goto LABEL_8;
      }
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("title")) & 1) == 0)
      {
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("frameset")))
          self->hasFrameset = 1;
LABEL_39:
        if (*(_DWORD *)(v10 + 8) == 3)
        {
          v25 = *(_QWORD *)(v10 + 80);
          if (v25)
          {
            v26 = (void *)objc_msgSend(*(id *)(v9 + 1992), "stringWithCString:encoding:", v25, 4);
            v27 = objc_msgSend(v26, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"));
            if (v27)
            {
              objc_msgSend(v6, "appendString:", v27);
              objc_msgSend(v6, "appendString:", CFSTR(" "));
            }
          }
        }
        goto LABEL_43;
      }
      if (-[WFTreeXMLDocumentStripper pageTitle](self, "pageTitle"))
        goto LABEL_39;
      v23 = *(_QWORD *)(v10 + 24);
      if (v23)
      {
        v24 = *(_QWORD *)(v23 + 80);
        if (v24)
          -[WFTreeXMLDocumentStripper setPageTitle:](self, "setPageTitle:", objc_msgSend(*(id *)(v9 + 1992), "stringWithCString:encoding:", v24, 4));
      }
LABEL_43:
      for (j = *(_QWORD *)(v10 + 32); j; j = *(_QWORD *)(j + 56))
        objc_msgSend(v7, "WF_push:", j);
      if (!objc_msgSend(v7, "count"))
        return v6;
    }
    v13 = +[WFLink linkWithNode:](WFLink, "linkWithNode:", v10);
    scriptBlocks = self->links;
LABEL_8:
    -[NSMutableArray addObject:](scriptBlocks, "addObject:", v13);
    goto LABEL_43;
  }
  return v6;
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@:%p\n"), objc_msgSend((id)objc_opt_class(), "description"), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tpageTitle:%@\n"), self->pageTitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tmetaTagDescription:%@\n"), -[WFTreeXMLDocumentStripper metaTagDescription](self, "metaTagDescription"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\tmetaTagKeywords:%@\n"), -[WFTreeXMLDocumentStripper metaTagKeywords](self, "metaTagKeywords"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\tscriptBlocks:%@\n"), self->scriptBlocks);
  objc_msgSend(v3, "appendFormat:", CFSTR("\timages:%@\n"), self->images);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tpageContent:%@\n"), self->pageContent);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFTreeXMLDocumentStripper;
  -[WFTreeXMLDocumentStripper dealloc](&v3, sel_dealloc);
}

@end
