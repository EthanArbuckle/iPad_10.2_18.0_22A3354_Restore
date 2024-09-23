@implementation THModelContentLoadOperation

- (THModelContentLoadOperation)initWithDelegate:(id)a3 contentNode:(id)a4 documentRoot:(id)a5 applePubURL:(id)a6 documentEntryURI:(id)a7
{
  THModelContentLoadOperation *v12;
  NSString *v13;
  BOOL v14;
  PFXArchive *v15;
  id v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)THModelContentLoadOperation;
  v12 = -[THModelContentLoadOperation init](&v18, "init");
  if (!v12)
    return v12;
  if (a5)
  {
    if (a6)
      goto LABEL_4;
LABEL_13:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation initWithDelegate:contentNode:documentRoot:applePubURL:documentEntryURI:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm"), 73, CFSTR("invalid nil value for '%s'"), "applePubURL");
    if (a7)
      goto LABEL_5;
LABEL_14:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation initWithDelegate:contentNode:documentRoot:applePubURL:documentEntryURI:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm"), 74, CFSTR("invalid nil value for '%s'"), "documentEntryURI");
    goto LABEL_5;
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation initWithDelegate:contentNode:documentRoot:applePubURL:documentEntryURI:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm"), 72, CFSTR("invalid nil value for '%s'"), "documentRoot");
  if (!a6)
    goto LABEL_13;
LABEL_4:
  if (!a7)
    goto LABEL_14;
LABEL_5:
  v12->_epub = objc_msgSend(CFSTR("epub"), "isEqualToString:", objc_msgSend(objc_msgSend(a6, "pathExtension"), "lowercaseString"));
  v12->_contentNode = (THModelContentNode *)a4;
  v12->mDelegate = (THModelContentLoadOperationDelegate *)a3;
  v12->mDocumentRoot = (THDocumentRoot *)a5;
  v12->mApplePubURL = (NSURL *)objc_msgSend(a6, "copy");
  v13 = (NSString *)objc_msgSend(a7, "copy");
  v12->mDocumentEntryURI = v13;
  if (v12->mApplePubURL)
    v14 = v13 == 0;
  else
    v14 = 1;
  if (v14
    || (v15 = -[PFXArchive initWithPath:]([PFXArchive alloc], "initWithPath:", -[NSURL path](v12->mApplePubURL, "path")), v16 = -[PFXArchive decryptEntryWithName:error:](v15, "decryptEntryWithName:error:", v12->mDocumentEntryURI, 0), v15, !v16))
  {

    return 0;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THModelContentLoadOperation;
  -[THModelContentLoadOperation dealloc](&v3, "dealloc");
}

- (void)appendMainThreadCompletionBlock:(id)a3
{
  NSMutableArray *mMainThreadCompletionBlocks;
  NSMutableArray *v6;
  _QWORD v7[6];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation appendMainThreadCompletionBlock:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm"), 116, CFSTR("This operation must only be performed on the main thread."));
  if (a3)
  {
    mMainThreadCompletionBlocks = self->mMainThreadCompletionBlocks;
    if (!mMainThreadCompletionBlocks)
    {
      self->mMainThreadCompletionBlocks = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      if (-[THModelContentLoadOperation completionBlock](self, "completionBlock"))
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation appendMainThreadCompletionBlock:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm"), 125, CFSTR("already have a completion block"));
      v6 = self->mMainThreadCompletionBlocks;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1BBB54;
      v7[3] = &unk_426E28;
      v7[4] = self;
      v7[5] = v6;
      -[THModelContentLoadOperation setCompletionBlock:](self, "setCompletionBlock:", v7);
      mMainThreadCompletionBlocks = self->mMainThreadCompletionBlocks;
    }
    -[NSMutableArray addObject:](mMainThreadCompletionBlocks, "addObject:", objc_msgSend(a3, "copy"));
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation appendMainThreadCompletionBlock:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm"), 117, CFSTR("invalid nil value for '%s'"), "block");
  }
}

- (void)loadContentNode
{
  id v3;
  PFXArchive *v4;
  id v5;
  id v6;
  PFAIContentState *v7;
  unsigned int v8;
  id v9;
  PFAIDocOrientationState *v10;
  PFAIDocOrientationState *v11;
  TSUNoCopyDictionary *v12;
  TSUNoCopyDictionary *v13;
  TSUNoCopyDictionary *v14;
  TSUNoCopyDictionary *v15;

  v3 = objc_alloc_init((Class)NSAutoreleasePool);
  v4 = -[PFXArchive initWithPath:]([PFXArchive alloc], "initWithPath:", -[NSURL path](self->mApplePubURL, "path"));
  -[PFXArchive setAsset:](v4, "setAsset:", -[THBookDescription asset](-[THDocumentRoot bookDescription](self->mDocumentRoot, "bookDescription"), "asset"));
  if (!-[PFXArchive isValid](v4, "isValid"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation loadContentNode]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm"), 167, CFSTR("Failed to load valid archive"));
  if (-[PFXArchive isValid](v4, "isValid"))
  {
    v5 = -[THModelContentLoadOperation newNodeBodyWithContext:isFlow:](self, "newNodeBodyWithContext:isFlow:", -[THDocumentRoot context](self->mDocumentRoot, "context"), 1);
    v6 = -[THModelContentLoadOperation newNodeBodyWithContext:isFlow:](self, "newNodeBodyWithContext:isFlow:", -[THDocumentRoot context](self->mDocumentRoot, "context"), 0);
    v7 = -[PFAIContentState initWithDocumentRoot:contentNode:flowNodeBody:paginatedNodeBody:archive:documentEntryUri:]([PFAIContentState alloc], "initWithDocumentRoot:contentNode:flowNodeBody:paginatedNodeBody:archive:documentEntryUri:", self->mDocumentRoot, -[THModelContentLoadOperation contentNode](self, "contentNode"), v5, v6, v4, self->mDocumentEntryURI);
    -[PFXHtmlReaderState setNodeGUID:](v7, "setNodeGUID:", -[THModelNode nodeGUID](-[THModelContentLoadOperation contentNode](self, "contentNode"), "nodeGUID"));

    -[PFXHtmlReaderState setPageContentWidth:](v7, "setPageContentWidth:", 600.0);
    if (!-[PFXXmlStreamReaderState streamAPI](v7, "streamAPI"))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation loadContentNode]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm"), 188, CFSTR("invalid nil value for '%s'"), "contentState.streamAPI");
    if (-[PFXXmlStreamReaderState streamAPI](v7, "streamAPI"))
    {
      -[PFXHtmlReaderState setLoadDelegate:](v7, "setLoadDelegate:", self);
      v8 = +[PFAIContentDocument readWithState:](PFAIContentDocument, "readWithState:", v7);
      -[PFXHtmlReaderState setLoadDelegate:](v7, "setLoadDelegate:", 0);
    }
    else
    {
      v8 = 0;
    }
    -[THModelContentLoadOperation p_processHintsWithContentState:](self, "p_processHintsWithContentState:", v7);
    if (v8)
    {
      v9 = objc_alloc_init((Class)TSUNoCopyDictionary);
      v10 = -[PFAIContentState paginatedState](v7, "paginatedState");
      if (-[PFAIDocOrientationState contentNodeBody](v10, "contentNodeBody")
        && -[PFAIDocOrientationState presentationType](v10, "presentationType"))
      {
        objc_msgSend(v9, "setObject:forUncopiedKey:", -[PFAIDocOrientationState contentNodeBody](v10, "contentNodeBody"), -[PFAIDocOrientationState presentationType](v10, "presentationType"));
      }
      v11 = -[PFAIContentState flowState](v7, "flowState");
      if (-[PFAIDocOrientationState contentNodeBody](v11, "contentNodeBody")
        && -[PFAIDocOrientationState presentationType](v11, "presentationType"))
      {
        objc_msgSend(v9, "setObject:forUncopiedKey:", -[PFAIDocOrientationState contentNodeBody](v11, "contentNodeBody"), -[PFAIDocOrientationState presentationType](v11, "presentationType"));
      }
      v12 = -[PFXHtmlReaderState storageAnchorsForAnchorID](v7, "storageAnchorsForAnchorID");
      objc_msgSend(v9, "setObject:forKey:", v12, kTHModelStorageAnchorsForAnchorID);
      v13 = -[PFXHtmlReaderState storageAnchorsForCfiFrag](v7, "storageAnchorsForCfiFrag");
      objc_msgSend(v9, "setObject:forKey:", v13, kTHModelStorageAnchorsForCfiFrag);
      v14 = -[PFXHtmlReaderState textChildOffsetStorageAnchorsForCfiFrag](v7, "textChildOffsetStorageAnchorsForCfiFrag");
      objc_msgSend(v9, "setObject:forKey:", v14, kTHModelTextChildOffsetStorageAnchorsForCfiFrag);
      v15 = -[PFXHtmlReaderState anchorForCfiFrag](v7, "anchorForCfiFrag");
      objc_msgSend(v9, "setObject:forKey:", v15, kTHModelAnchorForCfiFrag);
      -[THModelContentLoadOperationDelegate contentLoadOperation:loadedContentBodies:](self->mDelegate, "contentLoadOperation:loadedContentBodies:", self, v9);

      goto LABEL_20;
    }
  }
  else
  {
    v7 = 0;
  }
  if ((-[THModelContentLoadOperation isCancelled](self, "isCancelled") & 1) == 0)
    -[THModelContentLoadOperationDelegate contentLoadOperationFailed:](self->mDelegate, "contentLoadOperationFailed:", self);
LABEL_20:

}

- (void)loadNavigationPageContentNode
{
  id v3;
  PFXArchive *v4;
  id v5;
  NSArray *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  THModelContentNode *v11;
  PFAITocConfigState *v12;
  unsigned __int8 v13;
  id v14;
  THModelContentNodeBody *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = objc_alloc_init((Class)NSAutoreleasePool);
  v4 = -[PFXArchive initWithPath:]([PFXArchive alloc], "initWithPath:", -[NSURL path](self->mApplePubURL, "path"));
  -[PFXArchive setAsset:](v4, "setAsset:", -[THBookDescription asset](-[THDocumentRoot bookDescription](self->mDocumentRoot, "bookDescription"), "asset"));
  if (!-[PFXArchive isValid](v4, "isValid"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation loadNavigationPageContentNode]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm"), 253, CFSTR("Failed to load valid archive"));
  if (!-[PFXArchive isValid](v4, "isValid"))
  {
    v12 = 0;
LABEL_23:
    -[THModelContentLoadOperationDelegate contentLoadOperationFailed:](self->mDelegate, "contentLoadOperationFailed:", self);
    goto LABEL_24;
  }
  v5 = -[THModelContentLoadOperation newNodeBodyWithContext:isFlow:](self, "newNodeBodyWithContext:isFlow:", -[THDocumentRoot context](self->mDocumentRoot, "context"), 0);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = -[THTOCModel tiles](-[THDocumentRoot tocModel](self->mDocumentRoot, "tocModel"), "tiles");
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v16 = v3;
    v8 = *(_QWORD *)v18;
LABEL_6:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
      v11 = (THModelContentNode *)objc_msgSend(v10, "browserPageNode");
      if (v11 == -[THModelContentLoadOperation contentNode](self, "contentNode"))
        break;
      if (v7 == (id)++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          goto LABEL_6;
        v10 = 0;
        break;
      }
    }
    v3 = v16;
  }
  else
  {
    v10 = 0;
  }
  v12 = -[PFAITocConfigState initWithDocumentRoot:nodeBody:tocTile:archive:documentEntryUri:]([PFAITocConfigState alloc], "initWithDocumentRoot:nodeBody:tocTile:archive:documentEntryUri:", self->mDocumentRoot, v5, v10, v4, self->mDocumentEntryURI);
  -[PFAITocConfigState setNodeGUID:](v12, "setNodeGUID:", -[THModelNode nodeGUID](-[THModelContentLoadOperation contentNode](self, "contentNode"), "nodeGUID"));

  if (!-[PFXXmlStreamReaderState streamAPI](v12, "streamAPI"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation loadNavigationPageContentNode]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm"), 279, CFSTR("invalid nil value for '%s'"), "tocState.streamAPI");
  if (!-[PFXXmlStreamReaderState streamAPI](v12, "streamAPI"))
    goto LABEL_23;
  -[PFAITocConfigState setLoadDelegate:](v12, "setLoadDelegate:", self);
  v13 = +[PFAITocConfig readWithState:](PFAITocConfig, "readWithState:", v12);
  -[PFAITocConfigState setLoadDelegate:](v12, "setLoadDelegate:", 0);
  if ((v13 & 1) == 0)
    goto LABEL_23;
  v14 = objc_alloc_init((Class)TSUNoCopyDictionary);
  v15 = -[PFAITocConfigState thNodeBody](v12, "thNodeBody");
  if (v15)
    objc_msgSend(v14, "setObject:forUncopiedKey:", v15, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THDocumentRoot context](self->mDocumentRoot, "context")));
  -[THModelContentLoadOperationDelegate contentLoadOperation:loadedContentBodies:](self->mDelegate, "contentLoadOperation:loadedContentBodies:", self, v14);

