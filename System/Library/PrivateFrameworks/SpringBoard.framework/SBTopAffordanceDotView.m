@implementation SBTopAffordanceDotView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (CAColorMatrix)lightDefaultColorMatrix
{
  *retstr = *(CAColorMatrix *)byte_1D0E89520;
  return result;
}

+ (CAColorMatrix)lightHighlightedColorMatrix
{
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  retstr->var18 = 0.75;
  return result;
}

+ (CAColorMatrix)darkDefaultColorMatrix
{
  *(_OWORD *)&retstr->var0 = xmmword_1D0E89570;
  *(_OWORD *)&retstr->var4 = xmmword_1D0E89580;
  *(_OWORD *)&retstr->var8 = xmmword_1D0E89590;
  *(_OWORD *)&retstr->var12 = xmmword_1D0E895A0;
  *(_OWORD *)&retstr->var16 = *(_OWORD *)&byte_1D0E89520[64];
  return result;
}

+ (CAColorMatrix)darkHighlightedColorMatrix
{
  *(_OWORD *)&retstr->var0 = xmmword_1D0E895B0;
  *(_OWORD *)&retstr->var4 = xmmword_1D0E895C0;
  *(_OWORD *)&retstr->var8 = xmmword_1D0E895D0;
  *(_OWORD *)&retstr->var12 = xmmword_1D0E895E0;
  *(_OWORD *)&retstr->var16 = *(_OWORD *)&byte_1D0E89520[64];
  return result;
}

- (SBTopAffordanceDotView)initWithFrame:(CGRect)a3
{
  SBTopAffordanceDotView *v3;
  SBTopAffordanceDotView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)SBTopAffordanceDotView;
  v3 = -[SBTopAffordanceDotView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SBTopAffordanceDotView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBTopAffordanceDotView _backdropLayer](v4, "_backdropLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsInPlaceFiltering:", 1);
    objc_msgSend(v5, "setCornerCurve:", *MEMORY[0x1E0CD2A60]);
    objc_msgSend(v5, "setCornerRadius:", 2.5);
    -[SBTopAffordanceDotView _makeBackdropLayerFilters](v4, "_makeBackdropLayerFilters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFilters:", v6);

    -[SBTopAffordanceDotView widthAnchor](v4, "widthAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToConstant:", 5.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    -[SBTopAffordanceDotView heightAnchor](v4, "heightAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTopAffordanceDotView widthAnchor](v4, "widthAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTopAffordanceDotView addConstraints:](v4, "addConstraints:", v12);

  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[SBTopAffordanceDotView _updateBackdropLayerFilters](self, "_updateBackdropLayerFilters");
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("filters.colorMatrix.inputColorMatrix")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBTopAffordanceDotView;
    v5 = -[SBTopAffordanceDotView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (CAColorMatrix)_effectiveColorMatrix
{
  void *v5;
  uint64_t v6;
  CAColorMatrix *result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  -[SBTopAffordanceDotView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  if (v6 != 2)
  {
    if (self->_highlighted)
    {
      result = (CAColorMatrix *)objc_opt_class();
      if (result)
      {
        result = (CAColorMatrix *)-[CAColorMatrix lightHighlightedColorMatrix](result, "lightHighlightedColorMatrix");
        goto LABEL_13;
      }
    }
    else
    {
      result = (CAColorMatrix *)objc_opt_class();
      if (result)
      {
        result = (CAColorMatrix *)-[CAColorMatrix lightDefaultColorMatrix](result, "lightDefaultColorMatrix");
        goto LABEL_13;
      }
    }
LABEL_12:
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v8 = 0u;
    goto LABEL_13;
  }
  if (!self->_highlighted)
  {
    result = (CAColorMatrix *)objc_opt_class();
    if (result)
    {
      result = (CAColorMatrix *)-[CAColorMatrix darkDefaultColorMatrix](result, "darkDefaultColorMatrix");
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  result = (CAColorMatrix *)objc_opt_class();
  if (!result)
    goto LABEL_12;
  result = (CAColorMatrix *)-[CAColorMatrix darkHighlightedColorMatrix](result, "darkHighlightedColorMatrix");
LABEL_13:
  *(_OWORD *)&retstr->var8 = v10;
  *(_OWORD *)&retstr->var12 = v11;
  *(_OWORD *)&retstr->var16 = v12;
  *(_OWORD *)&retstr->var0 = v8;
  *(_OWORD *)&retstr->var4 = v9;
  return result;
}

- (id)_makeBackdropLayerFilters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", CFSTR("colorMatrix"));
  v4 = (void *)MEMORY[0x1E0CB3B18];
  -[SBTopAffordanceDotView _effectiveColorMatrix](self, "_effectiveColorMatrix");
  objc_msgSend(v4, "valueWithCAColorMatrix:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, *MEMORY[0x1E0CD2D20]);

  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_updateBackdropLayerFilters
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[SBTopAffordanceDotView _backdropLayer](self, "_backdropLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3B18];
  -[SBTopAffordanceDotView _effectiveColorMatrix](self, "_effectiveColorMatrix");
  objc_msgSend(v4, "valueWithCAColorMatrix:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKeyPath:", v5, CFSTR("filters.colorMatrix.inputColorMatrix"));

}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);
}

@end
