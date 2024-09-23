@implementation THSearchRefTextLoadOperation

- (THSearchRefTextLoadOperation)initWithDelegate:(id)a3 documentRoot:(id)a4 searchArray:(id)a5
{
  THSearchRefTextLoadOperation *v8;
  THSearchRefTextLoadOperation *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)THSearchRefTextLoadOperation;
  v8 = -[THSearchRefTextLoadOperation init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->mDelegate = (THSearchRefTextLoadOperationDelegate *)a3;
    v8->mDocumentRoot = (THDocumentRoot *)a4;
    v8->mApplePubURL = (NSURL *)objc_msgSend(a4, "zipPackage");
    v9->mSearchRefTextEntry = (NSString *)objc_msgSend(objc_msgSend(a4, "properties"), "searchRefTextEntry");
    v9->mSearchArray = (NSArray *)a5;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THSearchRefTextLoadOperation;
  -[THSearchRefTextLoadOperation dealloc](&v3, "dealloc");
}

- (void)main
{
  THSearchRefTextLoadOperationDelegate *mDelegate;
  id v4;
  PFXArchive *v5;
  PFAISearchRefTextState *v6;

  mDelegate = self->mDelegate;
  objc_sync_enter(mDelegate);
  v4 = objc_alloc_init((Class)NSAutoreleasePool);
  v5 = -[PFXArchive initWithPath:]([PFXArchive alloc], "initWithPath:", -[NSURL path](self->mApplePubURL, "path"));
  if (!-[PFXArchive isValid](v5, "isValid"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSearchRefTextLoadOperation main]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THSearchRefTextLoadOperation.mm"), 57, CFSTR("Failed to load valid archive"));
  if (!-[PFXArchive isValid](v5, "isValid"))
  {
    v6 = 0;
LABEL_10:
    -[THSearchRefTextLoadOperationDelegate searchRefTextLoadOperationFailed:](self->mDelegate, "searchRefTextLoadOperationFailed:", self);
    goto LABEL_11;
  }
  v6 = -[PFAISearchRefTextState initWithEntry:searchArray:inArchive:documentRoot:]([PFAISearchRefTextState alloc], "initWithEntry:searchArray:inArchive:documentRoot:", self->mSearchRefTextEntry, self->mSearchArray, v5, self->mDocumentRoot);
  -[PFAISearchRefTextState setLoadDelegate:](v6, "setLoadDelegate:", self);
  if (!-[PFXXmlStreamReaderState streamAPI](v6, "streamAPI"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSearchRefTextLoadOperation main]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THSearchRefTextLoadOperation.mm"), 63, CFSTR("invalid nil value for '%s'"), "searchState.streamAPI");
  if (!-[PFXXmlStreamReaderState streamAPI](v6, "streamAPI")
    || !+[PFAISearchRefTextDocument processSearchRefTextWithState:](PFAISearchRefTextDocument, "processSearchRefTextWithState:", v6))
  {
    goto LABEL_10;
  }
LABEL_11:
  -[THSearchRefTextLoadOperationDelegate setSearchRefText:](self->mDelegate, "setSearchRefText:", -[PFAISearchRefTextState refTextForRIDs](v6, "refTextForRIDs"));

  objc_sync_exit(mDelegate);
}

@end
