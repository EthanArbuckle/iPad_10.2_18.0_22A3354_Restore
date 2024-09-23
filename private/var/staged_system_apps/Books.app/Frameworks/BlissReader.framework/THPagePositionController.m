@implementation THPagePositionController

- (THPagePositionController)initWithDelegate:(id)a3 enablePaging:(BOOL)a4 pageHorizontally:(BOOL)a5
{
  THPagePositionController *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THPagePositionController;
  result = -[THPagePositionController init](&v9, "init");
  if (result)
  {
    result->mDelegate = (THPagePositionControllerDelegate *)a3;
    result->mShouldEnablePaging = a4;
    result->mPageHorizontally = a5;
  }
  return result;
}

+ (CGSize)fixedPageSizeForLandscapeOrientation:(BOOL)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 768.0;
  if (a3)
    v3 = 1024.0;
  v4 = 1004.0;
  if (a3)
    v4 = 748.0;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (id)paginatedPositionerWithDelegate:(id)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithDelegate:enablePaging:pageHorizontally:", a3, 1, 1);
}

+ (id)flowPositionerWithDelegate:(id)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithDelegate:enablePaging:pageHorizontally:", a3, 0, 0);
}

- (CGSize)pageSize
{
  double v2;
  double v3;
  CGSize result;

  -[THPagePositionControllerDelegate pageSizeForPagePositionController:](self->mDelegate, "pageSizeForPagePositionController:", self);
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)relativePageIndexFromCanvasPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  unsigned int v10;
  double v11;
  double v12;

  y = a3.y;
  x = a3.x;
  -[THPagePositionController pageSize](self, "pageSize");
  v7 = v6;
  v9 = v8;
  v10 = -[THPagePositionController pageHorizontally](self, "pageHorizontally");
  if (v10)
    v11 = x;
  else
    v11 = y;
  if (v10)
    v12 = v7;
  else
    v12 = v9;
  if (v11 < 0.0)
    v11 = 0.0;
  return (unint64_t)(v11 / v12);
}

- (CGSize)canvasSizeForPageCount:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  unsigned int v9;
  double v10;
  double v11;
  CGSize result;

  -[THPagePositionController pageSize](self, "pageSize");
  v6 = v5;
  v8 = v7;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    a3 = 1;
  v9 = -[THPagePositionController pageHorizontally](self, "pageHorizontally");
  v10 = v8 * (double)a3;
  v11 = v6 * (double)a3;
  if (v9)
    v10 = v8;
  else
    v11 = v6;
  result.height = v10;
  result.width = v11;
  return result;
}

- (_NSRange)visibleRelativePageIndexRangeForRect:(CGRect)a3 withPadding:(BOOL)a4 pageCount:(unint64_t)a5
{
  _BOOL4 v6;
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  NSUInteger v23;
  _NSRange result;
  CGRect v25;
  CGRect v26;

  if (a3.size.height <= 0.0)
  {
    v19 = NSInvalidRange[0];
    v18 = NSInvalidRange[1];
  }
  else
  {
    v6 = a4;
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    -[THPagePositionController pageSize](self, "pageSize");
    v13 = v12;
    v15 = v14;
    if (-[THPagePositionController pageHorizontally](self, "pageHorizontally"))
    {
      v16 = x / v13;
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      v17 = CGRectGetMaxX(v25) / v13;
    }
    else
    {
      v16 = y / v15;
      v26.origin.x = x;
      v26.origin.y = y;
      v26.size.width = width;
      v26.size.height = height;
      v17 = CGRectGetMaxY(v26) / v15;
    }
    v20 = (unint64_t)v16 - 1;
    if (!(unint64_t)v16)
      v20 = 0;
    if (v6)
      v19 = (id)v20;
    else
      v19 = (id)v16;
    v21 = (unint64_t)v17 + v6;
    if (v21 + 1 < (unint64_t)v19)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPagePositionController visibleRelativePageIndexRangeForRect:withPadding:pageCount:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPagePositionController.m"), 94, CFSTR("negative page range length"));
    v22 = a5 - 1;
    if (v21 < a5 - 1)
      v22 = v21;
    v18 = (id)(v22 - (_QWORD)v19 + 1);
  }
  v23 = (NSUInteger)v19;
  result.length = (NSUInteger)v18;
  result.location = v23;
  return result;
}

- (unint64_t)mostVisibleRelativePageIndexForCanvasBoundsRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MidX;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MidX = CGRectGetMidX(a3);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  return -[THPagePositionController relativePageIndexFromCanvasPoint:](self, "relativePageIndexFromCanvasPoint:", MidX, CGRectGetMidY(v10));
}

