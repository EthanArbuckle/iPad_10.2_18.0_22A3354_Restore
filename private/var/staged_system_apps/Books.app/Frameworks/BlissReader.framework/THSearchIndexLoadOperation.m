@implementation THSearchIndexLoadOperation

- (THSearchIndexLoadOperation)initWithDelegate:(id)a3 documentRoot:(id)a4
{
  THSearchIndexLoadOperation *v6;
  THSearchIndexLoadOperation *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THSearchIndexLoadOperation;
  v6 = -[THSearchIndexLoadOperation init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->mDelegate = (THSearchIndexLoadOperationDelegate *)a3;
    v6->mDocumentRoot = (THDocumentRoot *)a4;
    v6->mApplePubURL = (NSURL *)objc_msgSend(a4, "zipPackage");
    v7->mSearchIndexEntry = (NSString *)objc_msgSend(objc_msgSend(a4, "properties"), "searchIndexEntry");
  }
  return v7;
}

- (void)main
{
  id v3;
  PFXArchive *v4;
  PFAISearchIndexState *v5;

  v3 = objc_alloc_init((Class)NSAutoreleasePool);
  v4 = -[PFXArchive initWithPath:]([PFXArchive alloc], "initWithPath:", -[NSURL path](self->mApplePubURL, "path"));
  if (!-[PFXArchive isValid](v4, "isValid"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSearchIndexLoadOperation main]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THSearchIndexLoadOperation.mm"), 48, CFSTR("Failed to load valid archive"));
  if (!-[PFXArchive isValid](v4, "isValid"))
  {
    v5 = 0;
LABEL_10:
    -[THSearchIndexLoadOperationDelegate searchIndexLoadOperationFailed:](self->mDelegate, "searchIndexLoadOperationFailed:", self);
    goto LABEL_11;
  }
  v5 = -[PFAISearchIndexState initWithEntry:inArchive:documentRoot:]([PFAISearchIndexState alloc], "initWithEntry:inArchive:documentRoot:", self->mSearchIndexEntry, v4, self->mDocumentRoot);
  -[PFAISearchIndexState setLoadDelegate:](v5, "setLoadDelegate:", self);
  if (!-[PFXXmlStreamReaderState streamAPI](v5, "streamAPI"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSearchIndexLoadOperation main]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THSearchIndexLoadOperation.mm"), 54, CFSTR("invalid nil value for '%s'"), "searchState.streamAPI");
  if (!-[PFXXmlStreamReaderState streamAPI](v5, "streamAPI")
    || !+[PFAISearchIndexDocument processSearchIndexWithState:](PFAISearchIndexDocument, "processSearchIndexWithState:", v5))
  {
    goto LABEL_10;
  }
LABEL_11:

}

@end
