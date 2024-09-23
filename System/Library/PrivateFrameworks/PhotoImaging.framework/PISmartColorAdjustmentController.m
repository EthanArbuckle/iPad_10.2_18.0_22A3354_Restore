@implementation PISmartColorAdjustmentController

- (PISmartColorAdjustmentController)initWithAdjustment:(id)a3
{
  id v3;
  PISmartColorAdjustmentController *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PISmartColorAdjustmentController;
  v3 = a3;
  v4 = -[PIAdjustmentController initWithAdjustment:](&v20, sel_initWithAdjustment_, v3);
  +[PISmartColorAdjustmentController statisticsKey](PISmartColorAdjustmentController, "statisticsKey", v20.receiver, v20.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("satPercentile75"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v4->_stats.p75 = v8;

  +[PISmartColorAdjustmentController statisticsKey](PISmartColorAdjustmentController, "statisticsKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("satPercentile98"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v4->_stats.p98 = v12;

  +[PISmartColorAdjustmentController statisticsKey](PISmartColorAdjustmentController, "statisticsKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("satPercentileG98"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v4->_stats.g98 = v16;

  +[PISmartColorAdjustmentController inputColorKey](PISmartColorAdjustmentController, "inputColorKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "doubleValue");
  -[PISmartColorAdjustmentController _updateSettingsWithInputColor:](v4, "_updateSettingsWithInputColor:");

  return v4;
}

- (void)_updateSettingsWithInputColor:(double)a3
{
  __int128 v4;
  $706A9568ADF44D3FC9F54AB3C13B5DC7 *p_smartSettings;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _OWORD v12[2];

  v4 = *(_OWORD *)&self->_stats.autoValue;
  v12[0] = *(_OWORD *)&self->_stats.p75;
  v12[1] = v4;
  p_smartSettings = &self->_smartSettings;
  smart_color_adjustments_from_stats(&self->_smartSettings.sat, (double *)v12, a3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", p_smartSettings->sat);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISmartColorAdjustmentController inputSaturationKey](PISmartColorAdjustmentController, "inputSaturationKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v6, v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", p_smartSettings->contrast);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISmartColorAdjustmentController inputContrastKey](PISmartColorAdjustmentController, "inputContrastKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v8, v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", p_smartSettings->cast);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartColorAdjustmentController inputCastKey](PISmartColorAdjustmentController, "inputCastKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v11, v10);

}

- (id)computedSettings
{
  void *v3;
  $706A9568ADF44D3FC9F54AB3C13B5DC7 *p_smartSettings;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  +[PISmartColorAdjustmentController inputSaturationKey](PISmartColorAdjustmentController, "inputSaturationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  p_smartSettings = &self->_smartSettings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_smartSettings.sat);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  +[PISmartColorAdjustmentController inputContrastKey](PISmartColorAdjustmentController, "inputContrastKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", p_smartSettings->contrast);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  +[PISmartColorAdjustmentController inputCastKey](PISmartColorAdjustmentController, "inputCastKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", p_smartSettings->cast);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setInputColor:(double)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISmartColorAdjustmentController inputColorKey](PISmartColorAdjustmentController, "inputColorKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v5, v6);

  -[PISmartColorAdjustmentController _updateSettingsWithInputColor:](self, "_updateSettingsWithInputColor:", a3);
}

- (double)inputColor
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISmartColorAdjustmentController inputColorKey](PISmartColorAdjustmentController, "inputColorKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setInputSaturation:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartColorAdjustmentController inputSaturationKey](PISmartColorAdjustmentController, "inputSaturationKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v5, v4);

}

- (double)inputSaturation
{
  double sat;
  void *v4;
  void *v5;
  double v6;
  double v7;

  sat = self->_smartSettings.sat;
  +[PISmartColorAdjustmentController offsetSaturationKey](PISmartColorAdjustmentController, "offsetSaturationKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = sat + v6;

  return v7;
}

- (void)setInputContrast:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartColorAdjustmentController inputContrastKey](PISmartColorAdjustmentController, "inputContrastKey");
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
  +[PISmartColorAdjustmentController offsetContrastKey](PISmartColorAdjustmentController, "offsetContrastKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = contrast + v6;

  return v7;
}

- (void)setInputCast:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartColorAdjustmentController inputCastKey](PISmartColorAdjustmentController, "inputCastKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v5, v4);

}

- (double)inputCast
{
  double cast;
  void *v4;
  void *v5;
  double v6;
  double v7;

  cast = self->_smartSettings.cast;
  +[PISmartColorAdjustmentController offsetCastKey](PISmartColorAdjustmentController, "offsetCastKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = cast + v6;

  return v7;
}

- (void)setOffsetCast:(double)a3
{
  void *v5;
  id v6;

  -[PIAdjustmentController setIsAuto:](self, "setIsAuto:", 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartColorAdjustmentController offsetCastKey](PISmartColorAdjustmentController, "offsetCastKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v6, v5);

}

- (double)offsetCast
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  +[PISmartColorAdjustmentController offsetCastKey](PISmartColorAdjustmentController, "offsetCastKey");
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
  +[PISmartColorAdjustmentController offsetContrastKey](PISmartColorAdjustmentController, "offsetContrastKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v6, v5);

}

- (double)offsetContrast
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  +[PISmartColorAdjustmentController offsetContrastKey](PISmartColorAdjustmentController, "offsetContrastKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setOffsetSaturation:(double)a3
{
  void *v5;
  id v6;

  -[PIAdjustmentController setIsAuto:](self, "setIsAuto:", 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PISmartColorAdjustmentController offsetSaturationKey](PISmartColorAdjustmentController, "offsetSaturationKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v6, v5);

}

- (double)offsetSaturation
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  +[PISmartColorAdjustmentController offsetSaturationKey](PISmartColorAdjustmentController, "offsetSaturationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setStatistics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v5, CFSTR("statistics"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("satPercentile75"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  self->_stats.p75 = v7;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("satPercentile98"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  self->_stats.p98 = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("satPercentileG98"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  self->_stats.g98 = v11;

  -[PISmartColorAdjustmentController inputColor](self, "inputColor");
  -[PISmartColorAdjustmentController _updateSettingsWithInputColor:](self, "_updateSettingsWithInputColor:");
}

- (NSDictionary)statistics
{
  return (NSDictionary *)-[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", CFSTR("statistics"));
}

- (id)pasteKeysForMediaType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  +[PIAdjustmentController enabledKey](PIAdjustmentController, "enabledKey", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISmartColorAdjustmentController inputColorKey](PISmartColorAdjustmentController, "inputColorKey", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  +[PISmartColorAdjustmentController offsetSaturationKey](PISmartColorAdjustmentController, "offsetSaturationKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  +[PISmartColorAdjustmentController offsetContrastKey](PISmartColorAdjustmentController, "offsetContrastKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  +[PISmartColorAdjustmentController offsetCastKey](PISmartColorAdjustmentController, "offsetCastKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (NSString)inputColorKey
{
  return (NSString *)CFSTR("inputColor");
}

+ (id)inputSaturationKey
{
  return CFSTR("inputSaturation");
}

+ (id)inputContrastKey
{
  return CFSTR("inputContrast");
}

+ (id)inputCastKey
{
  return CFSTR("inputCast");
}

+ (id)statisticsKey
{
  return CFSTR("statistics");
}

+ (NSString)offsetSaturationKey
{
  return (NSString *)CFSTR("offsetSaturation");
}

+ (NSString)offsetContrastKey
{
  return (NSString *)CFSTR("offsetContrast");
}

+ (NSString)offsetCastKey
{
  return (NSString *)CFSTR("offsetCast");
}

+ (NSString)attributeContrastKey
{
  return (NSString *)CFSTR("inputContrast");
}

+ (NSString)attributeVibrancyKey
{
  return (NSString *)CFSTR("inputSaturation");
}

+ (NSString)attributeCastKey
{
  return (NSString *)CFSTR("inputCast");
}

@end
