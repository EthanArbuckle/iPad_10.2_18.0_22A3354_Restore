@implementation PXGPPTRowStackLayout

- (PXGPPTRowStackLayout)initWithSettings:(id)a3
{
  id v4;
  PXGPPTRowStackLayout *v5;
  PXGPPTRowStackLayout *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGPPTRowStackLayout;
  v5 = -[PXGStackLayout init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_rowHeight = 80.0;
    v5->_numberOfItemsPerRow = 100;
    -[PXGStackLayout setAxis:](v5, "setAxis:", 1);
    -[PXGStackLayout setInterlayoutSpacing:](v6, "setInterlayoutSpacing:", 1.0);
    -[PXGStackLayout insertSublayoutProvider:inRange:](v6, "insertSublayoutProvider:inRange:", v6, 0, objc_msgSend(v4, "numberOfSections"));
  }

  return v6;
}

- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)result
{
  double rowHeight;

  rowHeight = self->_rowHeight;
  result.height = rowHeight;
  return result;
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  PXGPPTRowLayout *v5;
  PXGScrollLayout *v6;
  void *v7;
  long double __y;

  v5 = -[PXGPPTRowLayout initWithNumberOfItems:hue:]([PXGPPTRowLayout alloc], "initWithNumberOfItems:hue:", self->_numberOfItemsPerRow, (double)modf((double)a4 / 20.0, &__y));
  v6 = -[PXGScrollLayout initWithContentLayout:]([PXGScrollLayout alloc], "initWithContentLayout:", v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rowHeight);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGScrollLayout setFixedHeight:](v6, "setFixedHeight:", v7);

  return v6;
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

@end
