@implementation SBHomeGestureExclusionTrapezoidSettings

- (BOOL)showExclusionTrapezoidDebugView
{
  return self->_showExclusionTrapezoidDebugView;
}

- (void)setDefaultValues
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHomeGestureExclusionTrapezoidSettings;
  -[PTSettings setDefaultValues](&v7, sel_setDefaultValues);
  -[SBHomeGestureExclusionTrapezoidSettings setShowExclusionTrapezoidDebugView:](self, "setShowExclusionTrapezoidDebugView:", 0);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  -[SBHomeGestureExclusionTrapezoidSettings setLandscapeTrapezoidEnabled:](self, "setLandscapeTrapezoidEnabled:", (v4 & 0xFFFFFFFFFFFFFFFBLL) != 1);
  -[SBHomeGestureExclusionTrapezoidSettings setAllowHorizontalSwipesOutsideLandscapeTrapezoid:](self, "setAllowHorizontalSwipesOutsideLandscapeTrapezoid:", 0);
  -[SBHomeGestureExclusionTrapezoidSettings setLandscapeTrapezoidHeight:](self, "setLandscapeTrapezoidHeight:", 18.5);
  -[SBHomeGestureExclusionTrapezoidSettings setLandscapeTrapezoidBaseHeight:](self, "setLandscapeTrapezoidBaseHeight:", 7.5);
  -[SBHomeGestureExclusionTrapezoidSettings setLandscapeTrapezoidAdjacentXDistanceFromEdge:](self, "setLandscapeTrapezoidAdjacentXDistanceFromEdge:", 236.0);
  -[SBHomeGestureExclusionTrapezoidSettings setLandscapeTrapezoidOpposingXDistanceFromEdge:](self, "setLandscapeTrapezoidOpposingXDistanceFromEdge:", 236.0);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  -[SBHomeGestureExclusionTrapezoidSettings setPortraitTrapezoidEnabled:](self, "setPortraitTrapezoidEnabled:", (v6 & 0xFFFFFFFFFFFFFFFBLL) != 1);
  -[SBHomeGestureExclusionTrapezoidSettings setPortraitTrapezoidEnabledOnlyForKeyboards:](self, "setPortraitTrapezoidEnabledOnlyForKeyboards:", 1);
  -[SBHomeGestureExclusionTrapezoidSettings setAllowHorizontalSwipesOutsidePortraitTrapezoid:](self, "setAllowHorizontalSwipesOutsidePortraitTrapezoid:", 1);
  -[SBHomeGestureExclusionTrapezoidSettings setPortraitTrapezoidHeight:](self, "setPortraitTrapezoidHeight:", 24.5);
  -[SBHomeGestureExclusionTrapezoidSettings setPortraitTrapezoidBaseHeight:](self, "setPortraitTrapezoidBaseHeight:", 7.5);
  -[SBHomeGestureExclusionTrapezoidSettings setPortraitTrapezoidAdjacentXDistanceFromEdge:](self, "setPortraitTrapezoidAdjacentXDistanceFromEdge:", 60.0);
  -[SBHomeGestureExclusionTrapezoidSettings setPortraitTrapezoidOpposingXDistanceFromEdge:](self, "setPortraitTrapezoidOpposingXDistanceFromEdge:", 60.0);
}

+ (id)settingsControllerModule
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  void *v55;
  void *v56;
  _QWORD v57[7];
  _QWORD v58[8];

  v58[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("landscapeTrapezoidEnabled == YES"));
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Enable Trapezoid"), CFSTR("landscapeTrapezoidEnabled"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v50;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Allow Horizontal Swipes Outside Trapezoid"), CFSTR("allowHorizontalSwipesOutsideLandscapeTrapezoid"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v48;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Trapezoid Height"), CFSTR("landscapeTrapezoidHeight"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "between:and:", 0.1, 20.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "condition:", v2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v42;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Base Height"), CFSTR("landscapeTrapezoidBaseHeight"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 0.0, 100.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "condition:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v5;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Adjacent Base X Distance From Edge"), CFSTR("landscapeTrapezoidAdjacentXDistanceFromEdge"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "between:and:", 0.0, 500.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)v2;
  objc_msgSend(v7, "condition:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v58[4] = v8;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Opposing Base X Distance From Edge"), CFSTR("landscapeTrapezoidOpposingXDistanceFromEdge"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", 0.0, 500.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "condition:", v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v58[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 6);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:", v52, CFSTR("Landscape Trapezoid"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("portraitTrapezoidEnabled == YES"));
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Enable Trapezoid"), CFSTR("portraitTrapezoidEnabled"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v47;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Allow Horizontal Swipes Outside Trapezoid"), CFSTR("allowHorizontalSwipesOutsidePortraitTrapezoid"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v45;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Only for Keyboards"), CFSTR("portraitTrapezoidEnabledOnlyForKeyboards"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2] = v43;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Trapezoid Height"), CFSTR("portraitTrapezoidHeight"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "between:and:", 0.1, 20.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "condition:", v12);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v57[3] = v39;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Base Height"), CFSTR("portraitTrapezoidBaseHeight"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "between:and:", 0.0, 100.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "condition:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v57[4] = v15;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Adjacent Base X Distance From Edge"), CFSTR("portraitTrapezoidAdjacentXDistanceFromEdge"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "between:and:", 0.0, 500.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)v12;
  objc_msgSend(v17, "condition:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v57[5] = v18;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Opposing Base X Distance From Edge"), CFSTR("portraitTrapezoidOpposingXDistanceFromEdge"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "between:and:", 0.0, 500.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "condition:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v57[6] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 7);
  v22 = objc_claimAutoreleasedReturnValue();

  v23 = (void *)v22;
  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:", v22, CFSTR("Portrait Trapezoid"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Visualize Trapezoids"), CFSTR("showExclusionTrapezoidDebugView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0D83070];
  v56 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sectionWithRows:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rowWithTitle:action:", CFSTR("Restore Defaults"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)MEMORY[0x1E0D83070];
  v55 = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sectionWithRows:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0D83070];
  v54[0] = v51;
  v54[1] = v24;
  v54[2] = v28;
  v54[3] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "moduleWithTitle:contents:", 0, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (void)setShowExclusionTrapezoidDebugView:(BOOL)a3
{
  self->_showExclusionTrapezoidDebugView = a3;
}

