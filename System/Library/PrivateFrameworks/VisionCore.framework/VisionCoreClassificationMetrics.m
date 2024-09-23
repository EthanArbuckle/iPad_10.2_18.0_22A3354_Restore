@implementation VisionCoreClassificationMetrics

- (VisionCoreClassificationMetrics)initWithPrecisionCurve:(id)a3 recallCurve:(id)a4
{
  id v6;
  id v7;
  VisionCoreClassificationMetrics *v8;
  uint64_t v9;
  VisionCoreValueConfidenceCurve *precisionCurve;
  uint64_t v11;
  VisionCoreValueConfidenceCurve *recallCurve;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VisionCoreClassificationMetrics;
  v8 = -[VisionCoreClassificationMetrics init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    precisionCurve = v8->_precisionCurve;
    v8->_precisionCurve = (VisionCoreValueConfidenceCurve *)v9;

    v11 = objc_msgSend(v7, "copy");
    recallCurve = v8->_recallCurve;
    v8->_recallCurve = (VisionCoreValueConfidenceCurve *)v11;

  }
  return v8;
}

- (float)confidenceThresholdForPrecision:(float)a3
{
  float result;

  -[VisionCoreValueConfidenceCurve confidenceForValue:](self->_precisionCurve, "confidenceForValue:");
  return result;
}

- (float)confidenceThresholdForRecall:(float)a3
{
  float result;

  -[VisionCoreValueConfidenceCurve confidenceForValue:](self->_recallCurve, "confidenceForValue:");
  return result;
}

- (float)precisionOfConfidence:(float)a3
{
  float result;

  -[VisionCoreValueConfidenceCurve valueForConfidence:](self->_precisionCurve, "valueForConfidence:");
  return result;
}

- (float)recallOfConfidence:(float)a3
{
  float result;

  -[VisionCoreValueConfidenceCurve valueForConfidence:](self->_recallCurve, "valueForConfidence:");
  return result;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("P: %@\nR: %@"), self->_precisionCurve, self->_recallCurve);
}

- (BOOL)isEqual:(id)a3
{
  VisionCoreClassificationMetrics *v4;
  VisionCoreClassificationMetrics *v5;
  BOOL v6;

  v4 = (VisionCoreClassificationMetrics *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[VisionCoreValueConfidenceCurve isEqual:](self->_precisionCurve, "isEqual:", v5->_precisionCurve)
        && -[VisionCoreValueConfidenceCurve isEqual:](self->_recallCurve, "isEqual:", v5->_recallCurve);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_precisionCurve, CFSTR("P"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_recallCurve, CFSTR("R"));

}

- (VisionCoreClassificationMetrics)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  VisionCoreClassificationMetrics *v8;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("P"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("R"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      self = -[VisionCoreClassificationMetrics initWithPrecisionCurve:recallCurve:](self, "initWithPrecisionCurve:recallCurve:", v6, v7);
      v8 = self;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recallCurve, 0);
  objc_storeStrong((id *)&self->_precisionCurve, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
