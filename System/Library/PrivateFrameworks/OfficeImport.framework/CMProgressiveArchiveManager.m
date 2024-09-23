@implementation CMProgressiveArchiveManager

- (CMProgressiveArchiveManager)initWithClient:(const void *)a3 andCallBacks:(id *)a4
{
  CMProgressiveArchiveManager *v6;
  CMProgressiveArchiveManager *v7;
  uint64_t v8;
  NSMutableDictionary *mDataCache;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CMProgressiveArchiveManager;
  v6 = -[CMStylingArchiveManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->mClient = a3;
    v6->mCallBacks = a4;
    v8 = objc_opt_new();
    mDataCache = v7->mDataCache;
    v7->mDataCache = (NSMutableDictionary *)v8;

    v7->super.super.mCommitInterval = 2.0;
    v7->super.super.mAutoCommit = 1;
  }
  return v7;
}

- (BOOL)isCancelled
{
  return ((uint64_t (*)(const void *, SEL))self->mCallBacks->var3)(self->mClient, a2) ^ 1;
}

- (void)commitDataAtPath:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;

  v4 = (__CFString *)a3;
  v12 = v4;
  if (!v4)
  {
    if (!self->mMainDataInited)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", CFSTR("text/html"), CFSTR("MimeType"), CFSTR("UTF-8"), CFSTR("TextEncoding"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->super.super.mWidth)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v6, HTMLWidth);

      }
      if (self->super.super.mHeight)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v7, HTMLHeight);

      }
      if (self->super.super.mPageCount)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v8, HTMLPageCount);

      }
      ((void (*)(const void *, const __CFString *, void *))self->mCallBacks->var0)(self->mClient, CFSTR("public.html"), v5);
      self->mMainDataInited = 1;

    }
    v4 = CFSTR("##main##");
  }
  v9 = v4;
  -[NSMutableDictionary objectForKey:](self->mDataCache, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v12)
      v11 = objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:");
    else
      v11 = 0;
    ((void (*)(const void *, uint64_t, void *, _QWORD))self->mCallBacks->var2)(self->mClient, v11, v10, 0);
    -[NSMutableDictionary removeObjectForKey:](self->mDataCache, "removeObjectForKey:", v9);
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
    if (!v6)
      -[NSMutableString appendString:](self->mHtmlLogString, "appendString:", v8);
    objc_msgSend(v8, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMProgressiveArchiveManager pushData:toPath:](self, "pushData:toPath:", v7, v6);

  }
}

- (void)pushData:(id)a3 toPath:(id)a4
{
  __CFString *v6;
  NSDate *v7;
  NSDate *mStartDate;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  double v12;
  NSDate *mLastCommitDate;
  double v14;
  NSDate *v15;
  NSDate *v16;
  id v17;

  v17 = a3;
  v6 = (__CFString *)a4;
  if (!self->mStartDate)
  {
    v7 = (NSDate *)objc_alloc_init(MEMORY[0x24BDBCE60]);
    mStartDate = self->mStartDate;
    self->mStartDate = v7;

  }
  v9 = CFSTR("##main##");
  if (v6)
    v9 = v6;
  v10 = v9;
  if (!-[CMArchiveManager progressiveMappingIsPausedOnPath:](self, "progressiveMappingIsPausedOnPath:", v10))
  {
    -[NSMutableDictionary objectForKey:](self->mDataCache, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", objc_msgSend(v17, "length"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->mDataCache, "setObject:forKey:", v17, v10);
    }
    objc_msgSend(v11, "appendData:", v17);
    if (!v6 && self->super.super.mAutoCommit)
    {
      if (self->super.super.mCommitInterval == 0.0
        || (-[NSDate timeIntervalSinceNow](self->mStartDate, "timeIntervalSinceNow"), fabs(v12) < 2.0))
      {
        -[CMProgressiveArchiveManager commitDataAtPath:](self, "commitDataAtPath:", 0);
      }
      else
      {
        mLastCommitDate = self->mLastCommitDate;
        if (!mLastCommitDate
          || (-[NSDate timeIntervalSinceNow](mLastCommitDate, "timeIntervalSinceNow"),
              fabs(v14) > self->super.super.mCommitInterval))
        {
          -[CMProgressiveArchiveManager commitDataAtPath:](self, "commitDataAtPath:", 0);
          v15 = (NSDate *)objc_alloc_init(MEMORY[0x24BDBCE60]);
          v16 = self->mLastCommitDate;
          self->mLastCommitDate = v15;

        }
      }
    }

  }
}

- (void)pushCssToPath:(id)a3
{
  id v4;

  -[CMStylingArchiveManager commitStylesheet](self, "commitStylesheet", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[CMProgressiveArchiveManager pushText:toPath:](self, "pushText:toPath:", v4, 0);

}

- (BOOL)isProgressive
{
  return 1;
}

- (void)closeResourceAtPath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (v4)
    v4 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
  ((void (*)(const void *, id, _QWORD, uint64_t))self->mCallBacks->var2)(self->mClient, v4, 0, 1);

}

- (id)copyResourceWithName:(id)a3 type:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const void *v10;
  void *v11;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  +[CMArchiveManager resourceTypeToMIME:](CMArchiveManager, "resourceTypeToMIME:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v7, CFSTR("MimeType"), CFSTR("UTF-8"), CFSTR("TextEncoding"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)((uint64_t (*)(const void *, id, void *))self->mCallBacks->var1)(self->mClient, v6, v8);
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v10);
    v10 = (const void *)objc_msgSend(v11, "copy");

  }
  return (id)v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mHtmlLogString, 0);
  objc_storeStrong((id *)&self->mLastCommitDate, 0);
  objc_storeStrong((id *)&self->mStartDate, 0);
  objc_storeStrong((id *)&self->mDataCache, 0);
}

@end
