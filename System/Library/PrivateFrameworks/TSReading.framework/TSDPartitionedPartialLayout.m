@implementation TSDPartitionedPartialLayout

- (TSDPartitionedPartialLayout)initWithInfo:(id)a3 bounds:(CGRect)a4 partitioner:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  TSDPartitionedPartialLayout *result;
  objc_super v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)TSDPartitionedPartialLayout;
  result = -[TSDLayout initWithInfo:](&v11, sel_initWithInfo_, a3);
  if (result)
  {
    result->mBounds.origin.x = x;
    result->mBounds.origin.y = y;
    result->mBounds.size.width = width;
    result->mBounds.size.height = height;
    result->mPartitioner = (TSDDefaultPartitioner *)a5;
  }
  return result;
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (id)computeLayoutGeometry
{
  TSDLayoutGeometry *v3;
  double width;
  double height;
  __int128 v6;
  _OWORD v8[3];

  v3 = [TSDLayoutGeometry alloc];
  width = self->mBounds.size.width;
  height = self->mBounds.size.height;
  v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v8[0] = *MEMORY[0x24BDBD8B8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  return -[TSDLayoutGeometry initWithSize:transform:](v3, "initWithSize:transform:", v8, width, height);
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mBounds.origin.x;
  y = self->mBounds.origin.y;
  width = self->mBounds.size.width;
  height = self->mBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (TSDDefaultPartitioner)partitioner
{
  return self->mPartitioner;
}

@end
