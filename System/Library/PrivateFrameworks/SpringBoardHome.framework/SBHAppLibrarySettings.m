@implementation SBHAppLibrarySettings

- (void)setDefaultValues
{
  -[SBHAppLibrarySettings setMinimumNumberOfIconsToShowSectionHeaderInDeweySearch:](self, "setMinimumNumberOfIconsToShowSectionHeaderInDeweySearch:", 75);
  -[SBHAppLibrarySettings setCriticalDismissalThresholdDurationFactor:](self, "setCriticalDismissalThresholdDurationFactor:", 0.0);
  -[SBHAppLibrarySettings setMinimumVelocityForSwipeToDismiss:](self, "setMinimumVelocityForSwipeToDismiss:", 450.0);
  -[SBHAppLibrarySettings setMinimumTranslationFractionForSwipeToDismiss:](self, "setMinimumTranslationFractionForSwipeToDismiss:", 0.25);
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[3];
  _QWORD v28[3];
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83078];
  v30[0] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:", v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Section Header Minimum Icons"), CFSTR("minimumNumberOfIconsToShowSectionHeaderInDeweySearch"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue:maxValue:", 25.0, 150.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setValueValidatator:", &__block_literal_global_49);
  v7 = (void *)MEMORY[0x1E0D83078];
  v29 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionWithRows:title:", v8, CFSTR("Search"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Critical Dismissal Duration Factor"), CFSTR("criticalDismissalThresholdDurationFactor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "between:and:", 0.0, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "precision:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v12;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Minimum Velocity for Swipe To Dismiss"), CFSTR("minimumVelocityForSwipeToDismiss"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "minValue:maxValue:", 100.0, 2500.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v14;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Minimum Translation Fraction for Swipe To Dismiss"), CFSTR("minimumTranslationFractionForSwipeToDismiss"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "minValue:maxValue:", 0.0, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:title:", v17, CFSTR("Trailing Page"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0D83078];
  v27[0] = v23;
  v27[1] = v18;
  v27[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "moduleWithTitle:contents:", CFSTR("Icons"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

uint64_t __49__SBHAppLibrarySettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  float v3;
  double v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "floatValue");
  *(float *)&v4 = floorf(v3);
  return objc_msgSend(v2, "numberWithFloat:", v4);
}

- (unint64_t)minimumNumberOfIconsToShowSectionHeaderInDeweySearch
{
  return self->_minimumNumberOfIconsToShowSectionHeaderInDeweySearch;
}

- (void)setMinimumNumberOfIconsToShowSectionHeaderInDeweySearch:(unint64_t)a3
{
  self->_minimumNumberOfIconsToShowSectionHeaderInDeweySearch = a3;
}

- (double)criticalDismissalThresholdDurationFactor
{
  return self->_criticalDismissalThresholdDurationFactor;
}

- (void)setCriticalDismissalThresholdDurationFactor:(double)a3
{
  self->_criticalDismissalThresholdDurationFactor = a3;
}

- (double)minimumVelocityForSwipeToDismiss
{
  return self->_minimumVelocityForSwipeToDismiss;
}

- (void)setMinimumVelocityForSwipeToDismiss:(double)a3
{
  self->_minimumVelocityForSwipeToDismiss = a3;
}

- (double)minimumTranslationFractionForSwipeToDismiss
{
  return self->_minimumTranslationFractionForSwipeToDismiss;
}

- (void)setMinimumTranslationFractionForSwipeToDismiss:(double)a3
{
  self->_minimumTranslationFractionForSwipeToDismiss = a3;
}

@end
