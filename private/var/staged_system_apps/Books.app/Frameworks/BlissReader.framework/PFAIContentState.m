@implementation PFAIContentState

- (PFAIContentState)initWithDocumentRoot:(id)a3 contentNode:(id)a4 flowNodeBody:(id)a5 paginatedNodeBody:(id)a6 archive:(id)a7 documentEntryUri:(id)a8
{
  PFAIContentState *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PFAIContentState;
  v10 = -[PFXHtmlReaderState initWithDocumentRoot:contentNode:entry:inArchive:](&v12, "initWithDocumentRoot:contentNode:entry:inArchive:", a3, a4, a8, a7);
  if (v10)
  {
    v10->mFlowState = (PFAIDocOrientationState *)-[PFAIDocOrientationState initWitContentNodeBody:presentationType:readerState:]([PFAIDocOrientationState alloc], "initWitContentNodeBody:presentationType:readerState:", a5, +[THPresentationType flowPresentationTypeInContext:](THPresentationType, "flowPresentationTypeInContext:", -[THDocumentRoot context](-[PFXHtmlReaderState thDocumentRoot](v10, "thDocumentRoot"), "context")), v10);
    v10->mPaginatedState = (PFAIDocOrientationState *)-[PFAIDocOrientationState initWitContentNodeBody:presentationType:readerState:]([PFAIDocOrientationState alloc], "initWitContentNodeBody:presentationType:readerState:", a6, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THDocumentRoot context](-[PFXHtmlReaderState thDocumentRoot](v10, "thDocumentRoot"), "context")), v10);
    v10->mCurrentReferenceAnchorForEntryOrientation = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
    v10->mReferenceAnchorStartForEntryOrientation = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
    v10->mHintCollectors = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSURetainedPointerKeyDictionary);
    v10->mHints = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v10->mFlowHeader = 0;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFAIContentState;
  -[PFXHtmlReaderState dealloc](&v3, "dealloc");
}

- (void)setInTable:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  +[PFAIReferenceAnchor endCurrentReferenceAnchorForEntryOrientation:contentState:](PFAIReferenceAnchor, "endCurrentReferenceAnchorForEntryOrientation:contentState:", -[PFXXmlStackEntry currentEntryOrientationState](self->super.super.mCurrentEntry, "currentEntryOrientationState"), self);
  v5.receiver = self;
  v5.super_class = (Class)PFAIContentState;
  -[PFXHtmlReaderState setInTable:](&v5, "setInTable:", v3);
}

- (PFAIStackEntry)currentStackEntry
{
  return (PFAIStackEntry *)self->super.super.mCurrentEntry;
}

- (id)currentHtmlDocMediaState
{
  return self->mCurrentOrientationState;
}

- (PFAIDocOrientationState)currentDocOrientationState
{
  return self->mCurrentOrientationState;
}

- (BOOL)paginatedIsCurrent
{
  return self->mCurrentOrientationState == self->mPaginatedState;
}

- (BOOL)flowIsCurrent
{
  return self->mCurrentOrientationState == self->mFlowState;
}

- (BOOL)setPaginatedAsCurrent
{
  self->mCurrentOrientationState = self->mPaginatedState;
  return objc_msgSend(-[PFXXmlStackEntry paginatedState](self->super.super.mCurrentEntry, "paginatedState"), "processOrientation");
}

- (BOOL)setFlowAsCurrent
{
  self->mCurrentOrientationState = self->mFlowState;
  return objc_msgSend(-[PFXXmlStackEntry flowState](self->super.super.mCurrentEntry, "flowState"), "processOrientation");
}

- (unint64_t)orientationCount
{
  return 2;
}

- (void)switchToOrientation:(unint64_t)a3
{
  if (a3 == 1)
  {
    -[PFAIContentState setFlowAsCurrent](self, "setFlowAsCurrent");
  }
  else if (!a3)
  {
    -[PFAIContentState setPaginatedAsCurrent](self, "setPaginatedAsCurrent");
  }
}

