@implementation _PXStoryTimeBasedChapterCollectionConfiguration

- (_PXStoryTimeBasedChapterCollectionConfiguration)init
{
  _PXStoryTimeBasedChapterCollectionConfiguration *v2;
  NSMutableArray *v3;
  NSMutableArray *chapters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PXStoryTimeBasedChapterCollectionConfiguration;
  v2 = -[_PXStoryTimeBasedChapterCollectionConfiguration init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    chapters = v2->_chapters;
    v2->_chapters = v3;

  }
  return v2;
}

- (void)addChapterWithDateInterval:(id)a3 configuration:(id)a4
{
  void (**v6)(id, _PXStoryTimeBasedChapter *);
  id v7;
  void *v8;
  _PXStoryTimeBasedChapter *v9;

  v6 = (void (**)(id, _PXStoryTimeBasedChapter *))a4;
  v7 = a3;
  v9 = -[_PXStoryTimeBasedChapter initWithDateInterval:firstAssetLocalIdentifier:]([_PXStoryTimeBasedChapter alloc], "initWithDateInterval:firstAssetLocalIdentifier:", v7, 0);

  v6[2](v6, v9);
  -[_PXStoryTimeBasedChapterCollectionConfiguration chapters](self, "chapters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

- (BOOL)usesAssetLocalCreationDates
{
  return self->_usesAssetLocalCreationDates;
}

- (void)setUsesAssetLocalCreationDates:(BOOL)a3
{
  self->_usesAssetLocalCreationDates = a3;
}

- (NSMutableArray)chapters
{
  return self->_chapters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chapters, 0);
}

@end
