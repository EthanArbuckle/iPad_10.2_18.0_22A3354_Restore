@implementation PFAISearchRefTextState

- (PFAISearchRefTextState)initWithEntry:(id)a3 searchArray:(id)a4 inArchive:(id)a5 documentRoot:(id)a6
{
  PFAISearchRefTextState *v8;
  PFAISearchRefTextState *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PFAISearchRefTextState;
  v8 = -[PFXXmlStreamReaderState initWithEntry:inArchive:](&v11, "initWithEntry:inArchive:", a3, a5);
  v9 = v8;
  if (v8)
  {
    v8->mDocumentRoot = (THDocumentRoot *)a6;
    v8->mRIDs = (NSArray *)objc_msgSend(a4, "sortedArrayUsingSelector:", "caseInsensitiveCompare:");
    v9->mRefTextForRID = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](v9->mRIDs, "count"));
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFAISearchRefTextState;
  -[PFXXmlStreamReaderState dealloc](&v3, "dealloc");
}

- (id)currentRID
{
  unint64_t mCurrentRIDIndex;

  mCurrentRIDIndex = self->mCurrentRIDIndex;
  if (mCurrentRIDIndex >= -[NSArray count](self->mRIDs, "count"))
    return 0;
  else
    return -[NSArray objectAtIndex:](self->mRIDs, "objectAtIndex:", self->mCurrentRIDIndex);
}

- (id)incrementFromRID:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", -[PFAISearchRefTextState currentRID](self, "currentRID")))
    ++self->mCurrentRIDIndex;
  return -[PFAISearchRefTextState currentRID](self, "currentRID");
}

- (id)addRefText:(id)a3 forRID:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->mRefTextForRID, "setObject:forKey:", a3);
  return -[PFAISearchRefTextState incrementFromRID:](self, "incrementFromRID:", a4);
}

- (id)refTextForRIDs
{
  return self->mRefTextForRID;
}

- (void)switchReadToGetCfi
{
  -[PFXXmlStreamReaderState switchEntryTo:](self, "switchEntryTo:", -[THDocumentProperties searchIndexEntry](-[THDocumentRoot properties](self->mDocumentRoot, "properties"), "searchIndexEntry"));
  self->mCurrentRIDIndex = 0;
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
