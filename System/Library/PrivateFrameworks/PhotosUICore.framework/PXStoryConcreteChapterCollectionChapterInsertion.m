@implementation PXStoryConcreteChapterCollectionChapterInsertion

- (PXStoryConcreteChapterCollectionChapterInsertion)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryChapterCollectionEdit.m"), 47, CFSTR("%s is not available as initializer"), "-[PXStoryConcreteChapterCollectionChapterInsertion init]");

  abort();
}

- (PXStoryConcreteChapterCollectionChapterInsertion)initWithFirstAsset:(id)a3 chapterConfiguration:(id)a4
{
  id v7;
  id v8;
  PXStoryConcreteChapterCollectionChapterInsertion *v9;
  PXStoryConcreteChapterCollectionChapterInsertion *v10;
  uint64_t v11;
  id chapterConfiguration;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryConcreteChapterCollectionChapterInsertion;
  v9 = -[PXStoryConcreteChapterCollectionChapterInsertion init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_firstAsset, a3);
    v11 = objc_msgSend(v8, "copy");
    chapterConfiguration = v10->_chapterConfiguration;
    v10->_chapterConfiguration = (id)v11;

  }
  return v10;
}

- (int64_t)kind
{
  return 2;
}

- (PXDisplayAsset)firstAsset
{
  return self->_firstAsset;
}

- (id)chapterConfiguration
{
  return self->_chapterConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_chapterConfiguration, 0);
  objc_storeStrong((id *)&self->_firstAsset, 0);
}

@end
