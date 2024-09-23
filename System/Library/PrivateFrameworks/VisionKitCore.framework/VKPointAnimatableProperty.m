@implementation VKPointAnimatableProperty

- (VKPointAnimatableProperty)init
{
  VKPointAnimatableProperty *v2;
  UIViewFloatAnimatableProperty *v3;
  UIViewFloatAnimatableProperty *x;
  UIViewFloatAnimatableProperty *v5;
  UIViewFloatAnimatableProperty *y;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VKPointAnimatableProperty;
  v2 = -[VKPointAnimatableProperty init](&v8, sel_init);
  if (v2)
  {
    v3 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
    x = v2->_x;
    v2->_x = v3;

    v5 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
    y = v2->_y;
    v2->_y = v5;

  }
  return v2;
}

- (void)setValue:(CGPoint)a3
{
  double y;

  y = a3.y;
  -[UIViewFloatAnimatableProperty setValue:](self->_x, "setValue:", a3.x);
  -[UIViewFloatAnimatableProperty setValue:](self->_y, "setValue:", y);
}

- (CGPoint)value
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[UIViewFloatAnimatableProperty value](self->_x, "value");
  v4 = v3;
  -[UIViewFloatAnimatableProperty value](self->_y, "value");
  v6 = v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (CGPoint)presentationValue
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[UIViewFloatAnimatableProperty presentationValue](self->_x, "presentationValue");
  v4 = v3;
  -[UIViewFloatAnimatableProperty presentationValue](self->_y, "presentationValue");
  v6 = v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (UIViewFloatAnimatableProperty)x
{
  return self->_x;
}

- (UIViewFloatAnimatableProperty)y
{
  return self->_y;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_y, 0);
  objc_storeStrong((id *)&self->_x, 0);
}

@end
