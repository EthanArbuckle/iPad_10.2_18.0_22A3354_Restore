@implementation PXTwoTuple

- (id)first
{
  return self->_first;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

- (PXTwoTuple)initWithFirst:(id)a3 second:(id)a4
{
  id v7;
  id v8;
  PXTwoTuple *v9;
  PXTwoTuple *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXTwoTuple;
  v9 = -[PXTwoTuple init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_first, a3);
    objc_storeStrong(&v10->_second, a4);
  }

  return v10;
}

- (void)setFirst:(id)a3
{
  objc_storeStrong(&self->_first, a3);
}

- (id)second
{
  return self->_second;
}

- (void)setSecond:(id)a3
{
  objc_storeStrong(&self->_second, a3);
}

@end
