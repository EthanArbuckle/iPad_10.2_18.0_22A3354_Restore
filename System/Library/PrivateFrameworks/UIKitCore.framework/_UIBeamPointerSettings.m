@implementation _UIBeamPointerSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIBeamPointerSettings;
  -[_UIFreeformPointerSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[_UIFreeformPointerSettings setSlipFactorX:](self, "setSlipFactorX:", 0.5);
  -[_UIFreeformPointerSettings setSlipFactorY:](self, "setSlipFactorY:", 0.5);
  -[_UIBeamPointerSettings setMinLength:](self, "setMinLength:", 24.0);
  -[_UIBeamPointerSettings setMaxLength:](self, "setMaxLength:", 100.0);
  -[_UIBeamPointerSettings setMaxSnapLength:](self, "setMaxSnapLength:", 100.0);
  -[_UIBeamPointerSettings setWidth:](self, "setWidth:", 3.0);
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
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[3];
  void *v37;
  _QWORD v38[4];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Slip X"), CFSTR("slipFactorX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 0.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precision:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v5;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Slip Y"), CFSTR("slipFactorY"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "between:and:", 0.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "precision:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v9, CFSTR("Pointer Motion"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Min Length"), CFSTR("minLength"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "between:and:", 0.0, 100.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "precision:", 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v32;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Max Length"), CFSTR("maxLength"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "between:and:", 0.0, 10000.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "precision:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v12;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Max Snap Length"), CFSTR("maxSnapLength"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "between:and:", 0.0, 10000.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "precision:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v15;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Width"), CFSTR("width"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "between:and:", 0.0, 100.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "precision:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sectionWithRows:title:", v19, CFSTR("Beam Attributes"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rowWithTitle:action:", CFSTR("Restore Defaults"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0D83078];
  v37 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sectionWithRows:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0D83078];
  v36[0] = v35;
  v36[1] = v31;
  v36[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "moduleWithTitle:contents:", 0, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (double)minLength
{
  return self->_minLength;
}

- (void)setMinLength:(double)a3
{
  self->_minLength = a3;
}

- (double)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(double)a3
{
  self->_maxLength = a3;
}

- (double)maxSnapLength
{
  return self->_maxSnapLength;
}

- (void)setMaxSnapLength:(double)a3
{
  self->_maxSnapLength = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

@end
