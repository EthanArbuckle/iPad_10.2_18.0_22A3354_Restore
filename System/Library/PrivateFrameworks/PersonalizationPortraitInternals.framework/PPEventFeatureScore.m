@implementation PPEventFeatureScore

- (PPEventFeatureScore)initWithFeatureValues:(id)a3 weightedScore:(double)a4 prominentFeature:(unint64_t)a5
{
  id v10;
  PPEventFeatureScore *v11;
  PPEventFeatureScore *v12;
  void *v14;
  objc_super v15;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPEventTuples.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("featureValues != nil"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PPEventFeatureScore;
  v11 = -[PPEventFeatureScore init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_featureValues, a3);
    v12->_weightedScore = a4;
    v12->_prominentFeature = a5;
    v12->_ocnt_precomputedHash = -[PPEventFeatureScore _hash](v12, "_hash");
  }

  return v12;
}

- (id)copyWithReplacementFeatureValues:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFeatureValues:weightedScore:prominentFeature:", v4, self->_prominentFeature, self->_weightedScore);

  return v5;
}

- (id)copyWithReplacementWeightedScore:(double)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFeatureValues:weightedScore:prominentFeature:", self->_featureValues, self->_prominentFeature, a3);
}

- (id)copyWithReplacementProminentFeature:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFeatureValues:weightedScore:prominentFeature:", self->_featureValues, a3, self->_weightedScore);
}

- (BOOL)isEqualToEventFeatureScore:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSArray *featureValues;
  void *v10;
  int v11;
  double weightedScore;
  double v13;
  BOOL v14;
  unint64_t prominentFeature;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  v6 = self->_featureValues != 0;
  objc_msgSend(v4, "featureValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_7;
  featureValues = self->_featureValues;
  if (featureValues)
  {
    objc_msgSend(v5, "featureValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSArray isEqual:](featureValues, "isEqual:", v10);

    if (!v11)
      goto LABEL_7;
  }
  objc_msgSend(v5, "weightedScore", self->_weightedScore);
  weightedScore = self->_weightedScore;
  objc_msgSend(v5, "weightedScore");
  if (weightedScore == v13)
  {
    prominentFeature = self->_prominentFeature;
    v14 = prominentFeature == objc_msgSend(v5, "prominentFeature");
  }
  else
  {
LABEL_7:
    v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  PPEventFeatureScore *v4;
  PPEventFeatureScore *v5;
  BOOL v6;

  v4 = (PPEventFeatureScore *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPEventFeatureScore isEqualToEventFeatureScore:](self, "isEqualToEventFeatureScore:", v5);

  return v6;
}

- (unint64_t)_hash
{
  uint64_t v3;
  double weightedScore;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;

  v3 = -[NSArray hash](self->_featureValues, "hash");
  weightedScore = self->_weightedScore;
  v5 = -weightedScore;
  if (weightedScore >= 0.0)
    v5 = self->_weightedScore;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return self->_prominentFeature - (v8 - v3 + 32 * v3) + 32 * (v8 - v3 + 32 * v3);
}

- (unint64_t)hash
{
  return self->_ocnt_precomputedHash;
}

- (id)description
{
  id v3;
  NSArray *featureValues;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  featureValues = self->_featureValues;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_weightedScore);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_prominentFeature);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPEventFeatureScore | featureValues:%@ weightedScore:%@ prominentFeature:%@>"), featureValues, v5, v6);

  return v7;
}

- (NSArray)featureValues
{
  return self->_featureValues;
}

- (double)weightedScore
{
  return self->_weightedScore;
}

- (unint64_t)prominentFeature
{
  return self->_prominentFeature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureValues, 0);
}

+ (id)eventFeatureScoreWithFeatureValues:(id)a3 weightedScore:(double)a4 prominentFeature:(unint64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFeatureValues:weightedScore:prominentFeature:", v8, a5, a4);

  return v9;
}

@end
