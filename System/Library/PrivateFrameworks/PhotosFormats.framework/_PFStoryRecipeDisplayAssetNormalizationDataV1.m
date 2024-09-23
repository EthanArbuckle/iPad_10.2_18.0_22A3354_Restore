@implementation _PFStoryRecipeDisplayAssetNormalizationDataV1

- (_PFStoryRecipeDisplayAssetNormalizationDataV1)initWithSliderNetPackedDataV1:(id *)a3
{
  _PFStoryRecipeDisplayAssetNormalizationDataV1 *result;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PFStoryRecipeDisplayAssetNormalizationDataV1;
  result = -[_PFStoryRecipeDisplayAssetNormalizationDataV1 init](&v6, sel_init);
  if (result)
  {
    v5 = *(_QWORD *)&a3->var0;
    *(_DWORD *)&result->_data.highKeyInputStrength = *(_DWORD *)&a3->var8;
    *(_QWORD *)&result->_data.version = v5;
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v2;
  $38417A72299760BBB22641FA9B1EDC74 *p_data;
  unint64_t result;

  v2 = 0;
  p_data = &self->_data;
  result = 1;
  do
    result = *(&p_data->version + v2++) - result + 32 * result;
  while (v2 != 12);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  v6 = (objc_opt_isKindOfClass() & 1) != 0
    && *(_QWORD *)&self->_data.version == v4[1]
    && *(_DWORD *)&self->_data.highKeyInputStrength == (unint64_t)*((unsigned int *)v4 + 4);

  return v6;
}

- (const)sliderNetPackedData
{
  return (const $3C3B3F5936EA3FC38689B584FA72ECEA *)&self->_data;
}

- (int64_t)version
{
  return self->_data.version;
}

- (double)score
{
  unint64_t v2;

  LOBYTE(v2) = self->_data.score;
  return (double)v2 / 255.0;
}

- (NSDictionary)tempTintProperties
{
  void *v3;
  unsigned int tempTintInputTemperature;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  unsigned int tempTintInputTint;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "limits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  tempTintInputTemperature = self->_data.tempTintInputTemperature;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TEMPERATURE_MIN"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TEMPERATURE_MAX"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  if (v9 <= v7)
    goto LABEL_4;
  v10 = v9;

  tempTintInputTint = self->_data.tempTintInputTint;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TINT_MIN"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TINT_MAX"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  if (v16 <= v14)
LABEL_4:
    __assert_rtn("_byteToDoubleInRange", "PFStoryRecipeDisplayAssetNormalization.m", 19, "maxValue > minValue");
  v17 = v7 + (double)tempTintInputTemperature / 255.0 * (v10 - v7);
  v18 = v14 + (double)tempTintInputTint / 255.0 * (v16 - v14);

  v23[0] = CFSTR("inputTemperature");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = CFSTR("inputTint");
  v24[0] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v21;
}

- (NSDictionary)smartToneProperties
{
  void *v3;
  unsigned int smartToneInputContrast;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  unsigned int smartToneInputBlack;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  unsigned int smartToneInputExposure;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  unsigned int smartToneInputHighlights;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v39[4];
  _QWORD v40[5];

  v40[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "limits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  smartToneInputContrast = self->_data.smartToneInputContrast;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CONTRAST_MIN"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CONTRAST_MAX"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  if (v9 <= v7)
    goto LABEL_6;
  v10 = v9;

  smartToneInputBlack = self->_data.smartToneInputBlack;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BLACK_MIN"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BLACK_MAX"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  if (v16 <= v14)
    goto LABEL_6;
  v17 = v16;

  smartToneInputExposure = self->_data.smartToneInputExposure;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("EXPOSURE_MIN"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("EXPOSURE_MAX"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  if (v23 <= v21)
    goto LABEL_6;
  v24 = v23;

  smartToneInputHighlights = self->_data.smartToneInputHighlights;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HIGHLIGHTS_MIN"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "doubleValue");
  v28 = v27;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HIGHLIGHTS_MAX"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "doubleValue");
  if (v30 <= v28)
LABEL_6:
    __assert_rtn("_byteToDoubleInRange", "PFStoryRecipeDisplayAssetNormalization.m", 19, "maxValue > minValue");
  v31 = v7 + (double)smartToneInputContrast / 255.0 * (v10 - v7);
  v32 = v28 + (double)smartToneInputHighlights / 255.0 * (v30 - v28);

  v39[0] = CFSTR("inputContrast");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v33;
  v39[1] = CFSTR("inputBlack");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14 + (double)smartToneInputBlack / 255.0 * (v17 - v14));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v34;
  v39[2] = CFSTR("inputExposure");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21 + (double)smartToneInputExposure / 255.0 * (v24 - v21));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v35;
  v39[3] = CFSTR("inputHighlights");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v36;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v37;
}

- (NSDictionary)highKeyProperties
{
  void *v3;
  unsigned int highKeyInputStrength;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "limits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  highKeyInputStrength = self->_data.highKeyInputStrength;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HIGHKEY_MIN"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HIGHKEY_MAX"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  if (v9 <= v7)
    __assert_rtn("_byteToDoubleInRange", "PFStoryRecipeDisplayAssetNormalization.m", 19, "maxValue > minValue");
  v10 = v7 + (double)highKeyInputStrength / 255.0 * (v9 - v7);

  v14 = CFSTR("inputStrength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (NSDictionary)smartColorProperties
{
  void *v3;
  unsigned int smartColorInputVibrancy;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  unsigned int smartColorInputCast;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "limits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  smartColorInputVibrancy = self->_data.smartColorInputVibrancy;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VIBRANCY_MIN"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VIBRANCY_MAX"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  if (v9 <= v7)
    goto LABEL_4;
  v10 = v9;

  smartColorInputCast = self->_data.smartColorInputCast;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CAST_MIN"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CAST_MAX"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  if (v16 <= v14)
LABEL_4:
    __assert_rtn("_byteToDoubleInRange", "PFStoryRecipeDisplayAssetNormalization.m", 19, "maxValue > minValue");
  v17 = v7 + (double)smartColorInputVibrancy / 255.0 * (v10 - v7);
  v18 = v14 + (double)smartColorInputCast / 255.0 * (v16 - v14);

  v23[0] = CFSTR("inputVibrancy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = CFSTR("inputCast");
  v24[0] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v21;
}

+ (NSDictionary)limits
{
  if (limits_onceToken != -1)
    dispatch_once(&limits_onceToken, &__block_literal_global_1669);
  return (NSDictionary *)(id)limits_limitsV1;
}

@end
