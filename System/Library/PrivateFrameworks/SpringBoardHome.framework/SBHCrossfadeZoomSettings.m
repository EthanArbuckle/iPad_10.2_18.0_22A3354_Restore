@implementation SBHCrossfadeZoomSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHCrossfadeZoomSettings;
  -[SBHScaleZoomSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBHCrossfadeZoomSettings setMorphWithZoom:](self, "setMorphWithZoom:", 1);
  -[SBHScaleZoomSettings setFadesIconGrid:](self, "setFadesIconGrid:", 1);
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
  _QWORD v17[3];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  +[SBHScaleZoomSettings settingsControllerModule](SBHScaleZoomSettings, "settingsControllerModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "submoduleWithModule:childSettingsKeyPath:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Morph on zoom spring"), CFSTR("morphWithZoom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionWithRows:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0DA9D80], "_moduleWithSectionTitle:delay:frameRate:", CFSTR("Morph Animation"), 1, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("morphWithZoom == NO"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submoduleWithModule:childSettingsKeyPath:condition:", v10, CFSTR("morphSettings"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83078];
  v17[0] = v4;
  v17[1] = v8;
  v17[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moduleWithTitle:contents:", CFSTR("Crossfade Zoom"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)effectiveMorphAnimationSettings
{
  if (-[SBHCrossfadeZoomSettings morphWithZoom](self, "morphWithZoom"))
    -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  else
    -[SBHCrossfadeZoomSettings morphSettings](self, "morphSettings");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)morphWithZoom
{
  return (BOOL)self->super._iconGridFadeSettings;
}

- (void)setMorphWithZoom:(BOOL)a3
{
  LOBYTE(self->super._iconGridFadeSettings) = a3;
}

- (SBFAnimationSettings)morphSettings
{
  return *(SBFAnimationSettings **)&self->_morphWithZoom;
}

- (void)setMorphSettings:(id)a3
{
  objc_storeStrong((id *)&self->_morphWithZoom, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_morphWithZoom, 0);
}

@end
