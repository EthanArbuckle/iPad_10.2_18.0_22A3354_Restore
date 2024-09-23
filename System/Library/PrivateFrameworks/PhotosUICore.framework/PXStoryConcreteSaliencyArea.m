@implementation PXStoryConcreteSaliencyArea

- (PXStoryConcreteSaliencyArea)init
{
  double v2;

  LODWORD(v2) = 0;
  return -[PXStoryConcreteSaliencyArea initWithContentsRect:confidence:](self, "initWithContentsRect:confidence:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), v2);
}

- (PXStoryConcreteSaliencyArea)initWithContentsRect:(CGRect)a3 confidence:(float)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PXStoryConcreteSaliencyArea *result;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)PXStoryConcreteSaliencyArea;
  result = -[PXStoryConcreteSaliencyArea init](&v10, sel_init);
  if (result)
  {
    result->_contentsRect.origin.x = x;
    result->_contentsRect.origin.y = y;
    result->_contentsRect.size.width = width;
    result->_contentsRect.size.height = height;
    result->_confidence = a4;
  }
  return result;
}

- (CGRect)contentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentsRect.origin.x;
  y = self->_contentsRect.origin.y;
  width = self->_contentsRect.size.width;
  height = self->_contentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (float)confidence
{
  return self->_confidence;
}

@end
