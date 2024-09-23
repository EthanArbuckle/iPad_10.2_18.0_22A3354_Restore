@implementation PFAISearchIndexState

- (PFAISearchIndexState)initWithEntry:(id)a3 inArchive:(id)a4 documentRoot:(id)a5
{
  PFAISearchIndexState *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PFAISearchIndexState;
  result = -[PFXXmlStreamReaderState initWithEntry:inArchive:](&v7, "initWithEntry:inArchive:", a3, a4);
  if (result)
    result->mDocumentRoot = (THDocumentRoot *)a5;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFAISearchIndexState;
  -[PFXXmlStreamReaderState dealloc](&v3, "dealloc");
}

- (THDocumentRoot)thDocumentRoot
{
  return self->mDocumentRoot;
}

- (PFAIOperationLoadDelegate)loadDelegate
{
  return self->mLoadDelegate;
}

- (void)setLoadDelegate:(id)a3
{
  self->mLoadDelegate = (PFAIOperationLoadDelegate *)a3;
}

- (PFAISearchIndex)index
{
  return self->mIndex;
}

- (void)setIndex:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (BOOL)isCancelled
{
  BOOL result;

  if (self->mWasCancelled)
    result = 1;
  else
    result = -[PFAIOperationLoadDelegate operationShouldCancelLoad](self->mLoadDelegate, "operationShouldCancelLoad");
  self->mWasCancelled = result;
  return result;
}

@end
