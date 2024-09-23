@implementation PXShapeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setPath:(id)a3
{
  UIBezierPath *v4;
  UIBezierPath *path;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;

  v11 = a3;
  if ((objc_msgSend(v11, "isEqual:", self->_path) & 1) == 0)
  {
    v4 = (UIBezierPath *)objc_msgSend(v11, "copy");
    path = self->_path;
    self->_path = v4;

    -[PXShapeView shapeLayer](self, "shapeLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_retainAutorelease(v11);
    objc_msgSend(v6, "setPath:", objc_msgSend(v7, "CGPath"));
    objc_msgSend(v7, "lineWidth");
    objc_msgSend(v6, "setLineWidth:");
    LODWORD(v7) = objc_msgSend(v7, "usesEvenOddFillRule");
    -[PXShapeView shapeLayer](self, "shapeLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((_DWORD)v7)
      v10 = CFSTR("even-odd");
    else
      v10 = CFSTR("non-zero");
    objc_msgSend(v8, "setFillRule:", v10);

  }
}

- (void)setFillColor:(id)a3
{
  UIColor *v5;
  void *v6;
  char v7;
  CGColor *v8;
  UIColor *v9;

  v9 = (UIColor *)a3;
  v5 = self->_fillColor;
  v6 = v9;
  if (v5 == v9)
    goto LABEL_4;
  v7 = -[UIColor isEqual:](v9, "isEqual:", v5);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fillColor, a3);
    v8 = -[UIColor CGColor](self->_fillColor, "CGColor");
    -[PXShapeView shapeLayer](self, "shapeLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFillColor:", v8);
LABEL_4:

  }
}

- (void)setStrokeColor:(id)a3
{
  UIColor *v5;
  void *v6;
  char v7;
  CGColor *v8;
  UIColor *v9;

  v9 = (UIColor *)a3;
  v5 = self->_strokeColor;
  v6 = v9;
  if (v5 == v9)
    goto LABEL_4;
  v7 = -[UIColor isEqual:](v9, "isEqual:", v5);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_strokeColor, a3);
    v8 = -[UIColor CGColor](self->_strokeColor, "CGColor");
    -[PXShapeView shapeLayer](self, "shapeLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStrokeColor:", v8);
LABEL_4:

  }
}

- (UIBezierPath)path
{
  return self->_path;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
