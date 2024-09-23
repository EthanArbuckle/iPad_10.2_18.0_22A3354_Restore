@implementation TSDTextSelectionRect

- (TSDTextSelectionRect)initWithRect:(CGRect)a3 direction:(int64_t)a4 range:(id)a5 containsStart:(BOOL)a6 containsEnd:(BOOL)a7 isVertical:(BOOL)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  TSDTextSelectionRect *v17;
  TSDTextSelectionRect *v18;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)TSDTextSelectionRect;
  v17 = -[TSDTextSelectionRect init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_rect.origin.x = x;
    v17->_rect.origin.y = y;
    v17->_rect.size.width = width;
    v17->_rect.size.height = height;
    v17->_writingDirection = a4;
    v17->_range = (UITextRange *)a5;
    v18->_containsStart = a6;
    v18->_containsEnd = a7;
    v18->_isVertical = a8;
  }
  return v18;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDTextSelectionRect;
  -[TSDTextSelectionRect dealloc](&v3, sel_dealloc);
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)writingDirection
{
  return self->_writingDirection;
}

- (UITextRange)range
{
  return self->_range;
}

- (void)setRange:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)containsStart
{
  return self->_containsStart;
}

- (BOOL)containsEnd
{
  return self->_containsEnd;
}

- (BOOL)isVertical
{
  return self->_isVertical;
}

@end
