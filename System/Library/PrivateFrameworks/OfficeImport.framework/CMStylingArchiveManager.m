@implementation CMStylingArchiveManager

- (CMStylingArchiveManager)init
{
  CMStylingArchiveManager *v2;
  NSMutableString *v3;
  NSMutableString *mCssString;
  NSMutableDictionary *v5;
  NSMutableDictionary *mStyleCache;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMStylingArchiveManager;
  v2 = -[CMArchiveManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    mCssString = v2->mCssString;
    v2->mCssString = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mStyleCache = v2->mStyleCache;
    v2->mStyleCache = v5;

  }
  return v2;
}

- (id)addCssStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->mStyleCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("s%lu"), -[NSMutableDictionary count](self->mStyleCache, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->mStyleCache, "setObject:forKey:", v5, v4);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(".%@.%@.%@ {%@}\n"), v5, v5, v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendString:](self->mCssString, "appendString:", v6);

  }
  return v5;
}

- (void)addCssStyle:(id)a3 withName:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(".%@ {%@}\n"), a4, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendString:](self->mCssString, "appendString:");

}

- (id)commitStylesheet
{
  void *v3;
  NSMutableString *v4;
  NSMutableString *mCssString;

  if (-[NSMutableString length](self->mCssString, "length"))
  {
    -[NSMutableString insertString:atIndex:](self->mCssString, "insertString:atIndex:", CFSTR("<style type=\"text/css\">\n"), 0);
    -[NSMutableString appendString:](self->mCssString, "appendString:", CFSTR("</style>"));
    v3 = (void *)-[NSMutableString copy](self->mCssString, "copy");
    v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    mCssString = self->mCssString;
    self->mCssString = v4;

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)cssStylesheetString
{
  return (id)-[NSMutableString copy](self->mCssString, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStyleCache, 0);
  objc_storeStrong((id *)&self->mCssString, 0);
}

@end
