@implementation BKPageAnimation

- (NSArray)existingPages
{
  return self->_existingPages;
}

- (void)setExistingPages:(id)a3
{
  objc_storeStrong((id *)&self->_existingPages, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)isGoingToNextPage
{
  return self->_isGoingToNextPage;
}

- (void)setIsGoingToNextPage:(BOOL)a3
{
  self->_isGoingToNextPage = a3;
}

- (BOOL)isInteractive
{
  return self->_isInteractive;
}

- (void)setIsInteractive:(BOOL)a3
{
  self->_isInteractive = a3;
}

- (BKPageAnimationDelegate)pageAnimationDelegate
{
  return (BKPageAnimationDelegate *)objc_loadWeakRetained((id *)&self->_pageAnimationDelegate);
}

- (void)setPageAnimationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pageAnimationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pageAnimationDelegate);
  objc_storeStrong((id *)&self->_existingPages, 0);
}

@end
