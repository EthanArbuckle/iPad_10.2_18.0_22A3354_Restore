@implementation _UIPreviewPresentationEffectView

- (_UIPreviewPresentationEffectView)initWithFrame:(CGRect)a3
{
  _UIPreviewPresentationEffectView *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _UIPreviewPresentationEffectView *v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)_UIPreviewPresentationEffectView;
  v3 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CD2780]);
    v5 = (void *)objc_msgSend(v4, "initWithType:", *MEMORY[0x1E0CD2C88]);
    objc_msgSend(v5, "setValue:forKey:", &unk_1E1A95CB0, *MEMORY[0x1E0C9E258]);
    objc_msgSend(v5, "setValue:forKey:", CFSTR("low"), CFSTR("inputQuality"));
    objc_msgSend(v5, "setValue:forKey:", CFSTR("low"), CFSTR("inputIntermediateBitDepth"));
    objc_msgSend(v5, "setName:", CFSTR("gaussianBlur"));
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFilters:", v6);

    -[_UIPreviewPresentationEffectView setShadowOffset:](v3, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    -[_UIPreviewPresentationEffectView setShadowRadius:](v3, "setShadowRadius:", 0.0);
    +[UIColor blackColor](UIColor, "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorWithAlphaComponent:", 0.333333333);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewPresentationEffectView setShadowColor:](v3, "setShadowColor:", v9);

    -[_UIPreviewPresentationEffectView setShadowAlpha:](v3, "setShadowAlpha:", 0.0);
    v10 = v3;

  }
  return v3;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIPreviewPresentationEffectView;
  if (-[UIView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4)
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("filters.gaussianBlur.inputRadius")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("cornerRadius")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("shadowOpacity")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("shadowOffset")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("shadowRadius")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("shadowColor"));
  }

  return v5;
}

- (double)blurRadius
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)setBlurRadius:(double)a3
{
  void *v4;
  id v5;

  -[UIView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v4, CFSTR("filters.gaussianBlur.inputRadius"));

}

- (void)setCornerRadius:(double)a3
{
  void *v4;
  id v5;

  -[UIView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v4, CFSTR("cornerRadius"));

}

- (double)cornerRadius
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("cornerRadius"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)setShadowAlpha:(double)a3
{
  void *v4;
  id v5;

  -[UIView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v4, CFSTR("shadowOpacity"));

}

- (double)shadowAlpha
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("shadowOpacity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)setShadowOffset:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  id v6;

  height = a3.height;
  width = a3.width;
  -[UIView layer](self, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", width, height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKeyPath:", v5, CFSTR("shadowOffset"));

}

- (CGSize)shadowOffset
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("shadowOffset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGSizeValue");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setShadowRadius:(double)a3
{
  void *v4;
  id v5;

  -[UIView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v4, CFSTR("shadowRadius"));

}

- (double)shadowRadius
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("shadowRadius"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)setShadowColor:(id)a3
{
  void *v4;
  char v5;
  UIColor *v6;
  UIColor *shadowColor;
  void *v8;
  id v9;

  v9 = a3;
  -[_UIPreviewPresentationEffectView shadowColor](self, "shadowColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v9);

  if ((v5 & 1) == 0)
  {
    v6 = (UIColor *)objc_msgSend(v9, "copy");
    shadowColor = self->_shadowColor;
    self->_shadowColor = v6;

    -[UIView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKeyPath:", -[UIColor CGColor](self->_shadowColor, "CGColor"), CFSTR("shadowColor"));

  }
}

- (void)setShouldRasterizeForTransition:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v3 = a3;
  self->_shouldRasterizeForTransition = a3;
  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldRasterize:", v3);

  -[UIView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  if (v9 >= 3.0)
    v9 = v9 * 0.5;
  -[UIView layer](self, "layer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRasterizationScale:", v9);

}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (BOOL)shouldRasterizeForTransition
{
  return self->_shouldRasterizeForTransition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
}

@end
