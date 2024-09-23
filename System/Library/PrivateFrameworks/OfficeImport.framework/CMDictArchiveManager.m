@implementation CMDictArchiveManager

- (CMDictArchiveManager)initWithName:(id)a3 resourcePathPrefix:(id)a4
{
  id v7;
  id v8;
  CMDictArchiveManager *v9;
  NSMutableString *v10;
  NSMutableString *mMainHtml;
  NSMutableDictionary *v12;
  NSMutableDictionary *mResources;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CMDictArchiveManager;
  v9 = -[CMStylingArchiveManager init](&v15, sel_init);
  if (v9)
  {
    v10 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    mMainHtml = v9->mMainHtml;
    v9->mMainHtml = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mResources = v9->mResources;
    v9->mResources = v12;

    objc_storeStrong((id *)&v9->mPrefix, a4);
    objc_storeStrong((id *)&v9->mResourceUrlProtocol, a4);
    objc_storeStrong((id *)&v9->mName, a3);
    v9->mIsFrameset = 0;
    v9->super.super.mIsThumbnail = 0;
  }

  return v9;
}

- (void)setIsFrameset
{
  self->mIsFrameset = 1;
}

- (id)name
{
  return self->mName;
}

- (id)copyResourceWithName:(id)a3 type:(int)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  -[NSMutableDictionary setObject:forKey:](self->mResources, "setObject:forKey:", v6, v5);
  v7 = 3;
  if (!self->mIsFrameset)
    v7 = 2;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CMDictArchiveManager_mMainHtml[v7]), "stringByAppendingString:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)pushData:(id)a3 toPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (!-[CMArchiveManager progressiveMappingIsPausedOnPath:](self, "progressiveMappingIsPausedOnPath:", v6))
  {
    v7 = v6;
    v8 = 3;
    if (!self->mIsFrameset)
      v8 = 2;
    v9 = *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CMDictArchiveManager_mMainHtml[v8]);
    if (objc_msgSend(v7, "hasPrefix:", v9))
    {
      objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v9, "length"));
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v10;
    }
    -[NSMutableDictionary objectForKey:](self->mResources, "objectForKey:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendData:", v12);

  }
}

- (void)pushText:(id)a3 toPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (!-[CMArchiveManager progressiveMappingIsPausedOnPath:](self, "progressiveMappingIsPausedOnPath:", v6))
  {
    if (v6)
    {
      objc_msgSend(v8, "dataUsingEncoding:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMDictArchiveManager pushData:toPath:](self, "pushData:toPath:", v7, v6);

    }
    else
    {
      -[NSMutableString appendString:](self->mMainHtml, "appendString:", v8);
    }
  }

}

- (id)copyDictionaryWithSizeInfos:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSMutableString *mMainHtml;
  NSMutableDictionary *mResources;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  __CFString *v16;

  v3 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCE70]);
  mMainHtml = self->mMainHtml;
  mResources = self->mResources;
  v8 = HTMLMainContent;
  v9 = HTMLResources;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->super.super.mHeight);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = HTMLHeight;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->super.super.mWidth);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = HTMLWidth;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->super.super.mPageCount);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", mMainHtml, v8, mResources, v9, v10, v16, v11, v12, v13, HTMLPageCount, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->super.super.mPageCount);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", mMainHtml, v8, mResources, v9, v10, HTMLPageCount, 0);
  }

  return v14;
}

- (unint64_t)resourceCount
{
  return -[NSMutableDictionary count](self->mResources, "count");
}

- (id)resourceUrlProtocol
{
  return self->mResourceUrlProtocol;
}

- (void)pushCssToPath:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[CMArchiveManager progressiveMappingIsPausedOnPath:](self, "progressiveMappingIsPausedOnPath:"))
  {
    -[CMStylingArchiveManager commitStylesheet](self, "commitStylesheet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      -[CMDictArchiveManager pushText:toPath:](self, "pushText:toPath:", v4, v5);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
  objc_storeStrong((id *)&self->mMainHtml, 0);
  objc_storeStrong((id *)&self->mResourceUrlProtocol, 0);
  objc_storeStrong((id *)&self->mPrefix, 0);
  objc_storeStrong((id *)&self->mResources, 0);
}

@end
