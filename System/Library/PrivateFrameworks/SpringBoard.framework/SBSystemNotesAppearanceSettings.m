@implementation SBSystemNotesAppearanceSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSystemNotesAppearanceSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBSystemNotesAppearanceSettings setPlatterTintRed:](self, "setPlatterTintRed:", 1.0);
  -[SBSystemNotesAppearanceSettings setPlatterTintGreen:](self, "setPlatterTintGreen:", 1.0);
  -[SBSystemNotesAppearanceSettings setPlatterTintBlue:](self, "setPlatterTintBlue:", 1.0);
  -[SBSystemNotesAppearanceSettings setPlatterTintAlpha:](self, "setPlatterTintAlpha:", 0.05);
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
  void *v20;
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("red"), CFSTR("platterTintRed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "between:and:", 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("green"), CFSTR("platterTintGreen"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "between:and:", 0.0, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("blue"), CFSTR("platterTintBlue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", 0.0, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("alpha"), CFSTR("platterTintAlpha"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "between:and:", 0.0, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83070];
  v21[0] = v4;
  v21[1] = v6;
  v21[2] = v8;
  v21[3] = v10;
  v21[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sectionWithRows:title:", v14, CFSTR("Platter Tint"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83070];
  v20 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "moduleWithTitle:contents:", 0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (double)platterTintRed
{
  return self->_platterTintRed;
}

- (void)setPlatterTintRed:(double)a3
{
  self->_platterTintRed = a3;
}

- (double)platterTintGreen
{
  return self->_platterTintGreen;
}

- (void)setPlatterTintGreen:(double)a3
{
  self->_platterTintGreen = a3;
}

- (double)platterTintBlue
{
  return self->_platterTintBlue;
}

- (void)setPlatterTintBlue:(double)a3
{
  self->_platterTintBlue = a3;
}

- (double)platterTintAlpha
{
  return self->_platterTintAlpha;
}

- (void)setPlatterTintAlpha:(double)a3
{
  self->_platterTintAlpha = a3;
}

@end
