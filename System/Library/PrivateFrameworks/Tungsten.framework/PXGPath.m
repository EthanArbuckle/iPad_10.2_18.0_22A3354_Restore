@implementation PXGPath

- (PXGPath)initWithBounds:(CGRect)a3 CGPath:(CGPath *)a4 strokeColor:(id)a5 lineWidth:(double)a6 fillColor:(id)a7 drawingMode:(int)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  id v19;
  PXGPath *v20;
  PXGPath *v21;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = a5;
  v19 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PXGPath;
  v20 = -[PXGPath init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_bounds.origin.x = x;
    v20->_bounds.origin.y = y;
    v20->_bounds.size.width = width;
    v20->_bounds.size.height = height;
    v20->_CGPath = CGPathRetain(a4);
    objc_storeStrong((id *)&v21->_strokeColor, a5);
    v21->_lineWidth = a6;
    objc_storeStrong((id *)&v21->_fillColor, a7);
    v21->_drawingMode = a8;
  }

  return v21;
}

- (PXGPath)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGPath.m"), 29, CFSTR("%s is not available as initializer"), "-[PXGPath init]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->_CGPath);
  v3.receiver = self;
  v3.super_class = (Class)PXGPath;
  -[PXGPath dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  PXGPath *v7;
  CFHashCode v8;
  double v9;
  unint64_t v10;

  -[PXGPath strokeColor](self, "strokeColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PXGPath fillColor](self, "fillColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = objc_retainAutorelease(self);
  v8 = v6 ^ CFHash(-[PXGPath CGPath](v7, "CGPath"));
  -[PXGPath lineWidth](v7, "lineWidth");
  v10 = v8 ^ -[PXGPath drawingMode](v7, "drawingMode") ^ (unint64_t)(v9 * 10.0);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PXGPath *v4;
  PXGPath *v5;
  double v6;
  double v7;
  double v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v4 = (PXGPath *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXGPath lineWidth](self, "lineWidth");
      v7 = v6;
      -[PXGPath lineWidth](v5, "lineWidth");
      if (v7 == v8
        && (v9 = -[PXGPath drawingMode](self, "drawingMode"), v9 == -[PXGPath drawingMode](v5, "drawingMode")))
      {
        -[PXGPath strokeColor](self, "strokeColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXGPath strokeColor](v5, "strokeColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqual:", v11))
        {
          -[PXGPath fillColor](self, "fillColor");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXGPath fillColor](v5, "fillColor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isEqual:", v13))
            v14 = CGPathEqualToPath(self->_CGPath, -[PXGPath CGPath](objc_retainAutorelease(v5), "CGPath"));
          else
            v14 = 0;

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (CGPath)CGPath
{
  return self->_CGPath;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int)drawingMode
{
  return self->_drawingMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
}

@end
