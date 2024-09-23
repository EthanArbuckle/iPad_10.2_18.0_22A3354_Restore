@implementation TUIEmbeddedCollectionViewState

- (CGPoint)contentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentOffset.x;
  y = self->_contentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  self->_contentOffset = a3;
}

- (TUIViewState)embeddedState
{
  return self->_embeddedState;
}

- (void)setEmbeddedState:(id)a3
{
  objc_storeStrong((id *)&self->_embeddedState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddedState, 0);
}

@end
