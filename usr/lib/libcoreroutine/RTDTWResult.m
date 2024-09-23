@implementation RTDTWResult

- (RTDTWResult)initWithDistance:(double)a3 cellIndices:(id)a4
{
  id v6;
  RTDTWResult *v7;
  RTDTWResult *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)RTDTWResult;
  v7 = -[RTDTWResult init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[RTDTWResult setDistance:](v7, "setDistance:", a3);
    -[RTDTWResult setCellIndices:](v8, "setCellIndices:", v6);
  }

  return v8;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (NSArray)cellIndices
{
  return self->_cellIndices;
}

- (void)setCellIndices:(id)a3
{
  objc_storeStrong((id *)&self->_cellIndices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellIndices, 0);
}

@end
