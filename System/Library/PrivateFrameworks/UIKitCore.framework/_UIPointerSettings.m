@implementation _UIPointerSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIPointerSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[_UIPointerSettings setShowRegions:](self, "setShowRegions:", 0);
  -[_UIPointerSettings setShowEffectPlatter:](self, "setShowEffectPlatter:", 0);
  -[_UIPointerSettings setShowMenuPressDuration:](self, "setShowMenuPressDuration:", 0);
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
  _QWORD v34[3];
  _QWORD v35[5];
  _QWORD v36[3];
  _QWORD v37[5];
  _QWORD v38[6];

  v38[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v21 = (id)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Size Rule Settings"), CFSTR("sizeRuleSettings"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v33;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Highlight Effect"), CFSTR("highlightEffectSettings"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v32;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Lift Effect"), CFSTR("liftEffectSettings"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v31;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Hover Effect"), CFSTR("hoverEffectSettings"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v30;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("SB App Icon Effect"), CFSTR("SBAppIconEffectSettings"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v28, CFSTR("Effect Settings"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v27;
  v3 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Freeform Pointer"), CFSTR("freeformPointerSettings"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v26;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Beam"), CFSTR("beamSettings"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v25;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Link Pointer"), CFSTR("linkPointerSettings"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v23, CFSTR("Special Pointer Settings"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v20;
  v4 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Text Interactions"), CFSTR("textSettings"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v19;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Button Interactions"), CFSTR("buttonSettings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v18;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("NavigationBar & Toolbar Interactions"), CFSTR("navigationAndToolbarSettings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v17;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("TabBar Interactions"), CFSTR("tabBarSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v5;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("SearchBar Interactions"), CFSTR("searchBarSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:", v7, CFSTR("Pointer Related Behavior Settings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v8;
  v9 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Pointer Regions"), CFSTR("showRegions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v10;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Effect Platter Debug Border"), CFSTR("showEffectPlatter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v11;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Context Menu Press Duration"), CFSTR("showMenuPressDuration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:title:", v13, CFSTR("Debugging"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "moduleWithTitle:contents:", CFSTR("UIKit Pointer Settings"), v15);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (BOOL)showRegions
{
  return self->_showRegions;
}

- (void)setShowRegions:(BOOL)a3
{
  self->_showRegions = a3;
}

- (BOOL)showEffectPlatter
{
  return self->_showEffectPlatter;
}

- (void)setShowEffectPlatter:(BOOL)a3
{
  self->_showEffectPlatter = a3;
}

- (BOOL)showMenuPressDuration
{
  return self->_showMenuPressDuration;
}

- (void)setShowMenuPressDuration:(BOOL)a3
{
  self->_showMenuPressDuration = a3;
}

- (_UIPointerEffectSizeRuleSettings)sizeRuleSettings
{
  return self->_sizeRuleSettings;
}

- (void)setSizeRuleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_sizeRuleSettings, a3);
}

- (_UIFreeformPointerSettings)freeformPointerSettings
{
  return self->_freeformPointerSettings;
}

- (void)setFreeformPointerSettings:(id)a3
{
  objc_storeStrong((id *)&self->_freeformPointerSettings, a3);
}

- (_UIBeamPointerSettings)beamSettings
{
  return self->_beamSettings;
}

- (void)setBeamSettings:(id)a3
{
  objc_storeStrong((id *)&self->_beamSettings, a3);
}

- (_UILinkPointerSettings)linkPointerSettings
{
  return self->_linkPointerSettings;
}

- (void)setLinkPointerSettings:(id)a3
{
  objc_storeStrong((id *)&self->_linkPointerSettings, a3);
}

- (_UIPointerHighlightEffectSettings)highlightEffectSettings
{
  return self->_highlightEffectSettings;
}

- (void)setHighlightEffectSettings:(id)a3
{
  objc_storeStrong((id *)&self->_highlightEffectSettings, a3);
}

- (_UIPointerLiftEffectSettings)liftEffectSettings
{
  return self->_liftEffectSettings;
}

- (void)setLiftEffectSettings:(id)a3
{
  objc_storeStrong((id *)&self->_liftEffectSettings, a3);
}

- (_UIPointerHoverEffectSettings)hoverEffectSettings
{
  return self->_hoverEffectSettings;
}

- (void)setHoverEffectSettings:(id)a3
{
  objc_storeStrong((id *)&self->_hoverEffectSettings, a3);
}

- (_UIPointerSBAppIconEffectSettings)SBAppIconEffectSettings
{
  return self->_SBAppIconEffectSettings;
}

- (void)setSBAppIconEffectSettings:(id)a3
{
  objc_storeStrong((id *)&self->_SBAppIconEffectSettings, a3);
}

- (_UIPointerTextBehaviorSettings)textSettings
{
  return self->_textSettings;
}

- (void)setTextSettings:(id)a3
{
  objc_storeStrong((id *)&self->_textSettings, a3);
}

- (_UIButtonBehaviorSettings)buttonSettings
{
  return self->_buttonSettings;
}

- (void)setButtonSettings:(id)a3
{
  objc_storeStrong((id *)&self->_buttonSettings, a3);
}

- (_UINavigationAndToolbarBehaviorSettings)navigationAndToolbarSettings
{
  return self->_navigationAndToolbarSettings;
}

- (void)setNavigationAndToolbarSettings:(id)a3
{
  objc_storeStrong((id *)&self->_navigationAndToolbarSettings, a3);
}

- (_UITabBarBehaviorSettings)tabBarSettings
{
  return self->_tabBarSettings;
}

- (void)setTabBarSettings:(id)a3
{
  objc_storeStrong((id *)&self->_tabBarSettings, a3);
}

- (_UISearchBarBehaviorSettings)searchBarSettings
{
  return self->_searchBarSettings;
}

- (void)setSearchBarSettings:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBarSettings, 0);
  objc_storeStrong((id *)&self->_tabBarSettings, 0);
  objc_storeStrong((id *)&self->_navigationAndToolbarSettings, 0);
  objc_storeStrong((id *)&self->_buttonSettings, 0);
  objc_storeStrong((id *)&self->_textSettings, 0);
  objc_storeStrong((id *)&self->_SBAppIconEffectSettings, 0);
  objc_storeStrong((id *)&self->_hoverEffectSettings, 0);
  objc_storeStrong((id *)&self->_liftEffectSettings, 0);
  objc_storeStrong((id *)&self->_highlightEffectSettings, 0);
  objc_storeStrong((id *)&self->_linkPointerSettings, 0);
  objc_storeStrong((id *)&self->_beamSettings, 0);
  objc_storeStrong((id *)&self->_freeformPointerSettings, 0);
  objc_storeStrong((id *)&self->_sizeRuleSettings, 0);
}

@end
