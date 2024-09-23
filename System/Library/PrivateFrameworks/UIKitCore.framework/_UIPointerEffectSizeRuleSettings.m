@implementation _UIPointerEffectSizeRuleSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIPointerEffectSizeRuleSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[_UIPointerEffectSizeRuleSettings setExplicitRequestMultiplier:](self, "setExplicitRequestMultiplier:", 1.4);
  -[_UIPointerEffectSizeRuleSettings setGenericSizeRuleThreshold:](self, "setGenericSizeRuleThreshold:", 125.0);
  -[_UIPointerEffectSizeRuleSettings setNarrowAspectRuleMinorDimensionThreshold:](self, "setNarrowAspectRuleMinorDimensionThreshold:", 50.0);
  -[_UIPointerEffectSizeRuleSettings setNarrowAspectRuleMajorDimensionThreshold:](self, "setNarrowAspectRuleMajorDimensionThreshold:", 180.0);
  -[_UIPointerEffectSizeRuleSettings setPointerSizeRuleMinorDimensionThreshold:](self, "setPointerSizeRuleMinorDimensionThreshold:", 19.0);
  -[_UIPointerEffectSizeRuleSettings setPointerSizeRuleMajorDimensionThreshold:](self, "setPointerSizeRuleMajorDimensionThreshold:", 320.0);
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
  void *v29;
  void *v30;
  void *v32;
  _QWORD v33[4];
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Explicit Request Multiplier"), CFSTR("explicitRequestMultiplier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 1.0, 5.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v4;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Generic Size Rule Threshold"), CFSTR("genericSizeRuleThreshold"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "between:and:", 0.0, 300.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v7, CFSTR("General"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Minor Dimension"), CFSTR("narrowAspectRuleMinorDimensionThreshold"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", 0.0, 100.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v10;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Major Dimension"), CFSTR("narrowAspectRuleMajorDimensionThreshold"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "between:and:", 0.0, 500.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionWithRows:title:", v13, CFSTR("Narrow Aspect Rule"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Minor Dimension"), CFSTR("pointerSizeRuleMinorDimensionThreshold"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "between:and:", 0.0, 100.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v17;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Major Dimension"), CFSTR("pointerSizeRuleMajorDimensionThreshold"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "between:and:", 0.0, 1000.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sectionWithRows:title:", v20, CFSTR("Narrow Aspect Rule"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rowWithTitle:action:", CFSTR("Restore Defaults"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0D83078];
  v34 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sectionWithRows:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1E0D83078];
  v33[0] = v32;
  v33[1] = v14;
  v33[2] = v21;
  v33[3] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "moduleWithTitle:contents:", 0, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (double)explicitRequestMultiplier
{
  return self->_explicitRequestMultiplier;
}

- (void)setExplicitRequestMultiplier:(double)a3
{
  self->_explicitRequestMultiplier = a3;
}

- (double)genericSizeRuleThreshold
{
  return self->_genericSizeRuleThreshold;
}

- (void)setGenericSizeRuleThreshold:(double)a3
{
  self->_genericSizeRuleThreshold = a3;
}

- (double)narrowAspectRuleMinorDimensionThreshold
{
  return self->_narrowAspectRuleMinorDimensionThreshold;
}

- (void)setNarrowAspectRuleMinorDimensionThreshold:(double)a3
{
  self->_narrowAspectRuleMinorDimensionThreshold = a3;
}

- (double)narrowAspectRuleMajorDimensionThreshold
{
  return self->_narrowAspectRuleMajorDimensionThreshold;
}

- (void)setNarrowAspectRuleMajorDimensionThreshold:(double)a3
{
  self->_narrowAspectRuleMajorDimensionThreshold = a3;
}

- (double)pointerSizeRuleMinorDimensionThreshold
{
  return self->_pointerSizeRuleMinorDimensionThreshold;
}

- (void)setPointerSizeRuleMinorDimensionThreshold:(double)a3
{
  self->_pointerSizeRuleMinorDimensionThreshold = a3;
}

- (double)pointerSizeRuleMajorDimensionThreshold
{
  return self->_pointerSizeRuleMajorDimensionThreshold;
}

- (void)setPointerSizeRuleMajorDimensionThreshold:(double)a3
{
  self->_pointerSizeRuleMajorDimensionThreshold = a3;
}

@end