- (CGRect)pageRectForRelativePageIndex:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[THPagePositionController pageOriginForRelativePageIndex:](self, "pageOriginForRelativePageIndex:", a3);
  v5 = v4;
  v7 = v6;
  -[THPagePositionController pageSize](self, "pageSize");
  v9 = v8;
  v11 = v10;
  v12 = v5;
  v13 = v7;
  result.size.height = v11;
  result.size.width = v9;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGPoint)pageOriginForRelativePageIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  unsigned int v9;
  double v10;
  double v11;
  CGPoint result;

  -[THPagePositionController pageSize](self, "pageSize");
  v6 = v5;
  v8 = v7;
  v9 = -[THPagePositionController pageHorizontally](self, "pageHorizontally");
  if (v9)
    v10 = v6 * (double)a3;
  else
    v10 = 0.0;
  if (v9)
    v11 = 0.0;
  else
    v11 = v8 * (double)a3;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGSize)pageSizeWithZeroInPagingDirection
{
  unsigned int v3;
  double v4;
  double v5;
  CGSize result;

  v3 = -[THPagePositionController pageHorizontally](self, "pageHorizontally");
  -[THPagePositionController pageSize](self, "pageSize");
  if (v3)
    v4 = 0.0;
  else
    v5 = 0.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGPoint)sectionOriginWithPrecedingSectionSizes:(id)a3
{
  double y;
  double x;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  double v11;
  double v12;
  double v13;
  double v14;
  unsigned int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(a3);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "CGSizeValue");
        v12 = v11;
        v14 = v13;
        v15 = -[THPagePositionController pageHorizontally](self, "pageHorizontally");
        v16 = -0.0;
        if (v15)
          v17 = -0.0;
        else
          v17 = v14;
        y = y + v17;
        if (v15)
          v16 = v12;
        x = x + v16;
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }
  v18 = x;
  v19 = y;
  result.y = v19;
  result.x = v18;
  return result;
}

- (CGSize)p_sequentialPageSizeOffsetFromPageSize:(CGSize)a3
{
  double height;
  double width;
  unsigned int v5;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = -[THPagePositionController pageHorizontally](self, "pageHorizontally");
  v6 = 0.0;
  if (v5)
    v7 = width;
  else
    v7 = 0.0;
  if (!v5)
    v6 = height;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)arrangeLayouts:(id)a3
{
  id v5;
  id v6;
  CGFloat width;
  CGFloat height;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    width = CGSizeZero.width;
    height = CGSizeZero.height;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10);
        memset(&v18, 0, sizeof(v18));
        CGAffineTransformMakeTranslation(&v18, width, height);
        v12 = objc_msgSend(objc_msgSend(v11, "geometry"), "mutableCopy");
        v17 = v18;
        objc_msgSend(v12, "setTransform:", &v17);
        objc_msgSend(v11, "setGeometry:", v12);
        objc_msgSend(v12, "size");
        v13 = -[THPagePositionController p_sequentialPageSizeOffsetFromPageSize:](self, "p_sequentialPageSizeOffsetFromPageSize:");
        width = TSDAddSizes(v13, width, height, v14, v15);
        height = v16;

        v10 = (char *)v10 + 1;
      }
      while (v6 != v10);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }
}

- (CGSize)sequentialSizeFromPageSizes:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  CGSize result;

  -[THPagePositionController pageSizeWithZeroInPagingDirection](self, "pageSizeWithZeroInPagingDirection");
  v6 = v5;
  v8 = v7;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(a3);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v12), "CGSizeValue");
        v13 = -[THPagePositionController p_sequentialPageSizeOffsetFromPageSize:](self, "p_sequentialPageSizeOffsetFromPageSize:");
        v6 = TSDAddSizes(v13, v6, v8, v14, v15);
        v8 = v16;
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }
  v17 = v6;
  v18 = v8;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGRect)offsetRect:(CGRect)a3 inPagingDirectionWithOffset:(CGPoint)a4
{
  double y;
  double x;
  CGFloat height;
  CGFloat width;
  double v8;
  double v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  y = a4.y;
  x = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v8 = a3.origin.y;
  v9 = a3.origin.x;
  v10 = -[THPagePositionController pageHorizontally](self, "pageHorizontally");
  v11 = -0.0;
  if (v10)
    v12 = x;
  else
    v12 = -0.0;
  v13 = v9 + v12;
  if (!v10)
    v11 = y;
  v14 = v8 + v11;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGSize)offsetSize:(CGSize)a3 inPagingDirectionWithOffset:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  unsigned int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  v8 = -[THPagePositionController pageHorizontally](self, "pageHorizontally");
  v9 = -0.0;
  if (v8)
    v10 = width;
  else
    v10 = -0.0;
  v11 = v7 + v10;
  if (!v8)
    v9 = height;
  v12 = v6 + v9;
  result.height = v12;
  result.width = v11;
  return result;
}

- (BOOL)shouldEnablePaging
{
  return self->mShouldEnablePaging;
}

- (BOOL)pageHorizontally
{
  return self->mPageHorizontally;
}

@end
