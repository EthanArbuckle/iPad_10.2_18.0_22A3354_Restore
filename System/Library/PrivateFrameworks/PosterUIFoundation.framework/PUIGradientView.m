@implementation PUIGradientView

- (PUIGradientView)initWithFrame:(CGRect)a3
{
  return -[PUIGradientView initWithFrame:usesBlur:](self, "initWithFrame:usesBlur:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PUIGradientView)initWithFrame:(CGRect)a3 usesBlur:(BOOL)a4
{
  _BOOL8 v4;
  PUIGradientView *v5;
  PUIGradientView *v6;
  uint64_t v7;
  CAGradientLayer *gradientLayer;
  CAGradientLayer *v9;
  void *v10;
  objc_super v12;

  v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUIGradientView;
  v5 = -[PUIGradientView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[PUIGradientView setClipsToBounds:](v5, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x24BDE56B8], "layer");
    v7 = objc_claimAutoreleasedReturnValue();
    gradientLayer = v6->_gradientLayer;
    v6->_gradientLayer = (CAGradientLayer *)v7;

    v9 = v6->_gradientLayer;
    -[PUIGradientView bounds](v6, "bounds");
    -[CAGradientLayer setFrame:](v9, "setFrame:");
    -[PUIGradientView layer](v6, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSublayer:", v6->_gradientLayer);

    -[PUIGradientView setUsesBlur:](v6, "setUsesBlur:", v4);
  }
  return v6;
}

- (void)layoutSubviews
{
  CAGradientLayer *gradientLayer;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUIGradientView;
  -[PUIGradientView layoutSubviews](&v4, sel_layoutSubviews);
  gradientLayer = self->_gradientLayer;
  -[PUIGradientView bounds](self, "bounds");
  -[CAGradientLayer setFrame:](gradientLayer, "setFrame:");
}

- (void)setUsesBlur:(BOOL)a3
{
  CAFilter *v4;
  CAFilter *blurFilter;
  CAGradientLayer **p_gradientLayer;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  if (self->_usesBlur != a3)
  {
    if (a3)
    {
      if (!self->_blurFilter)
      {
        objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A78]);
        v4 = (CAFilter *)objc_claimAutoreleasedReturnValue();
        blurFilter = self->_blurFilter;
        self->_blurFilter = v4;

        -[CAFilter setValue:forKey:](self->_blurFilter, "setValue:forKey:", &unk_25156AD20, CFSTR("inputRadius"));
        -[CAFilter setValue:forKey:](self->_blurFilter, "setValue:forKey:", &unk_25156AD38, CFSTR("inputHardEdges"));
        -[CAFilter setValue:forKey:](self->_blurFilter, "setValue:forKey:", &unk_25156AD38, CFSTR("inputNormalizeEdges"));
      }
      p_gradientLayer = &self->_gradientLayer;
      -[CAGradientLayer filters](self->_gradientLayer, "filters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");
      v9 = v8;
      if (v8)
        v10 = v8;
      else
        v10 = (id)objc_opt_new();
      v15 = v10;

      objc_msgSend(v15, "addObject:", self->_blurFilter);
    }
    else
    {
      p_gradientLayer = &self->_gradientLayer;
      -[CAGradientLayer filters](self->_gradientLayer, "filters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "mutableCopy");
      v13 = v12;
      if (v12)
        v14 = v12;
      else
        v14 = (id)objc_opt_new();
      v15 = v14;

      objc_msgSend(v15, "removeObject:", self->_blurFilter);
    }
    -[CAGradientLayer setFilters:](*p_gradientLayer, "setFilters:", v15);

  }
}

- (void)setColors:(id)a3 locations:(id)a4 type:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (v10)
    -[CAGradientLayer setColors:](self->_gradientLayer, "setColors:", v10);
  if (v8)
    -[CAGradientLayer setLocations:](self->_gradientLayer, "setLocations:", v8);
  if (v9)
    -[CAGradientLayer setType:](self->_gradientLayer, "setType:", v9);

}

- (void)setStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4
{
  double y;
  double x;

  y = a4.y;
  x = a4.x;
  -[CAGradientLayer setStartPoint:](self->_gradientLayer, "setStartPoint:", a3.x, a3.y);
  -[CAGradientLayer setEndPoint:](self->_gradientLayer, "setEndPoint:", x, y);
}

- (NSArray)colors
{
  void *v2;
  void *v3;

  -[CAGradientLayer colors](self->_gradientLayer, "colors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_compactMap:", &__block_literal_global_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __25__PUIGradientView_colors__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", a2);
}

- (void)setColors:(id)a3
{
  CAGradientLayer *gradientLayer;
  id v4;

  gradientLayer = self->_gradientLayer;
  objc_msgSend(a3, "bs_compactMap:", &__block_literal_global_14);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setColors:](gradientLayer, "setColors:", v4);

}

uint64_t __29__PUIGradientView_setColors___block_invoke(int a1, id a2)
{
  return objc_msgSend(objc_retainAutorelease(a2), "CGColor");
}

- (NSArray)locations
{
  return -[CAGradientLayer locations](self->_gradientLayer, "locations");
}

- (void)setLocations:(id)a3
{
  -[CAGradientLayer setLocations:](self->_gradientLayer, "setLocations:", a3);
}

- (CGPoint)startPoint
{
  double v2;
  double v3;
  CGPoint result;

  -[CAGradientLayer startPoint](self->_gradientLayer, "startPoint");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setStartPoint:(CGPoint)a3
{
  -[CAGradientLayer setStartPoint:](self->_gradientLayer, "setStartPoint:", a3.x, a3.y);
}

- (CGPoint)endPoint
{
  double v2;
  double v3;
  CGPoint result;

  -[CAGradientLayer endPoint](self->_gradientLayer, "endPoint");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setEndPoint:(CGPoint)a3
{
  -[CAGradientLayer setEndPoint:](self->_gradientLayer, "setEndPoint:", a3.x, a3.y);
}

- (BOOL)usesBlur
{
  return self->_usesBlur;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurFilter, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
}

@end
