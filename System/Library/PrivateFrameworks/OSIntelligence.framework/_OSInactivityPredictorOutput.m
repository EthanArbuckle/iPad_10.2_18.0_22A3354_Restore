@implementation _OSInactivityPredictorOutput

- (id)initInvalidOutput
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_OSInactivityPredictorOutput;
  result = -[_OSInactivityPredictorOutput init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)((char *)result + 24) = 0u;
    *(_OWORD *)((char *)result + 8) = 0u;
  }
  return result;
}

- (_OSInactivityPredictorOutput)initWithConfidenceLevel:(int64_t)a3 andConfidenceValue:(double)a4 andPredictedDuration:(double)a5 andReason:(int64_t)a6
{
  _OSInactivityPredictorOutput *result;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_OSInactivityPredictorOutput;
  result = -[_OSInactivityPredictorOutput init](&v12, sel_init);
  if (result)
  {
    result->_confidenceLevel = a3;
    v11 = 0.0;
    if (a5 >= 0.0)
      v11 = a5;
    result->_confidenceValue = a4;
    result->_predictedDuration = v11;
    result->_outputReason = a6;
  }
  return result;
}

- (_OSInactivityPredictorOutput)initWithConfidenceValue:(double)a3 andRelaxedThreshold:(double)a4 andStrictThreshold:(double)a5 andPredictedDuration:(double)a6 andReason:(int64_t)a7
{
  _OSInactivityPredictorOutput *result;
  int64_t v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_OSInactivityPredictorOutput;
  result = -[_OSInactivityPredictorOutput init](&v15, sel_init);
  if (!result)
    return result;
  result->_confidenceValue = a3;
  result->_confidenceLevel = 0;
  if (a6 > 0.0)
  {
    if (a3 > a5)
    {
      v13 = 2;
LABEL_7:
      result->_confidenceLevel = v13;
      goto LABEL_8;
    }
    if (a3 > a4)
    {
      v13 = 1;
      goto LABEL_7;
    }
  }
LABEL_8:
  v14 = 0.0;
  if (a6 >= 0.0)
    v14 = a6;
  result->_predictedDuration = v14;
  result->_outputReason = a7;
  return result;
}

- (_OSInactivityPredictorOutput)initWithConfidenceValue:(double)a3 andRelaxedThreshold:(double)a4 andStrictThreshold:(double)a5 andPredictedDuration:(double)a6 withReason:(int64_t)a7
{
  _OSInactivityPredictorOutput *result;
  int64_t v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_OSInactivityPredictorOutput;
  result = -[_OSInactivityPredictorOutput init](&v15, sel_init);
  if (!result)
    return result;
  result->_confidenceValue = a3;
  result->_confidenceLevel = 0;
  if (a6 > 0.0)
  {
    if (a3 > a5)
    {
      v13 = 2;
LABEL_7:
      result->_confidenceLevel = v13;
      goto LABEL_8;
    }
    if (a3 > a4)
    {
      v13 = 1;
      goto LABEL_7;
    }
  }
LABEL_8:
  v14 = 0.0;
  if (a6 >= 0.0)
    v14 = a6;
  result->_predictedDuration = v14;
  result->_outputReason = a7;
  return result;
}

- (void)adjustedPredictedDurationWithStrictLeeway:(double)a3 andRelaxedLeeway:(double)a4 andMaxPredictionCap:(double)a5
{
  int64_t confidenceLevel;
  double v6;

  confidenceLevel = self->_confidenceLevel;
  if (confidenceLevel)
  {
    if (confidenceLevel != 2)
      a3 = a4;
    v6 = a3 * self->_predictedDuration;
    self->_predictedDuration = v6;
  }
  else
  {
    self->_predictedDuration = 0.0;
    v6 = 0.0;
  }
  if (a5 > 0.0)
  {
    if (v6 >= a5)
      v6 = a5;
    if (v6 < 0.0)
      v6 = 0.0;
    self->_predictedDuration = v6;
  }
}

- (void)safeSubtractWaitTimeFromPredictedDuration:(double)a3
{
  double v3;

  v3 = self->_predictedDuration + a3 / -3600.0;
  if (v3 < 0.0)
    v3 = 0.0;
  self->_predictedDuration = v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_OSInactivityPredictorOutput confidenceLevelString](self, "confidenceLevelString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_OSInactivityPredictorOutput confidenceValueString](self, "confidenceValueString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_OSInactivityPredictorOutput predictedDurationString](self, "predictedDurationString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_OSInactivityPredictorOutput outputReasonString](self, "outputReasonString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[Inactivity Prediction] <Level: %@ | Value: %@ | Duration: %@ | Reason: %@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)outputReasonString
{
  unint64_t outputReason;
  __CFString *v3;
  void *v4;

  outputReason = self->_outputReason;
  if (outputReason >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = off_1E7D7BDD0[outputReason];
  }
  return v3;
}

- (id)confidenceLevelString
{
  unint64_t confidenceLevel;

  confidenceLevel = self->_confidenceLevel;
  if (confidenceLevel > 2)
    return CFSTR("unknown confidence");
  else
    return off_1E7D7BE00[confidenceLevel];
}

- (id)confidenceValueString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)&self->_confidenceValue);
}

- (id)predictedDurationString
{
  double predictedDuration;

  predictedDuration = self->_predictedDuration;
  if (predictedDuration == 0.0)
    return CFSTR("invalid duration");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f hours"), *(_QWORD *)&predictedDuration);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t confidenceLevel;
  id v5;

  confidenceLevel = self->_confidenceLevel;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", confidenceLevel, CFSTR("confidenceLevel"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("confidenceValue"), self->_confidenceValue);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("predictedDuration"), self->_predictedDuration);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_outputReason, CFSTR("outputReason"));

}

- (_OSInactivityPredictorOutput)initWithCoder:(id)a3
{
  id v4;
  _OSInactivityPredictorOutput *v5;
  double v6;
  double v7;
  _OSInactivityPredictorOutput *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_OSInactivityPredictorOutput;
  v5 = -[_OSInactivityPredictorOutput init](&v10, sel_init);
  if (v5)
  {
    v5->_confidenceLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("confidenceLevel"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidenceValue"));
    v5->_confidenceValue = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("predictedDuration"));
    v5->_predictedDuration = v7;
    v5->_outputReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("outputReason"));
    v8 = v5;
  }

  return v5;
}

- (int64_t)confidenceLevel
{
  return self->_confidenceLevel;
}

- (void)setConfidenceLevel:(int64_t)a3
{
  self->_confidenceLevel = a3;
}

- (double)confidenceValue
{
  return self->_confidenceValue;
}

- (void)setConfidenceValue:(double)a3
{
  self->_confidenceValue = a3;
}

- (double)predictedDuration
{
  return self->_predictedDuration;
}

- (void)setPredictedDuration:(double)a3
{
  self->_predictedDuration = a3;
}

- (int64_t)outputReason
{
  return self->_outputReason;
}

- (void)setOutputReason:(int64_t)a3
{
  self->_outputReason = a3;
}

@end
