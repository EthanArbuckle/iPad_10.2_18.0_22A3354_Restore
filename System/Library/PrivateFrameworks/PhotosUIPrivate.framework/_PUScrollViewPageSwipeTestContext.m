@implementation _PUScrollViewPageSwipeTestContext

- (_PUScrollViewPageSwipeTestContext)init
{
  _PUScrollViewPageSwipeTestContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PUScrollViewPageSwipeTestContext;
  result = -[_PUScrollViewPageSwipeTestContext init](&v3, sel_init);
  if (result)
    result->_currentDirection = 1;
  return result;
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)numberOfPages
{
  return self->_numberOfPages;
}

- (void)setNumberOfPages:(int64_t)a3
{
  self->_numberOfPages = a3;
}

- (int64_t)numberOfIterations
{
  return self->_numberOfIterations;
}

- (void)setNumberOfIterations:(int64_t)a3
{
  self->_numberOfIterations = a3;
}

- (unint64_t)scrollAxis
{
  return self->_scrollAxis;
}

- (void)setScrollAxis:(unint64_t)a3
{
  self->_scrollAxis = a3;
}

- (CGPoint)originContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_originContentOffset.x;
  y = self->_originContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOriginContentOffset:(CGPoint)a3
{
  self->_originContentOffset = a3;
}

- (int64_t)currentIteration
{
  return self->_currentIteration;
}

- (void)setCurrentIteration:(int64_t)a3
{
  self->_currentIteration = a3;
}

- (int64_t)currentPage
{
  return self->_currentPage;
}

- (void)setCurrentPage:(int64_t)a3
{
  self->_currentPage = a3;
}

- (int64_t)currentDirection
{
  return self->_currentDirection;
}

- (void)setCurrentDirection:(int64_t)a3
{
  self->_currentDirection = a3;
}

- (double)currentPageSwipeProgress
{
  return self->_currentPageSwipeProgress;
}

- (void)setCurrentPageSwipeProgress:(double)a3
{
  self->_currentPageSwipeProgress = a3;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testName, 0);
}

@end
