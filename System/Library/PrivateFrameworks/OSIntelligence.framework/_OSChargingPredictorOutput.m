@implementation _OSChargingPredictorOutput

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
  objc_msgSend(v5, "encodeBool:forKey:", self->_meetsSystemConfidenceThreshold, CFSTR("meetsThreshold"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("chargingDuration"), self->_chargingDuration);

}

- (_OSChargingPredictorOutput)initWithCoder:(id)a3
{
  id v4;
  _OSChargingPredictorOutput *v5;
  double v6;
  double v7;
  _OSChargingPredictorOutput *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_OSChargingPredictorOutput;
  v5 = -[_OSChargingPredictorOutput init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidence"));
    v5->_confidence = v6;
    v5->_meetsSystemConfidenceThreshold = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("meetsThreshold"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("chargingDuration"));
    v5->_chargingDuration = v7;
    v8 = v5;
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<_OSChargingPredictionOutput: Duration %.0lfm, Confidence: %.2lf>"), self->_chargingDuration / 60.0, *(_QWORD *)&self->_confidence);
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (BOOL)meetsSystemConfidenceThreshold
{
  return self->_meetsSystemConfidenceThreshold;
}

- (void)setMeetsSystemConfidenceThreshold:(BOOL)a3
{
  self->_meetsSystemConfidenceThreshold = a3;
}

- (double)chargingDuration
{
  return self->_chargingDuration;
}

- (void)setChargingDuration:(double)a3
{
  self->_chargingDuration = a3;
}

@end
