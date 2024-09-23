@implementation PFEIReaderState

- (PFEIReaderState)initWithDocumentRoot:(id)a3 contentNode:(id)a4 flowNodeBody:(id)a5 archive:(id)a6 documentEntryUri:(id)a7
{
  PFEIReaderState *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PFEIReaderState;
  v8 = -[PFXHtmlReaderState initWithDocumentRoot:contentNode:entry:inArchive:](&v10, "initWithDocumentRoot:contentNode:entry:inArchive:", a3, a4, a7, a6);
  if (v8)
  {
    v8->_orientationState = (PFAIDocOrientationState *)-[PFAIDocOrientationState initWitContentNodeBody:presentationType:readerState:]([PFAIDocOrientationState alloc], "initWitContentNodeBody:presentationType:readerState:", a5, +[THPresentationType flowPresentationTypeInContext:](THPresentationType, "flowPresentationTypeInContext:", -[THDocumentRoot context](-[PFXHtmlReaderState thDocumentRoot](v8, "thDocumentRoot"), "context")), v8);
    v8->_anchorsForCFIFrag = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFEIReaderState;
  -[PFXHtmlReaderState dealloc](&v3, "dealloc");
}

- (void)_setCfiPathForInfo:(id)a3 childIndex:(unint64_t)a4 fromStackEntry:(id)a5
{
  -[PFXHtmlReaderState setCfiPathForInfo:childIndex:nodeBody:fromStackEntry:](self, "setCfiPathForInfo:childIndex:nodeBody:fromStackEntry:", a3, a4, -[PFAIDocOrientationState contentNodeBody](self->_orientationState, "contentNodeBody"), a5);
}

- (void)setCfiPathForInfo:(id)a3 fromStackEntry:(id)a4
{
  -[PFXHtmlReaderState setCfiPathForInfo:childIndex:nodeBody:fromStackEntry:](self, "setCfiPathForInfo:childIndex:nodeBody:fromStackEntry:", a3, 0, -[PFAIDocOrientationState contentNodeBody](self->_orientationState, "contentNodeBody"), a4);
}

- (void)setCfiPathForCurrentStorage
{
  PFXHtmlStackEntry *v3;

  v3 = -[PFXHtmlReaderState currentHtmlStackEntry](self, "currentHtmlStackEntry");
  -[PFEIReaderState setCfiPathForInfo:fromStackEntry:](self, "setCfiPathForInfo:fromStackEntry:", -[PFXHtmlEntryMediaState storage](-[PFXHtmlStackEntry currentEntryMediaState](v3, "currentEntryMediaState"), "storage"), v3);
}

- (void)setCfiPathForTextRun:(unint64_t)a3
{
  PFXHtmlStackEntry *v5;

  v5 = -[PFXHtmlReaderState currentHtmlStackEntry](self, "currentHtmlStackEntry");
  -[PFEIReaderState _setCfiPathForInfo:childIndex:fromStackEntry:](self, "_setCfiPathForInfo:childIndex:fromStackEntry:", -[PFXHtmlEntryMediaState storage](-[PFXHtmlStackEntry currentEntryMediaState](v5, "currentEntryMediaState"), "storage"), a3, v5);
}

- (void)setUniqueIdForTableCellStorage:(id)a3 withInfoId:(id)a4
{
  THModelContentNodeBody *v6;

  v6 = -[PFAIDocOrientationState contentNodeBody](self->_orientationState, "contentNodeBody");
  if (-[THModelContentNodeBody infoForNodeUniqueID:](v6, "infoForNodeUniqueID:", a4))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFEIReaderState setUniqueIdForTableCellStorage:withInfoId:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/EPUB/PFEIReaderState.mm"), 84, CFSTR("Info already registered."));
  -[THModelContentNodeBody setNodeUniqueID:forInfo:](v6, "setNodeUniqueID:forInfo:", a4, a3);
}

- (id)uniqueIdForInfo:(id)a3
{
  return -[THModelContentNodeBody nodeUniqueIDForInfo:](-[PFAIDocOrientationState contentNodeBody](self->_orientationState, "contentNodeBody"), "nodeUniqueIDForInfo:", a3);
}

- (id)setUniqueIdForInfo:(id)a3 withPostfix:(id)a4 fromStackEntry:(id)a5
{
  return -[PFXHtmlReaderState setUniqueIdForInfo:nodeBody:withPostfix:fromStackEntry:](self, "setUniqueIdForInfo:nodeBody:withPostfix:fromStackEntry:", a3, -[PFAIDocOrientationState contentNodeBody](self->_orientationState, "contentNodeBody"), a4, a5);
}

- (id)currentHtmlDocMediaState
{
  return self->_orientationState;
}

- (PFAIDocOrientationState)orientationState
{
  return self->_orientationState;
}

- (int64_t)referenceAnchorStartIndex
{
  return self->_referenceAnchorStartIndex;
}

- (void)setReferenceAnchorStartIndex:(int64_t)a3
{
  self->_referenceAnchorStartIndex = a3;
}

- (NSString)referenceAnchorID
{
  return self->_referenceAnchorID;
}

- (void)setReferenceAnchorID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (TSUNoCopyDictionary)anchorsForCFIFrag
{
  return self->_anchorsForCFIFrag;
}

- (void)setAnchorsForCFIFrag:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 264);
}

- (Class)drawablePlacementClass
{
  return (Class)objc_opt_class(PFEIDrawablePlacement, a2);
}

- (id)readerForCurrentMediaStateWithStackEntry:(id)a3
{
  return objc_msgSend(a3, "reader");
}

@end
