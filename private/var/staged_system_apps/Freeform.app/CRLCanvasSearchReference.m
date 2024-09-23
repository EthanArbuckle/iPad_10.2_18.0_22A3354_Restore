@implementation CRLCanvasSearchReference

+ (id)searchReferenceWithBoardItem:(id)a3 searchCanvasDelegate:(id)a4
{
  id v5;
  id v6;
  CRLCanvasSearchReference *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[CRLCanvasSearchReference initWithBoardItem:selectionPath:]([CRLCanvasSearchReference alloc], "initWithBoardItem:selectionPath:", v6, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionPathForSearchReference:", v7));
  -[CRLCanvasSearchReference setSelectionPath:](v7, "setSelectionPath:", v8);

  return v7;
}

+ (id)searchReferenceWithBoardItem:(id)a3 selectionPath:(id)a4
{
  id v5;
  id v6;
  CRLCanvasSearchReference *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CRLCanvasSearchReference initWithBoardItem:selectionPath:]([CRLCanvasSearchReference alloc], "initWithBoardItem:selectionPath:", v6, v5);

  return v7;
}

- (CRLCanvasSearchReference)initWithBoardItem:(id)a3 selectionPath:(id)a4
{
  id v7;
  id v8;
  CRLCanvasSearchReference *v9;
  CRLCanvasSearchReference *v10;
  uint64_t v11;
  NSUUID *mUuid;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRLCanvasSearchReference;
  v9 = -[CRLCanvasSearchReference init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mBoardItem, a3);
    objc_storeStrong((id *)&v10->mSelectionPath, a4);
    v10->mRootIndex = 0x7FFFFFFFFFFFFFFFLL;
    v11 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    mUuid = v10->mUuid;
    v10->mUuid = (NSUUID *)v11;

  }
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  char *v4;
  void *v5;
  char *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSearchReference boardItem](self, "boardItem"));
  v4 = (char *)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSearchReference uuid](self, "uuid"));
  v6 = &v4[(_QWORD)objc_msgSend(v5, "hash")];

  return (unint64_t)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v4 = a3;
  objc_opt_class(CRLCanvasSearchReference, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSearchReference boardItem](self, "boardItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "boardItem"));
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSearchReference uuid](self, "uuid"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int64_t)compare:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  int64_t v21;
  void *v23;
  void *v24;

  v4 = a3;
  -[CRLCanvasSearchReference searchReferencePoint](self, "searchReferencePoint");
  v6 = v5;
  objc_msgSend(v4, "searchReferencePoint");
  v8 = v7;
  -[CRLCanvasSearchReference searchReferencePoint](self, "searchReferencePoint");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "searchReferencePoint");
  if (v6 == v8)
  {
    if (v10 == v13)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSearchReference uuid](self, "uuid"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
      v21 = (int64_t)objc_msgSend(v23, "compare:", v24);

      goto LABEL_11;
    }
    -[CRLCanvasSearchReference searchReferencePoint](self, "searchReferencePoint");
    v18 = v17;
    objc_msgSend(v4, "searchReferencePoint");
    v15 = v18 < v19;
    v16 = v18 <= v19;
  }
  else
  {
    v15 = v12 < v14;
    v16 = v12 <= v14;
  }
  v20 = !v16;
  if (v15)
    v21 = -1;
  else
    v21 = v20;
LABEL_11:

  return v21;
}

- (NSString)description
{
  Class v3;
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  Class v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSearchReference boardItem](self, "boardItem"));
  objc_opt_class(v6, v7);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSearchReference boardItem](self, "boardItem"));
  v12 = NSStringFromCGPoint(self->mSearchReferencePoint);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p info=<%@ %p>, frame=<%@>"), v5, self, v10, v11, v13));

  return (NSString *)v14;
}

- (id)commandForReplacingWithString:(id)a3 options:(unint64_t)a4
{
  void *v4;
  void *v5;
  void *v6;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3, a4);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101262FE0);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E3C748();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101263000);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE87A4(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasSearchReference commandForReplacingWithString:options:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLCanvasSearchReference.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 80, 0, "Cannot replace string on drawable");

  return 0;
}

