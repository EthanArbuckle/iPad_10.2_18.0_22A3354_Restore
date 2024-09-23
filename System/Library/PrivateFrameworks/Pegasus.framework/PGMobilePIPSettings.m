@implementation PGMobilePIPSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGMobilePIPSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  self->_shadowOffsetX = 0.0;
  self->_shadowOffsetY = 15.0;
  self->_shadowOpacity = 0.5;
  self->_shadowRadius = 75.0;
  self->_shadowContinuousCornerRadius = 20.0;
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[2];
  void *v36;
  _QWORD v37[6];

  v37[5] = *MEMORY[0x1E0C80C00];
  v28 = (void *)MEMORY[0x1E0D83078];
  v2 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_shadowOpacity);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:valueKeyPath:", CFSTR("Opacity"), v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "minValue:maxValue:", 0.0, 1.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v32;
  v3 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_shadowRadius);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Radius"), v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "minValue:maxValue:", 0.0, 100.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v27;
  v4 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_shadowOffsetX);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Offset X"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue:maxValue:", -30.0, 30.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v7;
  v8 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_shadowOffsetY);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:valueKeyPath:", CFSTR("Offset Y"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minValue:maxValue:", -30.0, 30.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v11;
  v12 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_shadowContinuousCornerRadius);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:valueKeyPath:", CFSTR("Continuous Corner Radius"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minValue:maxValue:", 0.0, 50.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sectionWithRows:title:", v16, CFSTR("PiP Shadow Settings"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:action:", CFSTR("Restore Defaults"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D83078];
  v36 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sectionWithRows:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0D83078];
  v35[0] = v29;
  v35[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "moduleWithTitle:contents:", CFSTR("PIP"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (void)setShadowOpacity:(double)a3
{
  self->_shadowOpacity = a3;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
}

- (double)shadowOffsetX
{
  return self->_shadowOffsetX;
}

- (void)setShadowOffsetX:(double)a3
{
  self->_shadowOffsetX = a3;
}

- (double)shadowOffsetY
{
  return self->_shadowOffsetY;
}

- (void)setShadowOffsetY:(double)a3
{
  self->_shadowOffsetY = a3;
}

- (double)shadowContinuousCornerRadius
{
  return self->_shadowContinuousCornerRadius;
}

- (void)setShadowContinuousCornerRadius:(double)a3
{
  self->_shadowContinuousCornerRadius = a3;
}

@end
