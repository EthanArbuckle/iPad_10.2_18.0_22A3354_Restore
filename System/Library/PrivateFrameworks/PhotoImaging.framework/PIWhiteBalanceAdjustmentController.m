@implementation PIWhiteBalanceAdjustmentController

- (int64_t)colorType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  v3 = (void *)objc_opt_class();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController colorTypeKey](PIWhiteBalanceAdjustmentController, "colorTypeKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "colorTypeForString:", v6);

  return v7;
}

- (void)setColorType:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend((id)objc_opt_class(), "stringForColorType:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController colorTypeKey](PIWhiteBalanceAdjustmentController, "colorTypeKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (double)faceStrength
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController faceStrengthKey](PIWhiteBalanceAdjustmentController, "faceStrengthKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setFaceStrength:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController faceStrengthKey](PIWhiteBalanceAdjustmentController, "faceStrengthKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (double)faceWarmth
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController faceWarmthKey](PIWhiteBalanceAdjustmentController, "faceWarmthKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setFaceWarmth:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController faceWarmthKey](PIWhiteBalanceAdjustmentController, "faceWarmthKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (double)faceI
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController faceIKey](PIWhiteBalanceAdjustmentController, "faceIKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setFaceI:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController faceIKey](PIWhiteBalanceAdjustmentController, "faceIKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (double)faceQ
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController faceQKey](PIWhiteBalanceAdjustmentController, "faceQKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setFaceQ:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController faceQKey](PIWhiteBalanceAdjustmentController, "faceQKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (double)grayStrength
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController grayStrengthKey](PIWhiteBalanceAdjustmentController, "grayStrengthKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setGrayStrength:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController grayStrengthKey](PIWhiteBalanceAdjustmentController, "grayStrengthKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (double)grayWarmth
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController grayWarmthKey](PIWhiteBalanceAdjustmentController, "grayWarmthKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setGrayWarmth:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController grayWarmthKey](PIWhiteBalanceAdjustmentController, "grayWarmthKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (double)grayY
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController grayYKey](PIWhiteBalanceAdjustmentController, "grayYKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setGrayY:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController grayYKey](PIWhiteBalanceAdjustmentController, "grayYKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (double)grayI
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController grayIKey](PIWhiteBalanceAdjustmentController, "grayIKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setGrayI:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController grayIKey](PIWhiteBalanceAdjustmentController, "grayIKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (double)grayQ
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController grayQKey](PIWhiteBalanceAdjustmentController, "grayQKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setGrayQ:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController grayQKey](PIWhiteBalanceAdjustmentController, "grayQKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (double)temperature
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController temperatureKey](PIWhiteBalanceAdjustmentController, "temperatureKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setTemperature:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController temperatureKey](PIWhiteBalanceAdjustmentController, "temperatureKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (double)tint
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController tintKey](PIWhiteBalanceAdjustmentController, "tintKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setTint:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController tintKey](PIWhiteBalanceAdjustmentController, "tintKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (double)warmTemp
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController warmTempKey](PIWhiteBalanceAdjustmentController, "warmTempKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setWarmTemp:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  if (-[PIWhiteBalanceAdjustmentController warmFace](self, "warmFace"))
    -[PIAdjustmentController setIsAuto:](self, "setIsAuto:", 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController warmTempKey](PIWhiteBalanceAdjustmentController, "warmTempKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

}

- (double)warmTint
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController warmTintKey](PIWhiteBalanceAdjustmentController, "warmTintKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setWarmTint:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  if (-[PIWhiteBalanceAdjustmentController warmFace](self, "warmFace"))
    -[PIAdjustmentController setIsAuto:](self, "setIsAuto:", 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController warmTintKey](PIWhiteBalanceAdjustmentController, "warmTintKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

}

- (BOOL)warmFace
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController warmFaceKey](PIWhiteBalanceAdjustmentController, "warmFaceKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setWarmFace:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController warmFaceKey](PIWhiteBalanceAdjustmentController, "warmFaceKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

+ (int64_t)colorTypeForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("neutralGray")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("faceBalance")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tempTint")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("warmTint")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)stringForColorType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("none");
  else
    return off_1E5019CF0[a3];
}

+ (NSString)colorTypeKey
{
  return (NSString *)CFSTR("colorType");
}

+ (id)faceStrengthKey
{
  return CFSTR("faceStrength");
}

+ (NSString)faceWarmthKey
{
  return (NSString *)CFSTR("faceWarmth");
}

+ (id)faceIKey
{
  return CFSTR("faceI");
}

+ (id)faceQKey
{
  return CFSTR("faceQ");
}

+ (id)grayStrengthKey
{
  return CFSTR("grayStrength");
}

+ (NSString)grayWarmthKey
{
  return (NSString *)CFSTR("grayWarmth");
}

+ (id)grayYKey
{
  return CFSTR("grayY");
}

+ (id)grayIKey
{
  return CFSTR("grayI");
}

+ (id)grayQKey
{
  return CFSTR("grayQ");
}

+ (id)temperatureKey
{
  return CFSTR("temperature");
}

+ (id)tintKey
{
  return CFSTR("tint");
}

+ (NSString)warmTempKey
{
  return (NSString *)CFSTR("warmTemp");
}

+ (NSString)warmTintKey
{
  return (NSString *)CFSTR("warmTint");
}

+ (NSString)warmFaceKey
{
  return (NSString *)CFSTR("warmFace");
}

@end
