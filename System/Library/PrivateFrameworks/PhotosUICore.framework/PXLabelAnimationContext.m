@implementation PXLabelAnimationContext

- (PXLabelAnimationContext)initWithLabel:(id)a3 andDestinationRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  PXLabelAnimationContext *v11;
  PXLabelAnimationContext *v12;
  objc_super v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXLabelAnimationContext;
  v11 = -[PXLabelAnimationContext init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_label, a3);
    v12->_destinationRect.origin.x = x;
    v12->_destinationRect.origin.y = y;
    v12->_destinationRect.size.width = width;
    v12->_destinationRect.size.height = height;
  }

  return v12;
}

- (UILabel)label
{
  return (UILabel *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CGRect)destinationRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_destinationRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setDestinationRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_destinationRect, &v3, 32, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
