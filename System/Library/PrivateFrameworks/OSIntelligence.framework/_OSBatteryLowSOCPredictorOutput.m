@implementation _OSBatteryLowSOCPredictorOutput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double confidence;
  id v5;

  confidence = self->_confidence;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("confidence"), confidence);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("confidenceThreshold"), self->_confidenceThreshold);
  objc_msgSend(v5, "encodeBool:forKey:", self->_lowSOCPredicted, CFSTR("lowSOCPredicted"));

}

- (_OSBatteryLowSOCPredictorOutput)initWithCoder:(id)a3
{
  id v4;
  _OSBatteryLowSOCPredictorOutput *v5;
  double v6;
  double v7;
  _OSBatteryLowSOCPredictorOutput *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_OSBatteryLowSOCPredictorOutput;
  v5 = -[_OSBatteryLowSOCPredictorOutput init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidence"));
    v5->_confidence = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidenceThreshold"));
    v5->_confidenceThreshold = v7;
    v5->_lowSOCPredicted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lowSOCPredicted"));
    v8 = v5;
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<_OSLowSOCPredictionOutput: lowSOCPredicted %d, Confidence: %.2lf, Confidence Threshold: %.21f>"), self->_lowSOCPredicted, *(_QWORD *)&self->_confidence, *(_QWORD *)&self->_confidenceThreshold);
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (double)confidenceThreshold
{
  return self->_confidenceThreshold;
}

- (void)setConfidenceThreshold:(double)a3
{
  self->_confidenceThreshold = a3;
}

- (BOOL)lowSOCPredicted
{
  return self->_lowSOCPredicted;
}

- (void)setLowSOCPredicted:(BOOL)a3
{
  self->_lowSOCPredicted = a3;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_storeStrong((id *)&self->_modelName, a3);
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_storeStrong((id *)&self->_modelVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
}

@end