LABEL_24:
}

- (void)loadEpubContentNode
{
  void *v3;
  PFXArchive *v4;
  id v5;
  PFEIReaderState *v6;
  id v7;
  PFAIDocOrientationState *v8;
  TSUNoCopyDictionary *v9;
  TSUNoCopyDictionary *v10;
  TSUNoCopyDictionary *v11;
  TSUNoCopyDictionary *v12;

  v3 = objc_autoreleasePoolPush();
  v4 = -[PFXArchive initWithPath:]([PFXArchive alloc], "initWithPath:", -[NSURL path](self->mApplePubURL, "path"));
  -[PFXArchive setAsset:](v4, "setAsset:", -[THBookDescription asset](-[THDocumentRoot bookDescription](self->mDocumentRoot, "bookDescription"), "asset"));
  if (!-[PFXArchive isValid](v4, "isValid"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation loadEpubContentNode]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm"), 331, CFSTR("Failed to load valid archive"));
  if (!-[PFXArchive isValid](v4, "isValid")
    || (-[THModelContentLoadOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
    v5 = 0;
    v6 = 0;
LABEL_12:
    -[THModelContentLoadOperationDelegate contentLoadOperationFailed:](self->mDelegate, "contentLoadOperationFailed:", self);
    goto LABEL_13;
  }
  v5 = -[THModelContentLoadOperation newNodeBodyWithContext:isFlow:](self, "newNodeBodyWithContext:isFlow:", -[THDocumentRoot context](self->mDocumentRoot, "context"), 1);
  v6 = -[PFEIReaderState initWithDocumentRoot:contentNode:flowNodeBody:archive:documentEntryUri:]([PFEIReaderState alloc], "initWithDocumentRoot:contentNode:flowNodeBody:archive:documentEntryUri:", self->mDocumentRoot, -[THModelContentLoadOperation contentNode](self, "contentNode"), v5, v4, self->mDocumentEntryURI);
  -[PFXHtmlReaderState setNodeGUID:](v6, "setNodeGUID:", -[THModelNode nodeGUID](-[THModelContentLoadOperation contentNode](self, "contentNode"), "nodeGUID"));
  -[PFXHtmlReaderState setPageContentWidth:](v6, "setPageContentWidth:", 600.0);
  if (!-[PFXXmlStreamReaderState streamAPI](v6, "streamAPI"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation loadEpubContentNode]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm"), 347, CFSTR("invalid nil value for '%s'"), "readerSate.streamAPI");
  if (!-[PFXXmlStreamReaderState streamAPI](v6, "streamAPI"))
    goto LABEL_12;
  if ((-[THModelContentLoadOperation isCancelled](self, "isCancelled") & 1) != 0)
    goto LABEL_12;
  -[PFXHtmlReaderState setLoadDelegate:](v6, "setLoadDelegate:", self);
  if (!+[PFEIContentDocument readWithState:](PFEIContentDocument, "readWithState:", v6)
    || (-[THModelContentLoadOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
    goto LABEL_12;
  }
  v7 = objc_alloc_init((Class)TSUNoCopyDictionary);
  v8 = -[PFEIReaderState orientationState](v6, "orientationState");
  if (-[PFAIDocOrientationState contentNodeBody](v8, "contentNodeBody")
    && -[PFAIDocOrientationState presentationType](v8, "presentationType"))
  {
    objc_msgSend(v7, "setObject:forUncopiedKey:", -[PFAIDocOrientationState contentNodeBody](v8, "contentNodeBody"), -[PFAIDocOrientationState presentationType](v8, "presentationType"));
  }
  v9 = -[PFXHtmlReaderState storageAnchorsForAnchorID](v6, "storageAnchorsForAnchorID");
  objc_msgSend(v7, "setObject:forKey:", v9, kTHModelStorageAnchorsForAnchorID);
  v10 = -[PFXHtmlReaderState storageAnchorsForCfiFrag](v6, "storageAnchorsForCfiFrag");
  objc_msgSend(v7, "setObject:forKey:", v10, kTHModelStorageAnchorsForCfiFrag);
  v11 = -[PFXHtmlReaderState textChildOffsetStorageAnchorsForCfiFrag](v6, "textChildOffsetStorageAnchorsForCfiFrag");
  objc_msgSend(v7, "setObject:forKey:", v11, kTHModelTextChildOffsetStorageAnchorsForCfiFrag);
  v12 = -[PFXHtmlReaderState anchorForCfiFrag](v6, "anchorForCfiFrag");
  objc_msgSend(v7, "setObject:forKey:", v12, kTHModelAnchorForCfiFrag);
  -[THModelContentLoadOperationDelegate contentLoadOperation:loadedContentBodies:](self->mDelegate, "contentLoadOperation:loadedContentBodies:", self, v7);

LABEL_13:
  -[PFXHtmlReaderState setLoadDelegate:](v6, "setLoadDelegate:", 0);

  objc_autoreleasePoolPop(v3);
}

- (void)main
{
  void *v3;

  v3 = objc_autoreleasePoolPush();
  if ((-[THModelContentLoadOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    if (-[THModelContentLoadOperation isEpub](self, "isEpub"))
    {
      -[THModelContentLoadOperation loadEpubContentNode](self, "loadEpubContentNode");
    }
    else if (-[THModelContentLoadOperationDelegate navigationPageNode](self->mDelegate, "navigationPageNode"))
    {
      -[THModelContentLoadOperation loadNavigationPageContentNode](self, "loadNavigationPageContentNode");
    }
    else
    {
      -[THModelContentLoadOperation loadContentNode](self, "loadContentNode");
    }
  }
  objc_autoreleasePoolPop(v3);
}

- (void)processHintsInOrientation:(id)a3 contentState:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  id v18;
  id v19;
  char *v20;
  char *v21;
  char *v22;
  id obj;
  uint64_t v24;
  id v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];

  if (objc_msgSend(a3, "hasHints"))
  {
    v6 = objc_msgSend(a3, "contentNodeBody");
    v7 = -[THDocumentRoot context](self->mDocumentRoot, "context");
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = objc_msgSend(v6, "pages");
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v25)
    {
      v8 = 0;
      v9 = 0;
      v24 = *(_QWORD *)v32;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(obj);
          v26 = v10;
          v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v12 = objc_msgSend(v11, "modelBodyInfos");
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v28;
            do
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(_QWORD *)v28 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
                if (!objc_msgSend(v17, "lineHints"))
                {
                  v18 = objc_msgSend(objc_alloc((Class)TSWPLineHintCollection), "initForEmptyShapeWithPreviousRange:context:", v9, v8, v7);
                  objc_msgSend(v17, "setLineHints:", v18);

                }
                v19 = objc_msgSend(v17, "lineHints");
                v20 = (char *)objc_msgSend(v19, "hints");
                if (v20)
                {
                  v21 = v20;
                  if (objc_msgSend(v19, "hintsCount"))
                  {
                    v22 = &v21[56 * (_QWORD)objc_msgSend(v19, "hintsCount")];
                    v9 = *((_QWORD *)v22 - 3);
                    v8 = *((_QWORD *)v22 - 2);
                  }
                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            }
            while (v14);
          }
          v10 = v26 + 1;
        }
        while ((id)(v26 + 1) != v25);
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v25);
    }
  }
}

- (void)p_processHintsWithContentState:(id)a3
{
  id v5;
  char *v6;

  v5 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "paginatedState"), "contentNodeBody"), "bodyStorage");
  v6 = (char *)objc_msgSend(v5, "length");
  objc_msgSend(a3, "processHints");
  -[THModelContentLoadOperation processHintsInOrientation:contentState:](self, "processHintsInOrientation:contentState:", objc_msgSend(a3, "paginatedState"), a3);
  -[THModelContentLoadOperation processHintsInOrientation:contentState:](self, "processHintsInOrientation:contentState:", objc_msgSend(a3, "flowState"), a3);
  if (v6 != objc_msgSend(v5, "length"))
  {
    if (v6 != (char *)objc_msgSend(v5, "length") + 1)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentLoadOperation p_processHintsWithContentState:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THModelContentLoadOperation.mm"), 486, CFSTR("expected equality between %s and %s"), "paginatedBodyInitialLength", "paginatedBodyStorage.length + 1");
    if (v6 == (char *)objc_msgSend(v5, "length") + 1)
      -[THModelContentLoadOperation p_fixPageCharacterRangeAfterStorageTruncationWithContentState:](self, "p_fixPageCharacterRangeAfterStorageTruncationWithContentState:", a3);
  }
}