- (id)hintCollectionWithUrl:(id)a3 data:(id)a4
{
  id v7;
  id v8;

  v7 = -[NSMutableDictionary objectForKey:](self->mHints, "objectForKey:");
  if (!v7)
  {
    v7 = objc_msgSend(objc_alloc((Class)TSWPLineHintCollection), "initWithApplePubData:context:", a4, -[THDocumentRoot context](-[PFXHtmlReaderState thDocumentRoot](self, "thDocumentRoot"), "context"));
    if (v7)
    {
      -[NSMutableDictionary setObject:forKey:](self->mHints, "setObject:forKey:", v7, a3);
      v8 = v7;
    }
  }
  return v7;
}

- (id)hintCollectorForStorage:(id)a3
{
  PFAIHintCollector *v5;
  PFAIHintCollector *v6;

  v5 = (PFAIHintCollector *)-[TSUNoCopyDictionary objectForKey:](self->mHintCollectors, "objectForKey:");
  if (!v5)
  {
    v5 = -[PFAIHintCollector initWithStorage:]([PFAIHintCollector alloc], "initWithStorage:", a3);
    -[TSUNoCopyDictionary setObject:forUncopiedKey:](self->mHintCollectors, "setObject:forUncopiedKey:", v5, a3);
    v6 = v5;
  }
  return v5;
}

- (void)processHints
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = -[TSUNoCopyDictionary objectEnumerator](self->mHintCollectors, "objectEnumerator", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "processHintCollections");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (id)currentReferenceAnchorForEntryOrientation:(id)a3
{
  return -[TSUNoCopyDictionary objectForKey:](self->mCurrentReferenceAnchorForEntryOrientation, "objectForKey:", a3);
}

- (void)setCurrentReferenceAnchor:(id)a3 forEntryOrientation:(id)a4
{
  TSUNoCopyDictionary *mCurrentReferenceAnchorForEntryOrientation;

  mCurrentReferenceAnchorForEntryOrientation = self->mCurrentReferenceAnchorForEntryOrientation;
  if (a3)
    -[TSUNoCopyDictionary setObject:forUncopiedKey:](mCurrentReferenceAnchorForEntryOrientation, "setObject:forUncopiedKey:", a3, a4);
  else
    -[TSUNoCopyDictionary removeObjectForKey:](mCurrentReferenceAnchorForEntryOrientation, "removeObjectForKey:", a4);
}

