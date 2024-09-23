@implementation PXGradientView

- (void)setColors:(id)a3
{
  NSArray *v4;
  NSArray *colors;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  colors = self->_colors;
  self->_colors = v4;

  -[PXGradientView _updateGradientLayerColors](self, "_updateGradientLayerColors");
}

- (void)_updateGradientLayerColors
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  -[PXGradientView colors](self, "colors");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__PXGradientView__updateGradientLayerColors__block_invoke;
  v7[3] = &unk_1E513E5A0;
  v8 = v3;
  v4 = v3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);
  -[PXGradientView gradientLayer](self, "gradientLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColors:", v4);

}

- (NSArray)locations
{
  void *v2;
  void *v3;

  -[PXGradientView gradientLayer](self, "gradientLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setLocations:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXGradientView gradientLayer](self, "gradientLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocations:", v4);

}

- (CGPoint)startPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[PXGradientView gradientLayer](self, "gradientLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setStartPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[PXGradientView gradientLayer](self, "gradientLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStartPoint:", x, y);

}

- (CGPoint)endPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[PXGradientView gradientLayer](self, "gradientLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setEndPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[PXGradientView gradientLayer](self, "gradientLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEndPoint:", x, y);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGradientView;
  v4 = a3;
  -[PXGradientView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[PXGradientView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[PXGradientView _updateGradientLayerColors](self, "_updateGradientLayerColors");
}

- (NSArray)colors
{
  return self->_colors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
}

uint64_t __44__PXGradientView__updateGradientLayerColors__block_invoke(uint64_t a1, id a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(objc_retainAutorelease(a2), "CGColor"));
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
