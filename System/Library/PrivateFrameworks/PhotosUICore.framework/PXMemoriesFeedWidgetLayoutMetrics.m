@implementation PXMemoriesFeedWidgetLayoutMetrics

- (PXMemoriesFeedWidgetLayoutMetrics)init
{
  PXMemoriesFeedWidgetLayoutMetrics *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMemoriesFeedWidgetLayoutMetrics;
  result = -[PXMemoriesFeedWidgetLayoutMetrics init](&v3, sel_init);
  if (result)
  {
    result->_numberOfRows = 1;
    result->_layoutAxis = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXMemoriesFeedWidgetLayoutMetrics;
  result = -[PXMemoriesFeedLayoutMetrics copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 8) = self->_numberOfColumns;
  *((_QWORD *)result + 9) = self->_numberOfRows;
  *(CGSize *)((char *)result + 88) = self->_interitemSpacing;
  *((_QWORD *)result + 10) = self->_layoutAxis;
  return result;
}

- (void)setNumberOfRows:(unint64_t)a3
{
  void *v6;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedWidgetLayoutMetrics.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numberOfRows > 0"));

  }
  if (self->_numberOfRows != a3)
    self->_numberOfRows = a3;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (void)setNumberOfColumns:(unint64_t)a3
{
  self->_numberOfColumns = a3;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (CGSize)interitemSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_interitemSpacing.width;
  height = self->_interitemSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInteritemSpacing:(CGSize)a3
{
  self->_interitemSpacing = a3;
}

- (int64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (void)setLayoutAxis:(int64_t)a3
{
  self->_layoutAxis = a3;
}

@end
