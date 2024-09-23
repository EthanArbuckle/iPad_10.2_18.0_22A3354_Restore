@implementation CRLDragAndDropInfo

- (CRLDragAndDropInfo)initWithPlatformDraggingInfo:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  CRLDragAndDropInfo *v7;
  CRLDragAndDropInfo *v8;
  CRLDragAndDropInfo *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  CRLiOSItemProviderItemSource *v17;
  CRLIngestibleItemSource *itemSource;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];

  v4 = a3;
  if (-[CRLDragAndDropInfo isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class(CRLDragAndDropInfo, v5)))
  {
    v7 = (CRLDragAndDropInfo *)objc_alloc((Class)objc_opt_class(CRLiOSDragAndDropInfo, v6));

    self = v7;
  }
  v29.receiver = self;
  v29.super_class = (Class)CRLDragAndDropInfo;
  v8 = -[CRLDragAndDropInfo init](&v29, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_platformDraggingInfo, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "items"));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), "itemProvider"));
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v13);
    }

    v17 = -[CRLiOSItemProviderItemSource initWithItemProviders:]([CRLiOSItemProviderItemSource alloc], "initWithItemProviders:", v10);
    itemSource = v9->_itemSource;
    v9->_itemSource = (CRLIngestibleItemSource *)v17;

    if (!v9->_itemSource)
    {
      v19 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122DEF8);
      v20 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE9AC4(v19, v20);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122DF18);
      v21 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE81F0(v21, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropInfo initWithPlatformDraggingInfo:]"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropInfo.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 63, 0, "invalid nil value for '%{public}s'", "_itemSource");

    }
    v9->_targetPreviewCenter = (CGPoint)xmmword_100EEC438;

  }
  return v9;
}

- (NSArray)inProcessDraggingSources
{
  return (NSArray *)&__NSArray0__struct;
}

- (unint64_t)dragOperationMask
{
  return 0;
}

- (NSArray)promisedUTIs
{
  return (NSArray *)&__NSArray0__struct;
}

- (unint64_t)numberOfDraggingItems
{
  return 0;
}

- (BOOL)canCreateItemsOfClass:(Class)a3
{
  return 0;
}

- (id)createItemsOfClass:(Class)a3 completion:(id)a4
{
  return 0;
}

- (UIDropSession)platformDraggingInfo
{
  return (UIDropSession *)objc_loadWeakRetained((id *)&self->_platformDraggingInfo);
}

- (BOOL)shouldHidePromisedFileTypes
{
  return self->_shouldHidePromisedFileTypes;
}

- (void)setShouldHidePromisedFileTypes:(BOOL)a3
{
  self->_shouldHidePromisedFileTypes = a3;
}

- (CRLIngestibleItemSource)itemSource
{
  return self->_itemSource;
}

- (CGPoint)targetPreviewCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_targetPreviewCenter.x;
  y = self->_targetPreviewCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTargetPreviewCenter:(CGPoint)a3
{
  self->_targetPreviewCenter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSource, 0);
  objc_destroyWeak((id *)&self->_platformDraggingInfo);
}

@end
