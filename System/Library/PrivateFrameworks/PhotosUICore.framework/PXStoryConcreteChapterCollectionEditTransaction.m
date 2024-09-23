@implementation PXStoryConcreteChapterCollectionEditTransaction

- (PXStoryConcreteChapterCollectionEditTransaction)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryChapterCollectionEdit.m"), 105, CFSTR("%s is not available as initializer"), "-[PXStoryConcreteChapterCollectionEditTransaction init]");

  abort();
}

- (PXStoryConcreteChapterCollectionEditTransaction)initWithOriginalChapterCollection:(id)a3 edits:(id)a4
{
  id v7;
  id v8;
  PXStoryConcreteChapterCollectionEditTransaction *v9;
  PXStoryConcreteChapterCollectionEditTransaction *v10;
  uint64_t v11;
  NSArray *edits;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryConcreteChapterCollectionEditTransaction;
  v9 = -[PXStoryConcreteChapterCollectionEditTransaction init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalChapterCollection, a3);
    v11 = objc_msgSend(v8, "copy");
    edits = v10->_edits;
    v10->_edits = (NSArray *)v11;

  }
  return v10;
}

- (PXStoryChapterCollection)originalChapterCollection
{
  return self->_originalChapterCollection;
}

- (NSArray)edits
{
  return self->_edits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edits, 0);
  objc_storeStrong((id *)&self->_originalChapterCollection, 0);
}

@end
