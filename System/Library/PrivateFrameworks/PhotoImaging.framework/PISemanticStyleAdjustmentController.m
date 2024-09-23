@implementation PISemanticStyleAdjustmentController

- (double)tone
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "toneKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setTone:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "toneKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (double)color
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "colorKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setColor:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "colorKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (void)setCast:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(a3, "copy");
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "castKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (NSString)cast
{
  void *v2;
  void *v3;
  void *v4;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "castKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setIntensity:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "intensityKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (double)intensity
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  float v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "intensityKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v5 = 1.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "floatValue");
    v5 = v6;
  }

  return v5;
}

- (NSDictionary)statistics
{
  void *v2;
  void *v3;
  void *v4;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "statisticsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)setStatistics:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(a3, "copy");
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "statisticsKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (NSString)debugMode
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  NSString *v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "debugModeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = CFSTR("none");
  v6 = v4;

  return v6;
}

- (void)setDebugMode:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PIAdjustmentController adjustment](self, "adjustment");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "debugModeKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, v5);

}

- (void)setVersion:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "versionKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (int64_t)version
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "versionKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "integerValue");
  else
    v5 = 0;

  return v5;
}

- (void)resetToUnstyledOriginal
{
  -[PISemanticStyleAdjustmentController setCast:](self, "setCast:", CFSTR("Standard"));
  -[PISemanticStyleAdjustmentController setTone:](self, "setTone:", 0.0);
  -[PISemanticStyleAdjustmentController setColor:](self, "setColor:", 0.0);
  -[PISemanticStyleAdjustmentController setIntensity:](self, "setIntensity:", 1.0);
}

- (void)updateWithSemStyleInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  float v11;
  double v12;
  void *v13;
  float v14;
  double v15;
  id v16;

  v16 = a3;
  if (objc_msgSend(v16, "count"))
  {
    -[PIAdjustmentController setEnabled:](self, "setEnabled:", 1);
    objc_msgSend(v16, "objectForKey:", CFSTR("cast"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && (objc_msgSend(v4, "isEqualToString:", &stru_1E501A310) & 1) == 0)
    {
      PISemanticStyleCastFromString(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PISemanticStyleAdjustmentController setCast:](self, "setCast:", v6);

    }
    else
    {
      -[PISemanticStyleAdjustmentController setCast:](self, "setCast:", CFSTR("Standard"));
    }
    objc_msgSend(v16, "objectForKey:", CFSTR("tone"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = v8;

    -[PISemanticStyleAdjustmentController setTone:](self, "setTone:", v9);
    objc_msgSend(v16, "objectForKey:", CFSTR("color"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v12 = v11;

    -[PISemanticStyleAdjustmentController setColor:](self, "setColor:", v12);
    objc_msgSend(v16, "objectForKey:", CFSTR("intensity"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    v15 = v14;

    -[PISemanticStyleAdjustmentController setIntensity:](self, "setIntensity:", v15);
  }

}

- (BOOL)isSettingEqual:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  +[PISemanticStyleAdjustmentController intensityKey](PISemanticStyleAdjustmentController, "intensityKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    objc_msgSend(v6, "schema");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PIAdjustmentController adjustment](self, "adjustment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PISemanticStyleAdjustmentController _areValuesEquivalentBetween:and:nilEquivalentDefaultValue:](self, "_areValuesEquivalentBetween:and:nilEquivalentDefaultValue:", v14, v15, v12);

  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PISemanticStyleAdjustmentController;
    v16 = -[PIAdjustmentController isSettingEqual:forKey:](&v18, sel_isSettingEqual_forKey_, v6, v7);
  }

  return v16;
}

- (BOOL)_areValuesEquivalentBetween:(id)a3 and:(id)a4 nilEquivalentDefaultValue:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7 || !v8)
  {
    if (!v7 || v8)
    {
      if (!v8 || !v7 || objc_msgSend(v7, "isEqual:", v8))
        goto LABEL_8;
LABEL_12:
      v11 = 0;
      goto LABEL_13;
    }
    v10 = v7;
  }
  else
  {
    v10 = v8;
  }
  if ((objc_msgSend(v10, "isEqual:", v9) & 1) == 0)
    goto LABEL_12;
LABEL_8:
  v11 = 1;
LABEL_13:

  return v11;
}

+ (id)toneKey
{
  return CFSTR("tone");
}

+ (id)colorKey
{
  return CFSTR("color");
}

+ (id)castKey
{
  return CFSTR("cast");
}

+ (id)intensityKey
{
  return CFSTR("intensity");
}

+ (id)statisticsKey
{
  return CFSTR("statistics");
}

+ (id)debugModeKey
{
  return CFSTR("debugMode");
}

+ (id)versionKey
{
  return CFSTR("version");
}

+ (id)useStyleEngineKey
{
  return CFSTR("useStyleEngineKey");
}

+ (id)allCastsWithStandard:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(a1, "allSystemCasts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "allCreativeCasts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (v3)
    objc_msgSend(v8, "addObject:", CFSTR("Standard"));
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

+ (id)allCasts
{
  return (id)objc_msgSend(a1, "allCastsWithStandard:", 0);
}

+ (id)allSystemCasts
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Cool");
  v3[1] = CFSTR("Neutral");
  v3[2] = CFSTR("BlushWarm");
  v3[3] = CFSTR("GoldWarm");
  v3[4] = CFSTR("TanWarm");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)allCreativeCasts
{
  _QWORD v3[10];

  v3[9] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Colorful");
  v3[1] = CFSTR("NoFilter");
  v3[2] = CFSTR("DreamyHues");
  v3[3] = CFSTR("UrbanCool");
  v3[4] = CFSTR("WarmAuthentic");
  v3[5] = CFSTR("Earthy");
  v3[6] = CFSTR("CloudCover");
  v3[7] = CFSTR("LongGray");
  v3[8] = CFSTR("StarkBW");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)defaultValuesForCast:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  PISemanticStyleCastToMakerNoteString(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D08AD0], "defaultStyleForCastType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "toneBias");
    v7 = v6;
    objc_msgSend(v5, "colorBias");
    v9 = v8;
    objc_msgSend(v5, "castIntensity");
    v11 = v10;
  }
  else
  {
    v11 = 1.0;
    v9 = 0.0;
    v7 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
