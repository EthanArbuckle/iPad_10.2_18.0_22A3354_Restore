@implementation SBDropShadowSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBDropShadowSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBDropShadowSettings setOpacity:](self, "setOpacity:", 0.5);
  -[SBDropShadowSettings setRadius:](self, "setRadius:", 75.0);
  -[SBDropShadowSettings setOffsetX:](self, "setOffsetX:", 0.0);
  -[SBDropShadowSettings setOffsetY:](self, "setOffsetY:", 15.0);
  -[SBDropShadowSettings setContinuousCornerRadius:](self, "setContinuousCornerRadius:", 20.0);
}

+ (id)settingsControllerModule
{
  return (id)objc_msgSend(a1, "moduleWithSectionTitle:", CFSTR("Drop Shadow"));
}

+ (id)moduleWithSectionTitle:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D830F0];
  v4 = a3;
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Opacity"), CFSTR("opacity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Shadow Radius"), CFSTR("radius"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue:maxValue:", 0.0, 100.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("X Offset"), CFSTR("offsetX"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue:maxValue:", -30.0, 30.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Y Offset"), CFSTR("offsetY"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minValue:maxValue:", -30.0, 30.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Continuous Corner Radius"), CFSTR("continuousCornerRadius"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minValue:maxValue:", 0.0, 50.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83070];
  v20[0] = v5;
  v20[1] = v7;
  v20[2] = v9;
  v20[3] = v11;
  v20[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sectionWithRows:title:", v15, v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "moduleWithTitle:contents:", CFSTR("Drop Shadow Settings"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (double)offsetX
{
  return self->_offsetX;
}

- (void)setOffsetX:(double)a3
{
  self->_offsetX = a3;
}

- (double)offsetY
{
  return self->_offsetY;
}

- (void)setOffsetY:(double)a3
{
  self->_offsetY = a3;
}

- (double)continuousCornerRadius
{
  return self->_continuousCornerRadius;
}

- (void)setContinuousCornerRadius:(double)a3
{
  self->_continuousCornerRadius = a3;
}

@end
