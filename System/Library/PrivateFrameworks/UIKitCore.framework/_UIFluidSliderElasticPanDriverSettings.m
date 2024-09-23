@implementation _UIFluidSliderElasticPanDriverSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIFluidSliderElasticPanDriverSettings;
  -[_UIFluidSliderDriverSettings setDefaultValues](&v5, sel_setDefaultValues);
  -[_UIFluidSliderDriverSettings update](self, "update");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDampingRatio:", 1.0);

  -[_UIFluidSliderDriverSettings update](self, "update");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResponse:", 0.4);

  -[_UIFluidSliderElasticPanDriverSettings setProjectionThreshold:](self, "setProjectionThreshold:", 10.0);
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
  objc_super v19;
  void *v20;
  void *v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS____UIFluidSliderElasticPanDriverSettings;
  objc_msgSendSuper2(&v19, sel_settingsControllerModule);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  v3 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Projection Deceleration Threshold (in pts)"), CFSTR("projectionThreshold"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "between:and:", 0.0, 10.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precision:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v6, CFSTR("Behaviors"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v7;
  v8 = (void *)MEMORY[0x1E0D83078];
  v9 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:action:", CFSTR("Restore Defaults"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionWithRows:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moduleWithTitle:contents:", CFSTR("Elastic Pan"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (double)projectionThreshold
{
  return self->_projectionThreshold;
}

- (void)setProjectionThreshold:(double)a3
{
  self->_projectionThreshold = a3;
}

@end