- (BOOL)landscapeTrapezoidEnabled
{
  return self->_landscapeTrapezoidEnabled;
}

- (void)setLandscapeTrapezoidEnabled:(BOOL)a3
{
  self->_landscapeTrapezoidEnabled = a3;
}

- (BOOL)allowHorizontalSwipesOutsideLandscapeTrapezoid
{
  return self->_allowHorizontalSwipesOutsideLandscapeTrapezoid;
}

- (void)setAllowHorizontalSwipesOutsideLandscapeTrapezoid:(BOOL)a3
{
  self->_allowHorizontalSwipesOutsideLandscapeTrapezoid = a3;
}

- (double)landscapeTrapezoidHeight
{
  return self->_landscapeTrapezoidHeight;
}

- (void)setLandscapeTrapezoidHeight:(double)a3
{
  self->_landscapeTrapezoidHeight = a3;
}

- (double)landscapeTrapezoidBaseHeight
{
  return self->_landscapeTrapezoidBaseHeight;
}

- (void)setLandscapeTrapezoidBaseHeight:(double)a3
{
  self->_landscapeTrapezoidBaseHeight = a3;
}

- (double)landscapeTrapezoidAdjacentXDistanceFromEdge
{
  return self->_landscapeTrapezoidAdjacentXDistanceFromEdge;
}

- (void)setLandscapeTrapezoidAdjacentXDistanceFromEdge:(double)a3
{
  self->_landscapeTrapezoidAdjacentXDistanceFromEdge = a3;
}

- (double)landscapeTrapezoidOpposingXDistanceFromEdge
{
  return self->_landscapeTrapezoidOpposingXDistanceFromEdge;
}

- (void)setLandscapeTrapezoidOpposingXDistanceFromEdge:(double)a3
{
  self->_landscapeTrapezoidOpposingXDistanceFromEdge = a3;
}

- (BOOL)portraitTrapezoidEnabled
{
  return self->_portraitTrapezoidEnabled;
}

- (void)setPortraitTrapezoidEnabled:(BOOL)a3
{
  self->_portraitTrapezoidEnabled = a3;
}

- (BOOL)portraitTrapezoidEnabledOnlyForKeyboards
{
  return self->_portraitTrapezoidEnabledOnlyForKeyboards;
}

- (void)setPortraitTrapezoidEnabledOnlyForKeyboards:(BOOL)a3
{
  self->_portraitTrapezoidEnabledOnlyForKeyboards = a3;
}

- (BOOL)allowHorizontalSwipesOutsidePortraitTrapezoid
{
  return self->_allowHorizontalSwipesOutsidePortraitTrapezoid;
}

- (void)setAllowHorizontalSwipesOutsidePortraitTrapezoid:(BOOL)a3
{
  self->_allowHorizontalSwipesOutsidePortraitTrapezoid = a3;
}

- (double)portraitTrapezoidHeight
{
  return self->_portraitTrapezoidHeight;
}

- (void)setPortraitTrapezoidHeight:(double)a3
{
  self->_portraitTrapezoidHeight = a3;
}

- (double)portraitTrapezoidBaseHeight
{
  return self->_portraitTrapezoidBaseHeight;
}

- (void)setPortraitTrapezoidBaseHeight:(double)a3
{
  self->_portraitTrapezoidBaseHeight = a3;
}

- (double)portraitTrapezoidAdjacentXDistanceFromEdge
{
  return self->_portraitTrapezoidAdjacentXDistanceFromEdge;
}

- (void)setPortraitTrapezoidAdjacentXDistanceFromEdge:(double)a3
{
  self->_portraitTrapezoidAdjacentXDistanceFromEdge = a3;
}

- (double)portraitTrapezoidOpposingXDistanceFromEdge
{
  return self->_portraitTrapezoidOpposingXDistanceFromEdge;
}

- (void)setPortraitTrapezoidOpposingXDistanceFromEdge:(double)a3
{
  self->_portraitTrapezoidOpposingXDistanceFromEdge = a3;
}

@end
