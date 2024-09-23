@implementation SBPIPSettings

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[7];
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[2];
  uint64_t v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83070];
  v49[0] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:", v5, CFSTR("Restore Default Values"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("User Interaction"), CFSTR("interactionSettings"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D83070];
  v48 = v6;
  v8 = v6;
  v40 = (void *)v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionWithRows:title:", v9, CFSTR("User interaction"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("AutoPIP and Fluid Restore"), CFSTR("fluidTransitionsSettings"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D83070];
  v47[0] = v8;
  v47[1] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:title:", v12, CFSTR("Morph animations"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Stash Visuals"), CFSTR("stashVisualSettings"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D83070];
  v46 = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sectionWithRows:title:", v15, CFSTR("Stash settings"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83040];
  NSStringFromSelector(sel_fadeInOutSettings);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rowWithTitle:childSettingsKeyPath:", CFSTR("Fade in/out"), v17);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83070];
  v45 = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sectionWithRows:title:", v19, CFSTR("Fade in/out animations"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Drop Shadow"), CFSTR("shadowSettings"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0D83070];
  v44 = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sectionWithRows:title:", v22, CFSTR("Drop Shadow Settings"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0D83040];
  NSStringFromSelector(sel_sizingSettings);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rowWithTitle:childSettingsKeyPath:", CFSTR("Sizing settings"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0D83070];
  v43 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sectionWithRows:title:", v28, CFSTR("Sizing"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0D83070];
  v42[0] = v34;
  v42[1] = v10;
  v42[2] = v13;
  v42[3] = v36;
  v42[4] = v20;
  v42[5] = v23;
  v42[6] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "moduleWithTitle:contents:", CFSTR("PIP Settings"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (SBPIPStashVisualSettings)stashVisualSettings
{
  return self->_stashVisualSettings;
}

- (void)setStashVisualSettings:(id)a3
{
  objc_storeStrong((id *)&self->_stashVisualSettings, a3);
}

- (SBPIPInteractionSettings)interactionSettings
{
  return self->_interactionSettings;
}

- (void)setInteractionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_interactionSettings, a3);
}

- (SBPIPFluidTransitionsSettings)fluidTransitionsSettings
{
  return self->_fluidTransitionsSettings;
}

- (void)setFluidTransitionsSettings:(id)a3
{
  objc_storeStrong((id *)&self->_fluidTransitionsSettings, a3);
}

- (SBPIPFadeInOutSettings)fadeInOutSettings
{
  return self->_fadeInOutSettings;
}

- (void)setFadeInOutSettings:(id)a3
{
  objc_storeStrong((id *)&self->_fadeInOutSettings, a3);
}

- (SBPIPShadowSettings)shadowSettings
{
  return self->_shadowSettings;
}

- (void)setShadowSettings:(id)a3
{
  objc_storeStrong((id *)&self->_shadowSettings, a3);
}

- (SBPIPSizingSettings)sizingSettings
{
  return self->_sizingSettings;
}

- (void)setSizingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_sizingSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizingSettings, 0);
  objc_storeStrong((id *)&self->_shadowSettings, 0);
  objc_storeStrong((id *)&self->_fadeInOutSettings, 0);
  objc_storeStrong((id *)&self->_fluidTransitionsSettings, 0);
  objc_storeStrong((id *)&self->_interactionSettings, 0);
  objc_storeStrong((id *)&self->_stashVisualSettings, 0);
}

@end
