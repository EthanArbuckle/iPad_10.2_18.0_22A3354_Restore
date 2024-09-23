@implementation CRLPasteboardItemSource

- (CRLPasteboardItemSource)initWithPasteboard:(id)a3 pasteboardController:(id)a4
{
  id v7;
  id v8;
  CRLPasteboardItemSource *v9;
  CRLPasteboardItemSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLPasteboardItemSource;
  v9 = -[CRLPasteboardItemSource init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_pbController, v8);
    objc_storeStrong((id *)&v10->_pasteboard, a3);
  }

  return v10;
}

- (CRLPasteboardItemSource)init
{
  unsigned int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  unsigned int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v2 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101261E38);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLPasteboardItemSource init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPasteboardItemSource.m";
    v17 = 1024;
    v18 = 48;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101261E58);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v12 = v2;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardItemSource init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPasteboardItemSource.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 48, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLPasteboardItemSource init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (unint64_t)itemCount
{
  return -[CRLPasteboard numberOfItems](self->_pasteboard, "numberOfItems");
}

- (BOOL)canLoadItemsOfClass:(Class)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  LOBYTE(a3) = objc_msgSend(v4, "canLoadItemsOfClass:", a3);

  return (char)a3;
}

- (unint64_t)preferredImportableDataTypeDetectingImportableURLsInText:(BOOL)a3 skipFileURLs:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v9 = objc_msgSend(v7, "preferredImportableDataTypeOnPasteboard:detectImportableURLsInText:skipFileURLs:", v8, v5, v4);

  return (unint64_t)v9;
}

- (unint64_t)preferredImportableDataTypeDetectingImportableURLsInText:(BOOL)a3
{
  return -[CRLPasteboardItemSource preferredImportableDataTypeDetectingImportableURLsInText:skipFileURLs:](self, "preferredImportableDataTypeDetectingImportableURLsInText:skipFileURLs:", a3, 0);
}

- (BOOL)hasImportableImages
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v5 = objc_msgSend(v3, "hasImportableImagesOnPasteboard:skipFileURLs:", v4, 0);

  return v5;
}

- (BOOL)hasImportableBoardItemsDetectingImportableURLsInText:(BOOL)a3 skipFileURLs:(BOOL)a4
{
  uint64_t v4;
  _BOOL8 v5;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  LOBYTE(v4) = objc_msgSend(v7, "hasImportableBoardItemsOnPasteboard:detectImportableURLsInText:skipFileURLs:", v8, v5, v4);

  return v4;
}

- (BOOL)hasImportableBoardItemsDetectingImportableURLsInText:(BOOL)a3
{
  return -[CRLPasteboardItemSource hasImportableBoardItemsDetectingImportableURLsInText:skipFileURLs:](self, "hasImportableBoardItemsDetectingImportableURLsInText:skipFileURLs:", a3, 0);
}

- (BOOL)hasImportableText
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v5 = objc_msgSend(v3, "hasImportablePlainTextOnPasteboard:", v4);

  return v5;
}

- (BOOL)hasImportableRichText
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v5 = objc_msgSend(v3, "hasImportableRichTextOnPasteboard:", v4);

  return v5;
}

- (id)loadImportedRichTextStringWithHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v9;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v9 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "importedRichTextStringFromPasteboard:smartPaste:", v6, &v9));

  if (v4)
    v4[2](v4, v7, v9);

  return 0;
}

- (id)loadImportedTextStringWithHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v9;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v9 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "importedTextStringFromPasteboard:smartPaste:", v6, &v9));

  if (v4)
    v4[2](v4, v7, v9);

  return 0;
}

- (BOOL)hasNativeTypes
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v5 = objc_msgSend(v3, "hasNativeTypesOnPasteboard:", v4);

  return v5;
}

- (BOOL)hasNativeBoardItems
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v5 = objc_msgSend(v3, "hasNativeBoardItemsOnPasteboard:", v4);

  return v5;
}

- (BOOL)canProduceBoardItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));

  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261E78);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3A858();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261E98);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardItemSource canProduceBoardItems]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPasteboardItemSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 139, 0, "invalid nil value for '%{public}s'", "self.pasteboardController");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v9 = objc_msgSend(v7, "canProduceBoardItemsFromPasteboard:", v8);

  return v9;
}

- (BOOL)hasSingleNativeImageBoardItem
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v5 = objc_msgSend(v3, "hasSingleNativeImageBoardItemOnPasteboard:", v4);

  return v5;
}

- (BOOL)hasSingleNativeMovieBoardItem
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v5 = objc_msgSend(v3, "hasSingleNativeMovieBoardItemOnPasteboard:", v4);

  return v5;
}

