@implementation PGLongTailAdditionalOptions

- (PGLongTailAdditionalOptions)init
{
  PGLongTailAdditionalOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGLongTailAdditionalOptions;
  result = -[PGLongTailAdditionalOptions init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_qualityPercentile = xmmword_1CA8ED9D0;
    result->_topTierAestheticScoreValue = 3;
  }
  return result;
}

- (PGLongTailAdditionalOptions)initWithDictionary:(id)a3
{
  id v4;
  PGLongTailAdditionalOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = -[PGLongTailAdditionalOptions init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("qualityPercentile"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && (objc_msgSend(v6, "integerValue") & 0x8000000000000000) == 0)
      v5->_qualityPercentile = objc_msgSend(v7, "unsignedIntegerValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("verifiedPersonScore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && (objc_msgSend(v8, "integerValue") & 0x8000000000000000) == 0)
      v5->_verifiedPersonScoreValue = objc_msgSend(v9, "unsignedIntegerValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topTierAestheticScore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && (objc_msgSend(v10, "integerValue") & 0x8000000000000000) == 0)
      v5->_topTierAestheticScoreValue = objc_msgSend(v11, "unsignedIntegerValue");

  }
  return v5;
}

- (unint64_t)qualityPercentile
{
  return self->_qualityPercentile;
}

- (void)setQualityPercentile:(unint64_t)a3
{
  self->_qualityPercentile = a3;
}

- (unint64_t)verifiedPersonScoreValue
{
  return self->_verifiedPersonScoreValue;
}

- (void)setVerifiedPersonScoreValue:(unint64_t)a3
{
  self->_verifiedPersonScoreValue = a3;
}

- (unint64_t)topTierAestheticScoreValue
{
  return self->_topTierAestheticScoreValue;
}

- (void)setTopTierAestheticScoreValue:(unint64_t)a3
{
  self->_topTierAestheticScoreValue = a3;
}

@end
