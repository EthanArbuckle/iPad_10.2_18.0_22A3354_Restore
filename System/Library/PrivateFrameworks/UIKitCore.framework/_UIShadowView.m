@implementation _UIShadowView

- (void)didMoveToSuperview
{
  void *v3;

  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[_UIShadowView _updateShadowVisualStyling](self, "_updateShadowVisualStyling");
}

- (void)setUseLowerIntensity:(BOOL)a3
{
  if (self->_useLowerIntensity != a3)
  {
    self->_useLowerIntensity = a3;
    -[_UIShadowView _updateShadowVisualStyling](self, "_updateShadowVisualStyling");
  }
}

- (void)_updateShadowVisualStyling
{
  _BOOL4 v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  __int128 v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  float v21;
  float v22;
  int v23;
  float v24;
  float v25;
  float v26;
  uint64_t v27;
  int v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v3 = -[_UIShadowView useLowerIntensity](self, "useLowerIntensity");
  v4 = -0.17188;
  if (v3)
    v4 = -0.1875;
  v5 = 0.67188;
  if (v3)
    v5 = 0.79688;
  v16 = __PAIR64__(LODWORD(v4), LODWORD(v5));
  v17 = xmmword_18667F2D0;
  v6 = 0.57812;
  if (v3)
    v6 = 0.71875;
  v7 = 0.078125;
  if (v3)
    v7 = 0.09375;
  v18 = __PAIR64__(LODWORD(v7), LODWORD(v6));
  v8 = 0.82812;
  if (v3)
    v8 = 0.96875;
  v9 = -0.015625;
  if (!v3)
    v9 = 0.0;
  v10 = -0.23438;
  if (v3)
    v10 = -0.25;
  v11 = -0.45312;
  if (v3)
    v11 = -0.5;
  v19 = 0x3C80000000000000;
  v20 = -1111490560;
  v21 = v4;
  v22 = v8;
  v23 = 0;
  v24 = v9;
  v25 = v10;
  v26 = v11;
  v27 = 0x3F800000BDC00000;
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F08], v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forKey:", v12, CFSTR("inputColorMatrix"));
  v29[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFilters:", v14);

}

- (BOOL)useLowerIntensity
{
  return self->_useLowerIntensity;
}

@end