- (id)boardItem
{
  return self->mBoardItem;
}

- (id)model
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSearchReference boardItem](self, "boardItem"));
  v9 = sub_100221DDC(v2, 1, v3, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLModel);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (id)infoForSelectionPath
{
  return self->mBoardItem;
}

- (id)selectionPath
{
  CRLSelectionPath *mSelectionPath;
  void *v4;
  void *v5;
  void *v6;

  mSelectionPath = self->mSelectionPath;
  if (!mSelectionPath)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101263020);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3C7CC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101263040);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasSearchReference selectionPath]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLCanvasSearchReference.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 97, 0, "Canvas search reference was not initialized with a selection path!");

    mSelectionPath = self->mSelectionPath;
  }
  return mSelectionPath;
}

- (void)setSelectionPath:(id)a3
{
  objc_storeStrong((id *)&self->mSelectionPath, a3);
}

- (BOOL)isSelectable
{
  return 1;
}

- (BOOL)isReplaceable
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRLCanvasSearchReference *v4;

  v4 = -[CRLCanvasSearchReference initWithBoardItem:selectionPath:]([CRLCanvasSearchReference alloc], "initWithBoardItem:selectionPath:", self->mBoardItem, self->mSelectionPath);
  -[CRLCanvasSearchReference searchReferencePoint](self, "searchReferencePoint");
  -[CRLCanvasSearchReference setSearchReferencePoint:](v4, "setSearchReferencePoint:");
  -[CRLCanvasSearchReference searchReferenceLayoutFrame](self, "searchReferenceLayoutFrame");
  -[CRLCanvasSearchReference setSearchReferenceLayoutFrame:](v4, "setSearchReferenceLayoutFrame:");
  -[CRLCanvasSearchReference connectionLineUnscaledPoint](self, "connectionLineUnscaledPoint");
  -[CRLCanvasSearchReference setConnectionLineUnscaledPoint:](v4, "setConnectionLineUnscaledPoint:");
  return v4;
}

- (NSArray)findHighlights
{
  return self->mFindHighlights;
}

- (void)setFindHighlights:(id)a3
{
  objc_storeStrong((id *)&self->mFindHighlights, a3);
}

- (BOOL)autohideHighlight
{
  return self->mAutohideHighlight;
}

- (void)setAutohideHighlight:(BOOL)a3
{
  self->mAutohideHighlight = a3;
}

- (BOOL)pulseHighlight
{
  return self->mPulseHighlight;
}

- (void)setPulseHighlight:(BOOL)a3
{
  self->mPulseHighlight = a3;
}

- (CGPoint)searchReferencePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->mSearchReferencePoint.x;
  y = self->mSearchReferencePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setSearchReferencePoint:(CGPoint)a3
{
  self->mSearchReferencePoint = a3;
}

- (CGRect)searchReferenceLayoutFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mSearchReferenceLayoutFrame.origin.x;
  y = self->mSearchReferenceLayoutFrame.origin.y;
  width = self->mSearchReferenceLayoutFrame.size.width;
  height = self->mSearchReferenceLayoutFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSearchReferenceLayoutFrame:(CGRect)a3
{
  self->mSearchReferenceLayoutFrame = a3;
}

- (CGPoint)connectionLineUnscaledPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->mConnectionLineUnscaledPoint.x;
  y = self->mConnectionLineUnscaledPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setConnectionLineUnscaledPoint:(CGPoint)a3
{
  self->mConnectionLineUnscaledPoint = a3;
}

- (int64_t)rootIndex
{
  return self->mRootIndex;
}

- (void)setRootIndex:(int64_t)a3
{
  self->mRootIndex = a3;
}

- (NSUUID)uuid
{
  return self->mUuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mUuid, 0);
  objc_storeStrong((id *)&self->mFindHighlights, 0);
  objc_storeStrong((id *)&self->mSelectionPath, 0);
  objc_storeStrong((id *)&self->mBoardItem, 0);
}

@end
