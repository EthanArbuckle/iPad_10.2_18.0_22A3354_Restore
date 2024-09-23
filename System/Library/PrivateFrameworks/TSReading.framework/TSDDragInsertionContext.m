@implementation TSDDragInsertionContext

- (TSDDragInsertionContext)initWithPreferredCenter:(CGPoint)a3 required:(BOOL)a4 shouldEndEditing:(BOOL)a5 fromDragToInsertController:(BOOL)a6 insertWillBeDiscarded:(BOOL)a7
{
  CGFloat y;
  CGFloat x;
  TSDDragInsertionContext *result;
  objc_super v14;

  y = a3.y;
  x = a3.x;
  v14.receiver = self;
  v14.super_class = (Class)TSDDragInsertionContext;
  result = -[TSDInsertionContext init](&v14, sel_init);
  if (result)
  {
    result->mPreferredCenter.x = x;
    result->mPreferredCenter.y = y;
    result->mPreferredCenterRequired = a4;
    result->mShouldEndEditing = a5;
    result->mFromDragToInsertController = a6;
    result->mInsertWillBeDiscarded = a7;
  }
  return result;
}

- (TSDDragInsertionContext)init
{
  return -[TSDDragInsertionContext initWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertWillBeDiscarded:](self, "initWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertWillBeDiscarded:", 0, 1, 0, 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

- (BOOL)hasPreferredCenter
{
  return 1;
}

- (BOOL)insertFloating
{
  return 0;
}

- (BOOL)insertFromDrag
{
  return 1;
}

- (BOOL)isInteractive
{
  return 1;
}

- (BOOL)isPreferredCenterRequired
{
  return self->mPreferredCenterRequired;
}

- (CGPoint)preferredCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->mPreferredCenter.x;
  y = self->mPreferredCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)shouldEndEditing
{
  return self->mShouldEndEditing;
}

- (BOOL)fromDragToInsertController
{
  return self->mFromDragToInsertController;
}

- (BOOL)insertWillBeDiscarded
{
  return self->mInsertWillBeDiscarded;
}

@end
