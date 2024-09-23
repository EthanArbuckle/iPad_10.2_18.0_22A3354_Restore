@implementation THAnnotationTextLocator

- (THAnnotationTextLocator)initWithDocumentRoot:(id)a3
{
  THAnnotationTextLocator *v4;
  THDocumentRoot *v5;
  THModelSearchIndex *v6;
  THSearchIndexLoadOperation *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THAnnotationTextLocator;
  v4 = -[THAnnotationTextLocator init](&v10, "init");
  if (v4)
  {
    v5 = (THDocumentRoot *)a3;
    v4->_documentRoot = v5;
    v6 = -[THDocumentRoot searchIndex](v5, "searchIndex");
    v4->_searchIndex = v6;
    if (!-[THSearchIndex loaded](v6, "loaded"))
    {
      v7 = -[THSearchIndexLoadOperation initWithDelegate:documentRoot:]([THSearchIndexLoadOperation alloc], "initWithDelegate:documentRoot:", 0, v4->_documentRoot);
      v8 = objc_alloc_init((Class)NSOperationQueue);
      objc_msgSend(v8, "addOperation:", v7);
      objc_msgSend(v8, "waitUntilAllOperationsAreFinished");
      -[THSearchIndex finishLoading](v4->_searchIndex, "finishLoading");

      if (!-[THSearchIndex loaded](v4->_searchIndex, "loaded"))
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationTextLocator initWithDocumentRoot:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationTextLocator.m"), 64, CFSTR("failed to load search index"));
    }
    if (!-[THSearchIndex loaded](v4->_searchIndex, "loaded"))
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THAnnotationTextLocator;
  -[THAnnotationTextLocator dealloc](&v3, "dealloc");
}

- (BOOL)locateAnnotationText:(id)a3 leftContext:(id)a4 rightContext:(id)a5 contentNodeID:(id *)a6 storageID:(id *)a7
{
  THAnnotationTextLocator *v7;
  THAnnotationTextLocator *v11;
  id v12;
  id v13;
  id v14;

  v7 = self;
  LOBYTE(self) = 0;
  if (a6 && a7)
  {
    if (a4
      && a5
      && (v11 = -[THSearchIndex unambiguousCFIForString:](v7->_searchIndex, "unambiguousCFIForString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@"), a4, a3, a5))) != 0|| (self = -[THSearchIndex unambiguousCFIForString:](v7->_searchIndex, "unambiguousCFIForString:", a3), (v11 = self) != 0))
    {
      v12 = -[THDocumentRoot contentNodeForCfi:error:](v7->_documentRoot, "contentNodeForCfi:error:", v11, 0);
      if (v12)
      {
        v13 = objc_msgSend(v12, "nodeGUID");
        v14 = -[THCFISplitter storageIDFromCFI:](+[THCFISplitter sharedInstance](THCFISplitter, "sharedInstance"), "storageIDFromCFI:", v11);
        if (!objc_msgSend(v14, "length"))
          v14 = v13;
        if (v13)
        {
          if (v14)
          {
            *a6 = v13;
            *a7 = v14;
            LOBYTE(self) = 1;
            return (char)self;
          }
          goto LABEL_15;
        }
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationTextLocator locateAnnotationText:leftContext:rightContext:contentNodeID:storageID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationTextLocator.m"), 127, CFSTR("invalid nil value for '%s'"), "contentNodeID");
        if (!v14)
LABEL_15:
          objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationTextLocator locateAnnotationText:leftContext:rightContext:contentNodeID:storageID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationTextLocator.m"), 128, CFSTR("invalid nil value for '%s'"), "storageID");
      }
      else
      {
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationTextLocator locateAnnotationText:leftContext:rightContext:contentNodeID:storageID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationTextLocator.m"), 114, CFSTR("invalid nil value for '%s'"), "contentNode");
      }
      LOBYTE(self) = 0;
    }
  }
  return (char)self;
}

- (THDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (void)setDocumentRoot:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (THModelSearchIndex)searchIndex
{
  return self->_searchIndex;
}

- (void)setSearchIndex:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