- (BOOL)hasOnlyNativeFreehandDrawingBoardItems
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v5 = objc_msgSend(v3, "hasOnlyNativeFreehandDrawingBoardItemsOnPasteboard:", v4);

  return v5;
}

- (BOOL)hasNativeFreehandDrawingBoardItems
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v5 = objc_msgSend(v3, "hasNativeFreehandDrawingBoardItemsOnPasteboard:", v4);

  return v5;
}

- (BOOL)hasOnlyNativeTextBoxItems
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v5 = objc_msgSend(v3, "hasOnlyNativeTextBoxItemsOnPasteboard:", v4);

  return v5;
}

- (BOOL)hasNativeTextStorages
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v5 = objc_msgSend(v3, "hasTextStoragesOnPasteboard:", v4);

  return v5;
}

- (BOOL)hasNativeText
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v5 = objc_msgSend(v3, "hasNativeTextOnPasteboard:", v4);

  return v5;
}

- (BOOL)hasNativeBoardItemsContainingText
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v5 = objc_msgSend(v3, "hasNativeBoardItemsContainingTextOnPasteboard:", v4);

  return v5;
}

- (id)loadTextStorageUsingBoardItemFactory:(id)a3 forTargetContext:(id)a4 targetStorage:(id)a5 loadHandler:(id)a6
{
  void (**v8)(id, void *, _QWORD);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v14;

  v8 = (void (**)(id, void *, _QWORD))a6;
  v14 = 0;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textStorageFromPasteboard:forTargetStorage:smartPaste:", v11, v9, &v14));

  if (v8)
    v8[2](v8, v12, v14);

  return 0;
}

- (id)loadProvidersForNativeBoardItemsWithBoardItemFactory:(id)a3 loadHandler:(id)a4
{
  void (**v5)(id, void *, void *);
  void *v6;
  void *v7;
  void *v8;

  v5 = (void (**)(id, void *, void *))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "providersForBoardItemsFromPasteboard:", v7));

  if (v5)
    v5[2](v5, v8, &__NSArray0__struct);

  return 0;
}

- (id)loadProvidersForImportedBoardItemsUsingBoardItemFactory:(id)a3 WithLoadHandler:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;

  v5 = (void (**)(id, void *))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "providersForBoardItemsImportedFromPasteboard:", v7));

  if (v5)
    v5[2](v5, v8);

  return 0;
}

- (id)loadProvidersForImportedBoardItemsUsingBoardItemFactory:(id)a3 maximumStringLength:(unint64_t)a4 WithLoadHandler:(id)a5
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;

  v6 = (void (**)(id, void *))a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboardController](self, "pasteboardController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardItemSource pasteboard](self, "pasteboard"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "providersForBoardItemsImportedFromPasteboard:", v8));

  if (v6)
    v6[2](v6, v9);

  return 0;
}

- (id)loadImportedImagesForAssetOwner:(id)a3 compatibilityAlertPresenter:(id)a4 withHandler:(id)a5
{
  CFArrayRef (__cdecl **v8)(CTFontDescriptorRef, CFSetRef);
  void *v9;
  void *v10;
  void *v11;
  dispatch_group_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  UTType *v20;
  _UNKNOWN **v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  UTType *v30;
  void *v31;
  CRLImageFillProvider *v32;
  CRLImageFillProvider *v33;
  CRLImageFillProvider *v34;
  CRLImageFillProvider *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  dispatch_queue_global_t global_queue;
  NSObject *v41;
  id v42;
  id v43;
  id v44;
  id v46;
  void *v47;
  id v48;
  id v49;
  _QWORD *v50;
  dispatch_group_t group;
  id v52;
  id v53;
  uint64_t v54;
  CRLPasteboardItemSource *v55;
  uint64_t v56;
  id v57;
  void *v58;
  id obj;
  _QWORD block[4];
  id v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[4];
  id v69;
  id v70;
  dispatch_group_t v71;
  _BYTE v72[128];

  v53 = a3;
  v52 = a4;
  v49 = a5;
  v8 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261EB8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3A97C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261ED8);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardItemSource loadImportedImagesForAssetOwner:compatibilityAlertPresenter:withHandler:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPasteboardItemSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 232, 0, "This operation must only be performed on the main thread.");

  }
  v56 = objc_claimAutoreleasedReturnValue(+[CRLIngestionTypes supportedImageTypes](CRLIngestionTypes, "supportedImageTypes"));
  v12 = dispatch_group_create();
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_10049D224;
  v68[3] = &unk_101261F40;
  v48 = v13;
  v69 = v48;
  v46 = v14;
  v70 = v46;
  group = v12;
  v71 = group;
  v50 = objc_retainBlock(v68);
  if ((id)-[CRLPasteboard numberOfItems](self->_pasteboard, "numberOfItems") != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261F60);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3A8F8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261F80);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardItemSource loadImportedImagesForAssetOwner:compatibilityAlertPresenter:withHandler:]", v46));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPasteboardItemSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 255, 0, "More than one item detected on the pasteboard for image fill. Currently only single items are supported.");

  }
  v18 = (void *)v56;
  if (-[CRLPasteboard numberOfItems](self->_pasteboard, "numberOfItems", v46) >= 1)
  {
    v19 = 0;
    v20 = UTTypeURL;
    v21 = RPTTestRunner_ptr;
    v55 = self;
    do
    {
      v54 = v19;
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v19));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboard pasteboardTypesForItemSet:](self->_pasteboard, "pasteboardTypesForItemSet:"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));

      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      obj = v23;
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v65;
        while (2)
        {
          v27 = 0;
          v57 = v25;
          do
          {
            if (*(_QWORD *)v65 != v26)
              objc_enumerationMutation(obj);
            v28 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21[145], "typeWithIdentifier:", v28));
            if (objc_msgSend(v28, "crl_conformsToAnyUTI:", v18))
            {
              dispatch_group_enter(group);
              v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboard dataForPasteboardType:inItemSet:](self->_pasteboard, "dataForPasteboardType:inItemSet:", v28, v58));
              v35 = (CRLImageFillProvider *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "firstObject"));

              v32 = -[CRLImageFillProvider initWithData:type:]([CRLImageFillProvider alloc], "initWithData:type:", v35, v28);
              -[CRLImageFillProvider provideImageDataForAssetOwner:compatibilityAlertPresenter:completionHandler:](v32, "provideImageDataForAssetOwner:compatibilityAlertPresenter:completionHandler:", v53, v52, v50);
