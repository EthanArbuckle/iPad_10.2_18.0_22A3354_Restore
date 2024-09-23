@implementation SBHCenterZoomSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHCenterZoomSettings;
  -[SBHIconZoomSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBHCenterZoomSettings setDockMass:](self, "setDockMass:", 4.0);
  -[SBHCenterZoomSettings setCenterRowCoordinate:](self, "setCenterRowCoordinate:", 2.5);
}

+ (id)settingsControllerModule
{
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  _QWORD v31[4];
  _QWORD v32[3];
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("centralAnimationSettings.animationType == %d"), 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Coordinate of center row"), CFSTR("centerRowCoordinate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "precision:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueValidator:", &__block_literal_global_82);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30.receiver = a1;
  v7 = (void *)MEMORY[0x1E0D83078];
  v30.super_class = (Class)&OBJC_METACLASS___SBHCenterZoomSettings;
  objc_msgSendSuper2(&v30, sel_settingsControllerModule);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "submoduleWithModule:childSettingsKeyPath:", v8, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Dock mass"), CFSTR("dockMass"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", 0.0, 10000.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:condition:", v11, 0, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Distance effect"), CFSTR("distanceEffect"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "possibleValues:titles:", &unk_1E8E17660, &unk_1E8E17648);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v13;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Mass for first \"hop\"), CFSTR("firstHopIncrement"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "between:and:", 0.0, 100.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "conditionFormat:", CFSTR("distanceEffect != 0"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v16;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Hop mass acceleration"), CFSTR("hopIncrementAcceleration"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "between:and:", -50.0, 50.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "conditionFormat:", CFSTR("distanceEffect != 0"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:condition:", v20, 0, v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0D83078];
  v31[0] = v29;
  v31[1] = v28;
  v31[2] = v27;
  v31[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "moduleWithTitle:contents:", CFSTR("Center Zoom"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

uint64_t __49__SBHCenterZoomSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  float v2;
  double v3;

  objc_msgSend(a2, "floatValue");
  v3 = fmax(roundf(v2 + v2) * 0.5, 1.0);
  if (v3 > 5.0)
    v3 = 5.0;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
}

- (BOOL)preferCenterOfIconGrid
{
  return *(&self->super._labelAlphaWithZoom + 1);
}

- (void)setPreferCenterOfIconGrid:(BOOL)a3
{
  *(&self->super._labelAlphaWithZoom + 1) = a3;
}

- (double)centerRowCoordinate
{
  return *(double *)&self->_preferCenterOfIconGrid;
}

- (void)setCenterRowCoordinate:(double)a3
{
  *(double *)&self->_preferCenterOfIconGrid = a3;
}

- (int64_t)distanceEffect
{
  return *(_QWORD *)&self->_centerRowCoordinate;
}

- (void)setDistanceEffect:(int64_t)a3
{
  *(_QWORD *)&self->_centerRowCoordinate = a3;
}

- (double)firstHopIncrement
{
  return *(double *)&self->_distanceEffect;
}

- (void)setFirstHopIncrement:(double)a3
{
  *(double *)&self->_distanceEffect = a3;
}

- (double)hopIncrementAcceleration
{
  return self->_firstHopIncrement;
}

- (void)setHopIncrementAcceleration:(double)a3
{
  self->_firstHopIncrement = a3;
}

- (double)dockMass
{
  return self->_hopIncrementAcceleration;
}

- (void)setDockMass:(double)a3
{
  self->_hopIncrementAcceleration = a3;
}

- (BOOL)zoomViewBelowIcons
{
  return *(&self->super._labelAlphaWithZoom + 2);
}

- (void)setZoomViewBelowIcons:(BOOL)a3
{
  *(&self->super._labelAlphaWithZoom + 2) = a3;
}

@end
