@implementation PUTilingLayoutCoordinateSystem

- (BOOL)isEqual:(id)a3
{
  PUTilingLayoutCoordinateSystem *v4;
  PUTilingLayoutCoordinateSystem *v5;
  void *v6;
  void *v7;
  char v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  BOOL v18;

  v4 = (PUTilingLayoutCoordinateSystem *)a3;
  if (v4 == self)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PUTilingLayoutCoordinateSystem parentCoordinateSystem](self, "parentCoordinateSystem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUTilingLayoutCoordinateSystem parentCoordinateSystem](v5, "parentCoordinateSystem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      -[PUTilingLayoutCoordinateSystem coordinateSystemOrigin](self, "coordinateSystemOrigin");
      v10 = v9;
      v12 = v11;
      -[PUTilingLayoutCoordinateSystem coordinateSystemOrigin](v5, "coordinateSystemOrigin");
      v14 = v13;
      v16 = v15;

      if (v10 == v14)
        v17 = v8;
      else
        v17 = 0;
      v18 = v12 == v16 && v17;
    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (PUTilingCoordinateSystem)parentCoordinateSystem
{
  return (PUTilingCoordinateSystem *)objc_loadWeakRetained((id *)&self->_parentCoordinateSystem);
}

- (void)setParentCoordinateSystem:(id)a3
{
  objc_storeWeak((id *)&self->_parentCoordinateSystem, a3);
}

- (CGPoint)coordinateSystemOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_coordinateSystemOrigin.x;
  y = self->_coordinateSystemOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCoordinateSystemOrigin:(CGPoint)a3
{
  self->_coordinateSystemOrigin = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentCoordinateSystem);
}

@end