- (int64_t)referenceAnchorStartForEntryOrientation:(id)a3
{
  id v3;

  v3 = -[TSUNoCopyDictionary objectForKey:](self->mReferenceAnchorStartForEntryOrientation, "objectForKey:", a3);
  if (v3)
    return (int64_t)objc_msgSend(v3, "integerValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setReferenceAnchorStart:(int64_t)a3 forEntryOrientation:(id)a4
{
  -[TSUNoCopyDictionary setObject:forUncopiedKey:](self->mReferenceAnchorStartForEntryOrientation, "setObject:forUncopiedKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3), a4);
}

- (void)_setCfiPathForInfo:(id)a3 childIndex:(unint64_t)a4 fromStackEntry:(id)a5
{
  -[PFXHtmlReaderState setCfiPathForInfo:childIndex:nodeBody:fromStackEntry:](self, "setCfiPathForInfo:childIndex:nodeBody:fromStackEntry:", a3, a4, -[PFAIDocOrientationState contentNodeBody](-[PFAIContentState currentDocOrientationState](self, "currentDocOrientationState"), "contentNodeBody"), a5);
}

- (void)setCfiPathForInfo:(id)a3 fromStackEntry:(id)a4
{
  -[PFAIContentState _setCfiPathForInfo:childIndex:fromStackEntry:](self, "_setCfiPathForInfo:childIndex:fromStackEntry:", a3, 0, a4);
}

- (void)setCfiPathForCurrentStorage
{
  PFAIStackEntry *v3;

  v3 = -[PFAIContentState currentStackEntry](self, "currentStackEntry");
  -[PFAIContentState setCfiPathForInfo:fromStackEntry:](self, "setCfiPathForInfo:fromStackEntry:", objc_msgSend(-[PFAIStackEntry currentEntryMediaState](v3, "currentEntryMediaState"), "storage"), v3);
}

- (void)setCfiPathForTextRun:(unint64_t)a3
{
  PFAIStackEntry *v5;

  if (a3 >= 2)
  {
    v5 = -[PFAIContentState currentStackEntry](self, "currentStackEntry");
    -[PFAIContentState _setCfiPathForInfo:childIndex:fromStackEntry:](self, "_setCfiPathForInfo:childIndex:fromStackEntry:", objc_msgSend(-[PFAIStackEntry currentEntryMediaState](v5, "currentEntryMediaState"), "storage"), a3, v5);
  }
}

- (void)setUniqueIdForTableCellStorage:(id)a3 withInfoId:(id)a4
{
  THModelContentNodeBody *v6;

  v6 = -[PFAIDocOrientationState contentNodeBody](-[PFAIContentState currentDocOrientationState](self, "currentDocOrientationState"), "contentNodeBody");
  if (-[THModelContentNodeBody infoForNodeUniqueID:](v6, "infoForNodeUniqueID:", a4))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFAIContentState setUniqueIdForTableCellStorage:withInfoId:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/PFAIContentState.mm"), 275, CFSTR("Info already registered."));
  -[THModelContentNodeBody setNodeUniqueID:forInfo:](v6, "setNodeUniqueID:forInfo:", a4, a3);
}

- (id)uniqueIdForInfo:(id)a3
{
  return -[THModelContentNodeBody nodeUniqueIDForInfo:](-[PFAIDocOrientationState contentNodeBody](-[PFAIContentState currentDocOrientationState](self, "currentDocOrientationState"), "contentNodeBody"), "nodeUniqueIDForInfo:", a3);
}

- (id)setUniqueIdForInfo:(id)a3 withPostfix:(id)a4 fromStackEntry:(id)a5
{
  return -[PFXHtmlReaderState setUniqueIdForInfo:nodeBody:withPostfix:fromStackEntry:](self, "setUniqueIdForInfo:nodeBody:withPostfix:fromStackEntry:", a3, -[PFAIDocOrientationState contentNodeBody](-[PFAIContentState currentDocOrientationState](self, "currentDocOrientationState"), "contentNodeBody"), a4, a5);
}

- (void)popReader
{
  objc_super v3;

  if ((__end_cap_ **)((char *)self->super.super.mContextStack.var0 - (char *)self->super.super.mContextStack.__begin_) <= (__end_cap_ **)((char *)&stru_20.cmdsize + 3))
    +[TCProgressContext setProgress:](TCProgressContext, "setProgress:", (double)xmlTextReaderByteConsumed(self->super.super.mStreamAPI));
  v3.receiver = self;
  v3.super_class = (Class)PFAIContentState;
  -[PFXXmlStreamReaderState popReader](&v3, "popReader");
}

- (BOOL)shouldCountText
{
  return 1;
}

- (PFAIDocOrientationState)paginatedState
{
  return self->mPaginatedState;
}

- (PFAIDocOrientationState)flowState
{
  return self->mFlowState;
}

- (BOOL)inFlowHeader
{
  return self->mFlowHeader;
}

- (void)setInFlowHeader:(BOOL)a3
{
  self->mFlowHeader = a3;
}

+ (Class)stackEntryClass
{
  return (Class)objc_opt_class(PFAIStackEntry, a2);
}

- (Class)drawablePlacementClass
{
  return (Class)objc_opt_class(PFAIDrawablePlacement, a2);
}

- (Class)textBodyClass
{
  return (Class)objc_opt_class(PFXBody, a2);
}

- (id)readerForCurrentMediaStateWithStackEntry:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;

  v4 = objc_msgSend(a3, "reader");
  v5 = objc_opt_class(PFAIDualReader);
  *(_QWORD *)&v7 = TSUDynamicCast(v5, v4).n128_u64[0];
  if (v6)
    return objc_msgSend(v6, "currentSubreaderWithState:", objc_msgSend(a3, "applePubReaderState", v7));
  else
    return v4;
}

@end
