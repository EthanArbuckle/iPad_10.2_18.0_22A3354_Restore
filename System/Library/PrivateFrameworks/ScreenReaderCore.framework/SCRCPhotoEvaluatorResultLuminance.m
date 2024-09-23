@implementation SCRCPhotoEvaluatorResultLuminance

- (SCRCPhotoEvaluatorResultLuminance)initWithDarknessLevel:(double)a3 brightnessLevel:(double)a4 averageLevel:(double)a5
{
  SCRCPhotoEvaluatorResultLuminance *v8;
  SCRCPhotoEvaluatorResultLuminance *v9;
  SCRCPhotoEvaluatorResultLuminance *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SCRCPhotoEvaluatorResultLuminance;
  v8 = -[SCRCPhotoEvaluatorResultLuminance init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_darknessLevel = a3;
    v8->_brightnessLevel = a4;
    v8->_averageLevel = a5;
    v10 = v8;
  }

  return v9;
}

- (id)humanReadableResult
{
  double darknessLevel;
  void *v3;
  void *v4;
  const __CFString *v5;
  double brightnessLevel;
  void *v7;

  darknessLevel = self->_darknessLevel;
  if (darknessLevel <= 0.85)
  {
    if (darknessLevel <= 0.6)
    {
      brightnessLevel = self->_brightnessLevel;
      if (brightnessLevel <= 0.85)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v3;
        if (brightnessLevel <= 0.6)
          v5 = CFSTR("well_lit");
        else
          v5 = CFSTR("bright");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v3;
        v5 = CFSTR("very_bright");
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("dark");
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("very_dark");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24CB26880, CFSTR("PhotoEvaluationStrings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)darknessLevel
{
  return self->_darknessLevel;
}

- (double)brightnessLevel
{
  return self->_brightnessLevel;
}

- (double)averageLevel
{
  return self->_averageLevel;
}

@end
