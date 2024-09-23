@implementation _UIActivityIndicatorSettings

- (double)fullLoopDuration
{
  return self->_fullLoopDuration;
}

- (BOOL)customColor
{
  return self->_customColor;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIActivityIndicatorSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[_UIActivityIndicatorSettings setFullLoopDuration:](self, "setFullLoopDuration:", 0.8);
  -[_UIActivityIndicatorSettings setCustomColor:](self, "setCustomColor:", 0);
  -[_UIActivityIndicatorSettings setRedValue:](self, "setRedValue:", 60.0);
  -[_UIActivityIndicatorSettings setGreenValue:](self, "setGreenValue:", 60.0);
  -[_UIActivityIndicatorSettings setBlueValue:](self, "setBlueValue:", 67.0);
  -[_UIActivityIndicatorSettings setAlphaValue:](self, "setAlphaValue:", 0.6);
}

- (void)setRedValue:(double)a3
{
  self->_redValue = a3;
}

- (void)setGreenValue:(double)a3
{
  self->_greenValue = a3;
}

- (void)setFullLoopDuration:(double)a3
{
  self->_fullLoopDuration = a3;
}

- (void)setCustomColor:(BOOL)a3
{
  self->_customColor = a3;
}

- (void)setBlueValue:(double)a3
{
  self->_blueValue = a3;
}

- (void)setAlphaValue:(double)a3
{
  self->_alphaValue = a3;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  void *v35;
  _QWORD v36[5];

  v36[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v21 = (id)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Duration"), CFSTR("fullLoopDuration"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "between:and:", 0.0, 5.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "precision:", 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v29, CFSTR("Animation"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v28;
  v3 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Custom Color"), CFSTR("customColor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v27;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Red"), CFSTR("redValue"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "between:and:", 0.0, 255.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "precision:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v24;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Green"), CFSTR("greenValue"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "between:and:", 0.0, 255.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "precision:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v19;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Blue"), CFSTR("blueValue"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "between:and:", 0.0, 255.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "precision:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v4;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Alpha"), CFSTR("alphaValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "between:and:", 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v7, CFSTR("Color"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v8;
  v9 = (void *)MEMORY[0x1E0D83078];
  v10 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:action:", CFSTR("Restore Defaults"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "moduleWithTitle:contents:", 0, v15);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (double)redValue
{
  return self->_redValue;
}

- (double)greenValue
{
  return self->_greenValue;
}

- (double)blueValue
{
  return self->_blueValue;
}

- (double)alphaValue
{
  return self->_alphaValue;
}

@end
