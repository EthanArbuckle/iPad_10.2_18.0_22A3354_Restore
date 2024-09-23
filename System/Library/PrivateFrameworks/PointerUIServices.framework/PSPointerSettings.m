@implementation PSPointerSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSPointerSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PSPointerSettings setMaterialAlphaDot:](self, "setMaterialAlphaDot:", 0.85);
  -[PSPointerSettings setMaterialAlphaIBeam:](self, "setMaterialAlphaIBeam:", 1.0);
  -[PSPointerSettings setMaterialAlphaSmallItemLight:](self, "setMaterialAlphaSmallItemLight:", 0.25);
  -[PSPointerSettings setMaterialAlphaSmallItemDark:](self, "setMaterialAlphaSmallItemDark:", 0.3);
  -[PSPointerSettings setMaterialAlphaSmallItemDarkHighContrast:](self, "setMaterialAlphaSmallItemDarkHighContrast:", 0.3);
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
  void *v22;
  void *v23;
  _QWORD v24[2];
  void *v25;
  _QWORD v26[6];

  v26[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Dot"), CFSTR("materialAlphaDot"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "between:and:", 0.0, 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("I-Beam"), CFSTR("materialAlphaIBeam"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 0.0, 1.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Small Item Light"), CFSTR("materialAlphaSmallItemLight"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "between:and:", 0.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Small Item Dark"), CFSTR("materialAlphaSmallItemDark"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "between:and:", 0.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Small Item Dark High Contrast"), CFSTR("materialAlphaSmallItemDarkHighContrast"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "between:and:", 0.0, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D83078];
  v26[0] = v23;
  v26[1] = v22;
  v26[2] = v5;
  v26[3] = v7;
  v26[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:title:", v11, CFSTR("Material Alpha"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:action:", CFSTR("Restore Defaults"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83078];
  v25 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionWithRows:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v18;
  v24[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83078], "moduleWithTitle:contents:", 0, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (double)materialAlphaDot
{
  return self->_materialAlphaDot;
}

- (void)setMaterialAlphaDot:(double)a3
{
  self->_materialAlphaDot = a3;
}

- (double)materialAlphaIBeam
{
  return self->_materialAlphaIBeam;
}

- (void)setMaterialAlphaIBeam:(double)a3
{
  self->_materialAlphaIBeam = a3;
}

- (double)materialAlphaSmallItemLight
{
  return self->_materialAlphaSmallItemLight;
}

- (void)setMaterialAlphaSmallItemLight:(double)a3
{
  self->_materialAlphaSmallItemLight = a3;
}

- (double)materialAlphaSmallItemDark
{
  return self->_materialAlphaSmallItemDark;
}

- (void)setMaterialAlphaSmallItemDark:(double)a3
{
  self->_materialAlphaSmallItemDark = a3;
}

- (double)materialAlphaSmallItemDarkHighContrast
{
  return self->_materialAlphaSmallItemDarkHighContrast;
}

- (void)setMaterialAlphaSmallItemDarkHighContrast:(double)a3
{
  self->_materialAlphaSmallItemDarkHighContrast = a3;
}

@end
