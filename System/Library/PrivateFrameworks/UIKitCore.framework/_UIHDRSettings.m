@implementation _UIHDRSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIHDRSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[_UIHDRSettings setAnimationDurationUp:](self, "setAnimationDurationUp:", 2.0);
  -[_UIHDRSettings setAnimationDurationDown:](self, "setAnimationDurationDown:", 2.0);
  -[_UIHDRSettings setAsymmetricAnimationDurations:](self, "setAsymmetricAnimationDurations:", 0);
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
  _QWORD v19[4];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Animation Duration"), CFSTR("animationDurationUp"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "between:and:", 0.0, 5.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "precision:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Animation Duration (Down)"), CFSTR("animationDurationDown"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "between:and:", 0.0, 5.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "precision:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "conditionFormat:", CFSTR("SELF.asymmetricAnimationDurations != NO"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Asymmetric Animations"), CFSTR("asymmetricAnimationDurations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:action:", CFSTR("Restore Defaults"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83078];
  v19[0] = v4;
  v19[1] = v8;
  v19[2] = v9;
  v19[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sectionWithRows:title:", v14, CFSTR("HDR Animation Settings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moduleWithTitle:contents:", 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (double)animationDurationUp
{
  return self->_animationDurationUp;
}

- (void)setAnimationDurationUp:(double)a3
{
  self->_animationDurationUp = a3;
}

- (double)animationDurationDown
{
  return self->_animationDurationDown;
}

- (void)setAnimationDurationDown:(double)a3
{
  self->_animationDurationDown = a3;
}

- (BOOL)asymmetricAnimationDurations
{
  return self->_asymmetricAnimationDurations;
}

- (void)setAsymmetricAnimationDurations:(BOOL)a3
{
  self->_asymmetricAnimationDurations = a3;
}

@end
