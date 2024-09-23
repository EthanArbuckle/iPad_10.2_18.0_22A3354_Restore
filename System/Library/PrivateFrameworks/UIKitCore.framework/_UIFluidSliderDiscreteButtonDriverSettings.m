@implementation _UIFluidSliderDiscreteButtonDriverSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFluidSliderDiscreteButtonDriverSettings;
  -[_UIFluidSliderDriverSettings setDefaultValues](&v7, sel_setDefaultValues);
  -[_UIFluidSliderDiscreteButtonDriverSettings setRepeatDelay:](self, "setRepeatDelay:", 0.333);
  -[_UIFluidSliderDiscreteButtonDriverSettings setRepeatCadence:](self, "setRepeatCadence:", 0.0416666667);
  -[_UIFluidSliderDiscreteButtonDriverSettings setMinimumPressDuration:](self, "setMinimumPressDuration:", 0.25);
  -[_UIFluidSliderDiscreteButtonDriverSettings setVerticalVolumeDownScale:](self, "setVerticalVolumeDownScale:", 0.92);
  -[_UIFluidSliderDiscreteButtonDriverSettings setVerticalVolumeUpScale:](self, "setVerticalVolumeUpScale:", 1.06);
  -[_UIFluidSliderDiscreteButtonDriverSettings setHorizontalVolumeDownScale:](self, "setHorizontalVolumeDownScale:", 0.96);
  -[_UIFluidSliderDiscreteButtonDriverSettings setHorizontalVolumeUpScale:](self, "setHorizontalVolumeUpScale:", 1.03);
  -[_UIFluidSliderDriverSettings update](self, "update");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDampingRatio:", 1.0);

  -[_UIFluidSliderDriverSettings update](self, "update");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResponse:", 0.3);

  -[_UIFluidSliderDiscreteButtonDriverSettings settle](self, "settle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDampingRatio:", 1.0);

  -[_UIFluidSliderDiscreteButtonDriverSettings settle](self, "settle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResponse:", 0.6);

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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;
  void *v42;
  _QWORD v43[7];
  void *v44;
  _QWORD v45[6];

  v45[4] = *MEMORY[0x1E0C80C00];
  v30 = (id)MEMORY[0x1E0D83078];
  v41.receiver = a1;
  v41.super_class = (Class)&OBJC_METACLASS____UIFluidSliderDiscreteButtonDriverSettings;
  objc_msgSendSuper2(&v41, sel_settingsControllerModule);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v40;
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Settle"), CFSTR("settle"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v38, CFSTR("Unique Animations"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v37;
  v3 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Auto-repeat Delay"), CFSTR("repeatDelay"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "between:and:", 0.0, 1.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "precision:", 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v34;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Auto-repeat Cadence"), CFSTR("repeatCadence"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "between:and:", 0.0, 1.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "precision:", 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v29;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Minimum Press Duration"), CFSTR("minimumPressDuration"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "between:and:", 0.0, 1.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "precision:", 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v26;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Volume Down Scale (Vertical)"), CFSTR("verticalVolumeDownScale"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "between:and:", 0.0, 2.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "precision:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v23;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Volume Up Scale (Vertical)"), CFSTR("verticalVolumeUpScale"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "between:and:", 0.0, 2.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "precision:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v20;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Volume Down Scale (Horizontal)"), CFSTR("horizontalVolumeDownScale"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "between:and:", 0.0, 2.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "precision:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v17;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Volume Up Scale (Horizontal)"), CFSTR("horizontalVolumeUpScale"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "between:and:", 0.0, 2.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "precision:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v7, CFSTR("Behaviors"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v8;
  v9 = (void *)MEMORY[0x1E0D83078];
  v10 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:action:", CFSTR("Restore Defaults"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "moduleWithTitle:contents:", CFSTR("Volume Buttons"), v15);
  v31 = (id)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (double)repeatDelay
{
  return self->_repeatDelay;
}

- (void)setRepeatDelay:(double)a3
{
  self->_repeatDelay = a3;
}

- (double)repeatCadence
{
  return self->_repeatCadence;
}

- (void)setRepeatCadence:(double)a3
{
  self->_repeatCadence = a3;
}

- (double)minimumPressDuration
{
  return self->_minimumPressDuration;
}

- (void)setMinimumPressDuration:(double)a3
{
  self->_minimumPressDuration = a3;
}

- (double)verticalVolumeDownScale
{
  return self->_verticalVolumeDownScale;
}

- (void)setVerticalVolumeDownScale:(double)a3
{
  self->_verticalVolumeDownScale = a3;
}

- (double)verticalVolumeUpScale
{
  return self->_verticalVolumeUpScale;
}

- (void)setVerticalVolumeUpScale:(double)a3
{
  self->_verticalVolumeUpScale = a3;
}

- (double)horizontalVolumeDownScale
{
  return self->_horizontalVolumeDownScale;
}

- (void)setHorizontalVolumeDownScale:(double)a3
{
  self->_horizontalVolumeDownScale = a3;
}

- (double)horizontalVolumeUpScale
{
  return self->_horizontalVolumeUpScale;
}

- (void)setHorizontalVolumeUpScale:(double)a3
{
  self->_horizontalVolumeUpScale = a3;
}

- (_UISpringAnimationPrototypeSettings)settle
{
  return self->_settle;
}

- (void)setSettle:(id)a3
{
  objc_storeStrong((id *)&self->_settle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settle, 0);
}

@end