LABEL_44:

              goto LABEL_45;
            }
            if (objc_msgSend(v29, "conformsToType:", v20))
            {
              v30 = v20;
              v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboard dataForPasteboardType:inItemSet:](self->_pasteboard, "dataForPasteboardType:inItemSet:", v28, v58));
              v32 = (CRLImageFillProvider *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "firstObject"));

              if (v32)
              {
                v33 = (CRLImageFillProvider *)objc_msgSend(objc_alloc((Class)v8[444]), "initWithData:encoding:", v32, 4);
                if (v33)
                {
                  v34 = (CRLImageFillProvider *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v33));
                  if (v34)
                  {
                    v35 = v34;
                    if (-[CRLImageFillProvider isFileURL](v34, "isFileURL"))
                      v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageFillProvider crl_fileTypeIdentifierHandlingFileCoordinationPromises](v35, "crl_fileTypeIdentifierHandlingFileCoordinationPromises"));
                    else
                      v36 = 0;
                    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "identifier"));
                    v38 = objc_msgSend(v37, "crl_conformsToAnyUTI:", v56);

                    if (v38)
                    {
                      dispatch_group_enter(group);
                      +[CRLImageFillProvider makeCompatibleImageFillDataFromURL:forAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:](CRLImageFillProvider, "makeCompatibleImageFillDataFromURL:forAssetOwner:modalOperationPresenter:compatibilityAlertPresenter:completionHandler:", v35, v53, v52, v52, v50);

                      self = v55;
                      v18 = (void *)v56;
                      v8 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
                      v20 = v30;
                      v21 = RPTTestRunner_ptr;
                      goto LABEL_44;
                    }

                    v33 = v32;
                    v32 = v35;
                    self = v55;
                    v18 = (void *)v56;
                    v8 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
                  }
                }
              }
              else
              {
                v33 = 0;
              }

              v20 = v30;
              v21 = RPTTestRunner_ptr;
              v25 = v57;
            }

            v27 = (char *)v27 + 1;
          }
          while (v25 != v27);
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
          if (v25)
            continue;
          break;
        }
      }
LABEL_45:

      v19 = v54 + 1;
    }
    while (v54 + 1 < -[CRLPasteboard numberOfItems](self->_pasteboard, "numberOfItems"));
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v41 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10049D484;
  block[3] = &unk_101239130;
  v61 = v48;
  v62 = v47;
  v63 = v49;
  v42 = v47;
  v43 = v48;
  v44 = v49;
  dispatch_group_notify(group, v41, block);

  return 0;
}

- (CRLPasteboard)pasteboard
{
  return self->_pasteboard;
}

- (CRLPasteboardController)pasteboardController
{
  return (CRLPasteboardController *)objc_loadWeakRetained((id *)&self->_pbController);
}

- (id)cancellationHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setCancellationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_storeStrong((id *)&self->_pasteboard, 0);
  objc_destroyWeak((id *)&self->_pbController);
}

@end
