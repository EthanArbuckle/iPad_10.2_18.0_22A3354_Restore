@implementation RPTChainedCoordinateSpaceConverter

- (RPTChainedCoordinateSpaceConverter)initWithPrimary:(id)a3 secondary:(id)a4
{
  id v7;
  id v8;
  RPTChainedCoordinateSpaceConverter *v9;
  RPTChainedCoordinateSpaceConverter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RPTChainedCoordinateSpaceConverter;
  v9 = -[RPTChainedCoordinateSpaceConverter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_primary, a3);
    objc_storeStrong((id *)&v10->_secondary, a4);
  }

  return v10;
}

- (CGPoint)convertPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[RPTChainedCoordinateSpaceConverter secondary](self, "secondary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPTChainedCoordinateSpaceConverter primary](self, "primary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:", x, y);
  objc_msgSend(v6, "convertPoint:");
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGSize)convertSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[RPTChainedCoordinateSpaceConverter secondary](self, "secondary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPTChainedCoordinateSpaceConverter primary](self, "primary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertSize:", width, height);
  objc_msgSend(v6, "convertSize:");
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGRect)convertRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[RPTChainedCoordinateSpaceConverter secondary](self, "secondary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPTChainedCoordinateSpaceConverter primary](self, "primary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:", x, y, width, height);
  objc_msgSend(v8, "convertRect:");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGVector)convertVector:(CGVector)a3
{
  double dy;
  double dx;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGVector result;

  dy = a3.dy;
  dx = a3.dx;
  -[RPTChainedCoordinateSpaceConverter secondary](self, "secondary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPTChainedCoordinateSpaceConverter primary](self, "primary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertVector:", dx, dy);
  objc_msgSend(v6, "convertVector:");
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.dy = v13;
  result.dx = v12;
  return result;
}

- (RPTCoordinateSpaceConverter)primary
{
  return self->_primary;
}

- (void)setPrimary:(id)a3
{
  objc_storeStrong((id *)&self->_primary, a3);
}

- (RPTCoordinateSpaceConverter)secondary
{
  return self->_secondary;
}

- (void)setSecondary:(id)a3
{
  objc_storeStrong((id *)&self->_secondary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondary, 0);
  objc_storeStrong((id *)&self->_primary, 0);
}

@end
