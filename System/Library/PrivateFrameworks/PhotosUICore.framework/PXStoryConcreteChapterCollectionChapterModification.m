@implementation PXStoryConcreteChapterCollectionChapterModification

- (PXStoryConcreteChapterCollectionChapterModification)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryChapterCollectionEdit.m"), 17, CFSTR("%s is not available as initializer"), "-[PXStoryConcreteChapterCollectionChapterModification init]");

  abort();
}

- (PXStoryConcreteChapterCollectionChapterModification)initWithEditedChapterIdentifier:(id)a3 chapterChangeRequest:(id)a4
{
  id v7;
  id v8;
  PXStoryConcreteChapterCollectionChapterModification *v9;
  PXStoryConcreteChapterCollectionChapterModification *v10;
  uint64_t v11;
  id chapterChangeRequest;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryConcreteChapterCollectionChapterModification;
  v9 = -[PXStoryConcreteChapterCollectionChapterModification init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_editedChapterIdentifier, a3);
    v11 = objc_msgSend(v8, "copy");
    chapterChangeRequest = v10->_chapterChangeRequest;
    v10->_chapterChangeRequest = (id)v11;

  }
  return v10;
}

- (int64_t)kind
{
  return 1;
}

- (NSCopying)editedChapterIdentifier
{
  return self->_editedChapterIdentifier;
}

- (id)chapterChangeRequest
{
  return self->_chapterChangeRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_chapterChangeRequest, 0);
  objc_storeStrong((id *)&self->_editedChapterIdentifier, 0);
}

@end
