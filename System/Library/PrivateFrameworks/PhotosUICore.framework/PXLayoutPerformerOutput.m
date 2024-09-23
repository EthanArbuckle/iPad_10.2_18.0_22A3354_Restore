@implementation PXLayoutPerformerOutput

- (PXLayoutPerformerOutput)initWithCapacity:(int64_t)a3
{
  PXLayoutPerformerOutput *v4;
  PXLayoutPerformerOutput *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXLayoutPerformerOutput;
  v4 = -[PXLayoutPerformerOutput init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_capacity = a3;
    v4->_lastIndex = -1;
    v4->_layoutRects = (CGRect *)malloc_type_malloc(32 * a3, 0x1000040E0EAB150uLL);
  }
  return v5;
}

- (void)dealloc
{
  CGRect *layoutRects;
  objc_super v4;

  layoutRects = self->_layoutRects;
  if (layoutRects)
  {
    free(layoutRects);
    self->_layoutRects = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PXLayoutPerformerOutput;
  -[PXLayoutPerformerOutput dealloc](&v4, sel_dealloc);
}

- (int64_t)count
{
  return self->_lastIndex + 1;
}

- (void)appendLayoutRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int64_t lastIndex;
  int64_t capacity;
  CGRect *layoutRects;
  int64_t v11;
  CGFloat *p_x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  capacity = self->_capacity;
  lastIndex = self->_lastIndex;
  if (lastIndex >= capacity)
  {
    self->_capacity = 2 * capacity;
    layoutRects = (CGRect *)malloc_type_realloc(self->_layoutRects, capacity << 6, 0x1000040E0EAB150uLL);
    self->_layoutRects = layoutRects;
    lastIndex = self->_lastIndex;
  }
  else
  {
    layoutRects = self->_layoutRects;
  }
  v11 = lastIndex + 1;
  self->_lastIndex = v11;
  p_x = &layoutRects[v11].origin.x;
  *p_x = x;
  p_x[1] = y;
  p_x[2] = width;
  p_x[3] = height;
}

- (void)removeAllRects
{
  self->_lastIndex = -1;
}

- (CGRect)layoutRectAtIndex:(int64_t)a3
{
  CGRect *v5;
  double x;
  double y;
  double width;
  double height;
  void *v11;
  CGRect result;

  if (self->_lastIndex < a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLayoutPerformer.m"), 141, CFSTR("PXLayoutPerformerOutput: Index %ld out of bounds"), a3);

  }
  v5 = &self->_layoutRects[a3];
  x = v5->origin.x;
  y = v5->origin.y;
  width = v5->size.width;
  height = v5->size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
