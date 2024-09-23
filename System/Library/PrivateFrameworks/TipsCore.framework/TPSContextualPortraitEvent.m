@implementation TPSContextualPortraitEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSContextualPortraitEvent)initWithDictionary:(id)a3
{
  id v4;
  TPSContextualPortraitEvent *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *topicID;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSContextualPortraitEvent;
  v5 = -[TPSContextualEvent initWithDictionary:](&v12, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "TPSSafeNumberForKey:", CFSTR("confidenceThreshold"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "doubleValue");
    else
      v8 = 0x3FE999999999999ALL;
    *(_QWORD *)&v5->_confidenceThreshold = v8;
    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("topicID"));
    v9 = objc_claimAutoreleasedReturnValue();
    topicID = v5->_topicID;
    v5->_topicID = (NSString *)v9;

  }
  return v5;
}

- (TPSContextualPortraitEvent)initWithCoder:(id)a3
{
  id v4;
  TPSContextualPortraitEvent *v5;
  double v6;
  uint64_t v7;
  NSString *topicID;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TPSContextualPortraitEvent;
  v5 = -[TPSContextualEvent initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidenceThreshold"));
    if (v6 == 0.0)
      v6 = 0.8;
    v5->_confidenceThreshold = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topicID"));
    v7 = objc_claimAutoreleasedReturnValue();
    topicID = v5->_topicID;
    v5->_topicID = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSContextualPortraitEvent;
  v4 = a3;
  -[TPSContextualEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("confidenceThreshold"), self->_confidenceThreshold, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_topicID, CFSTR("topicID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSContextualPortraitEvent;
  v4 = -[TPSContextualEvent copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setConfidenceThreshold:", self->_confidenceThreshold);
  objc_msgSend(v4, "setTopicID:", self->_topicID);
  return v4;
}

- (unsigned)minObservationCount
{
  return 1;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v7.receiver = self;
  v7.super_class = (Class)TPSContextualPortraitEvent;
  -[TPSContextualEvent debugDescription](&v7, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %lf\n"), CFSTR("confidenceThreshold"), *(_QWORD *)&self->_confidenceThreshold);
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("topicID"), self->_topicID);
  return v5;
}

- (double)confidenceThreshold
{
  return self->_confidenceThreshold;
}

- (void)setConfidenceThreshold:(double)a3
{
  self->_confidenceThreshold = a3;
}

- (NSString)topicID
{
  return self->_topicID;
}

- (void)setTopicID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicID, 0);
}

@end