- (void)p_fixPageCharacterRangeAfterStorageTruncationWithContentState:(id)a3
{
  id v3;
  id v4;

  v3 = objc_msgSend(objc_msgSend(a3, "paginatedState"), "contentNodeBody");
  v4 = objc_msgSend(v3, "pages");
  if (objc_msgSend(v4, "count"))
    objc_msgSend(objc_msgSend(v4, "lastObject"), "setPageEndCharIndex:", objc_msgSend(objc_msgSend(v3, "bodyStorage"), "length"));
}

- (id)newNodeBodyWithContext:(id)a3 isFlow:(BOOL)a4
{
  _BOOL8 v4;
  THModelContentNodeBody *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  THWPStorage *v12;

  v4 = a4;
  v7 = -[THModelContentNodeBody initWithContext:]([THModelContentNodeBody alloc], "initWithContext:", a3);
  v8 = objc_msgSend(objc_alloc((Class)TSSStylesheet), "initWithContext:canCullStyles:", a3, 0);
  -[THModelContentNodeBody setStylesheet:](v7, "setStylesheet:", v8);
  objc_msgSend(v8, "setParent:", -[THDocumentRoot stylesheet](self->mDocumentRoot, "stylesheet"));

  v9 = +[TSWPParagraphStyle defaultStyleWithContext:](TSWPParagraphStyle, "defaultStyleWithContext:", a3);
  -[THModelContentLoadOperation p_populateParagraphStyle:](self, "p_populateParagraphStyle:", v9);
  objc_msgSend(v8, "addStyle:withIdentifier:", v9, kTSWPDefaultContentParagraphStyleIdentifier);
  v10 = +[TSWPListStyle defaultStyleWithContext:](TSWPListStyle, "defaultStyleWithContext:", a3);
  objc_msgSend(v8, "addStyle:withIdentifier:", v10, TSWPDefaultListStyleIdentifier);
  v11 = +[TSWPColumnStyle defaultStyleWithContext:](TSWPColumnStyle, "defaultStyleWithContext:", a3);
  objc_msgSend(v8, "addStyle:", v11);
  v12 = -[THWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:]([THWPStorage alloc], "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:", a3, 0, 0, v8, v9, v10, 0, v11);
  -[THWPStorage setUsesApplicationFontScaling:](v12, "setUsesApplicationFontScaling:", v4);
  -[THModelContentNodeBody setBodyStorage:](v7, "setBodyStorage:", v12);

  return v7;
}

- (void)p_populateParagraphStyle:(id)a3
{
  NSString *v5;
  const __CFString *v6;
  _QWORD v7[5];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1BD2D0;
  v7[3] = &unk_427480;
  v7[4] = a3;
  objc_msgSend(+[TSWPParagraphStyle paragraphProperties](TSWPParagraphStyle, "paragraphProperties"), "enumeratePropertiesUsingBlock:", v7);
  v5 = -[THBookDescription language](-[THDocumentRoot bookDescription](self->mDocumentRoot, "bookDescription"), "language");
  if (v5)
    v6 = (const __CFString *)v5;
  else
    v6 = CFSTR("en");
  objc_msgSend(a3, "setBoxedValue:forProperty:", v6, 39);
}

- (THModelContentLoadOperationDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THModelContentLoadOperationDelegate *)a3;
}

- (THModelContentNode)contentNode
{
  return self->_contentNode;
}

- (void)setContentNode:(id)a3
{
  self->_contentNode = (THModelContentNode *)a3;
}

- (BOOL)isEpub
{
  return self->_epub;
}

- (void)setEpub:(BOOL)a3
{
  self->_epub = a3;
}

@end
