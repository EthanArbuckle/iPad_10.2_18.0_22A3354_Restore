@implementation PISmartToneAdjustmentController

- (PISmartToneAdjustmentController)initWithAdjustment:(id)a3
{
  id v3;
  PISmartToneAdjustmentController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PISmartToneAdjustmentController;
  v3 = a3;
  v4 = -[PIAdjustmentController initWithAdjustment:](&v7, sel_initWithAdjustment_, v3);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("inputLight"), v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  -[PISmartToneAdjustmentController _updateSettingsWithInputLight:](v4, "_updateSettingsWithInputLight:");

  return v4;
}

- (void)_updateSettingsWithInputLight:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
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
  void *v54;
  void *v55;
  void *v56;
  id v57;

  -[PISmartToneAdjustmentController statistics](self, "statistics");
  v57 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C9DDC8];
  objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("localAutoValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v5, "smartToneAdjustmentsForValue:localLightAutoValue:andStatistics:", v57, a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PISmartToneAdjustmentController inputExposureKey](PISmartToneAdjustmentController, "inputExposureKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  self->_smartSettings.exposure = v11;

  +[PISmartToneAdjustmentController inputContrastKey](PISmartToneAdjustmentController, "inputContrastKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  self->_smartSettings.contrast = v14;

  +[PISmartToneAdjustmentController inputBrightnessKey](PISmartToneAdjustmentController, "inputBrightnessKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  self->_smartSettings.brightness = v17;

  +[PISmartToneAdjustmentController inputShadowsKey](PISmartToneAdjustmentController, "inputShadowsKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  self->_smartSettings.shadows = v20;

  +[PISmartToneAdjustmentController inputHighlightsKey](PISmartToneAdjustmentController, "inputHighlightsKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  self->_smartSettings.highlights = v23;

  +[PISmartToneAdjustmentController inputBlackKey](PISmartToneAdjustmentController, "inputBlackKey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValue");
  self->_smartSettings.black = v26;

  +[PISmartToneAdjustmentController inputLocalLightKey](PISmartToneAdjustmentController, "inputLocalLightKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "doubleValue");
  self->_smartSettings.localLight = v29;

  +[PISmartToneAdjustmentController inputRawHighlightsKey](PISmartToneAdjustmentController, "inputRawHighlightsKey");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "doubleValue");
  self->_smartSettings.rawHighlights = v32;

  +[PISmartToneAdjustmentController inputExposureKey](PISmartToneAdjustmentController, "inputExposureKey");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController inputExposureKey](PISmartToneAdjustmentController, "inputExposureKey");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v34, v35);

  +[PISmartToneAdjustmentController inputContrastKey](PISmartToneAdjustmentController, "inputContrastKey");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController inputContrastKey](PISmartToneAdjustmentController, "inputContrastKey");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v37, v38);

  +[PISmartToneAdjustmentController inputBrightnessKey](PISmartToneAdjustmentController, "inputBrightnessKey");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController inputBrightnessKey](PISmartToneAdjustmentController, "inputBrightnessKey");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v40, v41);

  +[PISmartToneAdjustmentController inputShadowsKey](PISmartToneAdjustmentController, "inputShadowsKey");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController inputShadowsKey](PISmartToneAdjustmentController, "inputShadowsKey");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v43, v44);

  +[PISmartToneAdjustmentController inputHighlightsKey](PISmartToneAdjustmentController, "inputHighlightsKey");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController inputHighlightsKey](PISmartToneAdjustmentController, "inputHighlightsKey");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v46, v47);

  +[PISmartToneAdjustmentController inputBlackKey](PISmartToneAdjustmentController, "inputBlackKey");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController inputBlackKey](PISmartToneAdjustmentController, "inputBlackKey");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v49, v50);

  +[PISmartToneAdjustmentController inputLocalLightKey](PISmartToneAdjustmentController, "inputLocalLightKey");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController inputLocalLightKey](PISmartToneAdjustmentController, "inputLocalLightKey");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v52, v53);

  +[PISmartToneAdjustmentController inputRawHighlightsKey](PISmartToneAdjustmentController, "inputRawHighlightsKey");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController inputRawHighlightsKey](PISmartToneAdjustmentController, "inputRawHighlightsKey");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v55, v56);

}

