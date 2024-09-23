@implementation _OSInactivityPredictorMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *modelVersion;
  id v5;

  modelVersion = self->modelVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", modelVersion, CFSTR("modelVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->predictorType, CFSTR("predictorType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->queryingMechanism, CFSTR("queryingMechanism"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("recommendedWaitTime"), self->recommendedWaitTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("longThreshold"), self->longThreshold);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("confidenceThresholdStrict"), self->confidenceThresholdStrict);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("confidenceThresholdRelaxed"), self->confidenceThresholdRelaxed);
  objc_msgSend(v5, "encodeBool:forKey:", self->requireEnoughHistory, CFSTR("requireEnoughHistory"));

}

- (_OSInactivityPredictorMetadata)initWithCoder:(id)a3
{
  id v4;
  _OSInactivityPredictorMetadata *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _OSInactivityPredictorMetadata *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_OSInactivityPredictorMetadata;
  v5 = -[_OSInactivityPredictorMetadata init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = CFSTR("None");
    objc_storeStrong((id *)&v5->modelVersion, v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predictorType"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (__CFString *)v9;
    else
      v11 = CFSTR("None");
    objc_storeStrong((id *)&v5->predictorType, v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("queryingMechanism"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (__CFString *)v12;
    else
      v14 = CFSTR("None");
    objc_storeStrong((id *)&v5->queryingMechanism, v14);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("recommendedWaitTime"));
    v5->recommendedWaitTime = v15;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longThreshold"));
    v5->longThreshold = v16;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidenceThresholdStrict"));
    v5->confidenceThresholdStrict = v17;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidenceThresholdRelaxed"));
    v5->confidenceThresholdRelaxed = v18;
    v5->requireEnoughHistory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requireEnoughHistory"));
    v19 = v5;
  }

  return v5;
}

- (_OSInactivityPredictorMetadata)initWithProtocolConformer:(id)a3
{
  id v4;
  _OSInactivityPredictorMetadata *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _OSInactivityPredictorMetadata *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_OSInactivityPredictorMetadata;
  v5 = -[_OSInactivityPredictorMetadata init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "modelVersion");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = CFSTR("None");
    objc_storeStrong((id *)&v5->modelVersion, v8);

    objc_msgSend(v4, "predictorType");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (__CFString *)v9;
    else
      v11 = CFSTR("None");
    objc_storeStrong((id *)&v5->predictorType, v11);

    objc_msgSend(v4, "queryingMechanism");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (__CFString *)v12;
    else
      v14 = CFSTR("None");
    objc_storeStrong((id *)&v5->queryingMechanism, v14);

    objc_msgSend(v4, "recommendedWaitTime");
    v5->recommendedWaitTime = v15;
    objc_msgSend(v4, "longThreshold");
    v5->longThreshold = v16;
    objc_msgSend(v4, "confidenceThresholdStrict");
    v5->confidenceThresholdStrict = v17;
    objc_msgSend(v4, "confidenceThresholdRelaxed");
    v5->confidenceThresholdRelaxed = v18;
    v5->requireEnoughHistory = objc_msgSend(v4, "requireEnoughHistory");
    v19 = v5;
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_OSInactivityPredictorMetadata predictorType](self, "predictorType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_OSInactivityPredictorMetadata queryingMechanism](self, "queryingMechanism");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_OSInactivityPredictorMetadata recommendedWaitTime](self, "recommendedWaitTime");
  v7 = v6 / 60.0;
  -[_OSInactivityPredictorMetadata longThreshold](self, "longThreshold");
  v9 = v8 / 3600.0;
  -[_OSInactivityPredictorMetadata confidenceThresholdRelaxed](self, "confidenceThresholdRelaxed");
  v11 = v10;
  -[_OSInactivityPredictorMetadata confidenceThresholdStrict](self, "confidenceThresholdStrict");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("### Inactivity Predictor\n- Model Type: %@\n- How to Query: %@\n- Wait Time Before Query: %.2f minutes\n- Definition of Long Inactivity: >%.2f hours\n- Confidence Spectrum: 0 --- low --- %.2f --- medium --- %.2f --- high --- 1"), v4, v5, *(_QWORD *)&v7, *(_QWORD *)&v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (NSString)modelVersion
{
  return self->modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)predictorType
{
  return self->predictorType;
}

- (void)setPredictorType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)queryingMechanism
{
  return self->queryingMechanism;
}

- (void)setQueryingMechanism:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)recommendedWaitTime
{
  return self->recommendedWaitTime;
}

- (void)setRecommendedWaitTime:(double)a3
{
  self->recommendedWaitTime = a3;
}

- (double)longThreshold
{
  return self->longThreshold;
}

- (void)setLongThreshold:(double)a3
{
  self->longThreshold = a3;
}

- (double)confidenceThresholdStrict
{
  return self->confidenceThresholdStrict;
}

- (void)setConfidenceThresholdStrict:(double)a3
{
  self->confidenceThresholdStrict = a3;
}

- (double)confidenceThresholdRelaxed
{
  return self->confidenceThresholdRelaxed;
}

- (void)setConfidenceThresholdRelaxed:(double)a3
{
  self->confidenceThresholdRelaxed = a3;
}

- (BOOL)requireEnoughHistory
{
  return self->requireEnoughHistory;
}

- (void)setRequireEnoughHistory:(BOOL)a3
{
  self->requireEnoughHistory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->queryingMechanism, 0);
  objc_storeStrong((id *)&self->predictorType, 0);
  objc_storeStrong((id *)&self->modelVersion, 0);
}

@end
