@implementation BKPageNavigationViewController

- (BKPageNavigationViewController)init
{
  BKPageNavigationViewController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKPageNavigationViewController;
  result = -[BKPageNavigationViewController init](&v3, "init");
  if (result)
    result->_pageOffset = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (NSArray)viewControllers
{
  return 0;
}

- (_NSRange)visiblePages
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)contentView
{
  return 0;
}

- (void)contentViewImage:(BOOL)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))objc_retainBlock(a4);
  if (v7)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController contentView](self, "contentView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "im_snapshotInContext"));
    v7[2](v7, v6);

  }
}

- (void)contentViewImage:(BOOL)a3 afterScreenUpdates:(BOOL)a4 completion:(id)a5
{
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))objc_retainBlock(a5);
  if (v8)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageNavigationViewController contentView](self, "contentView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "im_snapshotInContext"));
    v8[2](v8, v7);

  }
}

- (BOOL)isZoomedOut
{
  return 1;
}

- (void)turnToNextPage
{
  -[BKPageNavigationViewController turnToNextPageWithDelta:](self, "turnToNextPageWithDelta:", 1);
}

- (void)turnToPreviousPage
{
  -[BKPageNavigationViewController turnToPreviousPageWithDelta:](self, "turnToPreviousPageWithDelta:", 1);
}

- (void)turnToNextPageWithDelta:(unint64_t)a3
{
  int64_t v5;
  int64_t v6;
  unint64_t v7;

  v5 = -[BKViewController layoutDirection](self, "layoutDirection");
  v6 = -[BKPageNavigationViewController pageOffset](self, "pageOffset");
  if (v5 == 1)
    v7 = -(uint64_t)a3;
  else
    v7 = a3;
  -[BKPageNavigationViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", v6 + v7 + 1, 1);
}

- (void)turnToPreviousPageWithDelta:(unint64_t)a3
{
  int64_t v5;
  int64_t v6;
  unint64_t v7;

  v5 = -[BKViewController layoutDirection](self, "layoutDirection");
  v6 = -[BKPageNavigationViewController pageOffset](self, "pageOffset");
  if (v5 == 1)
    v7 = a3;
  else
    v7 = -(uint64_t)a3;
  -[BKPageNavigationViewController turnToPageNumber:animated:](self, "turnToPageNumber:animated:", v6 + v7 + 1, 1);
}

- (void)adjustToNewSize:(CGSize)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), a3.width, a3.height, CFSTR("Do not call method"), "-[BKPageNavigationViewController adjustToNewSize:]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (id)viewForLiveResize
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[BKPageNavigationViewController viewForLiveResize]"));
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v2, 0));

  objc_exception_throw(v3);
}

- (BKPageNavigationDelegate)delegate
{
  return (BKPageNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIPageViewControllerDataSource)dataSource
{
  return (UIPageViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(int64_t)a3
{
  self->_pageCount = a3;
}

- (int64_t)pageOffset
{
  return self->_pageOffset;
}

- (void)setPageOffset:(int64_t)a3
{
  self->_pageOffset = a3;
}

- (BOOL)ignoreNextGesture
{
  return self->_ignoreNextGesture;
}

- (void)setIgnoreNextGesture:(BOOL)a3
{
  self->_ignoreNextGesture = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)_imageViewForPageContentImage:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v3);

  objc_msgSend(v4, "setContentMode:", 1);
  return v4;
}

- (int64_t)_pageNumberForOffset:(int64_t)a3 onGreaterSide:(BOOL)a4 usingPageCount:(int64_t)a5
{
  int64_t v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = 0x7FFFFFFFFFFFFFFFLL;
  v6 = (a3 & 1) + a3;
  if (a3 > a5)
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 >= 1)
    v5 = v6;
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  v8 = 1;
  if ((a3 & 1) != 0)
    v8 = 2;
  v9 = v8 + a3;
  if (a3 > a5)
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 >= 0)
    v7 = v9;
  if (a4)
    return v7;
  else
    return v5;
}

- (int64_t)_leftPageNumberForOffset:(int64_t)a3 usingPageCount:(int64_t)a4
{
  return -[BKPageNavigationViewController _pageNumberForOffset:onGreaterSide:usingPageCount:](self, "_pageNumberForOffset:onGreaterSide:usingPageCount:", a3, (char *)-[BKViewController layoutDirection](self, "layoutDirection") == (char *)&dword_0 + 1, a4);
}

- (int64_t)_rightPageNumberForOffset:(int64_t)a3 usingPageCount:(int64_t)a4
{
  return -[BKPageNavigationViewController _pageNumberForOffset:onGreaterSide:usingPageCount:](self, "_pageNumberForOffset:onGreaterSide:usingPageCount:", a3, -[BKViewController layoutDirection](self, "layoutDirection") == 0, a4);
}

- (int64_t)leftPageNumberForSpreadPageOffset:(int64_t)a3
{
  return -[BKPageNavigationViewController _leftPageNumberForOffset:usingPageCount:](self, "_leftPageNumberForOffset:usingPageCount:", a3, (char *)-[BKPageNavigationViewController pageCount](self, "pageCount") - 1);
}

- (int64_t)rightPageNumberForSpreadPageOffset:(int64_t)a3
{
  return -[BKPageNavigationViewController _rightPageNumberForOffset:usingPageCount:](self, "_rightPageNumberForOffset:usingPageCount:", a3, (char *)-[BKPageNavigationViewController pageCount](self, "pageCount") - 1);
}

- (int64_t)leftPageNumberForSinglePageOffset:(int64_t)a3
{
  return -[BKPageNavigationViewController _leftPageNumberForOffset:usingPageCount:](self, "_leftPageNumberForOffset:usingPageCount:", a3, -[BKPageNavigationViewController pageCount](self, "pageCount"));
}

- (int64_t)rightPageNumberForSinglePageOffset:(int64_t)a3
{
  return -[BKPageNavigationViewController _rightPageNumberForOffset:usingPageCount:](self, "_rightPageNumberForOffset:usingPageCount:", a3, -[BKPageNavigationViewController pageCount](self, "pageCount"));
}

@end
