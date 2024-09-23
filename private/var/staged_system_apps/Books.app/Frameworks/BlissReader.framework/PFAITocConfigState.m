@implementation PFAITocConfigState

- (PFAITocConfigState)initWithDocumentRoot:(id)a3 nodeBody:(id)a4 tocTile:(id)a5 archive:(id)a6 documentEntryUri:(id)a7
{
  PFAITocConfigState *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PFAITocConfigState;
  v10 = -[PFXHtmlReaderState initWithDocumentRoot:contentNode:entry:inArchive:](&v12, "initWithDocumentRoot:contentNode:entry:inArchive:", a3, 0, a7, a6);
  if (v10)
  {
    v10->mNodeBody = (THModelContentNodeBody *)a4;
    v10->mTocTile = (THTOCTileModel *)a5;
    v10->mPaginatedState = (PFAIDocOrientationState *)-[PFAIDocOrientationState initWitContentNodeBody:presentationType:readerState:]([PFAIDocOrientationState alloc], "initWitContentNodeBody:presentationType:readerState:", a4, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", objc_msgSend(a3, "context")), v10);
    v10->mPageDrawableList = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFAITocConfigState;
  -[PFXHtmlReaderState dealloc](&v3, "dealloc");
}

- (id)currentHtmlDocMediaState
{
  return self->mPaginatedState;
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

- (id)pageInfo
{
  if ((char *)-[NSArray count](-[THModelContentNodeBody pages](self->mNodeBody, "pages"), "count") == (char *)&dword_0 + 1)
    return -[NSArray objectAtIndex:](-[THModelContentNodeBody pages](self->mNodeBody, "pages"), "objectAtIndex:", 0);
  else
    return 0;
}

- (id)pageDrawableList
{
  return self->mPageDrawableList;
}

- (BOOL)isTOC
{
  return 1;
}

- (BOOL)isWidgetEntry:(id)a3
{
  int v4;
  const xmlChar *v5;
  const xmlChar *v6;

  v4 = xmlStrEqual((const xmlChar *)objc_msgSend(a3, "xmlElementName"), (const xmlChar *)"object");
  if (v4)
  {
    v5 = (const xmlChar *)objc_msgSend(a3, "xmlValueForAttribute:", "type");
    LOBYTE(v4) = v5
              && ((v6 = v5, xmlStrEqual(v5, (const xmlChar *)PFXCommonApubWidgetMimeType[0]))
               || xmlStrEqual(v6, (const xmlChar *)PFXCommonApubTocMimeType[0]));
  }
  return v4;
}

- (id)setUniqueIdForInfo:(id)a3 withPostfix:(id)a4 fromStackEntry:(id)a5
{
  THModelContentNodeBody *v8;
  NSString *v9;
  id v10;
  NSString *v11;

  v8 = -[PFAIDocOrientationState contentNodeBody](self->mPaginatedState, "contentNodeBody");
  v9 = -[THModelContentNodeBody nodeUniqueIDForInfo:](v8, "nodeUniqueIDForInfo:", a3);
  if (!v9)
  {
    v10 = objc_msgSend(a5, "xmlElementId");
    if (!v10
      || (v11 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v10)) == 0
      || (v9 = v11, objc_msgSend(a4, "length"))
      && (v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v9, a4)) == 0)
    {
      v9 = +[NSString stringWithUUID](NSString, "stringWithUUID");
    }
    -[THModelContentNodeBody setNodeUniqueID:forInfo:](v8, "setNodeUniqueID:forInfo:", v9, a3);
  }
  return v9;
}

- (TSSStylesheet)stylesheet
{
  return -[THModelContentNodeBody stylesheet](self->mNodeBody, "stylesheet");
}

- (THModelContentNodeBody)thNodeBody
{
  return self->mNodeBody;
}

- (THTOCTileModel)tocTile
{
  return self->mTocTile;
}

- (NSString)nodeGUID
{
  return self->mNodeGUID;
}

- (void)setNodeGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (PFAIOperationLoadDelegate)loadDelegate
{
  return self->mLoadDelegate;
}

- (void)setLoadDelegate:(id)a3
{
  self->mLoadDelegate = (PFAIOperationLoadDelegate *)a3;
}

- (PFAIDocOrientationState)paginatedState
{
  return self->mPaginatedState;
}

- (Class)drawablePlacementClass
{
  return (Class)objc_opt_class(PFAITocConfigDrawablePlacement, a2);
}

@end
