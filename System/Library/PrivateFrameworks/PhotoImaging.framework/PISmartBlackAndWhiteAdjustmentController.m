@implementation PISmartBlackAndWhiteAdjustmentController

+ (NSString)strengthKey
{
  return (NSString *)CFSTR("strength");
}

+ (NSString)neutralKey
{
  return (NSString *)CFSTR("neutral");
}

+ (NSString)toneKey
{
  return (NSString *)CFSTR("tone");
}

+ (NSString)grainKey
{
  return (NSString *)CFSTR("grain");
}

+ (NSString)hueKey
{
  return (NSString *)CFSTR("hue");
}

+ (id)inputStrengthKey
{
  return CFSTR("inputStrength");
}

+ (id)inputNeutralGammaKey
{
  return CFSTR("inputNeutralGamma");
}

+ (id)inputToneKey
{
  return CFSTR("inputTone");
}

+ (id)inputGrainKey
{
  return CFSTR("inputGrain");
}

+ (id)inputHueKey
{
  return CFSTR("inputHue");
}

+ (id)inputSeedKey
{
  return CFSTR("inputSeed");
}

+ (NSString)attributeStrengthKey
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "inputStrengthKey");
}

+ (NSString)attributeNeutralGammaKey
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "inputNeutralGammaKey");
}

+ (NSString)attributeToneKey
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "inputToneKey");
}

+ (NSString)attributeHueKey
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "inputHueKey");
}

+ (NSString)attributeGrainKey
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "inputGrainKey");
}

- (void)setStrength:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "strengthKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v5, v4);

}

- (double)strength
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend((id)objc_opt_class(), "strengthKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setNeutral:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "neutralKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v5, v4);

}

- (double)neutral
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend((id)objc_opt_class(), "neutralKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setTone:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "toneKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v5, v4);

}

- (double)tone
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend((id)objc_opt_class(), "toneKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setGrain:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "grainKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v5, v4);

}

- (double)grain
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend((id)objc_opt_class(), "grainKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void)setHue:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "hueKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v5, v4);

}

- (double)hue
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend((id)objc_opt_class(), "hueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

@end
