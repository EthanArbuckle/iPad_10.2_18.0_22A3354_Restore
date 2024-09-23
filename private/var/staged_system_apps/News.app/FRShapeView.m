@implementation FRShapeView

+ (Class)layerClass
{
  return (Class)objc_opt_class(CAShapeLayer, a2);
}

- (FRShapeView)initWithFrame:(CGRect)a3
{
  FRShapeView *v3;
  double v4;
  double v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FRShapeView;
  v3 = -[FRShapeView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[FRMacros deviceScreenScaleFromPotentialBackgroundThread](FRMacros, "deviceScreenScaleFromPotentialBackgroundThread");
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRShapeView layer](v3, "layer"));
    objc_msgSend(v6, "setContentsScale:", v5);

  }
  return v3;
}

- (void)setPath:(id)a3
{
  id v4;
  UIBezierPath *v5;
  UIBezierPath *path;
  id v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = (UIBezierPath *)objc_msgSend(v4, "copy");
  path = self->_path;
  self->_path = v5;

  v7 = objc_retainAutorelease(v4);
  v8 = objc_msgSend(v7, "CGPath");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRShapeView layer](self, "layer"));
  objc_msgSend(v9, "setPath:", v8);

  -[FRShapeView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setFillColor:(id)a3
{
  id v5;
  id v6;
  id v7;

  objc_storeStrong((id *)&self->_fillColor, a3);
  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "CGColor");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[FRShapeView layer](self, "layer"));
  objc_msgSend(v7, "setFillColor:", v6);

}

- (void)setStrokeColor:(id)a3
{
  id v5;
  id v6;
  id v7;

  objc_storeStrong((id *)&self->_strokeColor, a3);
  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "CGColor");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[FRShapeView layer](self, "layer"));
  objc_msgSend(v7, "setStrokeColor:", v6);

}

- (void)setLineWidth:(double)a3
{
  id v4;

  self->_lineWidth = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[FRShapeView layer](self, "layer"));
  objc_msgSend(v4, "setLineWidth:", a3);

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double Width;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double Height;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;
  CGRect v16;
  CGRect v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRShapeView path](self, "path"));
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRShapeView path](self, "path"));
  objc_msgSend(v5, "lineWidth");
  v7 = Width + v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRShapeView path](self, "path"));
  objc_msgSend(v8, "bounds");
  Height = CGRectGetHeight(v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRShapeView path](self, "path"));
  objc_msgSend(v10, "lineWidth");
  v12 = Height + v11;

  v13 = v7;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[FRShapeView intrinsicContentSize](self, "intrinsicContentSize", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if (qword_10010A980 != -1)
    dispatch_once(&qword_10010A980, &stru_1000DE500);
  v7.receiver = self;
  v7.super_class = (Class)FRShapeView;
  if (-[FRShapeView _shouldAnimatePropertyWithKey:](&v7, "_shouldAnimatePropertyWithKey:", v4))
    v5 = 1;
  else
    v5 = objc_msgSend((id)qword_10010A978, "containsObject:", v4);

  return v5;
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

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
