@implementation CRLStyleMappingBoardItemProvider

- (CRLStyleMappingBoardItemProvider)initWithIngestibleBoardItem:(id)a3
{
  id v5;
  CRLStyleMappingBoardItemProvider *v6;
  CRLStyleMappingBoardItemProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLStyleMappingBoardItemProvider;
  v6 = -[CRLStyleMappingBoardItemProvider init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ingestibleItemDrawable, a3);

  return v7;
}

- (CRLStyleMappingBoardItemProvider)init
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
    dispatch_once(&qword_10147E370, &stru_101238430);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLStyleMappingBoardItemProvider init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLStyleMappingBoardItemProvider.m";
    v17 = 1024;
    v18 = 27;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101238450);
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStyleMappingBoardItemProvider init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLStyleMappingBoardItemProvider.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 27, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLStyleMappingBoardItemProvider init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (id)newBoardItemWithFactory:(id)a3 bakedSize:(BOOL)a4
{
  return (id)objc_claimAutoreleasedReturnValue(-[CRLIngestibleBoardItemAndDescription boardItem](self->_ingestibleItemDrawable, "boardItem", a3, a4));
}

- (NSDictionary)pasteboardDescription
{
  return -[CRLIngestibleBoardItemAndDescription ingestibleDescription](self->_ingestibleItemDrawable, "ingestibleDescription");
}

- (id)imageData
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLIngestibleBoardItemAndDescription boardItem](self->_ingestibleItemDrawable, "boardItem"));
  v9 = sub_100221DDC(v2, 1, v3, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLPasteboardImageDataProvider);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageData"));
  return v11;
}

- (id)thumbnailImageData
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLIngestibleBoardItemAndDescription boardItem](self->_ingestibleItemDrawable, "boardItem"));
  v9 = sub_100221DDC(v2, 1, v3, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLPasteboardImageDataProvider);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "thumbnailImageData"));
  return v11;
}

- (void)provideBoardItemWithFactory:(id)a3 completionHandler:(id)a4
{
  _TtC8Freeform12CRLBoardItem *v6;
  _TtC8Freeform12CRLBoardItem *boardItem;
  void *v8;
  id v9;

  v9 = a4;
  v6 = -[CRLStyleMappingBoardItemProvider newBoardItemWithFactory:bakedSize:](self, "newBoardItemWithFactory:bakedSize:", a3, 0);
  boardItem = self->_boardItem;
  self->_boardItem = v6;

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    v8 = v9;
  }

}

- (_TtC8Freeform12CRLBoardItem)boardItem
{
  return self->_boardItem;
}

- (NSError)error
{
  return self->error;
}

- (CRLProgress)progress
{
  return self->progress;
}

- (unint64_t)uploadDataLength
{
  return self->uploadDataLength;
}

- (unint64_t)embeddedDataLength
{
  return self->embeddedDataLength;
}

- (CRLIngestibleItemImportableBoardItemProviderDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (CRLIngestibleItemImportableBoardItemProviderDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->progress, 0);
  objc_storeStrong((id *)&self->error, 0);
  objc_storeStrong((id *)&self->_boardItem, 0);
  objc_storeStrong((id *)&self->_ingestibleItemDrawable, 0);
}

@end
