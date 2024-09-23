@implementation THWGutterObjectPositioning

- (CGSize)offset
{
  double width;
  double height;
  CGSize result;

  width = self->mOffset.width;
  height = self->mOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setOffset:(CGSize)a3
{
  CGFloat height;
  CGFloat width;

  height = a3.height;
  width = a3.width;
  -[THWGutterObjectPositioning willModify](self, "willModify");
  self->mOffset.width = width;
  self->mOffset.height = height;
}

- (unint64_t)bodyCharIndex
{
  return self->mBodyCharIndex;
}

- (void)setBodyCharIndex:(unint64_t)a3
{
  -[THWGutterObjectPositioning willModify](self, "willModify");
  self->mBodyCharIndex = a3;
}

@end
