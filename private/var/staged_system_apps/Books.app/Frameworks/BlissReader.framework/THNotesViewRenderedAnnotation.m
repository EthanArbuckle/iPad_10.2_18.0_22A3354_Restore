@implementation THNotesViewRenderedAnnotation

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNotesViewRenderedAnnotation;
  -[THNotesViewRenderedAnnotation dealloc](&v3, "dealloc");
}

- (CALayer)highlightLayer
{
  return self->mHighlightLayer;
}

- (void)setHighlightLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (CALayer)editingHighlightLayer
{
  return self->mEditingHighlightLayer;
}

- (void)setEditingHighlightLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (CGRect)highlightTextFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mHighlightTextFrame.origin.x;
  y = self->mHighlightTextFrame.origin.y;
  width = self->mHighlightTextFrame.size.width;
  height = self->mHighlightTextFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setHighlightTextFrame:(CGRect)a3
{
  self->mHighlightTextFrame = a3;
}

@end
