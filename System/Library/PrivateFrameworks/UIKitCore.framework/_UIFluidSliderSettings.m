@implementation _UIFluidSliderSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFluidSliderSettings;
  -[PTSettings setDefaultValues](&v7, sel_setDefaultValues);
  -[_UIFluidSliderSettings programmaticUpdate](self, "programmaticUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDampingRatio:", 0.8);

  -[_UIFluidSliderSettings programmaticUpdate](self, "programmaticUpdate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResponse:", 0.4);

  -[_UIFluidSliderSettings pressScale](self, "pressScale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDampingRatio:", 0.9);

  -[_UIFluidSliderSettings pressScale](self, "pressScale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResponse:", 0.8);

  -[_UIFluidSliderSettings setSliderDriftFactor:](self, "setSliderDriftFactor:", 0.27);
  -[_UIFluidSliderSettings setSliderStepCount:](self, "setSliderStepCount:", 16.0);
  -[_UIFluidSliderSettings setDefaultStretchAmount:](self, "setDefaultStretchAmount:", 50.0);
  -[_UIFluidSliderSettings setSquishFactor:](self, "setSquishFactor:", 0.92);
  -[_UIFluidSliderSettings setMinSquishPoints:](self, "setMinSquishPoints:", 4.0);
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
  id v18;
  id v19;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[5];
  _QWORD v44[6];

  v44[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v18 = (id)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Drift Coefficient"), CFSTR("sliderDriftFactor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "between:and:", 0.0, 1.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "precision:", 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v37;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Slider Step Count"), CFSTR("sliderStepCount"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "between:and:", 0.0, 100.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "precision:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v34;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Default Stretch Amount"), CFSTR("defaultStretchAmount"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "between:and:", 0.0, 100.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "precision:", 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v31;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Squish Factor"), CFSTR("squishFactor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "between:and:", 0.0, 1.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "precision:", 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v28;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Min Squish Points"), CFSTR("minSquishPoints"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "between:and:", 0.0, 10.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "precision:", 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v24, CFSTR("Common"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v23;
  v3 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Programmatic Update"), CFSTR("programmaticUpdate"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v22;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Press Scale"), CFSTR("pressScale"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v20, CFSTR("Animations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v4;
  v5 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Elastic Pan"), CFSTR("elasticPanDriverSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v6;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Discrete Buttons"), CFSTR("discreteButtonDriverSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionWithRows:title:", v8, CFSTR("Driver Settings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v9;
  v10 = (void *)MEMORY[0x1E0D83078];
  v11 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rowWithTitle:action:", CFSTR("Restore Defaults"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "moduleWithTitle:contents:", CFSTR("Fluid Slider Interaction"), v16);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (_UISpringAnimationPrototypeSettings)programmaticUpdate
{
  return self->_programmaticUpdate;
}

- (void)setProgrammaticUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_programmaticUpdate, a3);
}

- (_UISpringAnimationPrototypeSettings)pressScale
{
  return self->_pressScale;
}

- (void)setPressScale:(id)a3
{
  objc_storeStrong((id *)&self->_pressScale, a3);
}

- (double)sliderDriftFactor
{
  return self->_sliderDriftFactor;
}

- (void)setSliderDriftFactor:(double)a3
{
  self->_sliderDriftFactor = a3;
}

- (double)sliderStepCount
{
  return self->_sliderStepCount;
}

- (void)setSliderStepCount:(double)a3
{
  self->_sliderStepCount = a3;
}

- (double)defaultStretchAmount
{
  return self->_defaultStretchAmount;
}

- (void)setDefaultStretchAmount:(double)a3
{
  self->_defaultStretchAmount = a3;
}

- (double)squishFactor
{
  return self->_squishFactor;
}

- (void)setSquishFactor:(double)a3
{
  self->_squishFactor = a3;
}

- (double)minSquishPoints
{
  return self->_minSquishPoints;
}

- (void)setMinSquishPoints:(double)a3
{
  self->_minSquishPoints = a3;
}

- (_UIFluidSliderElasticPanDriverSettings)elasticPanDriverSettings
{
  return self->_elasticPanDriverSettings;
}

- (void)setElasticPanDriverSettings:(id)a3
{
  objc_storeStrong((id *)&self->_elasticPanDriverSettings, a3);
}

- (_UIFluidSliderDiscreteButtonDriverSettings)discreteButtonDriverSettings
{
  return self->_discreteButtonDriverSettings;
}

- (void)setDiscreteButtonDriverSettings:(id)a3
{
  objc_storeStrong((id *)&self->_discreteButtonDriverSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discreteButtonDriverSettings, 0);
  objc_storeStrong((id *)&self->_elasticPanDriverSettings, 0);
  objc_storeStrong((id *)&self->_pressScale, 0);
  objc_storeStrong((id *)&self->_programmaticUpdate, 0);
}

@end
