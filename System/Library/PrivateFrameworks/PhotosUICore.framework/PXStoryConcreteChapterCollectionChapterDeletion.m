@implementation PXStoryConcreteChapterCollectionChapterDeletion

- (PXStoryConcreteChapterCollectionChapterDeletion)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryChapterCollectionEdit.m"), 77, CFSTR("%s is not available as initializer"), "-[PXStoryConcreteChapterCollectionChapterDeletion init]");

  abort();
}

- (PXStoryConcreteChapterCollectionChapterDeletion)initWithDeletedChapterIdentifier:(id)a3
{
  id v5;
  PXStoryConcreteChapterCollectionChapterDeletion *v6;
  PXStoryConcreteChapterCollectionChapterDeletion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryConcreteChapterCollectionChapterDeletion;
  v6 = -[PXStoryConcreteChapterCollectionChapterDeletion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_deletedChapterIdentifier, a3);

  return v7;
}

- (int64_t)kind
{
  return 3;
}

- (NSCopying)deletedChapterIdentifier
{
  return self->_deletedChapterIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedChapterIdentifier, 0);
}

@end
