@implementation SCRCPhotoEvaluatorResultBlur

- (SCRCPhotoEvaluatorResultBlur)initWithBlurLevel:(double)a3
{
  SCRCPhotoEvaluatorResultBlur *v4;
  SCRCPhotoEvaluatorResultBlur *v5;
  SCRCPhotoEvaluatorResultBlur *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCRCPhotoEvaluatorResultBlur;
  v4 = -[SCRCPhotoEvaluatorResultBlur init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_blurLevel = a3;
    v6 = v4;
  }

  return v5;
}

- (id)humanReadableResult
{
  double blurLevel;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  blurLevel = self->_blurLevel;
  if (blurLevel <= 0.9)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (blurLevel <= 0.75)
      v5 = CFSTR("crisp");
    else
      v5 = CFSTR("blurry");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("very_blurry");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24CB26880, CFSTR("PhotoEvaluationStrings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)blurLevel
{
  return self->_blurLevel;
}

@end
