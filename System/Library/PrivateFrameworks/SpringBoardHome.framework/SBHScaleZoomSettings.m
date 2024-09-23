@implementation SBHScaleZoomSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHScaleZoomSettings;
  -[SBHIconZoomSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBHScaleZoomSettings setCrossfadeWithZoom:](self, "setCrossfadeWithZoom:", 0);
  -[SBHScaleZoomSettings setFadesIconGrid:](self, "setFadesIconGrid:", 0);
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
  objc_super v26;
  _QWORD v27[6];
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v26.receiver = a1;
  v26.super_class = (Class)&OBJC_METACLASS___SBHScaleZoomSettings;
  objc_msgSendSuper2(&v26, sel_settingsControllerModule);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "submoduleWithModule:childSettingsKeyPath:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Crossfade on zoom spring"), CFSTR("crossfadeWithZoom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionWithRows:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0DA9D80], "_moduleWithSectionTitle:delay:frameRate:", CFSTR("Crossfade Animation"), 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submoduleWithModule:childSettingsKeyPath:", v10, CFSTR("crossfadeSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0DA9D80], "_moduleWithSectionTitle:delay:frameRate:", CFSTR("Outer Folder Fade"), 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submoduleWithModule:childSettingsKeyPath:", v13, CFSTR("outerFolderFadeSettings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Fade Icon Grid"), CFSTR("fadesIconGrid"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sectionWithRows:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0DA9D80], "_moduleWithSectionTitle:delay:frameRate:", CFSTR("Icon Grid Fade Animation"), 1, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "submoduleWithModule:childSettingsKeyPath:", v20, CFSTR("iconGridFadeSettings"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0D83078];
  v27[0] = v4;
  v27[1] = v8;
  v27[2] = v11;
  v27[3] = v14;
  v27[4] = v18;
  v27[5] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "moduleWithTitle:contents:", CFSTR("Crossfade Zoom"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)effectiveCrossfadeAnimationSettings
{
  if (-[SBHScaleZoomSettings crossfadeWithZoom](self, "crossfadeWithZoom"))
    -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  else
    -[SBHScaleZoomSettings crossfadeSettings](self, "crossfadeSettings");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SBFAnimationSettings)outerFolderFadeSettings
{
  return *(SBFAnimationSettings **)&self->_crossfadeWithZoom;
}

- (void)setOuterFolderFadeSettings:(id)a3
{
  objc_storeStrong((id *)&self->_crossfadeWithZoom, a3);
}

- (BOOL)crossfadeWithZoom
{
  return *(&self->super._labelAlphaWithZoom + 1);
}

- (void)setCrossfadeWithZoom:(BOOL)a3
{
  *(&self->super._labelAlphaWithZoom + 1) = a3;
}

- (SBFAnimationSettings)crossfadeSettings
{
  return self->_outerFolderFadeSettings;
}

- (void)setCrossfadeSettings:(id)a3
{
  objc_storeStrong((id *)&self->_outerFolderFadeSettings, a3);
}

- (BOOL)fadesIconGrid
{
  return *(&self->super._labelAlphaWithZoom + 2);
}

- (void)setFadesIconGrid:(BOOL)a3
{
  *(&self->super._labelAlphaWithZoom + 2) = a3;
}

- (SBFAnimationSettings)iconGridFadeSettings
{
  return self->_crossfadeSettings;
}

- (void)setIconGridFadeSettings:(id)a3
{
  objc_storeStrong((id *)&self->_crossfadeSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crossfadeSettings, 0);
  objc_storeStrong((id *)&self->_outerFolderFadeSettings, 0);
  objc_storeStrong((id *)&self->_crossfadeWithZoom, 0);
}

@end