- (id)computedSettings
{
  $F4790AD2D5F7E8B4E51579D0253F6F19 *p_smartSettings;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[8];
  _QWORD v23[10];

  v23[8] = *MEMORY[0x1E0C80C00];
  +[PISmartToneAdjustmentController inputExposureKey](PISmartToneAdjustmentController, "inputExposureKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v21;
  p_smartSettings = &self->_smartSettings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_smartSettings.exposure);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v20;
  +[PISmartToneAdjustmentController inputContrastKey](PISmartToneAdjustmentController, "inputContrastKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_smartSettings.contrast);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v18;
  +[PISmartToneAdjustmentController inputBrightnessKey](PISmartToneAdjustmentController, "inputBrightnessKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_smartSettings.brightness);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v16;
  +[PISmartToneAdjustmentController inputShadowsKey](PISmartToneAdjustmentController, "inputShadowsKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_smartSettings.shadows);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v14;
  +[PISmartToneAdjustmentController inputHighlightsKey](PISmartToneAdjustmentController, "inputHighlightsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_smartSettings.highlights);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v5;
  +[PISmartToneAdjustmentController inputBlackKey](PISmartToneAdjustmentController, "inputBlackKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", p_smartSettings->black);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v7;
  +[PISmartToneAdjustmentController inputLocalLightKey](PISmartToneAdjustmentController, "inputLocalLightKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", p_smartSettings->localLight);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v9;
  +[PISmartToneAdjustmentController inputRawHighlightsKey](PISmartToneAdjustmentController, "inputRawHighlightsKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", p_smartSettings->rawHighlights);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (double)inputLightDefault
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PISmartToneAdjustmentController statistics](self, "statistics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("autoValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)setInputLight:(double)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController inputLightKey](PISmartToneAdjustmentController, "inputLightKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v5, v6);

  -[PISmartToneAdjustmentController _updateSettingsWithInputLight:](self, "_updateSettingsWithInputLight:", a3);
}

- (double)inputLight
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  +[PISmartToneAdjustmentController inputLightKey](PISmartToneAdjustmentController, "inputLightKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setInputExposure:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController inputExposureKey](PISmartToneAdjustmentController, "inputExposureKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v5, v4);

}

- (double)inputExposure
{
  double exposure;
  void *v4;
  void *v5;
  double v6;
  double v7;

  exposure = self->_smartSettings.exposure;
  +[PISmartToneAdjustmentController offsetExposureKey](PISmartToneAdjustmentController, "offsetExposureKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = exposure + v6;

  return v7;
}

- (void)setInputBrightness:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController inputBrightnessKey](PISmartToneAdjustmentController, "inputBrightnessKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v5, v4);

}

- (double)inputBrightness
{
  double brightness;
  void *v4;
  void *v5;
  double v6;
  double v7;

  brightness = self->_smartSettings.brightness;
  +[PISmartToneAdjustmentController offsetBrightnessKey](PISmartToneAdjustmentController, "offsetBrightnessKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = brightness + v6;

  return v7;
}

- (void)setInputContrast:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController inputContrastKey](PISmartToneAdjustmentController, "inputContrastKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v5, v4);

}

- (double)inputContrast
{
  double contrast;
  void *v4;
  void *v5;
  double v6;
  double v7;

  contrast = self->_smartSettings.contrast;
  +[PISmartToneAdjustmentController offsetContrastKey](PISmartToneAdjustmentController, "offsetContrastKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = contrast + v6;

  return v7;
}

- (void)setInputShadows:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController inputShadowsKey](PISmartToneAdjustmentController, "inputShadowsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v5, v4);

}

- (double)inputShadows
{
  double shadows;
  void *v4;
  void *v5;
  double v6;
  double v7;

  shadows = self->_smartSettings.shadows;
  +[PISmartToneAdjustmentController offsetShadowsKey](PISmartToneAdjustmentController, "offsetShadowsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = shadows + v6;

  return v7;
}

- (void)setInputHighlights:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController inputHighlightsKey](PISmartToneAdjustmentController, "inputHighlightsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v5, v4);

}

- (double)inputHighlights
{
  double highlights;
  void *v4;
  void *v5;
  double v6;
  double v7;

  highlights = self->_smartSettings.highlights;
  +[PISmartToneAdjustmentController offsetHighlightsKey](PISmartToneAdjustmentController, "offsetHighlightsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = highlights + v6;

  return v7;
}

- (void)setInputBlack:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController inputBlackKey](PISmartToneAdjustmentController, "inputBlackKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v5, v4);

}

- (double)inputBlack
{
  double black;
  void *v4;
  void *v5;
  double v6;
  double v7;

  black = self->_smartSettings.black;
  +[PISmartToneAdjustmentController offsetBlackKey](PISmartToneAdjustmentController, "offsetBlackKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = black + v6;

  return v7;
}

- (void)setInputLocalLight:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController inputLocalLightKey](PISmartToneAdjustmentController, "inputLocalLightKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v5, v4);

}

- (double)inputLocalLight
{
  double localLight;
  void *v4;
  void *v5;
  double v6;
  double v7;

  localLight = self->_smartSettings.localLight;
  +[PISmartToneAdjustmentController offsetLocalLightKey](PISmartToneAdjustmentController, "offsetLocalLightKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = localLight + v6;

  return v7;
}

- (void)setInputRawHighlights:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController inputRawHighlightsKey](PISmartToneAdjustmentController, "inputRawHighlightsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v5, v4);

}

- (double)inputRawHighlights
{
  return self->_smartSettings.rawHighlights;
}

- (void)setStatistics:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(a3, "copy");
  +[PISmartToneAdjustmentController statisticsKey](PISmartToneAdjustmentController, "statisticsKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v4, v5);

  -[PISmartToneAdjustmentController inputLight](self, "inputLight");
  -[PISmartToneAdjustmentController _updateSettingsWithInputLight:](self, "_updateSettingsWithInputLight:");
}

- (NSDictionary)statistics
{
  void *v3;
  void *v4;

  +[PISmartToneAdjustmentController statisticsKey](PISmartToneAdjustmentController, "statisticsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (double)offsetBlack
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  +[PISmartToneAdjustmentController offsetBlackKey](PISmartToneAdjustmentController, "offsetBlackKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setOffsetBlack:(double)a3
{
  void *v5;
  id v6;

  -[PIAdjustmentController setIsAuto:](self, "setIsAuto:", 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController offsetBlackKey](PISmartToneAdjustmentController, "offsetBlackKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v6, v5);

}

- (double)offsetBrightness
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  +[PISmartToneAdjustmentController offsetBrightnessKey](PISmartToneAdjustmentController, "offsetBrightnessKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setOffsetBrightness:(double)a3
{
  void *v5;
  id v6;

  -[PIAdjustmentController setIsAuto:](self, "setIsAuto:", 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController offsetBrightnessKey](PISmartToneAdjustmentController, "offsetBrightnessKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v6, v5);

}

- (double)offsetContrast
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  +[PISmartToneAdjustmentController offsetContrastKey](PISmartToneAdjustmentController, "offsetContrastKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setOffsetContrast:(double)a3
{
  void *v5;
  id v6;

  -[PIAdjustmentController setIsAuto:](self, "setIsAuto:", 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController offsetContrastKey](PISmartToneAdjustmentController, "offsetContrastKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v6, v5);

}

- (double)offsetExposure
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  +[PISmartToneAdjustmentController offsetExposureKey](PISmartToneAdjustmentController, "offsetExposureKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setOffsetExposure:(double)a3
{
  void *v5;
  id v6;

  -[PIAdjustmentController setIsAuto:](self, "setIsAuto:", 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController offsetExposureKey](PISmartToneAdjustmentController, "offsetExposureKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v6, v5);

}

- (double)offsetHighlights
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  +[PISmartToneAdjustmentController offsetHighlightsKey](PISmartToneAdjustmentController, "offsetHighlightsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setOffsetHighlights:(double)a3
{
  void *v5;
  id v6;

  -[PIAdjustmentController setIsAuto:](self, "setIsAuto:", 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController offsetHighlightsKey](PISmartToneAdjustmentController, "offsetHighlightsKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v6, v5);

}

- (double)offsetLocalLight
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  +[PISmartToneAdjustmentController offsetLocalLightKey](PISmartToneAdjustmentController, "offsetLocalLightKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setOffsetLocalLight:(double)a3
{
  void *v5;
  id v6;

  -[PIAdjustmentController setIsAuto:](self, "setIsAuto:", 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController offsetLocalLightKey](PISmartToneAdjustmentController, "offsetLocalLightKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v6, v5);

}

- (double)offsetShadows
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  +[PISmartToneAdjustmentController offsetShadowsKey](PISmartToneAdjustmentController, "offsetShadowsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setOffsetShadows:(double)a3
{
  void *v5;
  id v6;

  -[PIAdjustmentController setIsAuto:](self, "setIsAuto:", 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartToneAdjustmentController offsetShadowsKey](PISmartToneAdjustmentController, "offsetShadowsKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v6, v5);

}

- (id)autoKeysForPaste
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  +[PISmartToneAdjustmentController inputLightKey](PISmartToneAdjustmentController, "inputLightKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pasteKeysForMediaType:(int64_t)a3
{
  uint64_t v4;
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
  _QWORD v16[9];
  _QWORD v17[9];

  v17[8] = *MEMORY[0x1E0C80C00];
  +[PIAdjustmentController enabledKey](PIAdjustmentController, "enabledKey");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (a3 == 2)
  {
    v17[0] = v4;
    +[PISmartToneAdjustmentController inputLightKey](PISmartToneAdjustmentController, "inputLightKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v6;
    +[PISmartToneAdjustmentController offsetBlackKey](PISmartToneAdjustmentController, "offsetBlackKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v7;
    +[PISmartToneAdjustmentController offsetBrightnessKey](PISmartToneAdjustmentController, "offsetBrightnessKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v8;
    +[PISmartToneAdjustmentController offsetContrastKey](PISmartToneAdjustmentController, "offsetContrastKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[4] = v9;
    +[PISmartToneAdjustmentController offsetExposureKey](PISmartToneAdjustmentController, "offsetExposureKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[5] = v10;
    +[PISmartToneAdjustmentController offsetHighlightsKey](PISmartToneAdjustmentController, "offsetHighlightsKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[6] = v11;
    +[PISmartToneAdjustmentController offsetShadowsKey](PISmartToneAdjustmentController, "offsetShadowsKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[7] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PISmartToneAdjustmentController inputLightKey](PISmartToneAdjustmentController, "inputLightKey", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v6;
    +[PISmartToneAdjustmentController offsetBlackKey](PISmartToneAdjustmentController, "offsetBlackKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v7;
    +[PISmartToneAdjustmentController offsetBrightnessKey](PISmartToneAdjustmentController, "offsetBrightnessKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = v8;
    +[PISmartToneAdjustmentController offsetContrastKey](PISmartToneAdjustmentController, "offsetContrastKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[4] = v9;
    +[PISmartToneAdjustmentController offsetExposureKey](PISmartToneAdjustmentController, "offsetExposureKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[5] = v10;
    +[PISmartToneAdjustmentController offsetHighlightsKey](PISmartToneAdjustmentController, "offsetHighlightsKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[6] = v11;
    +[PISmartToneAdjustmentController offsetLocalLightKey](PISmartToneAdjustmentController, "offsetLocalLightKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[7] = v12;
    +[PISmartToneAdjustmentController offsetShadowsKey](PISmartToneAdjustmentController, "offsetShadowsKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[8] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

+ (NSString)inputLightKey
{
  return (NSString *)CFSTR("inputLight");
}

+ (NSString)attributeBrightnessKey
{
  return (NSString *)CFSTR("inputBrightness");
}

+ (NSString)attributeContrastKey
{
  return (NSString *)CFSTR("inputContrast");
}

+ (NSString)attributeExposureKey
{
  return (NSString *)CFSTR("inputExposure");
}

+ (NSString)attributeHighlightsKey
{
  return (NSString *)CFSTR("inputHighlights");
}

+ (NSString)attributeShadowsKey
{
  return (NSString *)CFSTR("inputShadows");
}

+ (NSString)attributeBlackPointKey
{
  return (NSString *)CFSTR("inputBlack");
}

+ (NSString)attributeLocalLightKey
{
  return (NSString *)CFSTR("inputLocalLight");
}

+ (NSString)attributeLightMapKey
{
  return (NSString *)CFSTR("inputLightMap");
}

+ (NSString)attributeLightMapWidthKey
{
  return (NSString *)CFSTR("inputLightMapWidth");
}

+ (NSString)attributeLightMapHeightKey
{
  return (NSString *)CFSTR("inputLightMapHeight");
}

+ (NSString)offsetBlackKey
{
  return (NSString *)CFSTR("offsetBlack");
}

+ (NSString)offsetBrightnessKey
{
  return (NSString *)CFSTR("offsetBrightness");
}

+ (NSString)offsetContrastKey
{
  return (NSString *)CFSTR("offsetContrast");
}

+ (NSString)offsetExposureKey
{
  return (NSString *)CFSTR("offsetExposure");
}

+ (NSString)offsetHighlightsKey
{
  return (NSString *)CFSTR("offsetHighlights");
}

+ (NSString)offsetLocalLightKey
{
  return (NSString *)CFSTR("offsetLocalLight");
}

+ (NSString)offsetShadowsKey
{
  return (NSString *)CFSTR("offsetShadows");
}

+ (id)inputExposureKey
{
  return CFSTR("inputExposure");
}

+ (id)inputContrastKey
{
  return CFSTR("inputContrast");
}

+ (id)inputBrightnessKey
{
  return CFSTR("inputBrightness");
}

+ (id)inputShadowsKey
{
  return CFSTR("inputShadows");
}

+ (id)inputHighlightsKey
{
  return CFSTR("inputHighlights");
}

+ (id)inputBlackKey
{
  return CFSTR("inputBlack");
}

+ (id)inputLocalLightKey
{
  return CFSTR("inputLocalLight");
}

+ (id)inputRawHighlightsKey
{
  return CFSTR("inputRawHighlights");
}

+ (id)statisticsKey
{
  return CFSTR("statistics");
}

@end
