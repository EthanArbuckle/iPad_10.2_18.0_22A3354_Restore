@implementation _UIDiffuseShadowView

- (_UIDiffuseShadowView)initWithFrame:(CGRect)a3
{
  _UIDiffuseShadowView *v3;
  _UIDiffuseShadowView *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_UIDiffuseShadowView;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[_UIDiffuseShadowView setRadius:](v4, "setRadius:", 56.0);
    -[_UIDiffuseShadowView setOffset:](v4, "setOffset:", 0.0, 7.0);
    -[_UIDiffuseShadowView setIntensity:](v4, "setIntensity:", 0.24);
    -[UIView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShadowPathIsBounds:", 1);

    -[_UIDiffuseShadowView _updateForCurrentTraits](v4, "_updateForCurrentTraits");
    v10[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UIView registerForTraitChanges:withTarget:action:](v4, "registerForTraitChanges:withTarget:action:", v6, v4, sel__updateForCurrentTraits);

  }
  return v4;
}

- (void)setIntensity:(double)a3
{
  self->_intensity = a3;
  -[_UIDiffuseShadowView _updateForCurrentTraits](self, "_updateForCurrentTraits");
}

- (void)setRadius:(double)a3
{
  id v4;

  -[UIView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShadowRadius:", a3);

}

- (double)radius
{
  void *v2;
  double v3;
  double v4;

  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowRadius");
  v4 = v3;

  return v4;
}

- (void)setOffset:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[UIView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowOffset:", width, height);

}

- (CGSize)offset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowOffset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setPath:(id)a3
{
  id v4;
  UIBezierPath *v5;
  UIBezierPath *path;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v5 = (UIBezierPath *)objc_msgSend(v4, "copy");
  path = self->_path;
  self->_path = v5;

  -[UIView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShadowPathIsBounds:", v4 == 0);

  v8 = objc_retainAutorelease(v4);
  v9 = objc_msgSend(v8, "CGPath");

  -[UIView layer](self, "layer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShadowPath:", v9);

}

- (void)_updateForCurrentTraits
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  float v13;
  void *v14;
  double v15;
  _OWORD v16[5];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == 1)
  {
    -[UIView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFilters:", 0);

    -[_UIDiffuseShadowView intensity](self, "intensity");
    v7 = v6;
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F08]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = xmmword_186682844;
    v16[3] = unk_186682854;
    v16[4] = xmmword_186682864;
    v16[0] = kDarkModeColorMatrix;
    v16[1] = *(_OWORD *)algn_186682834;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v10, CFSTR("inputColorMatrix"));

    v17[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDiffuseShadowView intensity](self, "intensity");
    v7 = v11 / 0.24;

  }
  -[UIView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFilters:", v8);

  -[UIView layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7;
  *(float *)&v15 = v13;
  objc_msgSend(v14, "setShadowOpacity:", v15);

}

- (double)intensity
{
  return self->_intensity;
}

- (UIBezierPath)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
