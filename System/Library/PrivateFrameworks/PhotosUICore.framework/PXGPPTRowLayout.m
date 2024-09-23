@implementation PXGPPTRowLayout

- (PXGPPTRowLayout)init
{
  return -[PXGPPTRowLayout initWithNumberOfItems:hue:](self, "initWithNumberOfItems:hue:", 0, 0.0);
}

- (PXGPPTRowLayout)initWithNumberOfItems:(int64_t)a3 hue:(double)a4
{
  PXGPPTRowLayout *v6;
  PXGPPTRowLayout *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXGPPTRowLayout;
  v6 = -[PXGStackLayout init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_numberOfItems = a3;
    v6->_hue = a4;
    -[PXGStackLayout setAxis:](v6, "setAxis:", 2);
    -[PXGStackLayout setInterlayoutSpacing:](v7, "setInterlayoutSpacing:", 1.0);
    -[PXGStackLayout insertSublayoutProvider:inRange:](v7, "insertSublayoutProvider:inRange:", v7, 0, v7->_numberOfItems);
  }
  return v7;
}

- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)result
{
  double height;

  height = result.height;
  result.width = height;
  return result;
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  PXGPPTRowItemLayout *v5;
  void *v6;
  void *v7;
  PXGPPTRowItemLayout *v8;

  cos((double)a4 * 0.5);
  v5 = [PXGPPTRowItemLayout alloc];
  v6 = (void *)MEMORY[0x1E0DC3658];
  -[PXGPPTRowLayout hue](self, "hue");
  objc_msgSend(v6, "colorWithHue:saturation:brightness:alpha:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXGPPTRowItemLayout initWithColor:](v5, "initWithColor:", v7);

  return v8;
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (double)hue
{
  return self->_hue;
}

@end
